CheckTrait: ; sets carry if trait can be used, returns move index [wBuffer3] in `a`
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
	cp TRAIT_HEAL_HP_AND_STATUS + 1 
	ld d, 10 percent + 1
	jp c, .check_chance
	cp TRAIT_RAISE_SP_DEFENSE_STAT_LOWERED + 1 
	ld d, 25 percent + 1
	jp c, .check_chance
	cp TRAIT_HEAL_STATUS + 1 
	ld d, 30 percent + 1
	jp c, .check_chance
	cp TRAIT_HOT_COALS + 1 ; 
	ld d, 12 percent + 1
	jp c, .check_chance
	cp TRAIT_EVASION_ON_SPEED_DIFF + 1 ; 
	ld d, 50
	ld e, SPEED
	jp c, .check_stat_difference
	cp TRAIT_ATK_ON_ATK_DIFF + 1 ; 
	ld d, 50
	ld e, ATTACK
	jp c, .check_stat_difference
	cp TRAIT_BOOST_RECOIL + 1 ; all traits that require recoil
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
	cp TRAIT_SLEEP_IMMUNE + 1 ; all sleep traits
	jp c, .check_move_sleep
	cp TRAIT_FRZ_IMMUNE + 1 ; all freeze traits
	jp c, .check_move_frz
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
	cp TRAIT_LOWER_RANDOM_TURN_ZERO + 1 ; all traits on turn 0
	ld d, 0
	jp c, .check_turns_equal
	cp TRAIT_HEAL_HP_AFTER_WATER_MOVE + 1 ; 
	ld d, 0
	jp c, .check_trait_activation_over
	cp TRAIT_BOOST_SPATK_ACC_NOT_ATTACKING + 1 ; 
	ld d, 3
	jp c, .check_trait_activation_equal	
	cp TRAIT_RANDOM_STAT_AFTER_5_TURNS + 1 ; 
	jp c, .check_trait_activated
	cp TRAIT_REGEN_FIRST_TURNS + 1 ; all traits on turn 3 and lower
	ld d, 2 ; 0, 1, 2
	jp c, .check_turns_lower
	cp TRAIT_CULL_OPP_LOW_HP + 1 ; traits that require the opponent to be at certain hp
	ld b, 10
	jp c, .check_opp_below_threshold
	cp TRAIT_REGEN_LOW_HP + 1 ; all traits that require to be below 50% hp
	ld b, 50
	jp c, .check_below_threshold 
	cp TRAIT_CRIT_BELOW_THIRD + 1 ; all traits that require to be below 33% hp
	ld b, 34
	jp c, .check_below_threshold
	cp TRAIT_REDUCE_CRIT_MORE + 1
	jp c, .check_crit
	cp TRAIT_BOOST_MOVE_SECOND + 1
	jp c, .check_move_second
	cp TRAIT_CRITICAL_AFTER_CRIT + 1
	ld d, 1
	jp c, .check_trait_activation_equal
	cp TRAIT_STATUS_TO_SLP + 1
	ld d, $FF
	jp c, .check_user_status
	cp TRAIT_REGEN_STATUSED + 1
	ld d, $FE
	jp c, .check_user_status
	cp TRAIT_EVASION_WHEN_CONFUSED + 1
	ld d, SUBSTATUS_CONFUSED
	jp c, .check_user_substatus3
	cp TRAIT_RANDOM_STAT_WHEN_FLINCHED + 1
	ld d, SUBSTATUS_FLINCHED
	jp c, .check_user_substatus3
	cp TRAIT_OPP_SAME_TYPE_CRIT_BOOST + 1
	jp c, .check_opp_same_type
	cp TRAIT_BOOST_WEAK_MOVES + 1
	ld d, 60
	jp c, .check_move_power
	ld e, $FF ; reset e so no type equals it
	push af
	ld a, BATTLE_VARS_MOVE_TYPE
 	call GetBattleVar
	and TYPE_MASK
	ld d, a
	pop af
	cp TRAIT_REDUCE_PSN_AND_POISON
	ld b, a
	ld c, POISON
	call c, .check_move_type
	call c, .check_move_psn
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
	ld c, BUG
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
	cp TRAIT_REDUCE_WATER_FIRE_HIT + 1; 
	ld b, a
	ld c, WATER
	ld e, FIRE
	jp c, .check_move_type
	cp TRAIT_DEFENSE_ICE_FIRE_HIT + 1; 
	ld b, a
	ld c, FIRE
	ld e, ICE
	jp c, .check_move_type
	cp TRAIT_SPEED_BUG_DARK_HIT + 1; 
	ld b, a
	ld c, BUG
	ld e, DARK
	jp c, .check_move_type
	cp TRAIT_REDUCE_FIGHTING_MORE ; traits below this that require move type to be NORMAL
	ld b, a
	ld c, NORMAL
	jp c, .check_move_type
	cp TRAIT_REDUCE_FLYING_MORE ; traits that require move type to be FIGHTING
	ld b, a
	ld c, POISON
	jp c, .check_move_type
	cp TRAIT_REDUCE_POISON_MORE ; traits that require move type to be POISON
	ld b, a
	ld c, FIGHTING
	jp c, .check_move_type
	cp TRAIT_REDUCE_GROUND_MORE ; traits that require move type to be FLYING
	ld b, a
	ld c, FLYING
	jp c, .check_move_type
	cp TRAIT_REDUCE_ROCK_MORE ; traits that require move type to be GROUND
	ld b, a
	ld c, GROUND
	jp c, .check_move_type
	cp TRAIT_REDUCE_STEEL_MORE ; traits that require move type to be ROCK
	ld b, a
	ld c, ROCK
	jp c, .check_move_type
	cp TRAIT_REDUCE_BUG_MORE ; traits that require move type to be ROCK
	ld b, a
	ld c, STEEL
	jp c, .check_move_type
	cp TRAIT_REDUCE_FIRE_MORE ; traits that require move type to be BUG
	ld b, a
	ld c, BUG
	jp c, .check_move_type
	cp TRAIT_REDUCE_WATER_MORE ; traits that require move type to be FIRE
	ld b, a
	ld c, FIRE
	jp c, .check_move_type
	cp TRAIT_REDUCE_GRASS_MORE ; traits that require move type to be WATER
	ld b, a
	ld c, WATER
	jp c, .check_move_type
	cp TRAIT_REDUCE_ELECTRIC_MORE ; traits that require move type to be GRASS
	ld b, a
	ld c, GRASS
	jp c, .check_move_type
	cp TRAIT_REDUCE_PSYCHIC_MORE ; traits that require move type to be ELECTRIC
	ld b, a
	ld c, ELECTRIC
	jp c, .check_move_type
	cp TRAIT_REDUCE_ICE_MORE ; traits that require move type to be PSYCHIC
	ld b, a
	ld c, PSYCHIC
	jp c, .check_move_type
	cp TRAIT_REDUCE_DARK_MORE ; traits that require move type to be ICE
	ld b, a
	ld c, ICE
	jp c, .check_move_type
	cp TRAIT_BOOST_NOT_EFFECTIVE ; traits that require move type to be DARK
	ld b, a
	ld c, DARK
	jp c, .check_move_type
	
	jr .success
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
	ld a, [wBuffer3]
	ret

.check_chance
	call BattleRandom
	cp d
	jr c, .success
	and a
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
	cp EFFECT_RECOIL_HIT_BURN
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

.check_stat_difference
	ld a, e
	call GetStatDifference
	cp d
	jp nc, .success
	and a
	ret

.check_recoil
	call GetMoveStructEffect
	cp EFFECT_RECOIL_HIT
	jp z, .success
	cp EFFECT_RECOIL_HIT_BURN
	jp z, .success
	and a
	ret

.check_not_stab ; stab = nc, non-stab = c
	ld hl, wTypeModifier
	bit 7, [hl]
	jp z, .success
	and a
	ret

.check_crit:
	ld a, [wCriticalHit]
	cp 1
	jp z, .success
	jp .not_met

.check_move_second:
	call GetTraitUser
	ld a, [wEnemyGoesFirst]
	jr c, .player
	and a
	jp z, .success ; player went first
	jp .not_met
.player
	and a
	jp nz, .success ; player didn't go first
	jp .not_met

.check_turns_equal
	ld a, BATTLE_VARS_TURNS_TAKEN
 	call GetBattleVar
	dec a
	cp d
	jp z, .success ; 
	jp .not_met

.check_turns_lower
	ld a, BATTLE_VARS_TURNS_TAKEN
 	call GetBattleVar
	cp d
	jp nc, .not_met ; greater or equal
	jp .success

.check_turns_greater
	ld a, BATTLE_VARS_TURNS_TAKEN
 	call GetBattleVar
	cp d
	jr c, .turns_lower ; lower
	jp .success
.turns_lower
	and a
	ret

; Checks if `d` is over trait Activated Count
.check_trait_activation_over
	push de
	call CheckTraitCount
	pop de
	cp d
	jr z, .zero
	jp nc, .success
.zero
	and a
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

.check_opp_below_threshold
	ld hl, wEnemyMonHP
	ld de, wEnemyMonMaxHP
	call GetTraitUser
	jr c, .got_stats
	ld hl, wBattleMonHP
	ld de, wBattleMonMaxHP
.got_stats
	call GetHealthPercentageWithAddr ; pops bc in it
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
	jp nc, .not_met
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
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	bit SUBSTATUS_NIGHTMARE, [hl]
	jp nz, .success
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_CONFUSED, [hl]
	jp nz, .success
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	bit SUBSTATUS_TOXIC, [hl]
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

.check_opp_party_for_type:
	push de
	ld hl, wOTPartySpecies
	ld de, wPartySpecies
	jr .got_party
.check_party_for_type:
	push de
	ld hl, wPartySpecies
	ld de, wOTPartySpecies
.got_party
	call GetTraitUserAddr
	pop de
	ld b, 1 << (PARTY_LENGTH - 1)
	ld c, 0

.loop
	ld a, [hli]
	cp $ff
	ret z
	cp $0
	ret z

	push hl
	ld [wCurSpecies], a
	call GetBaseData
	ld hl, wBaseType1
	ld a, [hl]
	cp d
	jr z, .found_type
	ld a, [wCurSpecies]
	ld hl, wBaseType2
	ld a, [hl]
	cp d
	jr nz, .dont_choose_mon
	ld a, b
	or c
	ld c, a

.found_type
	call IncreaseTraitCount

.dont_choose_mon
	srl b
	pop hl
	jr .loop
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
.end
	and a
	ret

; triggers
.check_crit_trigger:
	ld a, [wCriticalHit]
	cp 1
	jr nz, .not_crit_trigger
	call IncreaseTraitCount
.not_crit_trigger
	and a
	ret

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

.check_move_type_trigger:
	ld b, a
	call GetMoveStructDamage
	inc hl
	ld a, [hl]
	and TYPE_MASK
	cp c
	jr z, .is_type
	cp e
	jr z, .is_type
	and a
	ld a, b ; restore trait into 'a'	
	ret
.is_type
; increase counter 2 times as long as it's 0
	call CheckTraitCount
	and a
	ret nz
	call IncreaseTraitCount
	jp IncreaseTraitCount

Get_move_category: ; 0 = physical, 1 = special, 2 = status
	ld a, BATTLE_VARS_MOVE_TYPE
 	call GetBattleVarAddr
	and $ff ^ TYPE_MASK
	and STATUS
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

GetMoveStructEffectOpp:
	ld hl, wPlayerMoveStruct + MOVE_EFFECT
	call GetTraitUser
	jr nc, .got_effect
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
	cp TRAIT_HEAL_HP_AFTER_WATER_MOVE
	jr c, .no_trigger

	cp TRAIT_HEAL_HP_AFTER_WATER_MOVE + 1
	ld e, $FF
	ld c, WATER
	jr c, CheckTraitCondition.check_move_type_trigger

	cp TRAIT_BOOST_SPATK_ACC_NOT_ATTACKING + 1
	jp c, CheckTraitCondition.check_did_no_dmg_for_three_turns

	cp TRAIT_ALL_STATS_AFTER_7_TURNS + 1
	ld d, 7
	jp c, CheckTraitCondition.check_every_x_turns

	cp TRAIT_RANDOM_STAT_AFTER_5_TURNS + 1
	ld d, 5
	jp c, CheckTraitCondition.check_every_x_turns

	cp TRAIT_REDUCE_CRIT_MORE + 1 ; no trigger before this
	jp c, .no_trigger
	
	cp TRAIT_CRITICAL_AFTER_CRIT + 1
	jp c, CheckTraitCondition.check_crit_trigger
.no_trigger
	ret

TraitRaiseStatAfterDamage:
	ld a, [wBuffer1]
	call GetBattleVar
	ld de, 1
	ld hl, .TraitsThatRaiseStatAfterDamage
	call IsInArray
	ret nc
	jp TraitRaiseStat

.TraitsThatRaiseStatAfterDamage:
	db TRAIT_ATTACK_AFTER_CRIT
	db TRAIT_DEFENSE_AFTER_CRIT
	db TRAIT_SPEED_AFTER_CRIT
	db TRAIT_SP_ATTACK_AFTER_CRIT
	db TRAIT_SP_DEFENSE_AFTER_CRIT
	db TRAIT_DEFENSE_ICE_FIRE_HIT
	db TRAIT_SPEED_BUG_DARK_HIT
	db -1

TraitOnEnter:
	ld a, TRAIT_SWAP_DEFENSE_BUFFS
	call CheckSpecificTrait
	jp c, SwapDefenseBuffs

	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	ld hl, .TraitsThatBoostBasedOnPartyType
	call CheckTrait
	ret nc

	ld a, [wBuffer3]
	ld d, a
	call CheckTraitCondition.check_party_for_type
	call CheckTraitCount
	inc a
	ld c, a
.loop
	dec c
	ret z
	push bc
	ld a, c
	and 1
	jr z, .sp_def
	ld hl, BattleCommand_DefenseUp
	jr .raised_stat
.sp_def
	ld hl, BattleCommand_SpecialDefenseUp
.raised_stat
	call TraitUseBattleCommandSimple
	; ld hl, BattleCommand_StatUpMessage
	; call TraitUseBattleCommandSimple

	; ld hl, BattleCommand_StatUpFailText
	; call TraitUseBattleCommandSimple
	pop bc
	jr .loop

.TraitsThatBoostBasedOnPartyType:
	db TRAIT_PARTY_NORMAL_BOOST_DEFENSE
	db TRAIT_PARTY_FIGHTING_BOOST_DEFENSE
	db TRAIT_PARTY_FLYING_BOOST_DEFENSE
	db TRAIT_PARTY_POISON_BOOST_DEFENSE
	db TRAIT_PARTY_GROUND_BOOST_DEFENSE
	db TRAIT_PARTY_ROCK_BOOST_DEFENSE
	db TRAIT_PARTY_BUG_BOOST_DEFENSE
	db TRAIT_PARTY_FIRE_BOOST_DEFENSE
	db TRAIT_PARTY_WATER_BOOST_DEFENSE
	db TRAIT_PARTY_GRASS_BOOST_DEFENSE
	db TRAIT_PARTY_ELECTRIC_BOOST_DEFENSE
	db TRAIT_PARTY_PSYCHIC_BOOST_DEFENSE
	db TRAIT_PARTY_ICE_BOOST_DEFENSE
	db TRAIT_PARTY_DARK_BOOST_DEFENSE
	db -1

.TypeList:
	db NORMAL
	db FIGHTING
	db FLYING
	db POISON
	db GROUND
	db ROCK
	db BUG
	db FIRE
	db WATER
	db GRASS
	db ELECTRIC
	db PSYCHIC
	db ICE
	db DARK

SwapDefenseBuffs:
	ld hl, wEnemyDefLevel
	ld de, wEnemySDefLevel
	call GetTraitUser
	jr c, .got_opp_def
	ld hl, wPlayerDefLevel
	ld de, wPlayerSDefLevel
.got_opp_def
	ld a, [hl]
	ld b, a
	ld a, [de]
	ld [hl], a
	ld a, b
	ld [de], a
	ret

TraitRaiseStat:
	ld a, $FF
	ld [wBuffer3], a
	ld a, TRAIT_ALL_STATS_AFTER_7_TURNS
	call CheckSpecificTrait
	jr c, .all_stats
	ld a, TRAIT_RANDOM_STAT_AFTER_5_TURNS
	call CheckSpecificTrait
	jr c, .random_stat
	ld a, TRAIT_EVASION_WHEN_CONFUSED
	call CheckSpecificTrait
	jr c, .evasion
	ld a, TRAIT_RANDOM_STAT_WHEN_FLINCHED
	call CheckSpecificTrait
	jr c, .random_stat
	ld a, TRAIT_EVASION_ON_SPEED_DIFF
	call CheckSpecificTrait
	jr c, .evasion
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
.end2
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
.no_raise
	pop af
	ret
.also_raise_acc
	ld b, ACCURACY
	jr .end
.evasion
	push af
	ld b, EVASION
	jr .end
.random_stat
	push af
	call ResetActivated
	ld b, 7
	jr .end
.all_stats
	push af
	ld b, 8
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
	dw BattleCommand_AllStatsUp

TraitsThatRaiseAttack:
	db TRAIT_BOOST_ATK_ACC_NOT_ATTACKING
	db TRAIT_ATTACK_BELOW_THIRD
	db TRAIT_ATTACK_STATUSED
	db TRAIT_ATTACK_AFTER_CRIT
	db TRAIT_ATK_ON_ATK_DIFF
	db -1

TraitsThatRaiseDefense:
	db TRAIT_BOOST_DEF_ACC_NOT_ATTACKING ; 6
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
	db TRAIT_SP_ATTACK_BELOW_THIRD
	db TRAIT_SP_ATTACK_STATUSED
	db TRAIT_SP_ATTACK_AFTER_CRIT
	db -1

TraitsThatRaiseSpDefense:
	db TRAIT_SP_DEFENSE_BELOW_THIRD
	db TRAIT_SP_DEFENSE_STATUSED
	db TRAIT_SP_DEFENSE_AFTER_CRIT
	db -1

TraitsThatRaiseAccuracy:
	db TRAIT_RAIN_ACCURACY
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

TraitLowerStatAfterDamage:
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	ld hl, TraitsThatLowerStats
	call CheckTrait
	jr nc, .check_opp

	cp 3
	ret nc

	call BattleRandom
	cp 85 percent + 1
	ret c

	ld a, [wBuffer3]
	ld hl, StatusCommands
	call TraitUseBattleCommand
.end
	ld hl, BattleCommand_StatDownMessage
	call TraitUseBattleCommandSimple

	ld hl, BattleCommand_StatDownFailText
	jp TraitUseBattleCommandSimple

.check_opp
	ld a, BATTLE_VARS_TRAIT_OPP
	ld [wBuffer1], a
	ld a, TRAIT_SUPER_EFFECTIVE_LOWER_ACC
	call CheckSpecificTrait
	ret nc

	ld a, [wTypeModifier]
	and $7f
	cp 20 ; check if its over 10 (normal) or 5 (not effective)
	ret nz

	call CheckTraitActivatedSimple
	ret c

	call ActivateTrait
	call Switch_turn
	ld hl, BattleCommand_AccuracyDown
	call TraitUseBattleCommandSimple
	ld hl, BattleCommand_StatDownMessage
	call TraitUseBattleCommandSimple
	ld hl, BattleCommand_StatDownFailText
	jp TraitUseBattleCommandSimpleSwitchTurn

TraitLowerStat:	
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	ld hl, TraitsThatLowerStats + 3
	call CheckTrait
	ret nc

	add 3
	ld hl, StatusCommands
	call TraitUseBattleCommand
	
	ld hl, BattleCommand_StatDownMessage
	call TraitUseBattleCommandSimple

	ld hl, BattleCommand_StatDownFailText
	jp TraitUseBattleCommandSimple

StatusCommands:
	dw BattleCommand_SpecialAttackDown
	dw BattleCommand_SpecialAttackDown
	dw BattleCommand_SpecialAttackDown
	dw BattleCommand_AttackDown
	dw BattleCommand_RandomStatDown

TraitsThatLowerStats:
	db TRAIT_LOWER_SP_ATTACK_FIRE
	db TRAIT_LOWER_SP_ATTACK_WATER
	db TRAIT_LOWER_SP_ATTACK_ELECTRIC
	db TRAIT_LOWER_ATTACK_TURN_ZERO
	db TRAIT_LOWER_RANDOM_TURN_ZERO
	db -1

TraitPassStatusWithAttack:
	ld a, TRAIT_PASS_STATUS_WITH_PHYSICAL
	call CheckSpecificTrait
	ret nc

	call Get_move_category
	and a
	ret nz

	call BattleRandom
	cp 50 percent
	ret c

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld d, h
	ld e, l
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
; fallthrough
PassStatus:
; stop if opp already has a status
	ld a, [de]
	and a
	ret nz

	ld a, [hl] ; user's status
	ld [de], a
	ld hl, BattleText_TraitPassedStatus
	jp StdBattleTextBox

TraitAfterMove:
	ld a, TRAIT_COPY_SPD_BUFFS
	call CheckSpecificTrait
	ret nc

	call GetMoveStructEffectOpp
	cp EFFECT_SPEED_UP
	jr z, .raise
	cp EFFECT_SPEED_UP_2
	ret nz
.raise
	call Switch_turn
	ld hl, BattleCommand_SpeedUp
	call TraitUseBattleCommandSimple

	ld hl, BattleCommand_StatUpMessage
	call TraitUseBattleCommandSimple

	ld hl, BattleCommand_StatUpFailText
	jp TraitUseBattleCommandSimpleSwitchTurn

TraitRaiseStatOnStatDown:
	ld a, [wFailedMessage]
	and a
	ret nz

	ld hl, .TraitsThatRaiseStatOnStatDown
	call CheckTrait
	ret nc

	call BattleRandom
	cp 25 percent
	ret nc
	
	call ResetActivated
	call Switch_turn
	ld a, [wBuffer3]
	ld b, a
	inc a
	ld [wBuffer3], a
	jp TraitRaiseStat.end2

.TraitsThatRaiseStatOnStatDown:
	db TRAIT_RAISE_ATTACK_STAT_LOWERED
	db TRAIT_RAISE_DEFENSE_STAT_LOWERED
	db TRAIT_RAISE_SPEED_STAT_LOWERED
	db TRAIT_RAISE_SP_ATTACK_STAT_LOWERED
	db TRAIT_RAISE_SP_DEFENSE_STAT_LOWERED
	db -1

TraitPreventStatDown:
	xor a
	ld [wBuffer2], a
	ld hl, .TraitsThatPreventStatDown
	call CheckTrait
	ret nc

	cp 6
	jr nz, .check_stat
	
	call BattleRandom
	cp 20 percent
	jr c, .prevent
	jr .dont_prevent

.check_stat
	ld a, [wLoweredStat]
	ld b, a
	ld a, [wBuffer3]
	cp b
	jr nz, .dont_prevent
.prevent
	ld a, 1
	ld [wBuffer2], a
	ret
.dont_prevent
	xor a
	ld [wBuffer2], a
	call ResetActivated ; reset so a message always appears
	ret

.TraitsThatPreventStatDown:
	db TRAIT_PREVENT_ATTACK_DOWN
	db TRAIT_PREVENT_DEFENSE_DOWN
	db TRAIT_PREVENT_SPEED_DOWN
	db TRAIT_PREVENT_SP_ATTACK_DOWN
	db TRAIT_PREVENT_SP_DEFENSE_DOWN
	db TRAIT_PREVENT_ACCURACY_DOWN
	db TRAIT_PREVENT_ALL_DOWN
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
	jp TraitUseBattleCommandSimpleSwitchTurn

.odd
	ld hl, BattleCommand_SpecialAttackUp
	call TraitUseBattleCommandSimple
	ld hl, BattleCommand_StatUpMessage
	call TraitUseBattleCommandSimple

	call CheckTraitActivatedSimple
	jr nc, .already_activated
	call Switch_turn
	ld hl, BattleCommand_AttackDown
	jp TraitUseBattleCommandSimpleSwitchTurn
.already_activated
	jp ActivateTrait

TraitBoostCritical:
	ld hl, .TraitsThatBoostCritical
	call CheckTrait
	jr nc, .not_met
	ld a, 1
	ld [wBuffer2], a
	ret
.not_met
	xor a
	ld [wBuffer2], a
	ret

.TraitsThatBoostCritical:
	db TRAIT_CRIT_BELOW_THIRD
	db TRAIT_CRITICAL_AFTER_CRIT
	db TRAIT_OPP_SAME_TYPE_CRIT_BOOST
	db TRAIT_CRITICAL_NOT_STAB
	db -1

TraitLowerCritical:
	ld a, TRAIT_REDUCE_CRIT_MORE
	call CheckSpecificTrait
	jr nc, .not_met
	ld a, 2
	ld [wBuffer2], a
	ret
.not_met
	xor a
	ld [wBuffer2], a
	ret

TraitBoostAccuracy:
	ld hl, TraitsThatBoostAccuracy
	call CheckTrait
	ret nc

	and a
	jr nz, .max ; perfect acc for trait 1

	ld a, BATTLE_VARS_TURNS_TAKEN
 	call GetBattleVar
	and a
	ld a, [wBuffer2]
	ld b, a
	jr z, .high_boost
	srl a
.high_boost
	srl a
	add b
	jr nc, .end
.max
	ld a, $FF
.end
	ld [wBuffer2], a
	ret

TraitsThatBoostAccuracy:
	db TRAIT_BOOST_ACCURACY_TURN_ZERO
	db TRAIT_PERFECT_ACCURACY ; 1
	db -1

TraitReduceAccuracy:
	ld hl, TraitsThatReduceAccuracy
	call CheckTrait
	ret nc
	ld a, [wBuffer2]
	cp 75 percent + 1 ; lower than 75%
	jr c, .lower_acc
	cp 85 percent + 1 ; between 75% and 85%
	jr c, .low_acc
	sub 5 percent ; above 85% lowers by 5%
	jr nc, .end
	jr .min
.low_acc	
	sub 7 percent ; between 75% and 85% lowers by 7%
	jr nc, .end
	jr .min
.lower_acc
	sub 12 percent ; under 75% lowers by 12%
	jr nc, .end
.min ; c is set, min is 0
	xor a
.end
	ld [wBuffer2], a
	ret

TraitsThatReduceAccuracy:
	db TRAIT_REDUCE_NORMAL_ACC
	db -1

TraitReduceSelfRecoil:
	ld hl, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonMaxHP
.got_hp
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
	jr nc, .not_met
.min
	inc c

.not_met
	srl b
	rr c
	srl b
	rr c
	ld a, b
	or c
	jr nz, .min_damage
	inc c
.min_damage
	ld a, [hli]
	ld [wBuffer2], a
	ld a, [hl]
	ld [wBuffer1], a
	dec hl
	dec hl
	ld a, [hl]
	ld [wBuffer3], a
	sub c
	ld [hld], a
	ld [wBuffer5], a
	ld a, [hl]
	ld [wBuffer4], a
	sbc b
	ld [hl], a
	ld [wBuffer6], a
	jr nc, .end
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, wBuffer5
	ld [hli], a
	ld [hl], a
.end
	ret

TraitContact:
	ld a, BATTLE_VARS_MOVE_TYPE
 	call GetBattleVar
	and CONTACT
	ret z

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar

	ld hl, .TraitsThatDealDamageOnContact
	call CheckTrait
	jr nc, .not_prickly

	and a
	jr z, .rock

	ld b, FLYING
	farcall CheckIfTargetIsNthType
	ret z
	ld b, GROUND
	farcall CheckIfTargetIsNthType
	ret z
	jp DoOneSixteenthDamage
.rock
	ld b, WATER
	farcall CheckIfTargetIsNthType
	ret z
	ld b, ROCK
	farcall CheckIfTargetIsNthType
	ret z
	jp DoOneSixteenthDamage

.not_prickly
	ld b, 12 percent
	call Chance
	ret nc

	ld a, TRAIT_HOT_COALS
	call CheckSpecificTrait
	jr nc, .not_hot_coals

	ld a, SPIKES
	ld [wBuffer2], a
	ld a, 7
	ld [wBuffer3], a
	jr .finish
.not_hot_coals
	ld hl, .TraitsThatRequireContact
	call CheckTrait
	ret nc
.finish
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
	dw BattleCommand_ParalyseOrSleep
	dw DoExactMove

.TraitsThatRequireContact:
	db TRAIT_CONTACT_BRN
	db TRAIT_CONTACT_PRZ
	db TRAIT_CONTACT_PSN
	db TRAIT_CONTACT_FLINCH
	db TRAIT_CONTACT_CONFUSED
	db TRAIT_CONTACT_IN_LOVE
	db TRAIT_CONTACT_SPORE
	db -1

.TraitsThatDealDamageOnContact:
	db TRAIT_CONTACT_DAMAGE_ROCK
	db TRAIT_CONTACT_DAMAGE_GROUND
	db -1

; TraitHail:
; ; check if either side has hail
; 	ld a, BATTLE_VARS_TRAIT
; 	ld [wBuffer1], a
; 	ld a, TRAIT_HAIL
; 	call CheckSpecificTrait
; 	jr c, .hail

; 	ld a, BATTLE_VARS_TRAIT_OPP
; 	ld [wBuffer1], a
; 	ld a, TRAIT_HAIL
; 	call CheckSpecificTrait
; 	ret nc

; .hail
; 	ld b, ICE
; 	farcall CheckIfTargetIsNthType
; 	jr nz, .not_hail_foe
; 	call DoOneSixteenthDamage
	
; .not_hail_foe
; 	call Switch_turn
; 	ld b, ICE
; 	farcall CheckIfTargetIsNthType
; 	jr nz, .not_hail_switch_turn
; 	call DoOneSixteenthDamage

; .not_hail
; 	jp Switch_turn

TraitCull:
	ld a, TRAIT_CULL_OPP_LOW_HP
	call CheckSpecificTrait
	ret nc

	call BattleRandom
	and %1
	jr z, .heal
; kill
	call Switch_turn
	ld hl, GetMaxHP
	ld a, BANK(GetMaxHP)
	rst FarCall
	ld hl, SubtractHPFromTarget
	ld a, BANK(GetMaxHP)
	rst FarCall
	ret
.heal
	ld hl, GetSixteenthMaxHP
	call CallHealAmount
	jp ResetActivated

TraitReplaceStatus:
	ld a, TRAIT_STATUS_TO_SLP
	call CheckSpecificTrait
	ret nc

	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	ld a, [hl]
	and SLP
	ret nz
	xor a
	ld [hl], a
	inc a
	ld [wBuffer3], a
	call Switch_turn
	ld hl, BattleCommand_SleepSimple
	call TraitUseBattleCommandSimple
	jp Switch_turn

TraitSturdyNormal:
	ld a, [wCriticalHit]
	cp 2
	ret z
; fallthrough
TraitSturdy:
	ld a, [wAttackMissed]
	and a
	ret nz

	ld a, BATTLE_VARS_TRAIT_OPP
	ld [wBuffer1], a
	ld a, TRAIT_STURDY
	call CheckSpecificTrait
	ret nc
	
.got_move
	call GetTraitUser
	jr c, .player

	ld de, wEnemyMonHP
	ld hl, wEnemyMonMaxHP
	push hl
	ld c, 2
	call CompareBytes
	jr z, .ohko
	pop hl
	ret
.player
	ld de, wBattleMonHP
	ld hl, wBattleMonMaxHP
	push hl
	ld c, 2
	call CompareBytes
	jr z, .ohko
	pop hl
	ret

.ohko
; check if damage is equal or higher than max health
	pop hl
	ld de, wCurDamage
	call CompareBytes
	ret c
	ret z

; set damage to current HP - 1
	ld c, 20
	call DelayFrames
	ld hl, BattleCommand_FalseSwipe
	call TraitUseBattleCommandSimple
	
	call ActivateTrait
	call ResetActivated
	
	xor a
	ld [wBuffer2], a
	ret
	
TraitPostHitBattleCommand:
	ld hl, .TraitsThatTriggerBattleEffects
	call CheckTrait
	ret nc

	ld hl, .StatusChances
	ld b, 0
	ld c, a
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld b, a
.chance
; double chance for moves under 60 power
	ld a, BATTLE_VARS_MOVE_POWER
 	call GetBattleVar
	cp 60
	jr nc, .got_power
	ld a, [hl]
	ld b, a

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
	dw BattleCommand_ParalyzeOrPoisonTarget
	dw BattleCommand_FreezeOrSlowTarget
	dw BattleCommand_PoisonTarget

.StatusChances:
	db 8 percent, 12 percent
	db 16 percent, 25 percent
	db 16 percent, 25 percent
	db 10 percent, 10 percent
	db 15 percent, 20 percent
	db 100 percent, 100 percent

.TraitsThatTriggerBattleEffects:
	db TRAIT_FLYING_FRZ
	db TRAIT_FLYING_PRZ
	db TRAIT_FLYING_BRN
	db TRAIT_PRZ_PSN_WITH_GRASS
	db TRAIT_FRZ_SPD_WITH_WATER
	db TRAIT_PSN_DRAIN ; 5
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
	ret nc
	call IncreaseTraitCount
	call SetUserTurn
	ld hl, GetEighthMaxHP
	jp CallHealAmount

.TraitsThatTriggerOnRainStart:
	db TRAIT_REGEN_ON_RAIN
	db -1

TraitSunshineStarts:
	ld hl, .TraitsThatTriggerOnSunshineStart
	call CheckTrait
	ret nc
	call IncreaseTraitCount
	call SetUserTurn
	ld hl, GetEighthMaxHP
	jp CallHealAmount

.TraitsThatTriggerOnSunshineStart:
	db TRAIT_REGEN_ON_SUNSHINE
	db -1

TraitSandstormStarts:
	ld hl, .TraitsThatTriggerOnSandstormStart
	call CheckTrait
	ret nc
	call IncreaseTraitCount
	call SetUserTurn
	ld hl, GetEighthMaxHP
	jp CallHealAmount

.TraitsThatTriggerOnSandstormStart:
	db TRAIT_REGEN_ON_SANDSTORM
	db -1

TraitPassStatus:
	ld a, TRAIT_PASS_STATUS
	call CheckSpecificTrait
	ret nc

	call BattleRandom
	cp 75 percent
	ret c

	ldh a, [hBattleTurn]
	and a
	jr z, .player

	farcall CheckAnyOtherAlivePartyMons ; check player party in enemy's turn
	ret z
	jr .not_last_mon
.player 
	farcall CheckAnyOtherAliveEnemyMons ; check enemy party in player's turn
	ret z
	
.not_last_mon
	ld de, wOTPartyCount
	ld hl, wCurOTMon
	ldh a, [hBattleTurn]
	and a
	jr z, .got_count
	ld de, wPartyCount
	ld hl, wCurBattleMon
.got_count
	ld a, [de]
.loop
	call RandomRange
	cp [hl]
	jr z, .loop
	ld b, a

	ldh a, [hBattleTurn]
	and a
	ld hl, wOTPartyMon1Status
	ld a, b
	jr z, .got_party
	ld hl, wPartyMon1Status
	ld a, b
.got_party
	call GetPartyLocation
	ld d, h
	ld e, l
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	jp PassStatus

TraitHealStatus:
	ld hl, .TraitsThatHealStatus
	call CheckTrait
	ret nc

	and a
	jr nz, .only_status ; traits 1 and up only heal status

	call ResetActivated
	call BattleRandom
	and 1
	jr z, .heal_hp
.only_status
	ld d, $FE
	call CheckTraitCondition.check_user_status
	ret nc
	jp HealAllStatuses
.heal_hp
	call Switch_turn
	ld hl, GetEighthMaxHP
	jp CallHealAmount

.TraitsThatHealStatus:
	db TRAIT_HEAL_HP_AND_STATUS ; 0
	db TRAIT_HEAL_STATUS ; 1
	db TRAIT_RAIN_NO_STATUS
	db TRAIT_SUNSHINE_NO_STATUS
	db TRAIT_SANDSTORM_NO_STATUS
	db -1

HealAllStatuses:
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	xor a
	ld [hl], a

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	and [hl]
	res SUBSTATUS_TOXIC, [hl]
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	and [hl]
	res SUBSTATUS_NIGHTMARE, [hl]
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_CONFUSED, [hl]

	ld hl, CalcEnemyStats
	ld de, CalcPlayerStats
	call GetTraitUserAddr

.got_pointer
	ld a, BANK(CalcPlayerStats)
	rst FarCall
	ret

TraitReducePower:
	ld a, [wCriticalHit]
	cp 1
	jr nz, .not_crit
	ld a, TRAIT_REDUCE_CRIT_DAMAGE
	call CheckSpecificTrait
	jp c, ReduceDamage25
.not_crit
	ld a, BATTLE_VARS_MOVE_TYPE
 	call GetBattleVarAddr
	and TYPE_MASK
	ld d, a
	ld e, $FF ; reset e so no type equals it

	ld a, [wBuffer1]
	call GetBattleVar
	cp TRAIT_REDUCE_POISON_UP_DEFENSE
	jr z, .skip_trigger1
	
	cp TRAIT_REDUCE_WATER_UP_DEFENSE
	jr z, .skip_trigger2

	cp TRAIT_REDUCE_GRASS_UP_ATTACK
	jr z, .skip_trigger3

	ld a, TRAIT_REDUCE_DAMAGE_TURN_ZERO
	call CheckSpecificTrait
	jp c, ReduceDamage50

	ld a, TRAIT_REDUCE_WATER_FIRE_HIT
	call CheckSpecificTrait
	jp c, ReduceDamage50

	ld a, BATTLE_VARS_TURNS_TAKEN
 	call GetBattleVar
	cp 1
	jr c, .not_balloon
	ld a, TRAIT_RESIST_GROUND_LATER
	call CheckSpecificTrait
	jp c, ReduceDamage25

.not_balloon
	ld hl, .TraitsThatReduceDamageLess
	call CheckTrait
	jp c, ReduceDamage10

	ld hl, .TraitsThatReduceDamage
	call CheckTrait
	jp c, ReduceDamage15

	ld hl, .TraitsThatReduceDamageMore
	call CheckTrait
	ret nc

	call GetHealthPercentage
	ld a, d
	cp 50
	ret nc
	jp ReduceDamage30

.skip_trigger1
	ld c, POISON
	call CheckTraitCondition.check_move_type
	jp c, ReduceDamage10
	ret
.skip_trigger2
	ld c, WATER
	call CheckTraitCondition.check_move_type
	jp c, ReduceDamage10
	ret
.skip_trigger3
	ld c, GRASS
	call CheckTraitCondition.check_move_type
	jp c, ReduceDamage10
	ret

.TraitsThatReduceDamage:
	db TRAIT_REDUCE_NORMAL
	db TRAIT_ATTACK_AFTER_CRIT
	db TRAIT_DEFENSE_AFTER_CRIT
	db TRAIT_SPEED_AFTER_CRIT
	db TRAIT_SP_ATTACK_AFTER_CRIT
	db TRAIT_SP_DEFENSE_AFTER_CRIT
	db TRAIT_REDUCE_CRIT_MORE
	db TRAIT_CRITICAL_AFTER_CRIT
	db -1

.TraitsThatReduceDamageMore: ; under 50% hp
	db TRAIT_REDUCE_NORMAL_MORE
	db TRAIT_REDUCE_FIGHTING_MORE
	db TRAIT_REDUCE_FLYING_MORE
	db TRAIT_REDUCE_POISON_MORE
	db TRAIT_REDUCE_GROUND_MORE
	db TRAIT_REDUCE_ROCK_MORE
	db TRAIT_REDUCE_STEEL_MORE
	db TRAIT_REDUCE_BUG_MORE
	db TRAIT_REDUCE_FIRE_MORE
	db TRAIT_REDUCE_WATER_MORE
	db TRAIT_REDUCE_GRASS_MORE
	db TRAIT_REDUCE_ELECTRIC_MORE
	db TRAIT_REDUCE_PSYCHIC_MORE
	db TRAIT_REDUCE_ICE_MORE
	db TRAIT_REDUCE_DARK_MORE
	db -1

.TraitsThatReduceDamageLess: ; 10%
	db TRAIT_REDUCE_PSN_AND_POISON
	db TRAIT_REDUCE_BRN_AND_FIRE
	db TRAIT_REDUCE_PRZ_AND_ELECTRIC
	db TRAIT_REDUCE_FLINCH_AND_ROCK
	db TRAIT_REDUCE_SLP_AND_DARK
	db TRAIT_REDUCE_PSN_AND_BUG
	db TRAIT_REDUCE_FRZ_AND_ICE
	db TRAIT_REDUCE_CONFUSE_AND_PSYCHIC
	db TRAIT_REDUCE_WATER_UP_DEFENSE
	db TRAIT_REDUCE_POISON_UP_ATTACK
	db TRAIT_REDUCE_GRASS_UP_ATTACK
	db -1

PowerBoostingTraits:
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	call TraitBoostPower

	call TraitBoostDamagePerTurn

	call TraitBoostDamagePerTurnSlow

	call TraitReduceDamagePerTurn ; damage dealt

	call TraitResistDamagePerTurn ; damage taken

	call TraitDamageBasedOnStats

	call TraitDamageBasedOnHP

	ld a, BATTLE_VARS_TRAIT_OPP
	ld [wBuffer1], a
	jp TraitReducePower

; PRINTV TRAIT_REDUCE_SUPER_EFFECTIVE_MORE

TraitReduceVeryEffective:
	ld a, [wTypeModifier]
	and $7f
	cp 20 ; check if its over 10 (normal) or 5 (not effective)
	ret nz
	ld hl, .TraitsThatReduceSuperEffectiveDamageMore
	call CheckTrait
	jr nc, .next
	call GetHealthPercentage
	ld a, d
	cp 50
	ret nc
	jp ReduceDamage30
.next
	ld hl, .TraitsThatReduceSuperEffectiveDamage
	call CheckTrait
	ret nc
	jp ReduceDamage15

.TraitsThatReduceSuperEffectiveDamage:
	db TRAIT_REDUCE_SUPER_EFFECTIVE
	db -1

.TraitsThatReduceSuperEffectiveDamageMore:
	db TRAIT_REDUCE_SUPER_EFFECTIVE_MORE
	db -1

TraitBoostNotEffective:
	ld a, [wTypeModifier]
	and $7f
	cp $5 ; check if its over 10 (normal) or 5 (not effective)
	ret nz
	ld a, TRAIT_BOOST_NOT_EFFECTIVE
	call CheckSpecificTrait
	jp c, BoostDamage20

TraitBoostPower:
	ld a, [wCriticalHit]
	cp 1
	jr nz, .not_crit
	ld a, TRAIT_BOOST_CRIT_DAMAGE
	call CheckSpecificTrait
	jp c, BoostDamage25
.not_crit
	ld a, TRAIT_BOOST_DAMAGE_WITH_EFFECT
	call CheckSpecificTrait
	jp c, BoostDamage25
	ld a, TRAIT_BOOST_RECOIL
	call CheckSpecificTrait
	jp c, BoostDamage20
	ld a, TRAIT_BOOST_MOVE_SECOND
	call CheckSpecificTrait
	jp c, .move_second
	ld a, TRAIT_BOOST_WEAK_MOVES
	call CheckSpecificTrait
	jp c, BoostDamage50
	ld a, TRAIT_BOOST_POWER_BRN_SELF
	call CheckSpecificTrait
	jp c, BoostDamage50BurnSelf
	ld a, TRAIT_BOOST_POWER_RAISED_DEF
	call CheckSpecificTrait
	jp c, BoostDamageBasedOnFoesDefUp

	ld a, [wBattleWeather]
	and a
	jp z, .no_weather
	ld a, TRAIT_BOOST_FLYING_DURING_WEATHER
	call CheckSpecificTrait
	jr nc, .no_weather
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	cp 60
	jp nc, BoostDamage20
	jp BoostDamage50
.move_second
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp VITAL_THROW
	jp z, BoostDamage25
	jp BoostDamage15
.no_weather
	ld hl, .TraitsThatBoostTypeStatused
	call CheckTrait
	jr c, .boost_with_status
	ld hl, .TraitsThatBoostDamage
	call CheckTrait
	jp c, BoostDamage20
	ld c, 5
.loop
	ld hl, .JumpTableTraitsBoostMoveClass
	ld a, c
	dec a
	push bc
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	call CheckSpecificTrait
	jr c, .met
	pop bc
	dec c
	ret z
	jr .loop
.met
	pop bc
	ld a, c
	dec a
	ld hl, JumptableMoveClass
	call GetToJumptable
	ld a, [hl]
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld de, 1
	call IsInArray
	ret nc
	call CheckTraitCount
	and a
	jr nz, .skip_spd_down
	call IncreaseTraitCount	
	call Switch_turn
	ld hl, BattleCommand_SpeedDown
	call TraitUseBattleCommandSimple
	
	ld hl, BattleCommand_StatDownMessage
	call TraitUseBattleCommandSimple

	ld hl, BattleCommand_StatDownFailText
	call TraitUseBattleCommandSimpleSwitchTurn
.skip_spd_down
	jp BoostDamage15
.boost_with_status
	ld d, $FE
	call CheckTraitCondition.check_user_status
	jp c, BoostDamage20
	ret
.boost_activated_count
	call CheckTraitCount
	cp 6
	jr c, .max
	ld a, 6 ; the max is 6
.max
	ld b, a
	ld a, 10
	add b
.boost
	ld [hMultiplier], a
	call Multiply ; multiply damage value that is stored
	ld b, 4
	ld a, 10
	ldh [hDivisor], a
	jp Divide ; divide damage value that is stored

.TraitsThatBoostTypeStatused:
	db TRAIT_BOOST_NORMAL_STATUSED
	db TRAIT_BOOST_FIGHTING_STATUSED
	db TRAIT_BOOST_FLYING_STATUSED
	db TRAIT_BOOST_POISON_STATUSED
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

.JumpTableTraitsBoostMoveClass:
	db TRAIT_BOOST_PUNCHING
	db TRAIT_BOOST_BITING
	db TRAIT_BOOST_CUTTING
	db TRAIT_BOOST_BEAM
	db TRAIT_BOOST_PERFURATE

JumptableMoveClass:
	dw PunchingMoves
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
	db FELL_STINGER
	db HORN_ATTACK
	db -1

TraitBoostNonStab: ; after damage calc, once stab is checked
	ld hl, .TraitsThatBoostNonStab
	call CheckTrait
	ret nc

	and a
	jp z, BoostDamage20
	dec a
	ld b, WATER
	ld c, ICE
	jr z, .types
	dec a
	ld b, GRASS
	ld c, BUG
	jr z, .types
	dec a
	ld b, FIRE
	ld c, PSYCHIC
.types
	ld a, BATTLE_VARS_TYPE1_OPP
	call GetBattleVar
	cp b
	jr z, .boost_25
	cp c
	jr z, .boost_25
	ld a, BATTLE_VARS_TYPE2_OPP
	call GetBattleVar
	cp b
	jr z, .boost_25
	cp c
	ret nz

.boost_25
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	cp 60
	jp nc, BoostDamage25
	jp BoostDamage50

.TraitsThatBoostNonStab:
	db TRAIT_BOOST_NOT_STAB
	db TRAIT_BOOST_NOT_STAB_WATER_ICE
	db TRAIT_BOOST_NOT_STAB_GRASS_BUG
	db TRAIT_BOOST_NOT_STAB_FIRE_PSYCHIC
	db -1

TraitReduceNonStab: ; after damage calc, once stab is checked
	ld a, TRAIT_REDUCE_NOT_STAB
	call CheckSpecificTrait
	ret nc
	jp ReduceDamage15

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
	ret z
	push bc
	call GetToJumptable
	call CheckTrait
	pop bc
	ld a, c
	jr nc, .loop

	call GetStatDifference
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
	jp ApplyDamageMod
.max
	ld a, $FF
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
	db -1

TraitsThatBoostDamageBasedOnSpDefense:
	db TRAIT_BOOST_ROCK_SP_DEFENSE
	db -1

GetStatDifference: ; takes stat in `a` and returns difference in `a`
	ld hl, wBattleMonStats
	ld de, wEnemyMonStats
	call GetTraitUser
	jr c, .got_stats
	ld hl, wEnemyMonStats
	ld de, wBattleMonStats
.got_stats
	ld b, 0
; puts user stat in hl
	add hl, bc
	add hl, bc
	push hl
	ld h, d
	ld l, e
; puts opp stat in de
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
	ret
.max
	ld a, $FF
	ret

TraitDamageBasedOnHP:
	ld hl, TraitsThatBoostMoveByHP
	call CheckTrait
	ret nc
	call GetHealthPercentage
	ld a, d
	cp 45
	ret nc ; if hp% is over 45%
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
	jp ApplyDamageMod

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

TraitWhenDrained:
	ld a, TRAIT_PSN_DRAIN
	call CheckSpecificTrait
	ret nc

	call Switch_turn
	ld hl, BattleCommand_PoisonTargetSimple
	jp TraitUseBattleCommandSimpleSwitchTurn

TraitBoostEffectChance:
	ld hl, .TraitsThatBoostEffectChance
	call CheckTrait
	ret nc
	ld a, [wBuffer2]
	add 12 ; 5%
	ld b, a
	jr c, .max ; max value if this would go over 255
	ld a, [wBuffer3]
	cp 5
	jr c, .end ; indexes 0 to 4
	ld a, b
	add 12 ; 5% more
	ld b, a
	jr c, .max ; max value if this would go over 255
.end
	ld a, b
	ld [wBuffer2], a
.max
	ld b, $FF
	jr .end

.TraitsThatBoostEffectChance:
	db TRAIT_BOOST_EFFECT_BRN ; 0
	db TRAIT_BOOST_EFFECT_PSN ; 1
	db TRAIT_BOOST_EFFECT_PRZ ; 2
	db TRAIT_BOOST_EFFECT_FLINCH ; 3
	db TRAIT_BOOST_EFFECT_CONFUSED ; 4
	db TRAIT_BOOST_EFFECT_NO_DAMAGE ; 5
	db TRAIT_BOOST_EFFECT_WITH_DAMAGE ; 6
	db -1

TraitReduceEffectChance:
	ld hl, .TraitsThatReduceEffectChance
	call CheckTrait
	ret nc
	ld a, [wBuffer2]
	rrca
	ld b, a ; save 1/2
	rrca
	add b ; add 1/2 and 1/4
	ld [wBuffer2], a
	ret

.TraitsThatReduceEffectChance:
	db TRAIT_REDUCE_EFFECT_NO_DAMAGE ; 1
	db TRAIT_REDUCE_EFFECT_WITH_DAMAGE ; 2
	db TRAIT_REDUCE_PSN_AND_POISON ; 3
	db TRAIT_REDUCE_BRN_AND_FIRE ; 4
	db TRAIT_REDUCE_PRZ_AND_ELECTRIC ; 5
	db TRAIT_REDUCE_FLINCH_AND_ROCK ; 6
	db TRAIT_REDUCE_SLP_AND_DARK ; 7
	db TRAIT_REDUCE_PSN_AND_BUG ; 8
	db -1

TraitNegateEffectChance:
	ld hl, .TraitsThatNegateEffectChance
	call CheckTrait
	jr c, .got_trait

	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	ld a, TRAIT_BOOST_DAMAGE_WITH_EFFECT
	call CheckSpecificTrait
	ret nc

.got_trait
	xor a
	ld [wBuffer2], a
	ret

.TraitsThatNegateEffectChance:
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
	ret nc

	and a
	jr z, .count

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
	ret nc
	inc a
	ld [wBuffer2], a
	ret

TraitsThatDealWithMultiHit:
	db TRAIT_BOOST_MULTI_HIT_COUNT ; 0
	db TRAIT_BOOST_MULTI_HIT_DAMAGE ; 1
	db -1

TraitPP:
	ld hl, TraitsThatRecoverPP
	call CheckTrait
	ret nc
	ld a, [wBuffer2]
	cp 0
	jr nz, .without_chance
	call BattleRandom
	cp 10 percent
	ret nc
.without_chance
	jp EffectTraitForceRecoverPP

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
	jp TraitFaintMon

.player_turn
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
TraitFaintMon:
	ld hl, TraitsThatTriggerOnFaintMon
	call CheckTrait
	jr nc, .not_1

	call Switch_turn
	ld a, [wBuffer3]
	and a
	jr z, .do_damage
	ld hl, .StatusCommands
	call TraitUseBattleCommand
	call Switch_turn
.not_1
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	ld hl, TraitsThatTriggerOnFaintOppMon
	call CheckTrait
	ret nc

	and a
	jr z, .heal_hp_faint
	dec a
	jr z, .heal_pp_faint
	dec a
	ld hl, .StatusCommands2
	call TraitUseBattleCommand
	ld hl, BattleCommand_StatUpMessage
	call TraitUseBattleCommandSimple
	ld hl, BattleCommand_StatUpFailText
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

.do_damage
	ld de, SELFDESTRUCT
	farcall FarPlayBattleAnimation
	call Switch_turn
	call ActivateTrait
	ld hl, GetQuarterMaxHP
	ld a, BANK(GetMaxHP)
	rst FarCall
	ld hl, SubtractHPFromTarget
	ld a, BANK(GetMaxHP)
	rst FarCall
	jp Switch_turn

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
	db TRAIT_DAMAGE_FAINT ; 0
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
	ret z
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
	ret

TraitRegenHP:
	ld hl, .TraitsThatRegenerate
	call CheckTrait
	ret nc
	
	cp 2
	jr nc, .heal_hp_sixteenth
	ld hl, GetEighthMaxHP
	jr .complete_heal
.heal_hp_sixteenth
	cp 3
	call nc, ReduceTraitCount
	ld hl, GetSixteenthMaxHP
.complete_heal
	jp CallHealAmount

.TraitsThatRegenerate:
	db TRAIT_REGEN_LOW_HP ; 0
	db TRAIT_REGEN_STATUSED ; 1
	db TRAIT_REGEN_FIRST_TURNS ; 2
	db TRAIT_HEAL_AFTER_BERRY ; 3
	db TRAIT_HEAL_HP_AFTER_WATER_MOVE ; 4
	db -1

TraitBoostBurnPoisonDamage: ; modifies `bc`
	push bc
	ld a, BATTLE_VARS_TRAIT_OPP
	call GetBattleVar
	cp TRAIT_BOOST_BRN_OPP_ITEM
	pop bc
	ret nz

	ld hl, wPartyMon1Item
	ld de, wOTPartyMon1Item
	call GetTraitUserAddr
	ld a, [hl]
	cp NO_ITEM
	ret z
; increase bc by 50%
	ld l, b
	ld h, c
	call HalveBC
	add hl, bc
	ld b, h
	ld c, l
	ret

TraitCausedBurn:
	ld a, TRAIT_RANDOM_STAT_BRN
	call CheckSpecificTrait
	ret nc

	ld hl, BattleCommand_RandomStatUp
	call TraitUseBattleCommandSimple
	ld hl, BattleCommand_StatUpMessage
	call TraitUseBattleCommandSimple
	ld hl, BattleCommand_StatUpFailText
	jp TraitUseBattleCommandSimple

TraitChangeDamageType:
	; ld hl, .TraitsThatChangeDamageType
	; call CheckTrait
	; ret nc

	; ld a, BATTLE_VARS_MOVE_TYPE
	; call GetBattleVarAddr
	; ld a, [hl]
	; and %11000000
	; ld b, a
	; ld a, [hl]
	; and TYPE_MASK
	; ld a, FIRE
	; add b
	; ld [hl], a
	ret

.TraitsThatChangeDamageType:
	; db TRAIT_NORMAL_TO_FIRE_TURN_ZERO
	db -1

TraitCloneBerry:
	ld a, [wBuffer3]
	ld l, a
	ld a, [wBuffer4]
	ld h, a
	push hl

	ld b, 50 percent
	call Chance
	jr c, .end

	ld a, [wBuffer2]
	cp NO_ITEM
	jr z, .end

	ld hl, BerryList
	ld de, 1
	call IsInArray
	jr nc, .end

	call Switch_turn
	ld a, TRAIT_CLONE_BERRY
	call CheckSpecificTrait
	jr nc, .end

	pop hl
	ld a, [wBuffer2]
	ld [hl], a

	ld hl, wBattleMonItem
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wEnemyMonItem
.go
	ld a, [wBuffer2]
	ld [hl], a

	jp RefreshBattleHuds
	
.end
	pop hl
	ld [hl], NO_ITEM
	ret

TraitChangeItem:
	ld hl, wPartyMon1Item
	ld de, wOTPartyMon1Item
	call GetTraitUserAddr
	push hl

	ld b, 5 percent ; lower than 5% per turn
	call Chance
	jr c, .end

	ld a, TRAIT_UPGRADE_BERRY
	call CheckSpecificTrait
	jr c, .upgrade_berry

	ld a, TRAIT_FIND_BERRY
	call CheckSpecificTrait
	jr nc, .end

	ld hl, BerryList
	call Random
.loopberry
	sub [hl]
	jr c, .okberry
	inc hl
	inc hl
	jr .loopberry
.okberry
	inc hl
	ld a, [hl]
	ld b, a
	pop hl
	ld a, [hl]
	cp NO_ITEM
	jr z, .replace_item
	ret
.upgrade_berry
	ld b, 50 percent ; cuts previous chance in half
	call Chance
	jr nc, .end
	pop hl
	ld b, GOLD_BERRY
	ld a, [hl]
	cp BERRY
	ret nz
.replace_item
	ld a, b
	ld [hl], a
	ret
.end
	pop hl
	ret

BerryList:
	db 128, BERRY
	db 16, PSNCUREBERRY
	db 16, PRZCUREBERRY
	db 16, BURNT_BERRY
	db 16, ICE_BERRY
	db 16, BITTER_BERRY
	db 16, MINT_BERRY
	db 16, MIRACLEBERRY
	db 16, GOLD_BERRY

TraitBoostBerryHeal:
	ld a, TRAIT_BOOST_BERRY
	call CheckSpecificTrait
	jr c, .boost_heal

	ld a, TRAIT_HEAL_AFTER_BERRY
	call CheckSpecificTrait
	ret nc

	call IncreaseTraitCount
	jp IncreaseTraitCount

.boost_heal
	ld a, [wBuffer2]
	add a
	ld [wBuffer2], a
	ret

BoostDamageBasedOnFoesDefUp:
	ld hl, wEnemyDefLevel
	call GetTraitUser
	jr c, .got_opp_def
	ld hl, wPlayerDefLevel
.got_opp_def
	ld a, [hl]
	sub 7
	ret c
	ret z
	ld hl, .boost
	dec a
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	jp ApplyDamageMod

.boost
	db $BA ; 10%
	db $65 ; 20%
	db $DA ; 30%
	db $75 ; 40%
	db $32 ; 50%
	db $74 ; 75% ; bonus!

BoostDamage50:
	ld a, $32 ; ~1.5
	jp ApplyDamageMod

BoostDamage50BurnSelf:
	call BoostDamage50
	call Switch_turn
	ld hl, BattleCommand_BurnTargetSimple
	jp TraitUseBattleCommandSimpleSwitchTurn

BoostDamage25:
	ld a, $54 ; ~1.25
	jp ApplyDamageMod

BoostDamage20:
	ld a, $65 ; ~1.20
	jp ApplyDamageMod

BoostDamage15:
	ld a, $76 ; ~1.16
	jp ApplyDamageMod

ReduceDamage50:
	ld a, $12 ; ~0.5 ; 50% reduction
	jp ApplyDamageMod

ReduceDamage30:
	ld a, $57 ; ~0.71 ; 29% reduction
	jp ApplyDamageMod

ReduceDamage25:
	ld a, $68 ; ~0.75 ; 25% reduction
	jp ApplyDamageMod

ReduceDamage15:
	ld a, $67 ; ~0.86 ; 14% reduction
	jp ApplyDamageMod

ReduceDamage10:
	ld a, $9A ; =0.9 ; 10% reduction
	jp ApplyDamageMod

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

CallHealAmount: ; takes `GetEighthMaxHP` or others in `hl`
	xor a
	ld [wBuffer3], a
	ld [wBuffer5], a
	ld a, BANK(GetMaxHP)
	rst FarCall
	ld a, c
	ld [wBuffer6], a
	jp EffectTraitForceRecoverHP
	
DoOneSixteenthDamage:
	ld hl, GetSixteenthMaxHP
	ld a, BANK(GetMaxHP)
	rst FarCall
	ld hl, SubtractHPFromTarget
	ld a, BANK(GetMaxHP)
	rst FarCall
	ret

EffectTraitForceRecoverHP:
	call Switch_turn ; RestoreHP restores opponent's hp
	ld hl, RestoreHP
	ld a, BANK("Battle Core")
	rst FarCall
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

TraitUseBattleCommandSimpleSwitchTurn:
	ld a, BANK("Effect Commands")
	rst FarCall
;fallthrough
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
	ld hl, wBattleMonHP
	ld de, wBattleMonMaxHP
	call GetTraitUser
	jr c, .got_stats
	ld hl, wEnemyMonHP
	ld de, wEnemyMonMaxHP
.got_stats
GetHealthPercentageWithAddr:
	push bc
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
	ret ; enemy's turn & checking enemy's trait
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
	cp BATTLE_VARS_TRAIT_OPP
	jr nz, .end
	scf
	ret ; enemy's turn opp's trait (user's)
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

ReduceTraitCount:
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
	cp 0
	jr z, .min1
	dec a
.min1
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
	cp 0
	jr z, .min2
	dec a
.min2
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
	ldh a, [hBattleTurn]
	and a
	jr nz, .okturn1
	call Switch_turn
	ld hl, BattleText_TraitActivatedEnemy
	call StdBattleTextBox
	call Switch_turn
	jr .end1
.okturn1
	ld hl, BattleText_TraitActivatedEnemy
	call StdBattleTextBox
.end1
	ld hl, wTraitActivated
	set 4, [hl] ; enemy trait
	ld a, [hl]
	ret
.player_user
	ldh a, [hBattleTurn]
	and a
	jr z, .okturn
	call Switch_turn
	ld hl, BattleText_TraitActivatedPlayer
	call StdBattleTextBox
	call Switch_turn
	jr .end
.okturn
	ld hl, BattleText_TraitActivatedPlayer
	call StdBattleTextBox
.end
	ld hl, wTraitActivated
	set 0, [hl] ; player trait
	ld a, [hl]
	ret

; Resets the wTraitActivated bit for the current trait user	
ResetActivated:
	call GetTraitUser
	ld hl, wTraitActivated
	jr c, .player_user
	ld a, [hl]
	and %00001111
	ld [hl], a
	; res 4, [hl] ; enemy trait
	ret
.player_user
	ld a, [hl]
	and %11110000
	ld [hl], a
	; res 0, [hl] ; player trait
	ret

OneShotTraits:
; List of traits that can only go off once while the pokemon is out
	db TRAIT_SWAP_DEFENSE_BUFFS
	db TRAIT_EVASION_ON_SPEED_DIFF
	db TRAIT_ATK_ON_ATK_DIFF
	db TRAIT_RAISE_ATTACK_STAT_LOWERED
	db TRAIT_RAISE_DEFENSE_STAT_LOWERED
	db TRAIT_RAISE_SPEED_STAT_LOWERED
	db TRAIT_RAISE_SP_ATTACK_STAT_LOWERED
	db TRAIT_RAISE_SP_DEFENSE_STAT_LOWERED
	db TRAIT_ATTACK_OPP_FAINT
	db TRAIT_SP_ATTACK_OPP_FAINT
	db TRAIT_RAIN_SPEED
	db TRAIT_RAIN_ACCURACY
	db TRAIT_RAIN_EVASION
	db TRAIT_RAIN_NO_STATUS
	db TRAIT_SUNSHINE_SPEED
	db TRAIT_SUNSHINE_EVASION
	db TRAIT_SUNSHINE_NO_STATUS	
	db TRAIT_SANDSTORM_SPEED
	db TRAIT_SANDSTORM_EVASION
	db TRAIT_SANDSTORM_NO_STATUS
	db TRAIT_FIND_BERRY
	db TRAIT_UPGRADE_BERRY
	db TRAIT_CLONE_BERRY
	db TRAIT_HEAL_HP_AND_STATUS
	db TRAIT_HEAL_STATUS
	db TRAIT_REGEN_ON_RAIN
	db TRAIT_REGEN_ON_SUNSHINE
	db TRAIT_REGEN_ON_SANDSTORM
	db TRAIT_BOOST_ATK_ACC_NOT_ATTACKING
	db TRAIT_BOOST_DEF_ACC_NOT_ATTACKING
	db TRAIT_BOOST_SPD_ACC_NOT_ATTACKING
	db TRAIT_BOOST_SPATK_ACC_NOT_ATTACKING
	db TRAIT_REDUCE_DAMAGE_TURN_ZERO
	db TRAIT_LOWER_ATTACK_TURN_ZERO
	db TRAIT_LOWER_RANDOM_TURN_ZERO
	db TRAIT_CULL_OPP_LOW_HP
	db TRAIT_REGEN_LOW_HP
	db TRAIT_ATTACK_BELOW_THIRD
	db TRAIT_DEFENSE_BELOW_THIRD
	db TRAIT_SPEED_BELOW_THIRD
	db TRAIT_SP_ATTACK_BELOW_THIRD
	db TRAIT_SP_DEFENSE_BELOW_THIRD
	db TRAIT_ACCURACY_BELOW_THIRD
	db TRAIT_EVASION_BELOW_THIRD 
	db TRAIT_CRIT_BELOW_THIRD
	db TRAIT_PASS_STATUS
	db TRAIT_ATTACK_STATUSED
	db TRAIT_DEFENSE_STATUSED
	db TRAIT_SPEED_STATUSED
	db TRAIT_SP_ATTACK_STATUSED
	db TRAIT_SP_DEFENSE_STATUSED
	db TRAIT_ACCURACY_STATUSED
	db TRAIT_EVASION_STATUSED
	db TRAIT_OPP_SAME_TYPE_CRIT_BOOST
	db TRAIT_PARTY_NORMAL_BOOST_DEFENSE
	db TRAIT_PARTY_FIGHTING_BOOST_DEFENSE
	db TRAIT_PARTY_FLYING_BOOST_DEFENSE
	db TRAIT_PARTY_POISON_BOOST_DEFENSE
	db TRAIT_PARTY_GROUND_BOOST_DEFENSE
	db TRAIT_PARTY_ROCK_BOOST_DEFENSE
	db TRAIT_PARTY_BUG_BOOST_DEFENSE
	db TRAIT_PARTY_FIRE_BOOST_DEFENSE
	db TRAIT_PARTY_WATER_BOOST_DEFENSE
	db TRAIT_PARTY_GRASS_BOOST_DEFENSE
	db TRAIT_PARTY_ELECTRIC_BOOST_DEFENSE
	db TRAIT_PARTY_PSYCHIC_BOOST_DEFENSE
	db TRAIT_PARTY_ICE_BOOST_DEFENSE
	db TRAIT_PARTY_DARK_BOOST_DEFENSE
	db TRAIT_DEFENSE_ICE_FIRE_HIT
	db TRAIT_SPEED_BUG_DARK_HIT
	db TRAIT_REDUCE_WATER_FIRE_HIT
	db TRAIT_REDUCE_WATER_UP_DEFENSE
	db TRAIT_REDUCE_POISON_UP_ATTACK
	db TRAIT_REDUCE_GRASS_UP_ATTACK
	db TRAIT_EVASION_WHEN_CONFUSED
	db TRAIT_RANDOM_STAT_WHEN_FLINCHED
	db -1

PRINTT "Trait constants left: "
PRINTV $FF - TRAIT_COUNT
PRINTT "\n"
