GetNextTrainerDataByte:
	ld a, [wTrainerGroupBank]
	call GetFarByte
	inc hl
	ret

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
	add hl, bc
	ld a, [hli]
	ld [wTrainerGroupBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wOtherTrainerID]
	ld b, a
.skip_trainer
	dec b
	jr z, .got_trainer
.loop
	call GetNextTrainerDataByte
	cp -1
	jr nz, .loop
	jr .skip_trainer
.got_trainer

.skip_name
	call GetNextTrainerDataByte
	cp "@"
	jr nz, .skip_name

	call GetNextTrainerDataByte
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
	inc a
	ld b, a
	pop hl
	call GetNextTrainerDataByte
	cp $ff
	ret z
	ld d, a ; save badge byte in d

	swap a
	and %1111 ; get first digit (badge min)
	cp b
	jp nc, .skip ; skip badge low

	ld a, d
	and %1111 ; get second digit (badge max)
	cp $f
	jr z, .always ; $F max badges will always appear (after the minimum matches)
	cp b
	jp c, .skip
.always
	call GetNextTrainerDataByte
	ld b, a
	and %11111 ; mask first 5 bits
	ld d, a ; put level in d
	ld a, b
	swap a
	rrca
	and %111
	ld [wEnemyMonEvolve], a ; evolve bit
	; change level
	ld a, [wNumSetBits] ; a is number of badges
	ld b, d ; b is level
	push hl
	push de
	call BadgeLevels
	pop de
	pop hl
	
	; call GetNextTrainerDataByte ; get evolve bit
	; ld [wEnemyMonEvolve], a
	
	call GetNextTrainerDataByte ; get speciess
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
	call GetNextTrainerDataByte
	ld [de], a
	inc de
	cp "@"
	jr nz, .copy_nickname
.extra_char
	inc c
	call GetNextTrainerDataByte
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

	call GetNextTrainerDataByte
	ld [de], a ; DV byte
	inc de
	ld a, STA_MAX
	ld [de], a ; Stamina
.no_dvs

; item?
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_ITEM_F, a
	jr z, .no_item

	call GetNextTrainerDataByte ; a has item badge req
	ld b, a

	push hl
	ld hl, wBadges
	ld b, 2
	call CountSetBits	
	ld a, [wNumSetBits]
	pop hl

	cp b ; compare badges to item badge requirement
	inc hl
	jp c, .no_item
	
	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Item
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl

	dec hl
	call GetNextTrainerDataByte
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
	call GetNextTrainerDataByte
	dec hl
	cp NO_MOVE
	jp z, .new_is_ff

	call GetNextTrainerDataByte
	dec hl
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
	call GetNextTrainerDataByte ; move (after moves were added)
	
	push hl
	push bc
	push de
	ld e, a
	farcall IsVariableMove
	jr nc, .not_variable
	farcall GetVariableMoveType
	jr nc, .not_variable
	ld a, e
	ld hl, VarMoves + MOVE_PP
	jr .got_move_pointer
.not_variable
	ld a, e
	dec a
	ld hl, Moves + MOVE_PP
.got_move_pointer
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop de
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
	; inc hl
	
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
	
.extra_skip2 ; skips 2 bytes for item info
	inc hl
	inc hl
	jp .skip_after_check2
	
.extra_skip3 ; skips 4 bytes for moves info
	inc hl
	inc hl
	inc hl
	inc hl
	jp .skip_after_check3
	
.extra_skip4 ; skips 1 byte for dvs info
	inc hl
	jp .skip_after_check4
	
BadgeLevels:
	push bc
	ld hl, .levels
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	add b
	ld b, a
	
	ld a, [wPartyCount]
	dec a
	ld hl, .levels_per_partycount
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	add b
	ld [wCurPartyLevel], a

	xor a
	ld d, a

	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Level
	ld a, [wPartyCount]

.party_loop
	push af
	ld a, [hl] ; get current
	ld d, a	; save current
	ld a, e ; get total
	add d   ; add current to total
	ld e, a ; save total

	pop af
	dec a
	jr z, .end_loop
	add hl, bc ; go to next pokemon level
	jr nz, .party_loop
	pop af
.end_loop
	ld a, [wPartyCount]
	ld c, a
	ld a, e
	call SimpleDivide ; b has average level of party

	ld c, 0
.loop_increase
	ld a, [wCurPartyLevel]
	cp b
	jr c, .add_average ; if player average level is higher than enemy level
	pop bc
	ret
.add_average
	ld a, [wCurPartyLevel]
	inc a
	ld [wCurPartyLevel], a
	ld a, c ; check how many loops we done
	cp $3
	inc c
	jr c, .loop_increase
	pop bc
	ret
	
.levels:
	db $0  ; 0 -> 0
	db $4  ; 1 -> 4
	db $a  ; 2 -> 10
	db $f  ; 3 -> 15
	db $18 ; 4 -> 24
	db $1c ; 5 -> 28
	db $1e ; 6 -> 30
	db $21 ; 7 -> 33
	db $24 ; 8 -> 36
	db $26 ; 9 -> 38
	db $28 ; 10 -> 40
	db $2a ; 11 -> 42
	db $2c ; 12 -> 44
	db $2e ; 13 -> 46
	db $30 ; 14 -> 48
	db $32 ; 15 -> 50
	db $34 ; 16 -> 52

.levels_per_partycount:
	db $0
	db $0
	db $1
	db $1
	db $2
	db $2
	
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
	and a
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

	inc hl
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte ; a = mon constant
	ld e, a ; puts evolved mon in e
	
	
	; ld a, d ; a = wild level
	; ld d, c ; d = evolve level data
	
.finish_evolve
	pop bc
	pop hl
	ld a, e
	ld b, a
	ret

.evolve_eevee
	ld a, d ; a = wild level
	cp 20
	jp c, .donezo
	pop hl
	ld a, [wEnemyMonEvolve]
	dec a
	jp z, .eevee_1
	dec a
	jp z, .eevee_2
	dec a
	jp z, .eevee_3
	dec a
	jp z, .eevee_4
.eevee_5
	ld a, UMBREON
	ld b, a
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

.evolve_gloom
	ld a, d ; a = wild level
	cp 35
	jp c, .donezo
	ld a, [wEnemyMonEvolve]
	dec a
	jp z, .gloom_1
.gloom_2
	ld a, BELLOSSOM
	jp .load_and_end
.gloom_1
	ld a, VILEPLUME
	jp .load_and_end

.evolve_poliwhirl
	ld a, d ; a = wild level
	cp 29
	jp c, .donezo
	ld a, [wEnemyMonEvolve]
	dec a
	jp z, .poliwhirl_1
.poliwhirl_2
	ld a, POLITOED
	jp .load_and_end
.poliwhirl_1
	ld a, POLIWRATH
	jp .load_and_end

.evolve_slowpoke
	ld a, d ; a = wild level
	cp 37
	jp c, .donezo
	ld a, [wEnemyMonEvolve]
	dec a
	jp z, .slowpoke_1
.slowpoke_2
	ld a, SLOWKING
	jp .load_and_end
.slowpoke_1
	ld a, SLOWBRO
	jp .load_and_end
.evolve_weepinbell
	ld a, d ; a = wild level
	cp 35
	jp c, .donezo
	ld a, VICTREEBEL
	jp .load_and_end
.evolve_exeggcute
	ld a, d ; a = wild level
	cp 38
	jp c, .donezo
	ld a, EXEGGUTOR
	jp .load_and_end
.evolve_growlithe
	ld a, d ; a = wild level
	cp 39
	jp c, .donezo
	ld a, ARCANINE
	jp .load_and_end
.evolve_nidorina
	ld a, d ; a = wild level
	cp 33
	jp c, .donezo
	ld a, NIDOQUEEN
	jp .load_and_end
.evolve_nidorino
	ld a, d ; a = wild level
	cp 33
	jp c, .donezo
	ld a, NIDOKING
	jp .load_and_end
.evolve_seadra
	ld a, d ; a = wild level
	cp 36
	jp c, .donezo
	ld a, KINGDRA
	jp .load_and_end

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
	jp .load_and_end
.evolve_golbat
	ld a, d ; a = wild level
	cp 40
	jp c, .donezo	
	ld a, CROBAT
	jp .load_and_end
	
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
	ld a, [wEnemyMonEvolve]
	dec a
	jp z, .hitmonlee
	dec a
	jp z, .hitmonchan
.hitmontop
	ld a, HITMONTOP
	jp .load_and_end
.hitmonlee
	ld a, HITMONLEE
	jp .load_and_end
.hitmonchan
	ld a, HITMONCHAN
	jp .load_and_end

.lower
.done
	pop bc
	pop hl
	ret
.donezo
	pop hl
	ret
.load_and_end
	ld b, a
	pop hl
	ret

ComputeTrainerReward:
	ld hl, hProduct
	xor a
	ld [hli], a
	ld [hli], a ; hMultiplicand + 0
	ld [hli], a ; hMultiplicand + 1
	ld a, [wEnemyTrainerBaseReward]

	ld a, [wNuzlocke]
	and a
	ld a, [wEnemyTrainerBaseReward]
	ld [hli], a ; hMultiplicand + 2
	jr z, .not_nuzlocke ; not set

	rra ; base reward is halved in nuzlocke
	ld [hli], a ; hMultiplicand + 2
.not_nuzlocke
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
	ld a, BANK(Battle_GetTrainerName)
	ld [wTrainerGroupBank], a
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
	add hl, bc
	ld a, [hli]
	ld [wTrainerGroupBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc

.loop
	dec b
	jr z, CopyTrainerName

.skip
	call GetNextTrainerDataByte
	cp $ff
	jr nz, .skip
	jr .loop

CopyTrainerName:
	ld de, wStringBuffer1
	push de
	ld bc, NAME_LENGTH
	ld a, [wTrainerGroupBank]
	call FarCopyBytes
	pop de
	ret

INCLUDE "data/trainers/party_pointers.asm"

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