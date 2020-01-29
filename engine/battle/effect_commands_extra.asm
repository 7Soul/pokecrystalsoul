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
	call TraitBoostDrain

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

CheckTrait:
	cp -1
	ret z
	push hl
	ld hl, wTraitActivated
	ldh a, [hBattleTurn]
	and a	
	jr z, .player_turn
	bit 1, [hl]
	jr nz, .already_activated
	jr .check_trait
.player_turn
	bit 0, [hl]
	jr nz, .already_activated
.check_trait
	ld a, [wBuffer1]
	cp BATTLE_VARS_TRAIT
	jr z, .end
	cp BATTLE_VARS_TRAIT_OPP
	jr z, .end
	ld a, BATTLE_VARS_TRAIT ; load this if wBuffer1 is some other value. May behave wrong if wBuffer1 was 12 or 13 by coincidence
.end
	pop hl
	call CheckTraitCondition
	ret
.already_activated
	pop hl
	and a
	ret

CheckSpecificTrait:
	ld b, a
	ld a, [wBuffer1]
	call GetBattleVar
	cp b
	jr nz, .no_trait
	jp CheckTraitCondition.GotTrait
.no_trait
	and a
	ret

CheckTraitCondition:
	ld a, [wBuffer1]
	call GetBattleVar
	ld de, 1	
	call IsInArray
	ld a, b
	ld [wBuffer3], a ; store array index
	jp nc, .not_met1
	ld a, [wBuffer1]
	call GetBattleVar
	; fallthrough
.GotTrait:
	cp TRAIT_NONE
	jp z, .not_met1
	cp TRAIT_SANDSTORM_ON_ENTER + 1 ; traits lower than this have no conditions
	jp c, .success
	cp TRAIT_REDUCE_RECOIL + 1 ; all traits that require rain weather
	jp c, .check_recoil
	cp TRAIT_RAIN_NO_STATUS + 1 ; all traits that require rain weather
	jp c, .check_rain	
	cp TRAIT_SUNSHINE_NO_STATUS + 1 ; all sun traits
	jp c, .check_sun
	cp TRAIT_SANDSTORM_NO_STATUS + 1 ; all sandstorm traits
	jp c, .check_sandstorm
	cp TRAIT_BOOST_EFFECT_BRN + 1 ; all burn traits
	jp c, .check_move_brn
	cp TRAIT_REGEN_BRN + 1
	ld d, BRN
	jp c, .check_user_status
	cp TRAIT_BOOST_EFFECT_PSN + 1 ; all poison traits
	jp c, .check_move_psn
	cp TRAIT_BOOST_EFFECT_PRZ + 1 ; all paralysis traits
	jp c, .check_move_prz
	cp TRAIT_BOOST_EFFECT_FLINCH + 1 ; all flinch traits
	jp c, .check_move_flinch
	cp TRAIT_BOOST_EFFECT_CONFUSED + 1 ; all confusion traits
	jp c, .check_move_confused
	cp TRAIT_IN_LOVE_IMMUNE + 1 ; all attract traits
	jp c, .check_move_attract
	cp TRAIT_REDUCE_EFFECT_SLEEP + 1 ; all sleep traits
	jp c, .check_move_sleep
	cp TRAIT_BOOST_EFFECT_NO_DAMAGE + 1 ; all traits for status moves 
	jp c, .check_move_status
	cp TRAIT_BOOST_EFFECT_WITH_DAMAGE + 1 ; all traits for moves with secondary effects 
	jp c, .check_move_has_secondary
	cp TRAIT_REDUCE_NOT_STAB + 1 ; all traits for non-stab hits
	jp c, .check_not_stab
	cp TRAIT_BOOST_ACCURACY_TURN_ZERO + 1 ; all traits on turn 0
	ld d, 0
	jp c, .check_turns
	cp TRAIT_CRIT_BELOW_THIRD + 1 ; all traits that require to be below 50% hp
	ld b, 34
	jp c, .check_below_threshold
	; cp TRAIT_BOOST_MULTI_HIT_DAMAGE + 1 
	; jp c, .check_move_multihit
	push af
	ld a, BATTLE_VARS_MOVE_TYPE
 	call GetBattleVarAddr
	and TYPE_MASK
	ld d, a
	pop af
	cp TRAIT_REDUCE_BRN_AND_FIRE
	ld b, a
	ld c, FIRE
	call .check_move_type
	jp .check_move_brn
	cp TRAIT_REDUCE_PRZ_AND_ELECTRIC
	ld b, a
	ld c, ELECTRIC
	call .check_move_type
	jp .check_move_prz
	cp TRAIT_REDUCE_FLINCH_AND_ROCK
	ld b, a
	ld c, ROCK
	call .check_move_type
	jp .check_move_flinch
	cp TRAIT_REDUCE_SLP_AND_DARK
	ld b, a
	ld c, DARK
	call .check_move_type
	jp .check_move_sleep
	cp TRAIT_REDUCE_PSN_AND_BUG
	ld b, a
	ld c, DARK
	call .check_move_type
	jp .check_move_psn
	cp TRAIT_REDUCE_FRZ_AND_ICE
	ld b, a
	ld c, ICE
	call .check_move_type
	jp .check_move_frz
	cp TRAIT_REDUCE_CONFUSE_AND_PSYCHIC
	ld b, a
	ld c, PSYCHIC
	call .check_move_type
	jp .check_move_confused
	cp TRAIT_REDUCE_FIGHTING ; traits below this that require move type to be NORMAL
	ld b, a
	ld c, NORMAL
	jp c, .check_move_type
	cp TRAIT_REDUCE_FLYING ; traits that require move type to be FIGHTING
	ld b, a
	ld c, FIGHTING
	jp c, .check_move_type
	cp TRAIT_REDUCE_GROUND ; traits that require move type to be FLYING
	ld b, a
	ld c, FLYING
	jp c, .check_move_type
	cp TRAIT_REDUCE_ROCK; traits that require move type to be GROUND
	ld b, a
	ld c, GROUND
	jp c, .check_move_type
	cp TRAIT_REDUCE_BUG ; traits that require move type to be ROCK
	ld b, a
	ld c, ROCK
	jp c, .check_move_type
	cp TRAIT_REDUCE_FIRE ; traits that require move type to be BUG
	ld b, a
	ld c, BUG
	jp c, .check_move_type
	cp TRAIT_REDUCE_WATER ; traits that require move type to be FIRE
	ld b, a
	ld c, FIRE
	jp c, .check_move_type
	cp TRAIT_REDUCE_GRASS ; traits that require move type to be WATER
	ld b, a
	ld c, WATER
	jp c, .check_move_type
	cp TRAIT_REDUCE_ELECTRIC ; traits that require move type to be GRASS
	ld b, a
	ld c, GRASS
	jp c, .check_move_type
	cp TRAIT_REDUCE_PSYCHIC ; traits that require move type to be ELECTRIC
	ld b, a
	ld c, ELECTRIC
	jp c, .check_move_type
	cp TRAIT_REDUCE_ICE ; traits that require move type to be PSYCHIC
	ld b, a
	ld c, PSYCHIC
	jp c, .check_move_type
	cp TRAIT_REDUCE_DARK ; traits that require move type to be ICE
	ld b, a
	ld c, ICE
	jp c, .check_move_type
	cp TRAIT_REDUCE_SUPER_EFFECTIVE ; traits that require move type to be DARK
	ld b, a
	ld c, DARK
	jp c, .check_move_type
	cp TRAIT_REDUCE_SUPER_EFFECTIVE ; 
	jp z, .success
.not_met1
	pop af
.not_met
	and a
	ret
.success
	scf
	ret

.check_rain
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	jp z, .success
	and a
	ret

.check_sun
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jp z, .success
	and a
	ret

.check_sandstorm
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	jp z, .success
	and a
	ret

.check_move_brn	
	call GetMoveStructEffect
	cp EFFECT_BURN
	jr z, .success
	cp EFFECT_BURN_HIT
	jr z, .success
	cp EFFECT_TRI_ATTACK
	jr z, .success
	and a
	ret

.check_move_prz	
	call GetMoveStructEffect
	cp EFFECT_PARALYZE
	jr z, .success
	cp EFFECT_PARALYZE_HIT
	jr z, .success
	cp EFFECT_TRI_ATTACK
	jr z, .success
	and a
	ret

.check_move_psn
	call GetMoveStructEffect
	cp EFFECT_POISON
	jr z, .success
	cp EFFECT_POISON_HIT
	jr z, .success
	cp EFFECT_POISON_MULTI_HIT
	jr z, .success
	and a
	ret

.check_move_frz
	call GetMoveStructEffect
	cp EFFECT_FREEZE_HIT
	jr z, .success
	cp EFFECT_TRI_ATTACK
	jr z, .success
	and a
	ret

.check_move_flinch
	call GetMoveStructEffect
	cp EFFECT_FLINCH_HIT
	jr z, .success
	and a
	ret

.check_move_confused
	call GetMoveStructEffect
	cp EFFECT_CONFUSE
	jr z, .success
	cp EFFECT_CONFUSE_HIT
	jr z, .success
	and a
	ret

.check_move_attract
	call GetMoveStructEffect
	cp EFFECT_ATTRACT
	jp z, .success
	and a
	ret

.check_move_sleep
	call GetMoveStructEffect
	cp EFFECT_SLEEP
	jp z, .success
	and a
	ret

; .check_move_multihit
; 	call GetMoveStructEffect
; 	cp EFFECT_MULTI_HIT
; 	jr z, .success
; 	cp EFFECT_POISON_MULTI_HIT
; 	jr z, .success
; 	and a
; 	ret

.check_move_status
	call Get_move_category
	cp 2
	jp z, .success
	and a
	ret

.check_move_has_secondary
	call GetMoveStructChance
	and a
	jr z, .nope
	call GetMoveStructDamage
	and a
	jp nz, .success
.nope
	and a
	ret

.check_recoil
	call GetMoveStructEffect
	cp EFFECT_RECOIL_HIT
	jp z, .success
	and a
	ret

.check_not_stab ; stab = nc, non-stab = c
	ld hl, wTypeModifier
	bit 7, [hl]
	jr nz, .yes
	scf
	ret
.yes
	and a
	ret

.check_turns
	ld hl, wPlayerTurnsTaken
	cp d
	jr nc, .no ; greater
	and a
	ret
.no
	scf
	ret

.check_below_threshold
	call GetHealthPercentage
	ld a, d
	cp b
	jr nc, .no_hp ; greater
	and a
	ret
.no_hp
	scf
	ret

.check_move_type:
	ld a, d
	cp c
	jp z, .success
	and a
	ld a, b ; restore trait into 'a'	
	ret

.check_user_status
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	ld a, d
	cp BRN
	jr z, .isBRN
	cp PSN
	jr z, .isPSN
	jr .not_status

.isBRN
	ld a, [hl]
	and 1 << BRN
	jp nz, .success
	jr .not_status
.isPSN
	ld a, [hl]
	and 1 << PSN
	jp nz, .success
.not_status
	and a
	ret

Get_move_category: ; 0 = physical, 1 = special, 2 = status
	ld a, BATTLE_VARS_MOVE_TYPE
 	call GetBattleVarAddr
	and $ff ^ TYPE_MASK
	rlc a
	rlc a
	dec a
	ret

GetMoveStructDamage:
	ld hl, wPlayerMoveStruct + MOVE_POWER
	ldh a, [hBattleTurn]
	and a	
	jr z, .got_power
	ld hl, wEnemyMoveStruct + MOVE_POWER
.got_power
	ld a, [hl]
	ret

GetMoveStructEffect:
	ld hl, wPlayerMoveStruct + MOVE_EFFECT
	ldh a, [hBattleTurn]
	and a	
	jr z, .got_effect
	ld hl, wEnemyMoveStruct + MOVE_EFFECT
.got_effect
	ld a, [hl]
	ret

GetMoveStructChance:
	ld hl, wPlayerMoveStruct + MOVE_CHANCE
	ldh a, [hBattleTurn]
	and a	
	jr z, .got_chance
	ld hl, wEnemyMoveStruct + MOVE_CHANCE
.got_chance
	ld a, [hl]
	ret

TraitRaiseStat:
	xor a
.loop
	push af
	cp EVASION + 1
	jr c, .atk
.loop_go
	pop af
	inc a
	cp EVASION + 1
	jr nz, .loop
	jp .not_met

.atk
	ld b, a ; stat id
	ld hl, .JumptableStatTraits

.find_trait_table
	ld a, [hli]
	cp -1
	jr z, .not_met
	cp b
	jr z, .found_trait_table
	inc hl
	inc hl
	jr .find_trait_table

.found_trait_table
	ld a, [hli]
	ld h, [hl]
	ld l, a

	push bc
	call CheckTrait
	pop bc
	jr nc, .loop_go	
	ld a, b ; stat id
	jr .end

.end
	ld [wLoweredStat], a
	xor a
	ld [wAttackMissed], a

	ld hl, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .got_stat_levels
	ld hl, wEnemyStatLevels
.got_stat_levels
	pop af
	ld c, a
	ld b, 0
	add hl, bc
	inc [hl]

	ld hl, wTraitActivated
	ldh a, [hBattleTurn]
	and a	
	jr z, .player_turn	
	set 1, [hl]
	ret
.player_turn
	set 0, [hl]
	ret

.not_met
	ret

.JumptableStatTraits:
	dbw ATTACK, TraitsThatRaiseAttack
	dbw DEFENSE, TraitsThatRaiseDefense
	dbw SPEED, TraitsThatRaiseSpeed
	dbw SP_ATTACK, TraitsThatRaiseSpAttack
	dbw SP_DEFENSE, TraitsThatRaiseSpDefense
	dbw ACCURACY, TraitsThatRaiseAccuracy
	dbw EVASION, TraitsThatRaiseEvasion
	dbw -1, -1

TraitsThatRaiseAttack:
	db TRAIT_RAIN_ATTACK
	db TRAIT_SUNSHINE_ATTACK
	db TRAIT_SANDSTORM_ATTACK
	db TRAIT_ATTACK_BELOW_THIRD
	db -1

TraitsThatRaiseDefense:
	db TRAIT_RAIN_DEFENSE
	db TRAIT_SUNSHINE_DEFENSE
	db TRAIT_SANDSTORM_DEFENSE
	db TRAIT_DEFENSE_BELOW_THIRD
	db -1

TraitsThatRaiseSpeed:
	db TRAIT_RAIN_SPEED
	db TRAIT_SUNSHINE_SPEED
	db TRAIT_SANDSTORM_SPEED
	db TRAIT_SPEED_BELOW_THIRD
	; db TRAIT_STATUS_RAISE_SPEED
	db -1

TraitsThatRaiseSpAttack:
	db TRAIT_RAIN_SP_ATTACK
	db TRAIT_SUNSHINE_SP_ATTACK
	db TRAIT_SANDSTORM_SP_ATTACK
	db TRAIT_SP_ATTACK_BELOW_THIRD
	db -1

TraitsThatRaiseSpDefense:
	db TRAIT_RAIN_SP_DEFENSE
	db TRAIT_SUNSHINE_SP_DEFENSE
	db TRAIT_SANDSTORM_SP_DEFENSE
	db TRAIT_SP_DEFENSE_BELOW_THIRD
	db -1

TraitsThatRaiseAccuracy:
	db TRAIT_RAIN_ACCURACY
	db TRAIT_SUNSHINE_ACCURACY
	db TRAIT_SANDSTORM_ACCURACY
	db TRAIT_ACCURACY_BELOW_THIRD
	db -1

TraitsThatRaiseEvasion:
	db TRAIT_RAIN_EVASION
	db TRAIT_SUNSHINE_EVASION
	db TRAIT_SANDSTORM_EVASION
	db TRAIT_EVASION_BELOW_THIRD
	db -1

TraitBoostCritical:
	ld hl, TraitsThatBoostCritical
	call CheckTrait
	jr nc, .not_met
	ld a, 1
	ld [wBuffer2], a
.not_met
	xor a
	ld [wBuffer2], a
	ret

TraitsThatBoostCritical:
	db TRAIT_CRIT_BELOW_THIRD
	db -1
	
TraitBoostAccuracy:
	ld hl, TraitsThatReduceDamage
	call CheckTrait
	jr nc, .not_met
	ld a, [wBuffer2]
	srl a
	add a
	add a
	jr nc, .end
.max
	ld a, $FF
.end
	ld [wBuffer2], a
.not_met
	ret

TraitsThatBoostAccuracy:
	db TRAIT_BOOST_ACCURACY_TURN_ZERO
	db -1

TraitReduceAccuracy:
	ld hl, TraitsThatReduceDamage
	call CheckTrait
	jr nc, .not_met
	ld a, [wBuffer2]
	cp 216 + 1 ; 85%
	jr c, .low_acc
	sub 12 ; 5%
	jr nc, .end
.low_acc
	cp 191 + 1 ; 75%
	jr c, .lower_acc
	sub 18 ; 7%
	jr nc, .end
.lower_acc
	sub 32 ; 12%
	jr nc, .end
.min
	xor a
.end
	ld [wBuffer2], a
.not_met
	ret

TraitsThatReduceAccuracy:
	db TRAIT_REDUCE_NORMAL_ACC
	db -1

TraitReduceSelfRecoil:
	ld a, TRAIT_REDUCE_SELF_RECOIL
	call CheckSpecificTrait
	ld a, [wCurDamage]
	ld b, a
	ld a, [wCurDamage + 1]
	ld c, a
	jr nc, .not_met
	; 50%
	srl b
	rr c	
	jr nc, .end
.min
	inc c
.end
	ld a, b
	ld [wBuffer2], a
	ld a, c
	ld [wBuffer3], a
.not_met
	ret

TraitContact:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld de, 1
	ld hl, ContactMoves
	call IsInArray
	jr nc, .not_met

	ld hl, TraitsThatRequireContact
	call CheckTrait
	jr nc, .not_met
; 	ld hl, TraitsThatBurn
; 	call CheckTrait
; 	jr nc, .not_burn_trait
; 	ld a, $0 ; BRN
; 	ld b, a
; 	jr .success

; .not_burn_trait
; 	ld hl, TraitsThatParalyze
; 	call CheckTrait
; 	jr nc, .not_paralyze_trait
; 	ld a, $1 ; PRZ
; 	ld b, a
; 	jr .success

; .not_paralyze_trait
; 	ld hl, TraitsThatPoison
; 	call CheckTrait
; 	jr nc, .not_poison_trait
; 	ld a, $2 ; PSN
; 	ld b, a
; 	jr .success

; .not_poison_trait
; 	ld hl, TraitsThatFlinch
; 	call CheckTrait
; 	jr nc, .not_flinch_trait
; 	ld a, $3 ; FLINCH
; 	ld b, a
; 	jr .success

; .not_flinch_trait
; 	ld hl, TraitsThatConfuse
; 	call CheckTrait
; 	jr nc, .not_confuse_trait
; 	ld a, $4 ; CONFUSE
; 	ld b, a
; 	jr .success

; .not_confuse_trait
; 	ld hl, TraitsThatAttract
; 	call CheckTrait
; 	jr nc, .not_attract_trait
; 	ld a, $5 ; ATTRACT
; 	ld b, a
; 	jr .success
	ld a, [wBuffer3]
	jr .success

.not_attract_trait
.not_met
	ret

.success
	call Chance
	jr nc, .not_met
	ld a, [wBuffer1]
	cp BATTLE_VARS_TRAIT
	jr z, .player_turn
	call Switch_turn ; switch so that it affects the mon opposite to the one that has the trait
.player_turn
	ld a, b
	ld hl, .StatusCommands
	ld b, 0
	ld c, a
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, BANK("Effect Commands")
	rst FarCall
	ret

.StatusCommands:
	dw BattleCommand_BurnTarget
	dw BattleCommand_ParalyzeTarget
	dw BattleCommand_PoisonTarget
	dw BattleCommand_FlinchTarget
	dw BattleCommand_ConfuseTarget
	dw BattleCommand_Attract

TraitsThatRequireContact:
	db TRAIT_CONTACT_BRN
	db TRAIT_CONTACT_PRZ
	db TRAIT_CONTACT_PSN
	db TRAIT_CONTACT_FLINCH
	db TRAIT_CONTACT_CONFUSED
	db TRAIT_CONTACT_IN_LOVE
	db -1

TraitsThatBurn:
	db TRAIT_CONTACT_BRN
	db -1

TraitsThatParalyze:
	db TRAIT_CONTACT_PRZ
	db -1
	
TraitsThatPoison:
	db TRAIT_CONTACT_PSN
	db -1

TraitsThatFlinch:
	db TRAIT_CONTACT_FLINCH
	db -1

TraitsThatConfuse:
	db TRAIT_CONTACT_CONFUSED
	db -1

TraitsThatAttract:
	db TRAIT_CONTACT_IN_LOVE
	db -1

TraitStartWeather:
	ld hl, TraitsThatStartWeather
	call CheckTrait
	jr nc, .not_start_weather
	ld a, 4
	jr .end
.not_start_weather
	ld hl, TraitsThatBoostWeather
	call CheckTrait
	jr nc, .not_met
	ld a, 6
	jr .end
.not_met
	ld a, 5
.end
	ld [wWeatherCount], a
	ret

TraitsThatStartWeather:
	db TRAIT_RAIN_ON_ENTER
	db TRAIT_SUNSHINE_ON_ENTER
	db TRAIT_SANDSTORM_ON_ENTER
	db -1

TraitsThatBoostWeather:
	db TRAIT_RAIN_DURATION
	db TRAIT_SUNSHINE_DURATION
	db TRAIT_SANDSTORM_DURATION
	db -1

TraitWeatherHealsStatus:
	call ResetActivated
	ld hl, TraitsThatHealStatus
	call CheckTrait
	jr nc, .not_met
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	xor a
	ld [hl], a
.not_met
	ret

TraitsThatHealStatus:
	db TRAIT_RAIN_NO_STATUS
	db TRAIT_SUNSHINE_NO_STATUS
	db TRAIT_SANDSTORM_NO_STATUS
	db -1

TraitReduceDamageFromType:
	ld hl, TraitsThatReduceDamageLess
	call CheckTrait
	jr c, .reduce_less
	ld hl, TraitsThatReduceDamage
	call CheckTrait
	jr c, .reduce
	ld hl, TraitsThatReduceDamageMore
	call CheckTrait
	jr c, .reduce_more
	ld a, [wTypeModifier]
	cp $11 ; check if its over 10 (normal) or 5 (not effective)
	ret c
	ld hl, TraitsThatReduceSuperEffectiveDamageMore
	call CheckTrait
	jr c, .reduce_more
	ld hl, TraitsThatReduceSuperEffectiveDamage
	call CheckTrait
	jr nc, .end
.reduce
	ld a, $67 ; ~0.86 ; 14% reduction
	call ApplyDamageMod
	jr .end
.reduce_less
	ld a, $9A ; =0.9 ; 10% reduction
	call ApplyDamageMod
	jr .end
.reduce_more
	call GetHealthPercentage
	ld a, d
	cp 50
	jr nc, .end
	ld a, $57 ; ~0.71 ; 29% reduction
	call ApplyDamageMod
.end
	ret

TraitsThatReduceSuperEffectiveDamage:
	db TRAIT_REDUCE_SUPER_EFFECTIVE
	db -1

TraitsThatReduceSuperEffectiveDamageMore:
	db TRAIT_REDUCE_SUPER_EFFECTIVE_MORE
	db -1

TraitsThatReduceDamage:
	db TRAIT_REDUCE_NORMAL
	db TRAIT_REDUCE_FIGHTING
	db TRAIT_REDUCE_FLYING
	db TRAIT_REDUCE_GROUND
	db TRAIT_REDUCE_ROCK
	db TRAIT_REDUCE_BUG
	db TRAIT_REDUCE_FIRE
	db TRAIT_REDUCE_WATER
	db TRAIT_REDUCE_GRASS
	db TRAIT_REDUCE_ELECTRIC
	db TRAIT_REDUCE_PSYCHIC
	db TRAIT_REDUCE_ICE
	db TRAIT_REDUCE_DARK
	db -1

TraitsThatReduceDamageMore: ; under 50% hp
	db TRAIT_REDUCE_NORMAL_MORE
	db TRAIT_REDUCE_FIGHTING_MORE
	db TRAIT_REDUCE_FLYING_MORE
	db TRAIT_REDUCE_GROUND_MORE
	db TRAIT_REDUCE_ROCK_MORE
	db TRAIT_REDUCE_BUG_MORE
	db TRAIT_REDUCE_FIRE_MORE
	db TRAIT_REDUCE_WATER_MORE
	db TRAIT_REDUCE_GRASS_MORE
	db TRAIT_REDUCE_ELECTRIC_MORE
	db TRAIT_REDUCE_PSYCHIC_MORE
	db TRAIT_REDUCE_ICE_MORE
	db TRAIT_REDUCE_DARK_MORE
	db -1

TraitsThatReduceDamageLess: ; 10%
	db TRAIT_REDUCE_BRN_AND_FIRE
	db TRAIT_REDUCE_PRZ_AND_ELECTRIC
	db TRAIT_REDUCE_FLINCH_AND_ROCK
	db TRAIT_REDUCE_SLP_AND_DARK
	db TRAIT_REDUCE_PSN_AND_BUG
	db TRAIT_REDUCE_FRZ_AND_ICE
	db TRAIT_REDUCE_CONFUSE_AND_PSYCHIC
	db -1

TraitReducePower:
	ld a, [wCriticalHit]
	cp 1
	jr nz, .not_crit
	ld a, TRAIT_REDUCE_CRIT_DAMAGE
	call CheckSpecificTrait
	jr .boost_more
.not_crit
	ld c, 6
.loop
	ld hl, .JumpTableTraitsReduceMoveClass
	dec c
	ld a, c
	jr z, .not_met1
	push bc
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	call CheckSpecificTrait
	pop bc
	ld a, c
	jr nc, .loop
.met
	ld a, c
	ld hl, JumptableMoveClass
	call GetToJumptable
	ld a, [hl]
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld de, 1
	call IsInArray
	jr nc, .not_met1
.boost
	ld a, $67 ; ~0.85
	call ApplyDamageMod
.not_met1
	ret
.not_met
	ret
.boost_more
	ld a, $68 ; 0.75
	call ApplyDamageMod
	ret

.JumpTableTraitsReduceMoveClass
	db TRAIT_REDUCE_PUNCHING
	db TRAIT_REDUCE_SOUND
	db TRAIT_REDUCE_BITING
	db TRAIT_REDUCE_CUTTING
	db TRAIT_REDUCE_BEAM
	db TRAIT_REDUCE_PERFURATE

TraitBoostPower:
	ld a, TRAIT_BOOST_DAMAGE_PER_TURN
	call CheckSpecificTrait
	jr nc, .not_met1
	
	ld c, 6
.loop
	ld hl, .JumpTableTraitsBoostMoveClass
	dec c
	ld a, c
	jr z, .not_met1
	push bc
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	call CheckSpecificTrait
	pop bc
	ld a, c
	jr nc, .loop
.met
	ld a, c
	ld hl, JumptableMoveClass
	call GetToJumptable
	ld a, [hl]
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld de, 1
	call IsInArray
	jr nc, .not_met1
.boost
	ld a, $76 ; ~1.16
	call ApplyDamageMod
.not_met1
	ret
.not_met2
	ret

.JumpTableTraitsBoostMoveClass
	db TRAIT_BOOST_PUNCHING
	db TRAIT_BOOST_SOUND
	db TRAIT_BOOST_BITING
	db TRAIT_BOOST_CUTTING
	db TRAIT_BOOST_BEAM
	db TRAIT_BOOST_PERFURATE

JumptableMoveClass:
	dw PunchingMoves
	dw SoundMoves
	dw BitingMoves
	dw CuttingMoves
	dw BeamMoves
	dw PerfurateMoves

PunchingMoves:
	db MEGA_PUNCH
	db COMET_PUNCH
	db DIZZY_PUNCH
	db FIRE_PUNCH
	db ICE_PUNCH
	db THUNDERPUNCH
	db MACH_PUNCH
	db -1

BitingMoves:
	db BITE
	db CRUNCH
	db SUPER_FANG
	db HYPER_FANG
	db -1

CuttingMoves:
	db SLASH
	db SCRATCH
	db FURY_CUTTER
	db X_SCISSOR
	db AIR_SLASH
	db RAZOR_LEAF
	db -1

SoundMoves:
	db BUG_BUZZ
	db GROWL
	db HYPER_SONAR
	db SCREECH
	db SING
	db SNORE
	db SUPERSONIC
	db -1

BeamMoves:
	db AURORA_BEAM
	db SOLARBEAM
	db HYPER_BEAM
	db ICE_BEAM
	db PSYBEAM
	db -1

PerfurateMoves:
	db PECK
	db HORN_DRILL
	db DRILL_PECK
	db MEGAHORN
	db HORN_ATTACK
	db -1

TraitBoostNonStab:
	ld a, TRAIT_BOOST_NOT_STAB
	call CheckSpecificTrait
	jr nc, .not_met
	ld a, $65 ; ~1.2
	call ApplyDamageMod
.not_met
	ret

TraitReduceNonStab:
	ld a, TRAIT_REDUCE_NOT_STAB
	call CheckSpecificTrait
	jr nc, .not_met
	ld a, $67 ; ~0.86
	call ApplyDamageMod
.not_met
	ret

TraitReduceRecoilMoves:
	ld a, TRAIT_REDUCE_RECOIL
	call CheckSpecificTrait
	jr nc, .not_met
	ld a, $67 ; ~0.86
	call ApplyDamageMod
.not_met
	ret

TraitBoostRecoilMoves:
	ld a, TRAIT_BOOST_RECOIL
	call CheckSpecificTrait
	jr nc, .not_met
	ld a, $76 ; ~1.16
	call ApplyDamageMod
.not_met
	ret

TraitDamageBasedOnStats:
	ld c, 6
.loop
	ld hl, .JumpTableTraitsBoostMoveByStat
	dec c
	ld a, c
	jr z, .not_met
	push bc
	call GetToJumptable
	call CheckTrait
	pop bc
	ld a, c
	jr nc, .loop
.met
	ld hl, wBattleMonStats
	ld de, wEnemyMonStats
	ldh a, [hBattleTurn]
	and a	
	jr z, .got_stats	
	ld hl, wEnemyMonStats
	ld de, wBattleMonStats
.got_stats
	ld b, 0
	add hl, bc
	add hl, bc
	push hl
	ld h, d
	ld l, e
	add hl, bc
	add hl, bc
	ld d, h
	ld e, l
	pop hl

	ld a, [de] ; opp stat (high byte)
	sub [hl] ; sub user stat from opp stat (high byte)
	jr nc, .no_carry
	cpl
	inc a
.no_carry
	and a ; check high byte diff is 0
	jr nz, .max ; if there is a diff, then the total diff is clearly above 255
; check low bytes
	inc de
	inc hl
	ld a, [de] ; opp stat (high byte)
	sub [hl] ; sub user stat from opp stat
	jr nc, .no_carry2
	cpl
	inc a
.no_carry2
; has difference between low bytes
	ld b, a ; diff is in b
	ld hl, .Boosts
.loop2	
	ld a, [hl]
	cp -1
	jr z, .max
	cp b
	jr nc, .got_multi
	inc hl
	inc hl
	jr .loop2
.got_multi
	dec hl
	ld a, [hl]
.boost
	call ApplyDamageMod
.not_met
	ret
.max
	ld a, $A7
	jr .boost

.Boosts:
	db $0,  $FF ; 1.00, diff 0
	db $19, $FE ; 1.07, diff 25
	db $2D, $A9 ; 1.11, diff 45
	db $7B, $FD ; 1.15, diff 75
	db $64, $65 ; 1.20, diff 100
	db $87, $A8 ; 1.25, diff 135
	db $AF, $FB ; 1.36, diff 175
	db $F5, $A7 ; 1.42, diff 250
	db -1, -1

.JumpTableTraitsBoostMoveByStat
	dw TraitsThatBoostDamageBasedOnAttack
	dw TraitsThatBoostDamageBasedOnDefense
	dw TraitsThatBoostDamageBasedOnSpeed
	dw TraitsThatBoostDamageBasedOnSpAttack
	dw TraitsThatBoostDamageBasedOnSpDefense

TraitsThatBoostDamageBasedOnAttack:
	db -1

TraitsThatBoostDamageBasedOnDefense:
	db TRAIT_BOOST_ROCK_DEFENSE
	db TRAIT_BOOST_WATER_DEFENSE
	db -1

TraitsThatBoostDamageBasedOnSpeed:
	db TRAIT_BOOST_FLYING_SPEED
	db TRAIT_BOOST_ELECTRIC_SPEED
	db -1

TraitsThatBoostDamageBasedOnSpAttack:
	db 
	db -1

TraitsThatBoostDamageBasedOnSpDefense:
	db TRAIT_BOOST_ROCK_SP_DEFENSE
	db -1

TraitDamageBasedOnHP:
	ld hl, TraitsThatBoostMoveByHP
	call CheckTrait
	jr nc, .not_met
	call GetHealthPercentage
	ld a, d
	cp 45
	jr nc, .not_met ; if hp% is over 45%
	ld hl, .Boosts
.loop2
	ld a, [hl]
	cp d
	jr nc, .got_multi
	inc hl
	inc hl
	jr .loop2
.got_multi
	dec hl
	ld a, [hl]
.boost
	call ApplyDamageMod
.not_met
	ret

.Boosts:
	db 0,  $A7 ; 1.42, 00~07%
	db 7,  $C9 ; 1.33, 07~15%
	db 15, $64 ; 1.20, 15~22%
	db 22, $FD ; 1.15, 22~30%
	db 30, $A9 ; 1.11, 30~37%
	db 37, $FE ; 1.07, 37~45%
	db 45, $FF ; 1.00, +45%

TraitsThatBoostMoveByHP:
	db TRAIT_BOOST_BUG_HP
	db TRAIT_BOOST_WATER_HP
	db TRAIT_BOOST_ICE_HP
	db -1

TraitBoostDrain:
	ld a, TRAIT_BOOST_DRAIN
	call CheckSpecificTrait
	jr nc, .not_met

	ldh a, [hDividend]
	ld h, a
	ldh a, [hDividend + 1]
	ld l, a
	push hl
	call GetHealthPercentage
	pop hl	
	ld a, d
	cp 50
	jr nc, .not_met
	
	ld b, h
	ld c, l
	srl b ; 50%
	rr c
	srl b ; 25%
	rr c
	ld a, c
	and a
	jr nz, .end
	inc c
.end
	add hl, bc	
	ld a, h
	ldh [hDividend], a
	ld a, l
	ldh [hDividend + 1], a
.not_met
	ret

TraitBoostEffectChance:
	ld hl, TraitsThatBoostEffectChance
	call CheckTrait
	jr nc, .not_met
	ld a, [wBuffer2]
	add 12 ; 5%
	ld b, a
	jr c, .max ; max value if this would fo over 255
	ld a, [wBuffer3] ; index from TraitsThatBoostEffectChance
	cp 5
	jr c, .end ; indexes 0 to 4
	ld a, b
	add 12 ; 5% more
	ld b, a
	jr c, .max ; max value if this would fo over 255
.end
	ld a, b
	ld [wBuffer2], a
.not_met
	ret
.max
	ld b, $FF
	jr .end

TraitsThatBoostEffectChance:
	db TRAIT_BOOST_EFFECT_BRN ; 0
	db TRAIT_BOOST_EFFECT_PSN ; 1
	db TRAIT_BOOST_EFFECT_PRZ ; 2
	db TRAIT_BOOST_EFFECT_FLINCH ; 3
	db TRAIT_BOOST_EFFECT_CONFUSED ; 4
	db TRAIT_BOOST_EFFECT_NO_DAMAGE ; 5
	db TRAIT_BOOST_EFFECT_WITH_DAMAGE ; 6
	db -1

TraitReduceEffectChance:
	ld hl, TraitsThatReduceEffectChance
	call CheckTrait
	jr nc, .not_met
	ld a, [wBuffer2]
	srl a
	ld b, a ; 50%
	; jr c, .min ; min value if this would go under 0
	ld a, [wBuffer3] ; index from TraitsThatBoostEffectChance
	cp 6
	jr c, .end ; indexes 0 to 5
	ld a, b
	srl a
	add b
	ld b, a ; 75%
	; jr c, .min ; min value if this would go under 0
.end
	ld a, b
	ld [wBuffer2], a
.not_met
	ret
.min
	ld b, 0
	jr .end

TraitsThatReduceEffectChance:
	db TRAIT_REDUCE_EFFECT_BRN ; 0
	db TRAIT_REDUCE_EFFECT_PSN ; 1
	db TRAIT_REDUCE_EFFECT_PRZ ; 2
	db TRAIT_REDUCE_EFFECT_FLINCH ; 3
	db TRAIT_REDUCE_EFFECT_CONFUSED ; 4
	db TRAIT_REDUCE_EFFECT_SLEEP ; 5
	db TRAIT_REDUCE_EFFECT_NO_DAMAGE ; 6
	db TRAIT_REDUCE_EFFECT_WITH_DAMAGE ; 7
	db TRAIT_REDUCE_BRN_AND_FIRE ; 8
	db TRAIT_REDUCE_PRZ_AND_ELECTRIC ; 9
	db TRAIT_REDUCE_FLINCH_AND_ROCK ; a
	db TRAIT_REDUCE_SLP_AND_DARK ; b
	db TRAIT_REDUCE_PSN_AND_BUG ; c
	db -1

TraitNegateEffectChance:
	ld hl, TraitsThatNegateEffectChance
	call CheckTrait
	jr nc, .not_met
	ld a, [wBuffer2]
	ld a, 0
	ld [wBuffer2], a
.not_met
	ret

TraitsThatNegateEffectChance:
	db TRAIT_BRN_IMMUNE ; 0
	db TRAIT_PSN_IMMUNE ; 1
	db TRAIT_PRZ_IMMUNE ; 2
	db TRAIT_FLINCH_IMMUNE ; 3
	db TRAIT_CONFUSED_IMMUNE ; 4
	db TRAIT_IN_LOVE_IMMUNE ; 5
	db TRAIT_SLEEP_IMMUNE ; 6
	db TRAIT_RAIN_NO_STATUS ; 7
	db TRAIT_SUNSHINE_NO_STATUS ; 8
	db TRAIT_SANDSTORM_NO_STATUS ; 9
	db -1
	
TraitMultiHit:
	ld hl, TraitsThatDealWithMultiHit
	call CheckTrait
	jr nc, .not_met
	ld a, [wBuffer3]
	cp 1
	jr nz, .count

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVarAddr
	ld a, [hl]
	ld b, a
	srl a
	add b
	ld [hl], a
	ld a, 1
	ld [wBuffer2], a
	ret

.count
	ld a, [wBuffer2] ; number of hits
	cp 2
	jr nc, .not_met
	inc a
	ld [wBuffer2], a

.not_met
	ret

TraitsThatDealWithMultiHit:
	db TRAIT_BOOST_MULTI_HIT_COUNT ; 0
	db TRAIT_BOOST_MULTI_HIT_DAMAGE ; 1
	db -1

TraitPP:
	ld hl, TraitsThatRecoverPP
	call CheckTrait
	jr nc, .not_met
	call EffectTraitForceRecoverPP
	; ld a, $FF
	; ld [wd002], a
	; ld c, 4
; .loop
	; ld a, c
	; dec a
	; ld [wMenuCursorY], a
	; push bc
	; callfar RestorePP
	; pop bc
	; dec c
	; jr nz, .loop
.not_met
	ret

TraitsThatRecoverPP:
	db TRAIT_GAIN_PP_TURN_ZERO
	db -1

TraitFaintMon:
	ld hl, TraitsThatTriggerOnFaintMon
	call CheckTrait
	jr nc, .not_met
	ld a, [wBuffer3]
	and a
	jr z, .heal_pp_faint
.not_met
	ret
.heal_pp_faint
	call EffectTraitForceRecoverPP
	ret

TraitsThatTriggerOnFaintMon:
	db TRAIT_HEAL_PP_FAINT
	db -1

EffectTraitForceRecoverPP:
	ld a, $FF
	ld [wd002], a
	callfar RestorePP
	ret

TraitRegenHP:	
	ld hl, TraitsThatRegenerate
	call CheckTrait
	jr nc, .not_met
	xor a
	ld [wBuffer3], a
	ld [wBuffer5], a
	ld a, 2
	ld [wBuffer6], a
	ld hl, BattleCommand_Heal
	ld a, BANK("Effect Commands")
	rst FarCall
.not_met
	ret

TraitsThatRegenerate:
	db TRAIT_REGEN_BRN
	db -1

ContactMoves:
	db AQUA_TAIL
	db BODY_SLAM
	db BITE
	db BRICK_BREAK
	db CLAMP
	db CLOSE_COMBAT
	db COMET_PUNCH
	db CONSTRICT
	db COUNTER
	db CRABHAMMER
	db CROSS_CHOP
	db CRUNCH
	db DIG
	db DIZZY_PUNCH
	db DOUBLE_KICK
	db DOUBLE_EDGE
	db DOUBLESLAP
	db DRILL_PECK
	db DYNAMICPUNCH
	db EXTREMESPEED
	db FAINT_ATTACK
	db FIRE_PUNCH
	db FLAME_WHEEL
	db FLY
	db FURY_ATTACK
	db FURY_CUTTER
	db HAMMER_ARM
	db HEADBUTT
	db HORN_ATTACK
	db HORN_DRILL
	db HYPER_FANG
	db ICE_PUNCH
	db KARATE_CHOP
	db LEECH_LIFE
	db LICK
	db LOW_KICK
	db MACH_PUNCH
	db MEGA_KICK
	db MEGA_PUNCH
	db MEGAHORN
	db PECK
	db PETAL_DANCE
	db POUND
	db PURSUIT
	db QUICK_ATTACK
	db RAGE
	db RAPID_SPIN
	db REVERSAL
	db ROCK_SMASH
	db ROLLOUT
	db ROLLING_KICK
	db SCRATCH
	db SEISMIC_TOSS
	db SKULL_BASH
	db SLAM
	db SLASH
	db STAMPEDE
	db STOMP
	db SUBMISSION
	db SUPER_FANG	
	db TACKLE
	db TAKE_DOWN
	db THRASH
	db THUNDERPUNCH
	db TRIPLE_KICK
	db VICEGRIP
	db VITAL_THROW
	db WAKEUP_SLAP
	db WRAP
	db X_SCISSOR
	db ZEN_HEADBUTT
	db -1
	
Chance:
	call BattleRandom
	cp 20 percent
	jr nc, .success
	and a
	ret	
.success
	xor a
	ld [wAttackMissed], a
	ld [wEffectFailed], a
	scf
	ret

	; ld a, [wBuffer2]
	; inc a
	; ld [wBuffer2], a
	
	; ld a, BANK("Effect Commands")
	; rst FarCall	
	
	; ld hl, BattleCommand_StatUpMessage
	; ld a, BANK("Effect Commands")
	; rst FarCall

CheckStab:
	ld hl, wTypeModifier
	bit 7, [hl]
	jr nz, .yes
	and a
	ret
.yes
	scf
	ret

Switch_turn:
	ld hl, BattleCommand_SwitchTurn
	ld a, BANK("Effect Commands")
	rst FarCall
	ret

GetToJumptable:
	ld b, 0
	ld c, a
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

CallFarSpecificTrait:
	ld a, [wBuffer1]
	call CheckSpecificTrait
	ret

ResetActivated:
	ld hl, wTraitActivated
	ldh a, [hBattleTurn]
	and a	
	jr z, .player_turn
	res 1, [hl]
	ret
.player_turn
	res 0, [hl]
	ret

GetHealthPercentage:
	push bc
	ld hl, wBattleMonHP
	ld de, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a	
	jr z, .got_stats	
	ld hl, wEnemyMonHP
	ld de, wEnemyMonMaxHP
.got_stats
; save old calculation results
	ldh a, [hMultiplicand + 1]
	ld b, a
	ldh a, [hMultiplicand + 2]
	ld c, a
	push bc
; get hp percentage
	xor a
	ldh [hMultiplicand + 0], a
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a
	ld a, 25
	ldh [hMultiplier], a
	call Multiply
	ld h, d
	ld l, e
	ld a, [hli]
	ld b, [hl]
	srl a
	rr b
	srl a
	rr b
	ld a, b
	ld b, 4
	ldh [hDivisor], a
	call Divide

; restores old calculation results
	ldh a, [hQuotient + 3]
	ld d, a ; health % is in d
	pop bc
	ld a, b
	ldh [hMultiplicand + 1], a
	ld a, c 
	ldh [hMultiplicand + 2], a
	pop bc
	ret
