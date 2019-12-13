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

CheckTrait:
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

CheckTraitCondition:
	ld a, [wBuffer1]
	call GetBattleVar
	ld de, 1	
	call IsInArray
	jp nc, .not_met1
	ld a, [wBuffer1]
	call GetBattleVar
	; fallthrough
.CheckSpecificTrait:
	cp TRAIT_NONE
	jp z, .not_met1
	cp TRAIT_SANDSTORM_ON_ENTER + 1 ; traits lower than this have no conditions
	jp c, .success
	cp TRAIT_RAIN_NO_STATUS + 1 ; all traits that require rain weather
	jp c, .check_rain
	cp TRAIT_SUNSHINE_NO_STATUS + 1 ; all sun traits
	jp c, .check_sun
	cp TRAIT_SANDSTORM_NO_STATUS + 1 ; all sandstorm traits
	jp c, .check_sandstorm
	cp TRAIT_REDUCE_SUPER_EFFECTIVE ; 
	jp z, .success
	cp TRAIT_REDUCE_NORMAL ; traits that require move type to be normal
	ld b, a
	ld c, NORMAL
	jp c, .check_move_type
	cp TRAIT_REDUCE_FIGHTING ; traits that require move type to be water
	ld b, a
	ld c, FIGHTING
	jp c, .check_move_type
	jr .not_met1
	cp TRAIT_REDUCE_FLYING ; traits that require move type to be water
	ld b, a
	ld c, FLYING
	jp c, .check_move_type
	jr .not_met1
	cp TRAIT_REDUCE_GROUND ; traits that require move type to be water
	ld b, a
	ld c, GROUND
	jp c, .check_move_type
	jr .not_met1
	cp TRAIT_REDUCE_ROCK ; traits that require move type to be water
	ld b, a
	ld c, ROCK
	jp c, .check_move_type
	jr .not_met1
	cp TRAIT_REDUCE_BUG ; traits that require move type to be water
	ld b, a
	ld c, BUG
	jp c, .check_move_type
	jr .not_met1
	cp TRAIT_REDUCE_FIRE ; traits that require move type to be water
	ld b, a
	ld c, FIRE
	jp c, .check_move_type
	jr .not_met1
	cp TRAIT_REDUCE_WATER ; traits that require move type to be water
	ld b, a
	ld c, WATER
	jp c, .check_move_type
	jr .not_met1
	cp TRAIT_REDUCE_GRASS ; traits that require move type to be water
	ld b, a
	ld c, GRASS
	jp c, .check_move_type
	jr .not_met1
	cp TRAIT_REDUCE_ELECTRIC ; traits that require move type to be water
	ld b, a
	ld c, ELECTRIC
	jp c, .check_move_type
	jr .not_met1
	cp TRAIT_REDUCE_PSYCHIC ; traits that require move type to be water
	ld b, a
	ld c, PSYCHIC
	jp c, .check_move_type
	jr .not_met1
	cp TRAIT_REDUCE_ICE ; traits that require move type to be water
	ld b, a
	ld c, ICE
	jp c, .check_move_type
	jr .not_met1
	cp TRAIT_REDUCE_DARK ; traits that require move type to be water
	ld b, a
	ld c, DARK
	jp c, .check_move_type
	jr .not_met1
.success
	scf
	ret
.not_met1
	pop af
.not_met
	and a
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

.check_move_type
	ld a, BATTLE_VARS_MOVE_TYPE
 	call GetBattleVarAddr
	and TYPE_MASK
	cp c
	jp z, .success
	and a
	ld a, b ; restore trait into 'a'
	
	ret

.check_move_category ; 0 = physical, 1 = special, 2 = status
	ld a, BATTLE_VARS_MOVE_TYPE
 	call GetBattleVarAddr
	and $ff ^ TYPE_MASK
	rlc a
	rlc a
	dec a
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
	db -1

TraitsThatRaiseDefense:
	db TRAIT_RAIN_DEFENSE
	db -1

TraitsThatRaiseSpeed:
	db TRAIT_RAIN_SPEED
	db -1

TraitsThatRaiseSpAttack:
	db TRAIT_RAIN_SP_ATTACK
	db -1

TraitsThatRaiseSpDefense:
	db TRAIT_RAIN_SP_DEFENSE
	db -1

TraitsThatRaiseAccuracy:
	db TRAIT_RAIN_ACCURACY
	db -1

TraitsThatRaiseEvasion:
	db TRAIT_RAIN_EVASION
	db -1

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
	ld hl, TraitsThatBurn
	call CheckTrait
	jr nc, .not_burn_trait
	ld a, $0 ; BRN
	ld b, a
	jr .success

.not_burn_trait
	ld hl, TraitsThatParalyze
	call CheckTrait
	jr nc, .not_paralyze_trait
	ld a, $1 ; PRZ
	ld b, a
	jr .success

.not_paralyze_trait
	ld hl, TraitsThatPoison
	call CheckTrait
	jr nc, .not_poison_trait
	ld a, $2 ; PSN
	ld b, a
	jr .success

.not_poison_trait
	ld hl, TraitsThatFlinch
	call CheckTrait
	jr nc, .not_flinch_trait
	ld a, $3 ; FLINCH
	ld b, a
	jr .success

.not_flinch_trait
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

TraitsThatRequireContact:
	db TRAIT_CONTACT_BRN
	db TRAIT_CONTACT_PAR
	db TRAIT_CONTACT_PSN
	db TRAIT_CONTACT_FLINCH
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

TraitReduceDamage:
	ld hl, TraitsThatReduceDamage
	call CheckTrait
	jr c, .reduce
	ld a, [wTypeModifier]
	cp $11 ; check if its over 10 (normal) or 5 (not effective)
	ret c
	ld hl, TraitsThatReduceSuperEffectiveDamage
	call CheckTrait
	jr nc, .not_se_reduction
.reduce
	ld a, $67 ; ~0.86
	call ApplyDamageMod
.not_se_reduction
	ret

TraitsThatReduceSuperEffectiveDamage:
	db TRAIT_REDUCE_SUPER_EFFECTIVE
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

CallFarSpecificTrait:
	ld a, [wBuffer1]
	call CheckTraitCondition.CheckSpecificTrait
	ret

TraitBoostPower:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld hl, BitingMoves
	ld de, 1
	call IsInArray
	jr c, .biting_move

.biting_move
	ld hl, TraitsThatBoostBitingMoves
	call CheckTrait
	jr nc, .not_met
	jr .boost
.cutting_move
	ld hl, TraitsThatBoostCuttingMoves
	call CheckTrait
	jr nc, .not_met
	jr .boost
.punching_move
	ld hl, TraitsThatBoostPunchingMoves
	call CheckTrait
	jr nc, .not_met
.boost
	ld hl, wPlayerMoveStructPower
	ld a, [hl]
	ld b, a
	srl a
	srl a
	srl a
	add b
	ld [hl], a
	ld [wBuffer1], a

.not_met
	ret

Switch_turn:
	ld hl, BattleCommand_SwitchTurn
	ld a, BANK("Effect Commands")
	rst FarCall
	ret

TraitsThatBurn:
	db TRAIT_CONTACT_BRN
	db -1

TraitsThatParalyze:
	db TRAIT_CONTACT_PAR
	db -1
	
TraitsThatPoison:
	db TRAIT_CONTACT_PSN
	db -1

TraitsThatFlinch:
	db TRAIT_CONTACT_FLINCH
	db -1

TraitsThatBoostBitingMoves:
	db TRAIT_BOOST_BITING
	db -1

TraitsThatBoostCuttingMoves:
	db TRAIT_BOOST_BITING
	db -1

TraitsThatBoostPunchingMoves:
	db TRAIT_BOOST_BITING
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

PunchingMoves:
	db MEGA_PUNCH
	db COMET_PUNCH
	db DIZZY_PUNCH
	db FIRE_PUNCH
	db ICE_PUNCH
	db THUNDERPUNCH
	db MACH_PUNCH
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
	cp 80 percent
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
