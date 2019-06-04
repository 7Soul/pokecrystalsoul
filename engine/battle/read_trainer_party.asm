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
	ld [wOtherTrainerType], a
	ld d, h
	ld e, l
	call ReadTrainerPartyPieces

.done
	jp ComputeTrainerReward

.cal2
	ld a, BANK(sMysteryGiftTrainer)
	call GetSRAMBank
	ld a, TRAINERTYPE_MOVES
	ld [wOtherTrainerType], a
	ld de, sMysteryGiftTrainer
	call ReadTrainerPartyPieces
	call CloseSRAM
	jr .done
	
ReadTrainerPartyPieces:
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
	ld a, [hli]
	cp $ff
	ret z
	cp b
	jp nc, .skip_2more ; skip badge low
	
	ld a, [hli]
	cp b
	jp c, .skip ;
	jp z, .skip ; skip badge high
	
	ld a, [hli]
	ld d, a ; put level in d
	; change level
	ld a, [wNumSetBits] ; a is number of badges
	ld b, d ; b is level
	push hl
	push de
	call BadgeLevels
	pop de
	pop hl
	
	ld a, [hli] ; get evolve bit
	ld [wEnemyMonEvolve], a
	
	ld a, [hli] ; get speciess
	ld b, a
	call EvolveTrainerMon
	ld a, b
	call EvolveTrainerMon
	ld a, b
	ld [wCurPartySpecies], a

; add to party
	ld a, OTPARTYMON
	ld [wMonType], a
	push hl
	predef TryAddMonToParty
	pop hl
	
; nickname?
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_NICKNAME_F, a
	jr z, .no_nickname

	push de
	ld de, wStringBuffer2
	ld c, 0
.copy_nickname
	inc c
	ld a, [hli]
	ld [de], a
	inc de
	cp "@"
	jr nz, .copy_nickname
.extra_char
	inc c
	ld a, [hli]
	ld a, c
	cp $c
	jr nz, .extra_char
	dec hl
	
	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wStringBuffer2
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	pop hl
	pop de
.no_nickname

; dvs?
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_DVS_F, a
	jr z, .no_dvs

	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1DVs
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl

; When reading DVs, treat PERFECT_DV as $ff
	ld a, [hli]
	cp PERFECT_DV
	jr nz, .atk_def_dv_ok
	ld a, $ff
.atk_def_dv_ok
	ld [de], a
	inc de
	ld a, [hli]
	cp PERFECT_DV
	jr nz, .spd_spc_dv_ok
	ld a, $ff
.spd_spc_dv_ok
	ld [de], a
.no_dvs

; item?
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_ITEM_F, a
	jr z, .no_item
	
	ld a, [hli]
	ld b, a
	ld a, [wNumSetBits]
	cp b ; compare badges to item badge requirement
	jp c, .no_item

	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Item
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl

	ld a, [hli]
	ld [de], a
.no_item

; moves?
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_MOVES_F, a
	jp z, .no_moves

	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Moves
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl

	ld b, NUM_MOVES
.copy_moves
	ld a, [hl]
	cp $FF
	jp z, .new_is_ff

	ld a, [hl]
	ld [de], a
	inc de
	jr .skip_no_move2
	
.new_is_ff
	ld a, [de]
	and a ; and old move is 0
	jr z, .new_is_ff_stay ; don't move to next slot if old move is NO_MOVE
	inc de ; move to next slot if new is FF but mon already had a move
	
.new_is_ff_stay
.skip_no_move2
	inc hl
	dec b
	jr nz, .copy_moves

	push hl

	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1
	call GetPartyLocation
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
	ld a, [hli] ; move (after moves were added)
	
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
	
	;and a
	;jr z, .skip_pp
	ld [de], a
	inc de
;.skip_pp
	dec b
	jr nz, .copy_pp
	
.copied_pp
	pop hl
	jp .no_moves
	
.skip
	inc hl
	inc hl
	inc hl
	
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_NICKNAME_F, a
	jp nz, .extra_skip1
.skip_after_check1
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_DVS_F, a
	jp nz, .extra_skip4
.skip_after_check4
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_ITEM_F, a
	jp nz, .extra_skip2
.skip_after_check2
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_MOVES_F, a
	jp nz, .extra_skip3
.skip_after_check3

.no_moves
; Custom DVs affect stats, so recalculate them after TryAddMonToParty
	ld a, [wOtherTrainerType]
	and TRAINERTYPE_DVS
	jr z, .no_stat_recalc

	push hl

	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1MaxHP
	call GetPartyLocation
	ld d, h
	ld e, l

	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1StatExp - 1
	call GetPartyLocation

; recalculate stats
	ld b, TRUE
	push de
	predef CalcMonStats
	pop hl

; copy max HP to current HP
	inc hl
	ld c, [hl]
	dec hl
	ld b, [hl]
	dec hl
	ld [hl], c
	dec hl
	ld [hl], b

	pop hl
.no_stat_recalc
	jp .loop
	
.skip_2more
	inc hl
	jp .skip
	
.extra_skip1 ; skips 11 bits for nickname info
rept 11
	inc hl
endr
	jp .skip_after_check1
	
.extra_skip2 ; skips 2 bits for item info
	inc hl
	inc hl
	jp .skip_after_check2
	
.extra_skip3 ; skips 4 bits for moves info
	inc hl
	inc hl
	inc hl
	inc hl
	jp .skip_after_check3
	
.extra_skip4 ; skips 2 bits for dvs info
	inc hl
	inc hl
	jp .skip_after_check4
	
BadgeLevels:
	ld hl, .levels
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	add b
	ld [wCurPartyLevel], a
	ret
	
.levels:
	db $0  ; 0
	db $4  ; 4
	db $a  ; 10
	db $f  ; 15
	db $18 ; 24
	db $1c ; 28
	db $1e ; 30
	db $21 ; 33
	db $24 ; 36
	
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
	ld a, [wEnemyMonEvolve] ; check evolve bit
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
	ld a, [wEnemyMonEvolve]
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
	cp 35
	jp c, .donezo
	pop hl
	ld a, [wEnemyMonEvolve]
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
	ld a, [wEnemyMonEvolve]
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
	ld a, [wEnemyMonEvolve]
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
.evolve_weepinbell
	ld a, d ; a = wild level
	cp 35
	jp c, .donezo
	ld a, VICTREEBEL
	ld b, a
	ret
.evolve_exeggcute
	ld a, d ; a = wild level
	cp 38
	jp c, .donezo
	ld a, EXEGGUTOR
	ld b, a
	ret
.evolve_growlithe
	ld a, d ; a = wild level
	cp 39
	jp c, .donezo
	ld a, ARCANINE
	ld b, a
	ret
.evolve_nidorina
	ld a, d ; a = wild level
	cp 33
	jp c, .donezo
	ld a, NIDOQUEEN
	ld b, a
	ret
.evolve_nidorino
	ld a, d ; a = wild level
	cp 33
	jp c, .donezo
	ld a, NIDOKING
	ld b, a
	ret
.evolve_seadra
	ld a, d ; a = wild level
	cp 45
	jp c, .donezo
	ld a, KINGDRA
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
	cp WEEPINBELL
	jp z, .evolve_weepinbell
	cp EXEGGCUTE
	jp z, .evolve_exeggcute
	cp GROWLITHE
	jp z, .evolve_growlithe
	cp NIDORINA
	jp z, .evolve_nidorina
	cp NIDORINO
	jp z, .evolve_nidorino
	cp SEADRA
	jp z, .evolve_seadra
	
	ld a, d ; a = wild level
	cp 23
	jp c, .donezo
	inc hl
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte ; a = evolved species
	ld b, a
	jp .donezo
	
.evolve_chansey
	ld a, d ; a = wild level
	cp 40
	jp c, .donezo
	ld a, BLISSEY
	ld b, a
	ret
.evolve_golbat
	ld a, d ; a = wild level
	cp 40
	jp c, .donezo	
	ld a, CROBAT
	ld b, a
	ret
	
.evolve_happy
	pop bc
	cp CHANSEY
	jp z, .evolve_chansey
	cp GOLBAT
	jp z, .evolve_golbat
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
	cp 20
	jp c, .donezo
	pop hl
	ld a, [wEnemyMonEvolve]
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