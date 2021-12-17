GetFirstPokemonHappiness:
	ld hl, wPartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	ld de, wPartySpecies
.loop
	ld a, [de]
	cp EGG
	jr nz, .done
	inc de
	add hl, bc
	jr .loop

.done
	ld [wNamedObjectIndexBuffer], a
	ld a, [hl]
	ld [wScriptVar], a
	call GetPokemonName
	jp CopyPokemonName_Buffer1_Buffer3

CheckFirstMonIsEgg:
	ld a, [wPartySpecies]
	ld [wNamedObjectIndexBuffer], a
	cp EGG
	ld a, TRUE
	jr z, .egg
	xor a

.egg
	ld [wScriptVar], a
	call GetPokemonName
	jp CopyPokemonName_Buffer1_Buffer3

ChangeHappiness:
; Perform happiness action c on wCurPartyMon

	ld a, [wCurPartyMon]
	inc a
	ld e, a
	ld d, 0
	ld hl, wPartySpecies - 1
	add hl, de
	ld a, [hl]
	cp EGG
	ret z

	push bc
	ld hl, wPartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	pop bc

	ld d, h
	ld e, l

	push de
	ld a, [de]
	and %01111111
	cp HAPPINESS_THRESHOLD_1
	ld e, 0
	jr c, .ok
	inc e
	cp HAPPINESS_THRESHOLD_2
	jr c, .ok
	inc e

.ok
	dec c
	ld b, 0
	ld hl, HappinessChanges
	add hl, bc
	add hl, bc
	add hl, bc
	ld d, 0
	add hl, de
	ld a, [hl]
	cp $80
	pop de

	ld a, [de]
	and $80
	ld b, a
	ld a, [de]
	jr nc, .negative
	add [hl]
	jr nc, .done
	ld a, -1
	jr .done

.negative
	add [hl]
	jr c, .done
	xor a

.done
	cp HAPPINESS_MAX
	jr nc, .max
	ld a, HAPPINESS_MAX
.max
	or b
	ld [de], a
	ld a, [wBattleMode]
	and a
	ret z
	ld a, [wCurPartyMon]
	ld b, a
	ld a, [wPartyMenuCursor]
	cp b
	ret nz
	ld a, [de]
	ld [wBattleMonHappiness], a
	ret

INCLUDE "data/events/happiness_changes.asm"

StepHappiness::
; Raise the party's happiness by 1 point every 4th step cycle.

	ld hl, wHappinessStepCount
	ld a, [hl]
	inc a
	and 3
	ld [hl], a
	ret nz

	ld de, wPartyCount
	ld a, [de]
	and a
	ret z

	ld c, a
	ld hl, wPartyMon1Happiness
.loop
	inc de
	ld a, [de]
	cp EGG
	jr z, .next
	inc [hl]
	jr nz, .next
	ld [hl], $ff

.next
	push de
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	pop de
	dec c
	jr nz, .loop
	ret

DayCareStep::
; Raise the experience of Day-Care Pokémon every step cycle.
	ld a, [wDayCareMan]
	bit DAYCAREMAN_HAS_MON_F, a
	jr z, .day_care_lady

	ld a, [wBreedMon1Level] ; level
	cp MAX_LEVEL
	jr nc, .day_care_lady
; gain exp based on half the number of badges
	push hl
	ld hl, wBadges
	ld b, 2
	call CountSetBits
	ld a, [wNumSetBits]
	srl a
	ld b, a
	pop hl
	ld c, 0
.add_second_exp_point_man
	ld hl, wBreedMon1Exp + 2 ; exp
	inc [hl]
	jr nz, .day_care_lady
	dec hl
	inc [hl]
	jr nz, .day_care_lady
	dec hl
	inc [hl]
	ld a, [hl]
	cp HIGH(MAX_DAY_CARE_EXP >> 8)
	jr c, .day_care_lady
	ld a, HIGH(MAX_DAY_CARE_EXP >> 8)
	ld [hl], a
	inc c
	cp b
	jr nz, .add_second_exp_point_man

.day_care_lady
	ld a, [wDayCareLady]
	bit DAYCARELADY_HAS_MON_F, a
	jr z, .check_egg

	ld a, [wBreedMon2Level] ; level
	cp MAX_LEVEL
	jr nc, .check_egg
; gain exp based on half the number of badges
	push hl	
	ld hl, wBadges
	ld b, 2
	call CountSetBits
	ld a, [wNumSetBits]
	srl a
	ld b, a
	pop hl
	ld c, 0
.add_second_exp_point_lady
	ld hl, wBreedMon2Exp + 2 ; exp
	inc [hl]
	jr nz, .check_egg
	dec hl
	inc [hl]
	jr nz, .check_egg
	dec hl
	inc [hl]
	ld a, [hl]
	cp HIGH(MAX_DAY_CARE_EXP >> 8)
	jr c, .check_egg
	ld a, HIGH(MAX_DAY_CARE_EXP >> 8)
	ld [hl], a
	inc c
	cp b
	jr nz, .add_second_exp_point_man

.check_egg ; checks if an egg was produced every wStepsToEgg steps
	ld hl, wDayCareMan
	bit DAYCAREMAN_MONS_COMPATIBLE_F, [hl]
	ret z
	; jr .force
	ld hl, wStepsToEgg
	dec [hl]
	ret nz
.min_steps
	call Random
	cp 128 ; limits steps to 128
	jr nc, .min_steps
	ld [hl], a
	callfar CheckBreedmonCompatibility
	ld a, [wBreedingCompatibility]
	cp 230 ; same species, same owner
	ld b, 40 percent + 1
	jr nc, .okay
	ld a, [wBreedingCompatibility]
	cp 170 ; same species, different owners
	ld b, 30 percent
	jr nc, .okay
	ld a, [wBreedingCompatibility]
	cp 110 ; different species, same owners
	ld b, 20 percent
	jr nc, .okay
	; different species, different owners
	ld b, 15 percent

.okay
	call Random
	cp b
	ret nc
; .force
	ld hl, wDayCareMan
	res DAYCAREMAN_MONS_COMPATIBLE_F, [hl]
	set DAYCAREMAN_HAS_EGG_F, [hl]
	ret
