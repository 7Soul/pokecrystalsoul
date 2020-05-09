CheckTrait:
	cp -1
	ret z
	call CheckTraitActivated ; check if trait only activates once
	jr c, .already_activated
.check_trait
	ld a, [wBuffer1]
	cp BATTLE_VARS_TRAIT
	jr z, .end
	cp BATTLE_VARS_TRAIT_OPP
	jr z, .end
	ld a, BATTLE_VARS_TRAIT ; load this if wBuffer1 is some other value just in case
.end
	call CheckTraitCondition
	ret
.already_activated
	and a
	ret

CheckSpecificTrait:
	ld b, a
	call CheckTraitActivated ; check if trait only activates once
	jr c, .no_trait	
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
	cp TRAIT_SANDSTORM_ON_ENTER + 1 ; traits lower than this have no conditions
	jp c, .success
	cp TRAIT_REDUCE_RECOIL + 1 ; all traits that require rain weather
	jp c, .check_recoil
	cp TRAIT_RAIN_NO_STATUS + 1 ; all traits that require rain weather
	ld d, WEATHER_RAIN
	jp c, .check_weather	
	cp TRAIT_SUNSHINE_NO_STATUS + 1 ; all sun traits
	ld d, WEATHER_SUN
	jp c, .check_weather
	cp TRAIT_SANDSTORM_NO_STATUS + 1 ; all sandstorm traits
	ld d, WEATHER_SANDSTORM
	jp c, .check_weather
	cp TRAIT_BOOST_EFFECT_BRN + 1 ; all burn traits
	jp c, .check_move_brn
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
	cp TRAIT_REDUCE_PHYSICAL_TAKEN_TURNS + 1 ; all traits for physical moves 
	jp c, .check_move_physical
	cp TRAIT_REDUCE_SPECIAL_TAKEN_TURNS + 1 ; all traits for special moves 
	jp c, .check_move_special
	cp TRAIT_BOOST_EFFECT_WITH_DAMAGE + 1 ; all traits for moves with secondary effects 
	jp c, .check_move_has_secondary
	cp TRAIT_REDUCE_NOT_STAB + 1 ; all traits for non-stab hits
	jp c, .check_not_stab
	cp TRAIT_BOOST_ACCURACY_TURN_ZERO + 1 ; all traits on turn 0
	ld d, 0
	jp c, .check_turns_equal
	cp TRAIT_BOOST_SPATK_ACC_NOT_ATTACKING + 1 ; 
	ld d, 3
	jp c, .check_trait_activation_equal
	cp TRAIT_RANDOM_STAT_AFTER_5_TURNS + 1 ; 
	jp c, .check_trait_activated
	cp TRAIT_REGEN_FIRST_TURNS + 1 ; all traits on turn 3 and lower
	ld d, 2
	jp c, .check_turns_lower
	cp TRAIT_REGEN_LOW_HP + 1 ; all traits that require to be below 50% hp
	ld b, 50
	jp c, .check_below_threshold
	cp TRAIT_CRIT_BELOW_THIRD + 1 ; all traits that require to be below 33% hp
	ld b, 34
	jp c, .check_below_threshold
	cp TRAIT_SPEED_AFTER_CRIT + 1
	jp c, .check_crit
	cp TRAIT_CRITICAL_AFTER_CRIT + 1
	ld d, 1
	jp c, .check_trait_activation_equal
	cp TRAIT_REGEN_STATUSED + 1
	ld d, $FE
	jp c, .check_user_status
	cp TRAIT_RANDOM_STAT_WHEN_FLINCHED + 1
	ld d, SUBSTATUS_FLINCHED
	jp c, .check_user_substatus3
	cp TRAIT_OPP_SAME_TYPE_CRIT_BOOST + 1
	jp c, .check_opp_same_type
	cp TRAIT_BOOST_WEAK_MOVES + 1
	ld d, 60
	jp c, .check_move_power
	push af
	ld a, BATTLE_VARS_MOVE_TYPE
 	call GetBattleVar
	and TYPE_MASK
	ld d, a
	pop af
	ld e, $FF ; reset e so no type equals it
	cp TRAIT_REDUCE_BRN_AND_FIRE
	ld b, a
	ld c, FIRE
	call c, .check_move_type
	call c, .check_move_brn
	cp TRAIT_REDUCE_PRZ_AND_ELECTRIC
	ld b, a
	ld c, ELECTRIC
	call c, .check_move_type
	call c, .check_move_prz
	cp TRAIT_REDUCE_FLINCH_AND_ROCK
	ld b, a
	ld c, ROCK
	call c, .check_move_type
	call c, .check_move_flinch
	cp TRAIT_REDUCE_SLP_AND_DARK
	ld b, a
	ld c, DARK
	call c, .check_move_type
	call c, .check_move_sleep
	cp TRAIT_REDUCE_PSN_AND_BUG
	ld b, a
	ld c, DARK
	call c, .check_move_type
	call c, .check_move_psn
	cp TRAIT_REDUCE_FRZ_AND_ICE
	ld b, a
	ld c, ICE
	call c, .check_move_type
	call c, .check_move_frz
	cp TRAIT_REDUCE_CONFUSE_AND_PSYCHIC
	ld b, a
	ld c, PSYCHIC
	call c, .check_move_type
	call c, .check_move_confused
	cp TRAIT_DEFENSE_ICE_FIRE_HIT ; 
	ld b, a
	ld c, FIRE
	ld e, ICE
	jp c, .check_move_type
	cp TRAIT_SPEED_BUG_DARK_HIT ; 
	ld b, a
	ld c, BUG
	ld e, DARK
	jp c, .check_move_type
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
	push hl
	ld hl, OneShotTraits
	ld a, [wBuffer1]
	call GetBattleVar
	ld de, 1	
	call IsInArray
	pop hl
	jr nc, .not_one_shot
	call ActivateTrait
.not_one_shot
	scf
	ret

.check_weather
	ld a, [wBattleWeather]
	cp d
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
	jp z, .success
	and a
	ret

.check_move_confused
	call GetMoveStructEffect
	cp EFFECT_CONFUSE
	jp z, .success
	cp EFFECT_CONFUSE_HIT
	jp z, .success
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

.check_move_physical
	call Get_move_category
	cp 0
	jp z, .success
	and a
	ret
	
.check_move_special
	call Get_move_category
	cp 1
	jp z, .success
	and a
	ret

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

.check_crit:
	ld a, [wCriticalHit]
	cp 1
	jp z, .success
	and a
	ret

.check_crit_trigger:
	ld a, [wCriticalHit]
	cp 1
	jr nz, .not_crit_trigger
	call IncreaseTraitCount
.not_crit_trigger
	and a
	ret

.check_turns_equal
	ld a, BATTLE_VARS_TURNS_TAKEN
 	call GetBattleVar
	cp d
	jr nz, .no_turns_equal ; greater
	and a
	ret
.no_turns_equal
	scf
	ret

.check_turns_lower
	ld a, BATTLE_VARS_TURNS_TAKEN
 	call GetBattleVar
	cp d
	jr nc, .no_turns_lower ; greater
	and a
	ret
.no_turns_lower
	scf
	ret

; Checks if a trait has been activated enough times
.check_trait_activation_equal
	push de
	call CheckTraitCount
	pop de
	inc a ; 1-based index
	cp d
	jp nc, .success
	and a
	ret

.check_trait_activated
	push de
	call CheckTraitActivatedSimple
	pop de
	jp c, .success
	and a
	ret

.check_below_threshold
	call GetHealthPercentage
	ld a, d
	cp b
	jp c, .success ; greater
	and a
	ret

.check_move_type:
	ld a, d
	cp c
	jp z, .success
	cp e
	jp z, .success
	and a
	ld a, b ; restore trait into 'a'	
	ret

.check_move_power: ; checks if power >= d
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	cp d
	jp c, .not_met
	jp .success

.check_user_status:
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	ld a, d
	cp BRN
	jr z, .isBRN
	cp PSN
	jr z, .isPSN
	cp $FF
	jr z, .isANY
	cp $FE
	jr z, .isANYANY
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
	jr .not_status
.isANY ; non-volatile
	ld a, [hl]
	cp 0
	jp nz, .success
.isANYANY
	ld a, [hl]
	cp 0
	jp nz, .success
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	bit SUBSTATUS_IN_LOVE, [hl]
	jp nz, .success
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_CONFUSED, [hl]
	jp nz, .success
.not_status
	and a
	ret

.check_user_substatus3:
	ld b, d
	ld a, %1
.loop_ss3
	rlca
	dec b
	jr z, .check_substatus3
	jr .loop_ss3
	
.check_substatus3
	ld b, a
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	ld a, [hl]
	cp b
	jp z, .success
	and a
	ret

.check_opp_same_type:
	ld a, BATTLE_VARS_TYPE1
 	call GetBattleVar
	ld b, a
	ld a, BATTLE_VARS_TYPE1_OPP
 	call GetBattleVar
	cp b
	jp z, .success
	ld a, BATTLE_VARS_TYPE2_OPP
 	call GetBattleVar
	cp b
	jp z, .success

	ld a, BATTLE_VARS_TYPE2
 	call GetBattleVar
	ld b, a
	ld a, BATTLE_VARS_TYPE1_OPP
 	call GetBattleVar
	cp b
	jp z, .success
	ld a, BATTLE_VARS_TYPE2_OPP
 	call GetBattleVar
	cp b
	jp z, .success

	and a
	ret

; triggers
.check_did_no_dmg_for_three_turns:
	call Get_move_category
	cp 2
	jp nc, IncreaseTraitCount ; if the attack not a status, did damage
	ld a, [wAttackMissed]
	jp nz, IncreaseTraitCount ; if the attack didn't miss, did damage
	and a
	ret

.check_every_x_turns:
	ld a, BATTLE_VARS_TURNS_TAKEN
 	call GetBattleVar
.mod1
	sub d
	jr nc, .mod1
	add d
	cp 0
	jp z, ActivateTrait
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
	call GetTraitUser
	jr c, .got_power
	ld hl, wEnemyMoveStruct + MOVE_POWER
.got_power
	ld a, [hl]
	ret

GetMoveStructEffect:
	ld hl, wPlayerMoveStruct + MOVE_EFFECT
	call GetTraitUser
	jr c, .got_effect
	ld hl, wEnemyMoveStruct + MOVE_EFFECT
.got_effect
	ld a, [hl]
	ret

GetMoveStructChance:
	ld hl, wPlayerMoveStruct + MOVE_CHANCE
	call GetTraitUser
	jr c, .got_chance
	ld hl, wEnemyMoveStruct + MOVE_CHANCE
.got_chance
	ld a, [hl]
	ret

TraitTurnTriggers:
	ld a, [wBuffer1]
	call GetBattleVar
	cp TRAIT_BOOST_ATK_ACC_NOT_ATTACKING
	jr c, .no_trigger
	cp TRAIT_BOOST_SPATK_ACC_NOT_ATTACKING + 1
	jp c, CheckTraitCondition.check_did_no_dmg_for_three_turns
	cp TRAIT_RANDOM_STAT_AFTER_5_TURNS + 1
	ld d, 5
	jp c, CheckTraitCondition.check_every_x_turns
	cp TRAIT_SPEED_AFTER_CRIT + 1
	jp c, .no_trigger
	cp TRAIT_CRITICAL_AFTER_CRIT + 1
	jp c, CheckTraitCondition.check_crit_trigger
	cp TRAIT_OPP_SAME_TYPE_DMG_BOOST + 1
	jp c, .no_trigger
.no_trigger
	ret

TraitRaiseStatAfterDamage:
	ld a, [wBuffer1]
	call GetBattleVar
	ld de, 1
	ld hl, TraitsThatRaiseStatAfterDamage
	call IsInArray
	ret nc
	jp TraitRaiseStat

TraitsThatRaiseStatAfterDamage:
	db TRAIT_ATTACK_AFTER_CRIT
	db TRAIT_DEFENSE_AFTER_CRIT
	db TRAIT_SPEED_AFTER_CRIT
	db TRAIT_DEFENSE_ICE_FIRE_HIT
	db TRAIT_SPEED_BUG_DARK_HIT
	db -1

TraitRaiseStat:
	ld a, $FF
	ld [wBuffer3], a
	ld a, TRAIT_RANDOM_STAT_AFTER_5_TURNS
	call CheckSpecificTrait
	jr c, .random_stat
	ld a, TRAIT_RANDOM_STAT_WHEN_FLINCHED
	call CheckSpecificTrait
	jr c, .random_stat
	xor a
.loop
	push af
	cp EVASION + 1
	jr c, .got_stat
.loop_go
	pop af
	inc a
	cp EVASION + 1
	jr nz, .loop
	ret

.got_stat
	ld b, a ; stat id
	ld hl, .JumptableStatTraits

.find_trait_table
	ld a, [hli]
	cp -1
	ret z
	cp b
	jr z, .found_trait_table
	inc hl
	inc hl
	jr .find_trait_table

.found_trait_table
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl has the trait table

	push bc
	call CheckTrait
	pop bc
	jr nc, .loop_go

.end
	pop af
	ld a, b
	
	ld hl, .JumptableBattleCommands
	call TraitUseBattleCommand

	ld hl, BattleCommand_StatUpMessage
	call TraitUseBattleCommandSimple

	ld hl, BattleCommand_StatUpFailText
	call TraitUseBattleCommandSimple

	ld a, [wBuffer3]
	cp 0 ; index 0 also raises acc
	jr z, .also_raise_acc
	ret
.also_raise_acc
	ld b, 6
	jr .end
.random_stat
	push af
	call ResetActivated
	ld b, 7
	jr .end

.JumptableStatTraits:
	dbw ATTACK, TraitsThatRaiseAttack
	dbw DEFENSE, TraitsThatRaiseDefense
	dbw SPEED, TraitsThatRaiseSpeed
	dbw SP_ATTACK, TraitsThatRaiseSpAttack
	dbw SP_DEFENSE, TraitsThatRaiseSpDefense
	dbw ACCURACY, TraitsThatRaiseAccuracy
	dbw EVASION, TraitsThatRaiseEvasion
	dbw -1, -1

.JumptableBattleCommands:
	dw BattleCommand_AttackUp
	dw BattleCommand_DefenseUp
	dw BattleCommand_SpeedUp
	dw BattleCommand_SpecialAttackUp
	dw BattleCommand_SpecialDefenseUp
	dw BattleCommand_AccuracyUp
	dw BattleCommand_EvasionUp
	dw BattleCommand_RandomStatUp

TraitsThatRaiseAttack:
	db TRAIT_BOOST_ATK_ACC_NOT_ATTACKING
	db TRAIT_RAIN_ATTACK
	db TRAIT_SUNSHINE_ATTACK
	db TRAIT_SANDSTORM_ATTACK
	db TRAIT_ATTACK_BELOW_THIRD
	db TRAIT_ATTACK_STATUSED
	db TRAIT_ATTACK_AFTER_CRIT
	db -1

TraitsThatRaiseDefense:
	db TRAIT_BOOST_DEF_ACC_NOT_ATTACKING ; 6
	db TRAIT_RAIN_DEFENSE
	db TRAIT_SUNSHINE_DEFENSE
	db TRAIT_SANDSTORM_DEFENSE
	db TRAIT_DEFENSE_BELOW_THIRD
	db TRAIT_DEFENSE_STATUSED
	db TRAIT_DEFENSE_AFTER_CRIT
	db TRAIT_DEFENSE_ICE_FIRE_HIT
	db TRAIT_REDUCE_WATER_UP_DEFENSE
	db -1

TraitsThatRaiseSpeed:
	db TRAIT_BOOST_SPD_ACC_NOT_ATTACKING
	db TRAIT_RAIN_SPEED
	db TRAIT_SUNSHINE_SPEED
	db TRAIT_SANDSTORM_SPEED
	db TRAIT_SPEED_BELOW_THIRD
	db TRAIT_SPEED_STATUSED
	db TRAIT_SPEED_AFTER_CRIT
	db TRAIT_SPEED_BUG_DARK_HIT
	db -1

TraitsThatRaiseSpAttack:
	db TRAIT_BOOST_SPATK_ACC_NOT_ATTACKING
	db TRAIT_RAIN_SP_ATTACK
	db TRAIT_SUNSHINE_SP_ATTACK
	db TRAIT_SANDSTORM_SP_ATTACK
	db TRAIT_SP_ATTACK_BELOW_THIRD
	db TRAIT_SP_ATTACK_STATUSED
	db -1

TraitsThatRaiseSpDefense:
	db TRAIT_RAIN_SP_DEFENSE
	db TRAIT_SUNSHINE_SP_DEFENSE
	db TRAIT_SANDSTORM_SP_DEFENSE
	db TRAIT_SP_DEFENSE_BELOW_THIRD
	db TRAIT_SP_DEFENSE_STATUSED
	db -1

TraitsThatRaiseAccuracy:
	db TRAIT_RAIN_ACCURACY
	db TRAIT_SUNSHINE_ACCURACY
	db TRAIT_SANDSTORM_ACCURACY
	db TRAIT_ACCURACY_BELOW_THIRD
	db TRAIT_ACCURACY_STATUSED
	db -1

TraitsThatRaiseEvasion:
	db TRAIT_RAIN_EVASION
	db TRAIT_SUNSHINE_EVASION
	db TRAIT_SANDSTORM_EVASION
	db TRAIT_EVASION_BELOW_THIRD
	db TRAIT_EVASION_STATUSED
	db -1

TraitPreventStatDown:
	ld hl, .TraitsThatPreventStatDown
	call CheckTrait
	ret nc
	xor a
	ld [wBuffer2], a
	ld a, [wLoweredStat]
	ld b, a
	ld a, [wBuffer3]
	cp b
	ret nz

	ld a, 1
	ld [wBuffer2], a
	ret

.TraitsThatPreventStatDown:
	db TRAIT_PREVENT_ATTACK_DOWN
	db TRAIT_PREVENT_DEFENSE_DOWN
	db TRAIT_PREVENT_SPEED_DOWN
	db TRAIT_PREVENT_SP_ATTACK_DOWN
	db TRAIT_PREVENT_SP_DEFENSE_DOWN
	db TRAIT_PREVENT_ACCURACY_DOWN
	db -1

TraitRaiseLowerOddEven:
	ld a, TRAIT_ATTACK_SPECIAL_ODD_EVEN
	ld b, a
	ld a, [wBuffer1]
	call GetBattleVar
	cp b
	ret nz

	ld a, BATTLE_VARS_TURNS_TAKEN
 	call GetBattleVar
	and 1
	jr z, .odd

	ld hl, BattleCommand_AttackUp
	call TraitUseBattleCommandSimple
	ld hl, BattleCommand_StatUpMessage
	call TraitUseBattleCommandSimple

	call CheckTraitActivatedSimple
	jr nc, .already_activated
	call Switch_turn
	ld hl, BattleCommand_SpecialAttackDown
	call TraitUseBattleCommandSimple
	jp Switch_turn

.odd
	ld hl, BattleCommand_SpecialAttackUp
	call TraitUseBattleCommandSimple
	ld hl, BattleCommand_StatUpMessage
	call TraitUseBattleCommandSimple

	call CheckTraitActivatedSimple
	jr nc, .already_activated
	call Switch_turn
	ld hl, BattleCommand_AttackDown
	call TraitUseBattleCommandSimple
	jp Switch_turn
.already_activated
	jp ActivateTrait

TraitBoostCritical:
	ld hl, TraitsThatBoostCritical
	call CheckTrait
	jr nc, .not_met
	ld a, 1
	ld [wBuffer2], a
	ret
.not_met
	xor a
	ld [wBuffer2], a
	ret

TraitsThatBoostCritical:
	db TRAIT_CRIT_BELOW_THIRD
	db TRAIT_CRITICAL_AFTER_CRIT
	db TRAIT_OPP_SAME_TYPE_CRIT_BOOST
	db -1
	
TraitBoostAccuracy:
	ld hl, TraitsThatBoostAccuracy
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
	ld hl, TraitsThatReduceAccuracy
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
	ret nc

	ld b, 12 percent
	call Chance
	ret nc

	ld hl, .TraitsThatRequireContact
	call CheckTrait
	ret nc

	call Switch_turn
	ld a, [wBuffer3]
	ld hl, .StatusCommands
	call TraitUseBattleCommand
	jp Switch_turn

.StatusCommands:
	dw BattleCommand_BurnTarget
	dw BattleCommand_ParalyzeTarget
	dw BattleCommand_PoisonTarget
	dw BattleCommand_FlinchTarget
	dw BattleCommand_ConfuseTarget
	dw BattleCommand_Attract

.TraitsThatRequireContact:
	db TRAIT_CONTACT_BRN
	db TRAIT_CONTACT_PRZ
	db TRAIT_CONTACT_PSN
	db TRAIT_CONTACT_FLINCH
	db TRAIT_CONTACT_CONFUSED
	db TRAIT_CONTACT_IN_LOVE
	db -1

TraitPostHitBattleCommand:
	ld hl, .TraitsThatTriggerBattleEffects
	call CheckTrait
	ret nc
	
	ld b, 8 percent
	ld a, [wBuffer3]
	cp 0
	jr z, .chance ; freeze trait is 8%
	ld b, 16 percent ; other traits are 16%
.chance	
; double chance for moves under 60 power
	ld a, BATTLE_VARS_MOVE_POWER
 	call GetBattleVar
	cp 60
	jr nc, .got_power
	rlc b

.got_power
	call Chance
	ret nc

	ld hl, .StatusCommands
	ld a, [wBuffer3]
	jp TraitUseBattleCommand

.StatusCommands:
	dw BattleCommand_FreezeTarget
	dw BattleCommand_ParalyzeTarget
	dw BattleCommand_BurnTarget

.TraitsThatTriggerBattleEffects:
	db TRAIT_FLYING_FRZ
	db TRAIT_FLYING_PRZ
	db TRAIT_FLYING_BRN
	db -1

TraitStartWeather:
	ld hl, .TraitsThatStartWeather
	call CheckTrait
	jr nc, .not_start_weather
	ld a, 4
	jr .end
.not_start_weather
	ld hl, .TraitsThatBoostWeather
	call CheckTrait
	jr nc, .no_boost
	ld a, 6
	jr .end
.no_boost
	ld a, 5
.end
	ld [wWeatherCount], a
	ret

.TraitsThatStartWeather:
	db TRAIT_RAIN_ON_ENTER
	db TRAIT_SUNSHINE_ON_ENTER
	db TRAIT_SANDSTORM_ON_ENTER
	db -1

.TraitsThatBoostWeather:
	db TRAIT_RAIN_DURATION
	db TRAIT_SUNSHINE_DURATION
	db TRAIT_SANDSTORM_DURATION
	db -1

TraitRainStarts:
	ld hl, .TraitsThatTriggerOnRainStart
	call CheckTrait
	jr nc, .not_met
	call IncreaseTraitCount
	call SetUserTurn
	jp TraitHealEighth
.not_met
	ret

.TraitsThatTriggerOnRainStart:
	db TRAIT_REGEN_ON_RAIN
	db -1

TraitSunshineStarts:
	ld hl, .TraitsThatTriggerOnSunshineStart
	call CheckTrait
	jr nc, .not_met
	call IncreaseTraitCount
	call SetUserTurn
	jp TraitHealEighth
.not_met
	ret

.TraitsThatTriggerOnSunshineStart:
	db TRAIT_REGEN_ON_SUNSHINE
	db -1

TraitSandstormStarts:
	ld hl, .TraitsThatTriggerOnSandstormStart
	call CheckTrait
	jr nc, .not_met
	call IncreaseTraitCount
	call SetUserTurn
	jp TraitHealEighth
.not_met
	ret

.TraitsThatTriggerOnSandstormStart:
	db TRAIT_REGEN_ON_SANDSTORM
	db -1

TraitHealEighth:
	xor a
	ld [wBuffer3], a
	ld [wBuffer5], a
	ld hl, GetEighthMaxHP
	ld a, BANK(GetMaxHP)
	rst FarCall
	ld a, c
	ld [wBuffer6], a
	call EffectTraitForceRecoverHP
	ret

TraitWeatherHealsStatus:
	; call ResetActivated
	ld hl, .TraitsThatHealStatus
	call CheckTrait
	jr nc, .not_met
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	xor a
	ld [hl], a
.not_met
	ret

.TraitsThatHealStatus:
	db TRAIT_RAIN_NO_STATUS
	db TRAIT_SUNSHINE_NO_STATUS
	db TRAIT_SANDSTORM_NO_STATUS
	db -1

TraitReduceDamageFromType:
	ld a, BATTLE_VARS_MOVE_TYPE
 	call GetBattleVarAddr
	and TYPE_MASK
	ld d, a
	ld e, $FF ; reset e so no type equals it

	ld a, [wBuffer1]
	call GetBattleVar
	cp TRAIT_REDUCE_WATER_UP_DEFENSE
	jr z, .skip_trigger1
	cp TRAIT_REDUCE_GRASS_UP_ATTACK
	jr z, .skip_trigger2

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
	ret nc
.reduce
	ld a, $67 ; ~0.86 ; 14% reduction
	jp ApplyDamageMod
.reduce_less
	ld a, $9A ; =0.9 ; 10% reduction
	jp ApplyDamageMod
.reduce_more
	call GetHealthPercentage
	ld a, d
	cp 50
	ret nc
	ld a, $57 ; ~0.71 ; 29% reduction
	jp ApplyDamageMod

.skip_trigger1
	ld c, WATER
	call CheckTraitCondition.check_move_type
	jr c, .reduce_less
	ret
.skip_trigger2
	ld c, GRASS
	call CheckTraitCondition.check_move_type
	jr c, .reduce_less
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
	db TRAIT_ATTACK_AFTER_CRIT
	db TRAIT_DEFENSE_AFTER_CRIT
	db TRAIT_SPEED_AFTER_CRIT
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
	db TRAIT_REDUCE_WATER_UP_DEFENSE
	db TRAIT_REDUCE_GRASS_UP_ATTACK
	db -1

TraitReducePower:
	ld a, [wCriticalHit]
	cp 1
	jr nz, .not_crit
	ld a, TRAIT_REDUCE_CRIT_DAMAGE
	call CheckSpecificTrait
	jr c, .boost_more
.not_crit
	ld c, 6
.loop
	ld hl, .JumpTableTraitsReduceMoveClass
	dec c
	ld a, c
	ret z
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
	ret nc
.boost
	ld a, $67 ; ~0.85
	jp ApplyDamageMod
.boost_more
	ld a, $68 ; 0.75
	jp ApplyDamageMod

.JumpTableTraitsReduceMoveClass
	db TRAIT_REDUCE_PUNCHING
	db TRAIT_REDUCE_SOUND
	db TRAIT_REDUCE_BITING
	db TRAIT_REDUCE_CUTTING
	db TRAIT_REDUCE_BEAM
	db TRAIT_REDUCE_PERFURATE

TraitBoostPower:
	ld a, [wCriticalHit]
	cp 1
	jr nz, .not_crit
	ld a, TRAIT_BOOST_CRIT_DAMAGE
	call CheckSpecificTrait
	jr c, .boost_25
.not_crit
	ld a, TRAIT_BOOST_WEAK_MOVES
	call CheckSpecificTrait
	jr c, .boost_50

	ld a, [wBattleWeather]
	and a
	jp z, .no_weather
	ld a, TRAIT_BOOST_FLYING_DURING_WEATHER
	call CheckSpecificTrait
	jr nc, .no_weather
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	cp 60
	jr nc, .boost_20
	jr .boost_50

.no_weather
	ld hl, .TraitsThatBoostTypeStatused
	call CheckTrait
	jr c, .boost2
	ld hl, .TraitsThatBoostDamage
	call CheckTrait
	jr c, .boost_20
	ld c, 6
.loop
	ld hl, .JumpTableTraitsBoostMoveClass
	dec c
	ld a, c
	ret z
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
	ret nc
.boost_15
	ld a, $76 ; ~1.16
	jp ApplyDamageMod
.boost2
	ld d, $FE
	call CheckTraitCondition.check_user_status
	ret nc
	; fallthrough
.boost_20
	ld a, $65 ; ~1.20
	jp ApplyDamageMod
.boost_25
	ld a, $54 ; ~1.25
	jp ApplyDamageMod
.boost_50
	ld a, $32 ; ~1.5
	jp ApplyDamageMod

.JumpTableTraitsBoostMoveClass
	db TRAIT_BOOST_PUNCHING
	db TRAIT_BOOST_SOUND
	db TRAIT_BOOST_BITING
	db TRAIT_BOOST_CUTTING
	db TRAIT_BOOST_BEAM
	db TRAIT_BOOST_PERFURATE

.TraitsThatBoostTypeStatused:
	db TRAIT_BOOST_NORMAL_STATUSED
	db TRAIT_BOOST_FIGHTING_STATUSED
	db TRAIT_BOOST_FLYING_STATUSED
	db TRAIT_BOOST_GROUND_STATUSED
	db TRAIT_BOOST_ROCK_STATUSED
	db TRAIT_BOOST_BUG_STATUSED
	db TRAIT_BOOST_FIRE_STATUSED
	db TRAIT_BOOST_WATER_STATUSED
	db TRAIT_BOOST_GRASS_STATUSED
	db TRAIT_BOOST_ELECTRIC_STATUSED
	db TRAIT_BOOST_PSYCHIC_STATUSED
	db TRAIT_BOOST_ICE_STATUSED
	db TRAIT_BOOST_DARK_STATUSED
	db -1

.TraitsThatBoostDamage:
	db TRAIT_OPP_SAME_TYPE_DMG_BOOST
	db -1

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

TraitBoostDamagePerTurn:
	ld a, TRAIT_BOOST_DAMAGE_PER_TURN
	call CheckSpecificTrait
	ret nc
	ld hl, wPlayerTurnsTaken
	ld de, wEnemyTurnsTaken
	call GetTraitUserAddr
	ld a, [hl]
	cp 7
	jr c, .max
	ld a, 7 ; the max is 7
.max
	ld b, a
	ld a, 24
	add b
.boost
	ld [hMultiplier], a
	call Multiply ; multiply damage value that is stored
	ld b, 4
	ld a, 25
	ldh [hDivisor], a
	jp Divide ; divide damage value that is stored

TraitBoostDamagePerTurnSlow:
	ld a, TRAIT_BOOST_DAMAGE_PER_TURN_SLOW
	call CheckSpecificTrait
	ret nc
	ld hl, wPlayerTurnsTaken
	ld de, wEnemyTurnsTaken
	call GetTraitUserAddr
	ld a, [hl]
	cp 4
	jr c, .max
	ld a, 4 ; the max is 4
.max
	ld b, a
	ld a, 8
	add b
.boost
	ld [hMultiplier], a
	call Multiply ; multiply damage value that is stored
	ld b, 4
	ld a, 10
	ldh [hDivisor], a
	jp Divide ; divide damage value that is stored

TraitReduceDamagePerTurn:
	ld a, TRAIT_BOOST_DAMAGE_PER_TURN
	call CheckSpecificTrait
	ret nc
	ld hl, wPlayerTurnsTaken
	ld de, wEnemyTurnsTaken
	call GetTraitUserAddr
	ld a, [hl]
	cp 7
	jr c, .max
	ld a, 7 ; the max is 7
.max
	ld b, a
	ld a, 27
	sub b
.boost
	ld [hMultiplier], a
	call Multiply ; multiply damage value that is stored
	ld b, 4
	ld a, 20
	ldh [hDivisor], a
	jp Divide ; divide damage value that is stored

TraitResistDamagePerTurn:
	ld hl, TraitsThatResistDamagePerTurn
	call CheckTrait
	ret nc
	ld hl, wPlayerTurnsTaken
	ld de, wEnemyTurnsTaken
	call GetTraitUserAddr
	ld a, [hl]
	cp 7
	jr c, .max
	ld a, 7 ; the max is 7
.max
	ld b, a
	ld a, 24
	sub b
.boost
	ld [hMultiplier], a
	call Multiply ; multiply damage value that is stored
	ld b, 4
	ld a, 25
	ldh [hDivisor], a
	jp Divide ; divide damage value that is stored

TraitsThatResistDamagePerTurn:
	db TRAIT_REDUCE_PHYSICAL_TAKEN_TURNS
	db TRAIT_REDUCE_SPECIAL_TAKEN_TURNS
	db -1

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
	db TRAIT_BOOST_FIRE_HP
	db TRAIT_BOOST_WATER_HP
	db TRAIT_BOOST_GRASS_HP
	db TRAIT_BOOST_ICE_HP
	db -1

TraitBoostDrain:
	ld a, TRAIT_BOOST_DRAIN
	call CheckSpecificTrait
	ret nc

	ldh a, [hDividend]
	ld h, a
	ldh a, [hDividend + 1]
	ld l, a
	push hl
	call GetHealthPercentage
	pop hl	
	ld a, d
	cp 50
	ret nc
	
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
	ld a, [wBuffer2]
	cp 0
	jr nz, .without_chance
	call BattleRandom
	cp 10 percent
	jr nc, .not_met
.without_chance
	call EffectTraitForceRecoverPP
.not_met
	ret

TraitsThatRecoverPP:
	db TRAIT_HEAL_PP_STATUSED
	db TRAIT_GAIN_PP_TURN_ZERO
	db -1

TraitFaintEnemyMon: ; enemy mon faints
	ldh a, [hBattleTurn]
	and a
	jr z, .player_turn
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	jp TraitFaintMon

.player_turn
	ld a, BATTLE_VARS_TRAIT_OPP
	ld [wBuffer1], a
	jp TraitFaintMon

TraitFaintPlayerMon: ; user mon faints
	ldh a, [hBattleTurn]
	and a
	jr z, .player_turn
	ld a, BATTLE_VARS_TRAIT_OPP
	ld [wBuffer1], a

.player_turn
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
TraitFaintMon:
	ld hl, TraitsThatTriggerOnFaintMon
	call CheckTrait
	jr nc, .not_1

	call Switch_turn
	ld a, [wBuffer3]
	ld hl, .StatusCommands
	call TraitUseBattleCommand
	
	call Switch_turn
.not_1
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	ld hl, TraitsThatTriggerOnFaintOppMon
	call CheckTrait
	ret nc

	ld a, [wBuffer3]
	and a
	jr z, .heal_hp_faint
	dec a
	jr z, .heal_pp_faint
	dec a
	ld hl, .StatusCommands2
	call TraitUseBattleCommand
	ld hl, BattleCommand_StatUpMessage
	jp TraitUseBattleCommandSimple

.heal_pp_faint
	call SetUserTurn
	jp EffectTraitForceRecoverPP
	
.heal_hp_faint
	call SetUserTurn
	call Switch_turn
	ld hl, GetEighthMaxHP
	ld a, BANK(GetMaxHP)
	rst FarCall
	ld a, c
	ld [wBuffer6], a
	jp EffectTraitForceRecoverHP

.StatusCommands:
	dw BattleCommand_BurnTarget
	dw BattleCommand_PoisonTarget
	dw BattleCommand_FreezeTarget
	dw BattleCommand_Curse

.StatusCommands2:
	dw BattleCommand_AttackUp
	dw BattleCommand_SpecialAttackUp
	dw BattleCommand_RandomStatUp

TraitsThatTriggerOnFaintMon:
	db TRAIT_BURN_FAINT
	db TRAIT_POISON_FAINT
	db TRAIT_FREEZE_FAINT
	db TRAIT_CURSE_FAINT
	db -1

TraitsThatTriggerOnFaintOppMon:
	db TRAIT_HEAL_HP_FAINT ; 0
	db TRAIT_HEAL_PP_FAINT ; 1
	db TRAIT_ATTACK_OPP_FAINT ; 2
	db TRAIT_SP_ATTACK_OPP_FAINT ; 3
	db TRAIT_RANDOM_STAT_OPP_FAINT ; 4
	db -1

EffectTraitForceRecoverPP:
	ld a, $FF
	ld [wd002], a
	callfar RestorePP

	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld de, wBattleMonMoves
	ld b, NUM_MOVES
.loop
	ld a, [de]
	and a
	jr z, .done
	cp [hl]
	jr nz, .next
	push hl
	push de
	push bc
rept NUM_MOVES + 2 ; wBattleMonPP - wBattleMonMoves
	inc de
endr
	ld bc, MON_PP - MON_MOVES
	add hl, bc
	ld a, [hl]
	ld [de], a
	pop bc
	pop de
	pop hl

.next
	inc hl
	inc de
	dec b
	jr nz, .loop

.done
	ret

EffectTraitForceRecoverHP:	
	ld hl, RestoreHP
	ld a, BANK("Battle Core")
	rst FarCall
	ret

TraitRegenHP:
	ld hl, TraitsThatRegenerate
	call CheckTrait
	jr nc, .not_met
	
	ld a, [wBuffer3]
	cp 2
	jr z, .heal_hp_sixteenth
	ld hl, GetEighthMaxHP
	jr .complete_heal
.heal_hp_sixteenth
	ld hl, GetSixteenthMaxHP
.complete_heal
	xor a
	ld [wBuffer3], a
	ld [wBuffer5], a
	ld a, BANK(GetMaxHP)
	rst FarCall
	ld a, c
	ld [wBuffer6], a
	call EffectTraitForceRecoverHP
.not_met
	ret

TraitsThatRegenerate:
	db TRAIT_REGEN_LOW_HP ; 0
	db TRAIT_REGEN_STATUSED ; 1
	db TRAIT_REGEN_FIRST_TURNS ; 2
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
	
Chance: ; takes `percent` in `b` and sets carry flag
	call BattleRandom
	cp b
	jr c, .success
	and a
	ret	
.success
	xor a
	ld [wAttackMissed], a
	ld [wEffectFailed], a
	scf
	ret

CheckStab:
	ld hl, wTypeModifier
	bit 7, [hl]
	jr nz, .yes
	and a
	ret
.yes
	scf
	ret

TraitUseBattleCommand: ; takes index in a and commands list in hl
	ld b, 0
	ld c, a
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld h, [hl]
	ld l, a

	xor a
	ld [wAttackMissed], a
	ld [wEffectFailed], a

	ld a, BANK("Effect Commands")
	rst FarCall
	ret

TraitUseBattleCommandSimple:
	ld a, BANK("Effect Commands")
	rst FarCall
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

GetHealthPercentage:
	push bc
	ld hl, wBattleMonHP
	ld de, wBattleMonMaxHP
	call GetTraitUser
	jr c, .got_stats
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

; takes player addr in hl, enemy addr in de, returns user addr in hl
GetTraitUserAddr:
	ldh a, [hBattleTurn]
	and a	
	jr z, .player_turn
	ld a, [wBuffer1]
	cp BATTLE_VARS_TRAIT
	jr z, .end_de
	ret ; player's turn & checking player's trait
.player_turn
	ld a, [wBuffer1]
	cp BATTLE_VARS_TRAIT
	ret z ; player's turn & checking player's trait
.end_de
	ld h, d
	ld l, e
	ret

; sets carry flag if the player is the user
GetTraitUser:
	ldh a, [hBattleTurn]
	and a	
	jr z, .player_turn
; enemy turn
	ld a, [wBuffer1]
	cp BATTLE_VARS_TRAIT
	jr z, .end
	scf
	ret ; enemy's turn player's trait
.player_turn
	ld a, [wBuffer1]
	cp BATTLE_VARS_TRAIT
	jr nz, .end
	scf
	ret ; player's turn player's trait
.end
	and a
	ret

; sets current turn to the user's turn, so the trait affects themselves
SetUserTurn:
	call GetTraitUser
	jr c, .player_user
	ldh a, [hBattleTurn]
	and a
	ret nz
	scf
	jp Switch_turn
.player_user
	ldh a, [hBattleTurn]
	and a	
	ret z
	scf
	jp Switch_turn

IncreaseTraitCount:
	call GetTraitUser
	ld hl, wTraitActivated
	jr c, .player_user
	ld a, [hl]
	and %00011111 ; grab the enemy bit (0001) and the player data (1111) to preserve it in b
	ld b, a
	ld a, [hl]
	and %11100000
	rrca
	swap a
	cp 7
	jr z, .max1
	inc a
.max1
	rlca
	swap a
	add b 
	jr .end

.player_user
	ld a, [hl]
	and %11110001 ; grab the player bit (0001) and the enemy data (1111) to preserve it in b
	ld b, a
	ld a, [hl]
	and %1110 ; grab the 3 bits after the player bit
	rrca
	cp 7
	jr z, .max2
	inc a
.max2
	rlca
	add b
.end
	ld [hl], a
	ret

CheckTraitCount: ; returns trait activation count in a
	call GetTraitUser
	ld hl, wTraitActivated
	jr c, .player_user
	ld a, [hl]
	and %11100000
	rrca
	swap a
	ret

.player_user
	ld a, [hl]
	and %1110
	rrca	
	ret

; Checks if the user's trait is already activated	
; - Preserves `hl` and `bc`	
; - Sets `c` if true
CheckTraitActivated:
	push hl
	push bc
	ld hl, OneShotTraits
	ld a, [wBuffer1]
	call GetBattleVar
	ld de, 1	
	call IsInArray
	jr nc, .end
.not_one_shot
	call GetTraitUser
	ld hl, wTraitActivated
	jr c, .player_user

	bit 4, [hl] ; enemy trait
	jr nz, .already_activated
	jr .end

.player_user
	bit 0, [hl] ; player trait
	jr nz, .already_activated
.end
	pop bc
	pop hl
	and a
	ret
.already_activated
	pop bc
	pop hl
	scf
	ret

CheckTraitActivatedSimple:
	call GetTraitUser
	ld hl, wTraitActivated
	jr c, .player_user

	bit 4, [hl] ; enemy trait
	jr nz, .already_activated
	jr .end

.player_user
	bit 0, [hl] ; player trait
	jr nz, .already_activated
.end
	and a
	ret
.already_activated
	scf
	ret

; Activates the wTraitActivated bit for the current user and displays activation text box
ActivateTrait:
	ld a, [wBuffer1]
	call GetBattleVar
	ld [wNamedObjectIndexBuffer], a
	call GetTraitName
	call GetTraitUser	
	jr c, .player_user
	ld hl, BattleText_TraitActivatedEnemy
	call StdBattleTextBox
	ld hl, wTraitActivated
	set 4, [hl] ; enemy trait
	ld a, [hl]
.player_user
	ld hl, BattleText_TraitActivatedPlayer
	call StdBattleTextBox
	ld hl, wTraitActivated
	set 0, [hl] ; player trait
	ld a, [hl]
	ret

; Resets the wTraitActivated bit for the current trait user	
ResetActivated:
	call GetTraitUser
	ld hl, wTraitActivated
	jr c, .player_user
	res 4, [hl] ; enemy trait
	ret
.player_user
	res 0, [hl] ; player trait
	ret

OneShotTraits:
; List of traits that can only go off once while the pokemon is out
	db TRAIT_ATTACK_OPP_FAINT
	db TRAIT_SP_ATTACK_OPP_FAINT
	db TRAIT_RAIN_ATTACK
	db TRAIT_RAIN_DEFENSE
	db TRAIT_RAIN_SPEED
	db TRAIT_RAIN_SP_ATTACK
	db TRAIT_RAIN_SP_DEFENSE
	db TRAIT_RAIN_ACCURACY
	db TRAIT_RAIN_EVASION
	db TRAIT_RAIN_NO_STATUS
	db TRAIT_SUNSHINE_ATTACK
	db TRAIT_SUNSHINE_DEFENSE 
	db TRAIT_SUNSHINE_SPEED
	db TRAIT_SUNSHINE_SP_ATTACK
	db TRAIT_SUNSHINE_SP_DEFENSE
	db TRAIT_SUNSHINE_ACCURACY
	db TRAIT_SUNSHINE_EVASION
	db TRAIT_SUNSHINE_NO_STATUS	
	db TRAIT_SANDSTORM_ATTACK
	db TRAIT_SANDSTORM_DEFENSE
	db TRAIT_SANDSTORM_SPEED
	db TRAIT_SANDSTORM_SP_ATTACK
	db TRAIT_SANDSTORM_SP_DEFENSE
	db TRAIT_SANDSTORM_ACCURACY
	db TRAIT_SANDSTORM_EVASION
	db TRAIT_SANDSTORM_NO_STATUS
	db TRAIT_REGEN_ON_RAIN
	db TRAIT_REGEN_ON_SUNSHINE
	db TRAIT_REGEN_ON_SANDSTORM
	db TRAIT_BOOST_ATK_ACC_NOT_ATTACKING
	db TRAIT_BOOST_DEF_ACC_NOT_ATTACKING
	db TRAIT_BOOST_SPD_ACC_NOT_ATTACKING
	db TRAIT_BOOST_SPATK_ACC_NOT_ATTACKING
	db TRAIT_REGEN_LOW_HP
	db TRAIT_ATTACK_BELOW_THIRD
	db TRAIT_DEFENSE_BELOW_THIRD
	db TRAIT_SPEED_BELOW_THIRD
	db TRAIT_SP_ATTACK_BELOW_THIRD
	db TRAIT_SP_DEFENSE_BELOW_THIRD
	db TRAIT_ACCURACY_BELOW_THIRD
	db TRAIT_EVASION_BELOW_THIRD 
	db TRAIT_CRIT_BELOW_THIRD
	db TRAIT_ATTACK_AFTER_CRIT
	db TRAIT_DEFENSE_AFTER_CRIT
	db TRAIT_SPEED_AFTER_CRIT
	db TRAIT_ATTACK_STATUSED
	db TRAIT_DEFENSE_STATUSED
	db TRAIT_SPEED_STATUSED
	db TRAIT_SP_ATTACK_STATUSED
	db TRAIT_SP_DEFENSE_STATUSED
	db TRAIT_ACCURACY_STATUSED
	db TRAIT_EVASION_STATUSED
	db TRAIT_OPP_SAME_TYPE_CRIT_BOOST
	db TRAIT_DEFENSE_ICE_FIRE_HIT
	db TRAIT_SPEED_BUG_DARK_HIT
	db TRAIT_REDUCE_WATER_UP_DEFENSE
	db TRAIT_REDUCE_GRASS_UP_ATTACK
	db TRAIT_RANDOM_STAT_WHEN_FLINCHED
	db -1