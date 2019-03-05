ReadTrainerParty:
	ld a, [wInBattleTowerBattle]
	bit 0, a
	ret nz

	ld a, [wLinkMode]
	and a
	ret nz

	ld hl, wOTPartyCount
	xor a
	ld [hli], a
	dec a
	ld [hl], a

	ld hl, wOTPartyMons
	ld bc, wOTPartyMonsEnd - wOTPartyMons
	xor a
	call ByteFill

	ld a, [wOtherTrainerClass]
	cp CAL
	jr nz, .not_cal2
	ld a, [wOtherTrainerID]
	cp CAL2
	jr z, .cal2
	ld a, [wOtherTrainerClass]
.not_cal2

	dec a
	ld c, a
	ld b, 0
	ld hl, TrainerGroups
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wOtherTrainerID]
	ld b, a
.skip_trainer
	dec b
	jr z, .got_trainer
.loop
	ld a, [hli]
	cp -1
	jr nz, .loop
	jr .skip_trainer
.got_trainer

.skip_name
	ld a, [hli]
	cp "@"
	jr nz, .skip_name

	ld a, [hli]
	ld c, a
	ld b, 0
	ld d, h
	ld e, l
	ld hl, TrainerTypes
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, .done
	push bc
	jp hl

.done
	jp ComputeTrainerReward

.cal2
	ld a, BANK(sMysteryGiftTrainer)
	call GetSRAMBank
	ld de, sMysteryGiftTrainer
	call TrainerType2
	call CloseSRAM
	jr .done

TrainerTypes:
; entries correspond to TRAINERTYPE_* constants
	dw TrainerType1 ; level, species
	dw TrainerType2 ; level, species, moves
	dw TrainerType3 ; level, species, item
	dw TrainerType4 ; level, species, item, moves

TrainerType1:
; normal (level, species)
	ld h, d
	ld l, e
.loop	
	; check badges
	push hl
	ld hl, wBadges
	ld b, 2
	call CountSetBits	
	ld a, [wNumSetBits]
	inc a
	ld b, a
	pop hl
	ld a, [hl]
	cp b
	ret nc	
	ld a, [hli]
	cp $ff
	ret z
	
	; stop if -1
	ld a, [hli]
	cp $ff
	ret z
	ld d, a ; put level in d
	; change level
	ld a, [wNumSetBits] ; a is number of badges
	ld b, d ; b is level
	call BadgeLevels	
	ld [wCurPartyLevel], a
	
	ld a, [hli] ; get evolve bit
	ld [$C000], a
	
	ld a, [hli] ; get speciess
	ld b, a
	call EvolveTrainerMon
	ld a, b
	call EvolveTrainerMon
	ld a, b
	ld [wCurPartySpecies], a
	
	ld a, OTPARTYMON
	ld [wMonType], a

	push hl
	predef TryAddMonToParty
	pop hl
	jp .loop

TrainerType2:
; moves
	ld h, d
	ld l, e
.loop
	; check badges
	push hl
	ld hl, wBadges
	ld b, 2
	call CountSetBits	
	ld a, [wNumSetBits]
	inc a
	ld b, a
	pop hl
	ld a, [hl]
	cp b
	ret nc	
	ld a, [hli]
	cp $ff
	ret z
	
	; stop if -1
	ld a, [hli]
	cp $ff
	ret z
	ld d, a ; put level in d
	; change level
	ld a, [wNumSetBits] ; a is number of badges
	ld b, d ; b is level
	call BadgeLevels
	
	ld [wCurPartyLevel], a
	ld a, [hli]
	ld [wCurPartySpecies], a

	ld a, OTPARTYMON
	ld [wMonType], a

	push hl
	predef TryAddMonToParty
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	pop hl

	ld b, NUM_MOVES
.copy_moves
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .copy_moves

	push hl

	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, MON_PP
	add hl, de
	push hl
	ld hl, MON_MOVES
	add hl, de
	pop de

	ld b, NUM_MOVES
.copy_pp
	ld a, [hli]
	and a
	jr z, .copied_pp

	push hl
	push bc
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop bc
	pop hl

	ld [de], a
	inc de
	dec b
	jr nz, .copy_pp
.copied_pp

	pop hl
	jp .loop

TrainerType3:
; item
	ld h, d
	ld l, e
.loop
	push hl
	ld hl, wBadges
	ld b, 2
	call CountSetBits	
	ld a, [wNumSetBits]
	inc a
	ld b, a
	pop hl
	ld a, [hl]
	cp b
	ret nc
	ld a, [hli]
	cp $ff
	ret z
	
	ld a, [hli]
	cp $ff
	ret z

	ld [wCurPartyLevel], a
	ld a, [hli]
	ld [wCurPartySpecies], a
	ld a, OTPARTYMON
	ld [wMonType], a
	push hl
	predef TryAddMonToParty
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	ld a, [hli]
	ld [de], a
	jp .loop

TrainerType4:
; item + moves
	ld h, d
	ld l, e
.loop
	; check badges
	push hl
	ld hl, wBadges
	ld b, 2
	call CountSetBits	
	ld a, [wNumSetBits]
	inc a
	ld b, a
	pop hl
	ld a, [hl]
	cp b
	ret nc	
	ld a, [hli]
	cp $ff
	ret z
	
	; stop if -1
	ld a, [hli]
	cp $ff
	ret z
	ld d, a ; put level in d
	; change level
	ld a, [wNumSetBits] ; a is number of badges
	ld b, d ; b is level
	call BadgeLevels
	
	ld [wCurPartyLevel], a
	ld a, [hli]
	ld [wCurPartySpecies], a

	ld a, OTPARTYMON
	ld [wMonType], a

	push hl
	predef TryAddMonToParty
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	pop hl

	ld a, [hli]
	ld [de], a

	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	pop hl

	ld b, NUM_MOVES
.copy_moves
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .copy_moves

	push hl

	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, MON_PP
	add hl, de

	push hl
	ld hl, MON_MOVES
	add hl, de
	pop de

	ld b, NUM_MOVES
.copy_pp
	ld a, [hli]
	and a
	jr z, .copied_pp

	push hl
	push bc
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop bc
	pop hl

	ld [de], a
	inc de
	dec b
	jr nz, .copy_pp
.copied_pp

	pop hl
	jp .loop
	
BadgeLevels:
	jp .switch_start
	
.case0; 0 badges
	ld a, b
	add a, 4
	jp .switch_end	
	
.case1; 1 badges
	ld a, b
	;add a, a
	add a, 8
	jp .switch_end	
	
.case2; 2 badges
	ld a, b
	;add a, a
	add a, 15
	jp .switch_end
	
.case3; 3 badges
	ld a, b
	add a, a
	add a, 22
	jp .switch_end
	
.case4; 4 badges
	ld a, b
	add a, a
	add a, 24
	jp .switch_end
	
.case5; 5 badges
	ld a, b
	add a, 28
	jp .switch_end
	
.case6; 6 badges
	ld a, b
	add a, 30
	jp .switch_end
	
.case7; 7 badges
	ld a, b
	add a, 35
	jp .switch_end
	
.case8; 8 badges
	ld a, b
	add a, 44
	jp .switch_end
	
.switch_start
	cp a, 0
	jp z, .case0
	cp a, 1
	jp z, .case1
	cp a, 2
	jp z, .case2
	cp a, 3
	jp z, .case3
	cp a, 4
	jp z, .case4
	cp a, 5
	jp z, .case5
	cp a, 6
	jp z, .case6
	cp a, 7
	jp z, .case7
	cp a, 8
	jp z, .case8

.switch_end
	ret
	
EvolveTrainerMon:
; check if the defender has any evolutions
; hl = EvosAttacksPointers  (species - 1) * 2
	dec a
	push hl
	push bc
	ld c, a
	ld b, 0
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, [$C000] ; check evolve bit
	cp 0
	jp z, .done
	ld a, [wCurPartyLevel]
	ld d, a ; d = wild mon level
; hl = the species' entry from EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call GetFarHalfword
; a = the first byte of the species' EvosAttacks data
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
; if a == 0, there are no evolutions, so don't boost stats
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	and a
	cp 0
	jp z, .done ; done if it has no evolutions

	inc hl
	cp EVOLVE_ITEM
	jp z, .evolve_item
	cp EVOLVE_HAPPINESS
	jp z, .evolve_happy
	cp EVOLVE_STAT
	jp z, .evolve_stat	
	
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte ; a = evolve level
	cp d
	jp nc, .lower
	
	ld c, a
	ld a, d ; a = wild level
	ld d, c ; d = evolve level data
	
.finish_evolve
	pop bc
	pop hl
	inc b
	ret

.evolve_eevee
	ld a, d ; a = wild level
	cp 20
	jp c, .donezo
	pop hl
	ld a, [$C000]
	cp 1
	jp z, .eevee_1
	cp 2
	jp z, .eevee_2
	cp 3
	jp z, .eevee_3
	cp 4
	jp z, .eevee_4
	cp 5
	jp z, .eevee_5
	ret
.eevee_1
	ld a, JOLTEON
	ld b, a
	ret
.eevee_2
	ld a, VAPOREON
	ld b, a
	ret
.eevee_3
	ld a, FLAREON
	ld b, a
	ret
.eevee_4
	ld a, ESPEON
	ld b, a
	ret
.eevee_5
	ld a, UMBREON
	ld b, a
	ret
.evolve_gloom
	ld a, d ; a = wild level
	cp 25
	jp c, .donezo
	pop hl
	ld a, [$C000]
	cp 1
	jp z, .gloom_1
	cp 2
	jp z, .gloom_2
.gloom_1
	ld a, VILEPLUME
	ld b, a
	ret
.gloom_2
	ld a, BELLOSSOM
	ld b, a
	ret
.evolve_poliwhirl
	ld a, d ; a = wild level
	cp 29
	jp c, .donezo
	pop hl
	ld a, [$C000]
	cp 1
	jp z, .poliwhirl_1
	cp 2
	jp z, .poliwhirl_2
.poliwhirl_1
	ld a, POLIWRATH
	ld b, a
	ret
.poliwhirl_2
	ld a, POLITOED
	ld b, a
	ret
.evolve_slowpoke
	ld a, d ; a = wild level
	cp 37
	jp c, .donezo
	pop hl
	ld a, [$C000]
	cp 1
	jp z, .slowpoke_1
	cp 2
	jp z, .slowpoke_2
.slowpoke_1
	ld a, SLOWBRO
	ld b, a
	ret
.slowpoke_2
	ld a, SLOWKING
	ld b, a
	ret
.hitmonlee
	ld a, HITMONLEE
	ld b, a
	ret
.hitmonchan
	ld a, HITMONCHAN
	ld b, a
	ret
.hitmontop
	ld a, HITMONTOP
	ld b, a
	ret
.evolve_item	
	pop bc
	ld a, b
	cp EEVEE
	jp z, .evolve_eevee
	cp GLOOM
	jp z, .evolve_gloom
	cp POLIWHIRL
	jp z, .evolve_poliwhirl
	cp SLOWPOKE
	jp z, .evolve_slowpoke
	
	ld a, d ; a = wild level
	cp 23
	jp c, .donezo
	inc hl
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte ; a = evolved species
	ld b, a
	jp .donezo
.evolve_happy
	pop bc
	ld a, d ; a = wild level
	cp 13
	jp c, .donezo
	inc hl
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte ; a = evolved species
	ld b, a
	jp .donezo
.evolve_stat
	pop bc
	ld a, d ; a = wild level
	ld [$C005], a
	cp 15
	jp c, .donezo
	pop hl
	ld a, [$C000]
	cp 1
	jp z, .hitmonlee
	cp 2
	jp z, .hitmonchan
	cp 3
	jp z, .hitmontop
.lower
.done
	pop bc
	pop hl
	ret
.donezo
	pop hl
	ret

ComputeTrainerReward:
	ld hl, hProduct
	xor a
	ld [hli], a
	ld [hli], a ; hMultiplicand + 0
	ld [hli], a ; hMultiplicand + 1
	ld a, [wEnemyTrainerBaseReward]
	ld [hli], a ; hMultiplicand + 2
	ld a, [wCurPartyLevel]
	ld [hl], a ; hMultiplier
	call Multiply
	ld hl, wBattleReward
	xor a
	ld [hli], a
	ldh a, [hProduct + 2]
	ld [hli], a
	ldh a, [hProduct + 3]
	ld [hl], a
	ret

Battle_GetTrainerName::
	ld a, [wInBattleTowerBattle]
	bit 0, a
	ld hl, wOTPlayerName
	jp nz, CopyTrainerName

	ld a, [wOtherTrainerID]
	ld b, a
	ld a, [wOtherTrainerClass]
	ld c, a

GetTrainerName::
	ld a, c
	cp CAL
	jr nz, .not_cal2

	ld a, BANK(sMysteryGiftTrainerHouseFlag)
	call GetSRAMBank
	ld a, [sMysteryGiftTrainerHouseFlag]
	and a
	call CloseSRAM
	jr z, .not_cal2

	ld a, BANK(sMysteryGiftPartnerName)
	call GetSRAMBank
	ld hl, sMysteryGiftPartnerName
	call CopyTrainerName
	jp CloseSRAM

.not_cal2
	dec c
	push bc
	ld b, 0
	ld hl, TrainerGroups
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc

.loop
	dec b
	jr z, CopyTrainerName

.skip
	ld a, [hli]
	cp $ff
	jr nz, .skip
	jr .loop

CopyTrainerName:
	ld de, wStringBuffer1
	push de
	ld bc, NAME_LENGTH
	call CopyBytes
	pop de
	ret

INCLUDE "data/trainers/parties.asm"

SetTrainerBattleLevel:
	ld a, 255
	ld [wCurPartyLevel], a

	ld a, [wInBattleTowerBattle]
	bit 0, a
	ret nz

	ld a, [wLinkMode]
	and a
	ret nz

	ld a, [wOtherTrainerClass]
	dec a
	ld c, a
	ld b, 0
	ld hl, TrainerGroups
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wOtherTrainerID]
	ld b, a
.skip_trainer
	dec b
	jr z, .got_trainer
.loop1
	ld a, [hli]
	cp $ff
	jr nz, .loop1
	jr .skip_trainer
.got_trainer

.skip_name
	ld a, [hli]
	cp "@"
	jr nz, .skip_name

	inc hl
	ld a, [hl]
	ld [wCurPartyLevel], a
	ret