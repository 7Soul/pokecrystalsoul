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
	ld [wFailedToFlee], a
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
	ld a, [wBattleEnded]
	and a
	jr nz, .got_species ; if battle ended, we always look at out own mons instead of checking for the turn
	ldh a, [hBattleTurn]
	and a
	jr z, .got_species
	ld a, [wEnemyMonSpecies]
	ld e, a

.got_species ; got species we're looking at
	ld a, [wFailedToFlee]
	cp TYPE_VARIABLE
	jp nc, .by_type ; list position is 41 or higher
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

.by_type
	push hl
	; get pokemon's base types
	ld a, e
	dec a
	ld hl, BaseData + BASE_TYPES
	ld bc, BASE_DATA_SIZE
	call AddNTimes
	ld a, BANK(BaseData)
	call GetFarByte
	ld b, a
	inc hl
	ld a, BANK(BaseData)
	call GetFarByte
	ld c, a
	pop hl
	ld a, [hli] ; grab type from variable move table
	cp -1
	jr z, .loop_variable_types_by_name
	cp b
	jp z, .found_mon_name
	cp c
	jp z, .found_mon_name
	inc hl
	jp .loop_variable_types_by_name
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
CheckIfTargetIsNthTypeGotValue: ; already has target type in `DE`
	ld a, [de]
	inc de
	cp b
	ret z
	ld a, [de]
	dec de
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
	ldh a, [hBattleTurn]
	push af

	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitBoostDrain

	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitWhenDrainedOther
	pop af
	ldh [hBattleTurn], a
	
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
	ldh a, [hBattleTurn]
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

Slow_Hit:
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonSpeed
	ld de, wEnemyMonSpeed
    jr z, .go
    ld hl, wEnemyMonSpeed
	ld de, wBattleMonSpeed
.go
; user's speed in bc and opp's in hl
    ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	and a
	ret z
	ld a, [de]
	ld h, a
	inc de
	ld a, [de]
	ld l, a
; b = opp, c = user
	call TruncateHL_BC
; opp's speed divided by user's
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp STEEL
	jr z, .got_type
; non steel (aka ELECTRIC) swaps b and c
	ld a, b
	ld b, c
	ld c, a
.got_type
	xor a
	ldh [hDividend + 0], a
	ldh [hDividend + 1], a
	ld a, b
	ldh [hDividend + 2], a
	ld a, c
	ldh [hDivisor], a
    ld b, 4
	call Divide
	ld a, 25
	ldh [hMultiplier], a
	call Multiply

	ldh a, [hProduct + 1]
	and a
	jr z, .notmax
.max
	ld a, 150
	jr .got_damage
.notmax
	ldh a, [hProduct + 2]
	inc a
	cp 150
	jr nc, .max
	; Overwrite the current move power
.got_damage
	cp 40
	jr nc, .min
	ld a, 40
.min
	ld b, a
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVarAddr
	ld [hl], b
	ret

RageDamage:
	ld a, [wCurDamage]
	ld h, a
	ld b, a
	ld a, [wCurDamage + 1]
	ld l, a
	ld c, a
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerRageCounter]
	jr z, .rage_loop
	ld a, [wEnemyRageCounter]
.rage_loop
	and a
	jr z, .done
	dec a
	add hl, bc
	jr nc, .rage_loop
	ld hl, $ffff
.done
	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a
	ret

CheckRoost: ; bc has foe's type
	ld a, BATTLE_VARS_LAST_MOVE_OPP
	call GetBattleVar
	cp RECOVER
	ret nz
	
	ld a, c ; foe's second type
	cp FLYING
	ret nz
	; copies first type to second type
	ld a, b
	ld c, a
	ret

DoTransform:
	ld a, [wCurSpecies]
	cp DITTO
	ret nz
	ld a, TRANSFORM
	ld [wCurEnemyMove], a
	ld [wCurPlayerMove], a
	callfar UpdateMoveData
	xor a
	ld [wAttackMissed], a
	ld [wAlreadyDisobeyed], a
	ld a, EFFECTIVE
	ld [wTypeModifier], a
	callfar DoMove
	ret

BattleCommandExtra_Critical:
; critical

; Determine whether this attack's hit will be critical.

	xor a
	ld [wCriticalHit], a

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	and a
	ret z

	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyMonItem
	ld a, [wEnemyMonSpecies]
	jr nz, .Item
	ld hl, wBattleMonItem
	ld a, [wBattleMonSpecies]

.Item:
	ld c, 0

	cp CHANSEY
	jr nz, .Farfetchd
	ld a, [hl]
	cp LUCKY_PUNCH
	jp nz, .FocusEnergy

; +2 critical level
	ld c, 2
	jp .Traits

.Farfetchd:
	cp FARFETCH_D
	jr nz, .Steel_Wing_Check
	ld a, [hl]
	cp LEEK
	jp nz, .FocusEnergy

; +2 critical level
	ld c, 2
	jp .Traits

.Steel_Wing_Check:
	; push hl
	ld d, a ; save mon to d	
	ld hl, UnevolvedList
	
.load_held_item
	ldh a, [hBattleTurn]
	and a
	ld a, [wEnemyMonItem]
	ld e, a
	jr nz, .find_mon
	ld a, [wBattleMonItem]
	ld e, a
	
.find_mon
	ld a, [hli]
	cp d
	jr z, .found_mon
	cp -1
	jp z, .FocusEnergy
	inc hl
	jr .find_mon

.found_mon
	ld a, [hli] ; item from table
	cp e
	jr z, .found_item	
	jp .load_held_item
	
.found_item	
	ld de, wBattleMonType1 ;put pokemon type in de
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wEnemyMonType1
.ok
	ld hl, wPlayerTypeMod
	ld a, [hl]
	and a
	jr nz, .has_mod
	
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
.has_mod
	ld b, a
	ld a, [de]
	cp b
	jr z, .sametype
	inc de
	ld a, [de]
	cp b
	jr z, .sametype
	jr .FocusEnergy
.sametype
	ld a, BATTLE_VARS_MOVE_POWER ; Check if power is below 60
	call GetBattleVar
	cp 61
	jr nc, .FocusEnergy
	cp 2
	jr c, .FocusEnergy

; +2 critical level
	ld c, 2
	jp .Traits

.FocusEnergy:
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_FOCUS_ENERGY, a
	jr z, .CheckCritical

; +1 critical level
	inc c

.CheckCritical:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld de, 1
	ld hl, CriticalHitMoves
	push bc
	call IsInArray
	pop bc
	jr nc, .ScopeLens

; +2 critical level
	inc c
	inc c

.ScopeLens:
	push bc
	callfar GetUserItem
	ld a, b
	cp HELD_CRITICAL_UP ; Increased critical chance. Only Scope Lens has this.
	pop bc
	jr nz, .Traits

; +1 critical level
	inc c

.Traits:
	push bc
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitBoostCritical

	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitLowerCritical
	pop bc
; buffer 0 does nothing, 1 raises crit by 1, 2 lowers crit by 1
	ld a, [wBuffer2]
	and a
	jr z, .Tally
	inc c
	dec a
	jr z, .Tally
	dec c
	dec c

.Tally:
	ld hl, CriticalHitChances
	ld b, 0
	add hl, bc
	call BattleRandom
	cp [hl]
	ret nc
	ld a, 1
	ld [wCriticalHit], a
	ret
	
INCLUDE "data/moves/critical_hit_moves.asm"

INCLUDE "data/battle/critical_hit_chances.asm"

BattleCommandExtra_Spikes:
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_turn
	ld hl, wPlayerScreens
.got_turn

; Fails if spikes are already down!

	bit SCREENS_COALS, [hl]
	jr nz, .failed
	bit SCREENS_SPIKES, [hl]
	jr nz, .failed
	bit SCREENS_BARBS, [hl]
	jr nz, .failed
	bit SCREENS_WEB, [hl]
	jr nz, .failed

; Nothing else stops it from working.
	ld a, BATTLE_VARS_TRAIT
	call GetBattleVar
	cp TRAIT_HOT_COALS
	jr z, .hot_coals
	cp TRAIT_BARBS
	jr z, .barbs

.common_spikes
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld e, a
	farcall IsVariableMove
	jr nc, .not_variable
	farcall GetVariableMoveType
	jr c, .variable
.not_variable
	ld a, $ff
	ld [wCurVariableMove], a
	jr .web
.variable
	set SCREENS_WEB, [hl]
	ld hl, StickyWebText
	jr .end
.web
	set SCREENS_SPIKES, [hl]
	ld hl, SpikesText
	jr .end
.hot_coals
	set SCREENS_COALS, [hl]
	ld hl, CoalsText
	jr .end
.barbs
	set SCREENS_BARBS, [hl]
	ld hl, BarbsText
.end
	push hl
	farcall AnimateCurrentMove
	pop hl
	jp StdBattleTextBox

.failed
	jp FailMove


MoveInfoBox:
	xor a
	ldh [hBGMapMode], a

	hlcoord 0, 7
	ld b, 2
	ld c, 8
	call TextBox
	hlcoord 0, 9
	ld b, 2
	ld c, 9
	call TextBox
	call MobileTextBorder
	
	hlcoord 0, 9
	ld a, $bd
	ld [hl], a
	hlcoord 9, 9
	ld a, $be
	ld [hl], a
	hlcoord 1, 9
	ld a, $7f
	ld c, 7
.line_loop
	ld [hli], a
	dec c
	jr nz, .line_loop
	
	hlcoord 0, 12
	ld a, $c2 ; mid left
	ld [hl], a
	hlcoord 10, 12
	ld a, $c0 ; mid up
	ld [hl], a
	
	ld a, [wPlayerDisableCount]
	and a
	jr z, .not_disabled

	swap a
	and $f
	ld b, a
	ld a, [wMenuCursorY]
	cp b
	jr nz, .not_disabled

	hlcoord 1, 11
	ld de, .Disabled
	call PlaceString
	jp .done

.not_disabled
	ld hl, wMenuCursorY
	dec [hl]
	call SetPlayerTurn
	ld hl, wBattleMonMoves
	ld a, [wMenuCursorY]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wCurPlayerMove], a

	ld a, [wCurBattleMon]
	ld [wCurPartyMon], a
	ld a, WILDMON
	ld [wMonType], a
	callfar GetMaxPPOfMove

	ld hl, wMenuCursorY
	ld c, [hl]
	inc [hl]

	callfar UpdateMoveData
	ld de, .bp_string
	hlcoord 1, 8
	call PlaceString

	ld a, [wPlayerMoveStruct + MOVE_POWER]
	hlcoord 4, 8
	cp 2
	jr c, .no_power
	ld [wDeciramBuffer], a
	ld de, wDeciramBuffer
	lb bc, 1, 3
	call PrintNum
	jr .place_acc
.no_power
	ld de, .String_na
	call PlaceString

.place_acc
	ld de, .acc_string
	hlcoord 2, 9
	call PlaceString

	ld a, [wPlayerMoveStruct + MOVE_ACC]
	ld [hMultiplicand], a
	ld a, 100
	ld [hMultiplier], a
	call Multiply
	ld a, [hProduct]
	; don't increase a for 0% moves
	and a
	jr z, .no_inc
	inc a
.no_inc
	hlcoord 6, 9
	cp 2
	jr c, .no_acc
	ld [wDeciramBuffer], a
	ld de, wDeciramBuffer
	lb bc, 1, 3
	call PrintNum
	jr .category
.no_acc
	ld de, .String_na
	call PlaceString
	
.category
	ld a, [wPlayerMoveStruct + MOVE_ANIM]
	ld b, a
	farcall GetMoveCategoryName
	hlcoord 1, 10
	ld de, wStringBuffer1
	call PlaceString

	ld h, b
	ld l, c
	ld [hl], "/"

	ld a, [wPlayerMoveStruct + MOVE_ANIM]
	ld b, a
	hlcoord 2, 11
	predef PrintMoveType

.done
	ret

.Disabled:
	db "Disabled!@"

.bp_string:
	db "BP@"

.acc_string:
	db "Acc@"

.String_na:
	db "---@"

ApplyExhaustionPenalty:
	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyMonStamina
	jr z, .got_stamina
	ld hl, wBattleMonStamina
.got_stamina
	ld a, [hl]
	swap a
	and STA_EX_MAX
	ld hl, .exhaustion_penalty
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	call ApplyDamageMod
	ret

.exhaustion_penalty:
	db $11 ;  0 - 1.00
	db $BA ;  1 - 1.10
	db $65 ;  2 - 1.20
	db $CA ;  3 - 1.30

RegenPartyStamina::
	ld a, [wBuffer1]
	ld hl, wPartySpecies
	and a
	jr z, .got_party_species
	ld hl, wOTPartySpecies
.got_party_species
	xor a
	ld [wCurPartyMon], a
.loop
	ld b, a
	ld a, [hli]
	cp -1
	ret z
	cp EGG
	jr z, .next

	ld a, [wBuffer1]
	push bc
	push hl
	and a ; partymon?
	jr nz, .get_otmon
	ld a, MON_STAMINA
	call GetPartyParamLocation
	ld a, [wCurBattleMon]
	ld [wBuffer2], a
	ld de, wBattleMonStamina
	jr .got_stamina_location

.get_otmon
	push bc
	ld hl, wOTPartyMons
	ld c, MON_STAMINA
	ld b, 0
	add hl, bc
	ld a, [wCurPartyMon]
	call GetPartyLocation
	pop bc
	ld a, [wCurOTMon]
	ld [wBuffer2], a
	ld de, wEnemyMonStamina

.got_stamina_location
	ld c, 0 ; 0 regen for now
	ld a, [hl]
	and STA_MASK
	and a ; 0 stamina?
	jr nz, .got_stamina
	ld c, STA_MAX ; full regen when stamina is 0
.got_stamina
; doubles gain if the last move was super effective
; 	ld a, [wTypeModifier]
; 	and $7f
; 	cp SUPER_EFFECTIVE
; 	jr nz, .not_super
; 	sla c 
; .not_super
	ld a, [wBuffer2]
	cp b
	jr z, .same_battlemon
	sla c
.same_battlemon
	call ItemStaminaRegen
	push bc
	ld a, [hl]
	and STA_MASK
	add c
	cp STA_MAX
	jr c, .max
	ld a, STA_MAX
.max
	ld b, a ; saves stamina amount (not counting exhaustion) in b
; add exhaustion into stamina amount
	ld a, [hl]
	and STA_EX_MASK
	or b
	ld [hl], a
	pop bc
	ld c, a ; save total stamina value in c
	ld a, [wBuffer2]
	cp b
	jr nz, .not_battlemon
	ld h, d
	ld l, e
	ld a, c
	ld [hl], a
.not_battlemon
	pop hl
.next
	ld a, [wCurPartyMon]
	inc a
	ld [wCurPartyMon], a
	pop bc
	jp .loop

; Copies current battlemon stamina to partymon stamina. 	
; Takes current stamina (including exhaustion bits) in `hl` and PARTYMON or OTPARTYMON in `[wBuffer1]`
UpdatePartyStamina::
	push bc
	ld a, [wBuffer1] 
	and a ; PARTYMON?
	ld hl, wPartyMon1Stamina
	ld a, [wCurBattleMon]
	jr z, .got_party_stamina_pointer
	ld hl, wOTPartyMon1Stamina
	ld a, [wCurOTMon]
.got_party_stamina_pointer
	call GetPartyLocation
	ld a, [wBuffer2]
	ld [hl], a
	pop bc
	ret

ItemStaminaRegen::
	push hl
	ld a, [wBuffer2]
	cp b
	jr nz, .no_regen
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	ld a, [hl]
	and %11110001
	ld b, a
; count turns
	ld a, [hl]
	and SUBSTATUS_REGEN_STAMINA_TURNS
	rra
	and a
	jr z, .no_regen
	dec a
	jr nz, .min
; turns became 0
	xor a
	res SUBSTATUS_REGEN_STAMINA, [hl]
.min
	sla a
	or b
	ld [hl], a
; increases regen amount
	and SUBSTATUS_REGEN_STAMINA_MASK
	jr z, .regen_one
	inc c
.regen_one
	inc c
	inc c ; for loop
	ld a, [wBattleMonStamina]
.loop
	dec c
	and STA_MASK
	add c
	cp STA_MAX
	jr nc, .loop
.no_regen
	pop hl
	ret

GetMoveID::
	ld a, [wCurVariableMove]
	cp -1
	scf
	ret nz
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	and a
	ret

