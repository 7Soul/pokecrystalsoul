ReplaceVariableType::
; takes move at e and pokemon types at bc
; has original type at wCurType
	ld a, [wCurType]
	ld [wMoveType], a
	push af
	push hl
	push de
	call IsVariableMove
	jr nc, .not_variable
	ld a, [wCurType]
	ld d, a
	call GetVariableMoveType
	ld a, [wCurType]
	pop af
	pop de
	pop hl
	ret
.not_variable
	pop de
	ld a, [wMoveType]
	ld [wCurType], a ; restores original type
	pop af
	pop hl
	ret

IsVariableMove::
; sets c if move 'e' is variable
; saves id into wCurType
	xor a
	ld [wCurType], a
	ld hl, VariableMoves
	ld d, 0
.moves_loop
	ld a, [hli]
	cp -1
	ret z
	cp e
	jr z, .found_move
	inc d
	jr .moves_loop
.found_move
	ld a, d
	ld [wCurType], a
	scf
	ret

GetVariableMoveType::
; takes mon types in 'b' and 'c', and and puts type in wCurType and 'a'
; takes variable id in 'd' from IsVariableMove
	ld hl, VariableTypesByName
	ld a, [wCurSpecies] ; move id
	ld e, a
	ld a, [hli]
	cp e
	jr z, .found_move
	dec hl
.loop_variable_types_by_name
	ld a, [hl]
	cp -2
	jr z, .check_by_type

	ld a, [wCurSpecies]
	ld e, a
	ld a, [hli]
	cp e
	jr z, .found_move
	inc hl
	inc hl
	jr .loop_variable_types_by_name

.found_move
	push bc
	ld a, [wBattleMode] ; overworld or battle check
	and a
	jp nz, .battle
	ld a, [wCurPartySpecies]
	ld b, a
	jr .got_species
.battle
	ld a, [wCurPartySpecies]
	ld b, a
	ldh a, [hBattleTurn]
	and a
	jr z, .got_species
	ld a, [wEnemyMonSpecies]
	ld b, a

.got_species
	ld a, b
	pop bc
	ld e, a
	
	ld a, [hli]
	cp e
	jr z, .found_mon_name
	inc hl
	jr .loop_variable_types_by_name 

.found_mon_name
	ld a, [hl]
	ld [wCurType], a
	ret

.check_by_type
	ld e, 0
	ld hl, VariableTypes
	ld a, d
	and a
	jr z, .loop ; if d is 0 start at first entry

.loop_variable_types
	ld a, [hli]
	cp -1
	jr nz, .loop_variable_types

	inc e
	ld a, e
	cp d
	jr z, .loop
	jr .loop_variable_types

.loop
	ld a, [hli]
	cp -1
	jr z, .no_type_match

	cp c
	jr z, .got_variable
	cp b
	jr z, .got_variable
	inc hl
	jr .loop

.got_variable
	ld a, [hl]
	ld [wCurType], a
	ret

.no_type_match
; restores original type into wCurType
	push bc
	ld a, [wCurSpecies]
	dec a
	ld bc, MOVE_LENGTH
	ld hl, Moves
	call AddNTimes
	ld de, wStringBuffer1
	ld a, BANK(Moves)
	call FarCopyBytes
	ld a, [wStringBuffer1 + MOVE_TYPE]
	and TYPE_MASK
	ld [wCurType], a
	pop bc
	; ld a, [wMoveType]
	; ld [wCurType], a ; restores original type
	ret

GetVariableMoveName2::
	call GetVariableMoveName
	ld de, wStringBuffer2
	ld bc, wStringBuffer3 - wStringBuffer2
	call CopyBytes
	ret

INCLUDE "data/moves/variable_moves_table.asm"

CheckIfTargetIsElectricType:
	ld de, wEnemyMonType1
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wBattleMonType1
.ok
	ld a, [de]
	inc de
	cp ELECTRIC
	ret z
	ld a, [de]
	cp ELECTRIC
	ret
	
CheckMoveTypeMatchesTarget:
; Compare move type to opponent type.
; Return z if matching the opponent type,
; unless the move is Normal (Tri Attack).
	push hl
	ld hl, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wBattleMonType1
	
.ok
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp NORMAL
	jr z, .normal
	cp [hl]
	jr z, .return
	inc hl
	cp [hl]

.return
	pop hl
	ret

.normal
	ld a, 1
	and a
	pop hl
	ret
	
CheckIfTargetIsFireType:
	ld de, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wBattleMonType1
.ok
	ld a, [de]
	inc de
	cp FIRE
	ret z
	ld a, [de]
	cp FIRE
	ret	
	
CheckIfTargetIsWaterType:
	ld de, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wBattleMonType1
.ok
	ld a, [de]
	inc de
	cp WATER
	ret z
	ld a, [de]
	cp WATER
	ret

HeldItems:
	ld hl, AllItems
	ret

INCLUDE "data/held_items.asm"
	
CheckOppositeGender:
	ld a, MON_SPECIES
	call BattlePartyAttr
	ld a, [hl]
	ld [wCurPartySpecies], a

	ld a, [wCurBattleMon]
	ld [wCurPartyMon], a
	xor a
	ld [wMonType], a

	farcall GetGender
	jr c, .genderless_samegender

	ld b, 1
	jr nz, .got_gender
	dec b

.got_gender
	push bc
	ld a, [wTempEnemyMonSpecies]
	ld [wCurPartySpecies], a
	ld hl, wEnemyMonDVs
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jr z, .not_transformed
	ld hl, wEnemyBackupDVs
.not_transformed
	ld a, [hli]
	ld [wTempMonDVs], a
	ld a, [hl]
	ld [wTempMonDVs + 1], a
	ld a, 3
	ld [wMonType], a
	farcall GetGender
	pop bc
	jr c, .genderless_samegender

	ld a, 1
	jr nz, .got_enemy_gender
	dec a

.got_enemy_gender
	xor b
	jr z, .genderless_samegender

	and a
	ret

.genderless_samegender
	scf
	ret

CheckAnyOtherAlivePartyMons:
	ld hl, wPartyMon1HP
	ld a, [wPartyCount]
	ld d, a
	ld a, [wCurBattleMon]
	ld e, a
	jr CheckAnyOtherAliveMons

CheckAnyOtherAliveEnemyMons:
	ld hl, wOTPartyMon1HP
	ld a, [wOTPartyCount]
	ld d, a
	ld a, [wCurOTMon]
	ld e, a

	; fallthrough

CheckAnyOtherAliveMons:
; Check for nonzero HP starting from partymon
; HP at hl for d partymons, besides current mon e.

; Return nz if any are alive.

	xor a
	ld b, a
	ld c, a
.loop
	ld a, c
	cp d
	jr z, .done
	cp e
	jr z, .next

	ld a, [hli]
	or b
	ld b, a
	ld a, [hld]
	or b
	ld b, a

.next
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	inc c
	jr .loop

.done
	ld a, b
	and a
	ret

IgnoreSleepOnly:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar

	; Snore and Sleep Talk bypass sleep.
	cp SNORE
	jr z, .CheckSleep
	cp SLEEP_TALK
	jr z, .CheckSleep
	and a
	ret

.CheckSleep:
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	ret z

; 'ignored orders…sleeping!'
	ld hl, IgnoredSleepingText
	call StdBattleTextBox

	call EndMoveEffect

	scf
	ret
	
CheckMimicUsed:
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurMoveNum]
	jr z, .player
	ld a, [wCurEnemyMoveNum]

.player
	ld c, a
	ld a, MON_MOVES
	call UserPartyAttr

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	cp MIMIC
	jr z, .mimic
;
	ld b, 0
	add hl, bc
	ld a, [hl]
	cp MIMIC
	jr nz, .mimic

	scf
	ret

.mimic
	and a
	ret
	
CheckPlayerHasMonToSwitchTo:
	ld a, [wPartyCount]
	ld d, a
	ld e, 0
	ld bc, PARTYMON_STRUCT_LENGTH
.loop
	ld a, [wCurBattleMon]
	cp e
	jr z, .next

	ld a, e
	ld hl, wPartyMon1HP
	call AddNTimes
	ld a, [hli]
	or [hl]
	jr nz, .not_fainted

.next
	inc e
	dec d
	jr nz, .loop

	scf
	ret

.not_fainted
	and a
	ret
	
SapHealth:
	; Divide damage by 2, store it in hDividend
	ld hl, wCurDamage
	ld a, [hli]
	srl a
	ldh [hDividend], a
	ld b, a
	ld a, [hl]
	rr a
	ldh [hDividend + 1], a
	or b
	jr nz, .at_least_one
	ld a, 1
	ldh [hDividend + 1], a
.at_least_one

	ld hl, wBattleMonHP
	ld de, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .battlemonhp
	ld hl, wEnemyMonHP
	ld de, wEnemyMonMaxHP
.battlemonhp

	; Store current HP in little endian wBuffer3/4
	ld bc, wBuffer4
	ld a, [hli]
	ld [bc], a
	ld a, [hl]
	dec bc
	ld [bc], a

	; Store max HP in little endian wBuffer1/2
	ld a, [de]
	dec bc
	ld [bc], a
	inc de
	ld a, [de]
	dec bc
	ld [bc], a

	; Add hDividend to current HP and copy it to little endian wBuffer5/6
	ldh a, [hDividend + 1]
	ld b, [hl]
	add b
	ld [hld], a
	ld [wBuffer5], a
	ldh a, [hDividend]
	ld b, [hl]
	adc b
	ld [hli], a
	ld [wBuffer6], a
	jr c, .max_hp

	; Substract current HP from max HP (to see if we have more than max HP)
	ld a, [hld]
	ld b, a
	ld a, [de]
	dec de
	sub b
	ld a, [hli]
	ld b, a
	ld a, [de]
	inc de
	sbc b
	jr nc, .finish

.max_hp
	; Load max HP into current HP and copy it to little endian wBuffer5/6
	ld a, [de]
	ld [hld], a
	ld [wBuffer5], a
	dec de
	ld a, [de]
	ld [hli], a
	ld [wBuffer6], a
	inc de

.finish
	ldh a, [hBattleTurn]
	and a
	hlcoord 10, 9
	ld a, $1
	jr z, .hp_bar
	hlcoord 2, 2
	xor a
.hp_bar
	ld [wWhichHPBar], a
	predef AnimateHPBar
	call RefreshBattleHuds
	jp UpdateBattleMonInParty

CheckTraitCondition:
	ld a, BATTLE_VARS_TRAIT
	call GetBattleVar
	; ld [$c000], a
	ld de, 1
	call IsInArray
	jr nc, .not_met

	ld a, BATTLE_VARS_TRAIT
	call GetBattleVar
	; cp TRAIT_CONTACT_BRN
	; jr c, .end
	; cp TRAIT_CONTACT_FLINCH + 1
	; jr c, .check_physical_move
	cp TRAIT_RAIN_ATTACK
	jr nc, .check_rain
	jr .end
	cp TRAIT_RAIN_SP_DEFENSE + 1
	jr c, .check_rain
.end
	scf
	ret

.not_met
	and a
	ret

.check_rain
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	jr z, .rain
	and a
	ret
.rain
	scf
	ret

.check_physical_move
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerMoveStructType]
	jr z, .got_it
	ld a, [wEnemyMoveStructType]
.got_it
	cp SPECIAL
	ret

TraitRaiseStat:
; wBuffer2 contains stat name (backwards id)
; wBuffer1 contains +stat count
	ld a, [wBuffer1]
	cp $5
	jr z, .atk
	cp $4
	jr z, .def
	cp $3
	jr z, .spd
	cp $2
	jr z, .spatk
	cp $1
	jr z, .spdef
	jr .not_met

.atk
	ld hl, .TraitsThatRaiseAttack
	call CheckTraitCondition
	jr nc, .not_met
	jr .end
.def
	ld hl, .TraitsThatRaiseDefense
	call CheckTraitCondition
	jr nc, .not_met
	jr .end
.spd
	ld hl, .TraitsThatRaiseSpeed
	call CheckTraitCondition
	jr nc, .not_met
	jr .end
.spatk
	ld hl, .TraitsThatRaiseSpAttack
	call CheckTraitCondition
	jr nc, .not_met
	jr .end
.spdef
	ld hl, .TraitsThatRaiseSpDefense
	call CheckTraitCondition
	jr nc, .not_met
.end
	ld a, [wBuffer2]
	inc a
	ld [wBuffer2], a
.not_met
	ret

.TraitsThatRaiseAttack:
	db TRAIT_RAIN_ATTACK
	db -1

.TraitsThatRaiseDefense:
	db TRAIT_RAIN_DEFENSE
	db -1

.TraitsThatRaiseSpeed:
	db TRAIT_RAIN_SPEED
	db -1

.TraitsThatRaiseSpAttack:
	db TRAIT_RAIN_SP_ATTACK
	db -1

.TraitsThatRaiseSpDefense:
	db TRAIT_RAIN_SP_DEFENSE
	db -1
