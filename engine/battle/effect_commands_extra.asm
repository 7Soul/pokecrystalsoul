; sets carry flag if move `e` is variable		
; saves index into `a`, `d` and `wCurType`
IsVariableMove::
	ld a, -1
	ld [wCurVariableMove], a
	ld hl, VariableMoves
	ld d, 0
.moves_loop
	ld a, [hli]
	cp -1
	jr z, .not_var
	cp e
	jr z, .found_move
	inc d
	jr .moves_loop
.found_move
	ld a, d
	ld [wCurType], a
	scf
	ret
.not_var
	and a
	ret

; takes variable index in `d`, and puts variable move id in `e`, `a` and `wCurVariableMove`
GetVariableMoveType::
	ld hl, VariablePointers
	dec d
	ld a, d
	add a
	add d
	ld e, a
	sbc a, a ; Sign-extend A
	ld d, a
	add hl, de
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	
.loop_variable_types_by_name
	ld a, [hl]
	cp -2
	jr z, .no_type_match
; found move
	ld a, [hli]
	ld [wCurVariableMove], a ; save our new move
	ld a, [wBattleMode] ; overworld or battle check
	and a
	jr nz, .battle
	ld a, [wCurPartySpecies]
	ld e, a
	jr .got_species
.battle
	ld a, [wBattleMonSpecies]
	ld e, a
	ldh a, [hBattleTurn]
	and a
	jr z, .got_species
	ld a, [wEnemyMonSpecies]
	ld e, a

.got_species ; got species we're looking at
	ld a, [hli]
	cp -1
	jr z, .loop_variable_types_by_name ; move isn't variable to this species
	cp e 
	jr z, .found_mon_name
	jr .got_species 

.found_mon_name ; in table
	ld a, [wCurVariableMove]
	ld e, a
	scf
	ret

.no_type_match
; restores original type
	ld a, -1
	ld [wCurVariableMove], a
	ld a, [wCurSpecies]
	ld e, a
	and a
	ret

INCLUDE "data/moves/variable_moves_table.asm"

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
	
CheckIfTargetIsNthType: ; takes type in `b`
	ld de, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wBattleMonType1
.ok
CheckIfTargetIsNthTypeGotValue:
	ld a, [de]
	inc de
	cp b
	ret z
	ld a, [de]
	cp b
	ret	

; HeldItems:
; 	ld hl, AllItems
; 	ret

; INCLUDE "data/held_items.asm"
	
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
	ld hl, wCurDamage + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	ldh [hDividend], a
	rr b
	or b
	jr nz, .at_least_one
	ld b, $1 ; minimum
	
.at_least_one
	ld a, b
	ldh [hDividend + 1], a

	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitBoostDrain

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
	
ApplyBrnEffectOnAttack:
	ldh a, [hBattleTurn]
	and a
	jr z, .enemy
	ld a, [wBattleMonStatus]
	and 1 << BRN
	ret z
	ld hl, wBattleMonAttack + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .player_ok
	ld b, $1 ; min attack

.player_ok
	ld [hl], b
	ret

.enemy
	ld a, [wEnemyMonStatus]
	and 1 << BRN
	ret z
	ld hl, wEnemyMonAttack + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .enemy_ok
	ld b, $1 ; min attack

.enemy_ok
	ld [hl], b
	ret

ApplyPrzEffectOnSpeed:
	ldh a, [hBattleTurn]
	and a
	jr z, .enemy
	ld a, [wBattleMonStatus]
	and 1 << PAR
	ret z
	ld hl, wBattleMonSpeed + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .player_ok
	ld b, $1 ; min speed

.player_ok
	ld [hl], b
	ret

.enemy
	ld a, [wEnemyMonStatus]
	and 1 << PAR
	ret z
	ld hl, wEnemyMonSpeed + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .enemy_ok
	ld b, $1 ; min speed

.enemy_ok
	ld [hl], b
	ret

SpeedBoostDamage: 
; damage * (user's speed + 20) / (opp's speed + 20)
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	and TYPE_MASK
	cp EFFECT_MULTI_HIT
	jr z, .speed_boost
	cp EFFECT_POISON_MULTI_HIT
	jr z, .speed_boost

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld hl, .SpeedBoostMoves
	ld de, 1
	call IsInArray
	jr c, .speed_boost
	ret
	
.speed_boost
	ld hl, wBattleMonSpeed
	ld de, wEnemyMonSpeed
	ld a, [hBattleTurn]
	and a
	jr z, .got_speed
	ld hl, wEnemyMonSpeed
	ld de, wBattleMonSpeed
.got_speed
; only boost if user speed is higher, so damage isn't reduced
	push hl
	push de
	ld c, 2
	call CompareBytes
	pop de
	pop hl
	ret nc
; user's speed in bc and opp's in hl
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	ld a, [de]
	ld h, a
	inc de
	ld a, [de]
	ld l, a
	call TruncateHL_BC
	ld a, c ; user
	add 20
	jr nc, .speed_max1
	ld c, $ff
.speed_max1
	ldh [hMultiplier], a
	call Multiply
	ld a, b ; opp
	add 20
	jr nc, .speed_max2
	ld c, $ff
.speed_max2
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ret

.SpeedBoostMoves:
	db QUICK_ATTACK
	db FIRE_SPIN
	db RAPID_SPIN
	db SWIFT
	db ZOOM_FLIGHT
	db SLASH
	db MACH_PUNCH
	db OCTAZOOKA
	db FEATHERGALE
	db AIR_SLASH
	db EXTREMESPEED
	db -1
