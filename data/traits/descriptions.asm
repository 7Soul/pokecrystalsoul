TraitDescriptions::
; entries correspond to move ids (see constants/move_constants.asm)
	dw FlameBodyDescription   ; TRAIT_CONTACT_BRN
	dw PoisonPointDescription ; TRAIT_CONTACT_PSN
	dw StaticDescription   ; TRAIT_CONTACT_PRZ
	dw StunBodyDescription    ; TRAIT_CONTACT_FLINCH
	dw HighTempoDescription   ; TRAIT_CONTACT_CONFUSED
	dw CuteCharmDescription   ; TRAIT_CONTACT_IN_LOVE
	dw EffectSporeDescription ; TRAIT_CONTACT_SPORE
	dw IronBarbsDescription   ; TRAIT_CONTACT_DAMAGE
	dw HotCoalsDescription    ; TRAIT_HOT_COALS
	dw LightningFastDescription ; TRAIT_EVASION_ON_SPEED_DIFF
	dw UnleashPowerDescription ; TRAIT_ATK_ON_ATK_DIFF
	dw LifeDrainDescription   ; TRAIT_HEAL_HP_FAINT
	dw KeepGoingDescription   ; TRAIT_HEAL_PP_FAINT
	dw EruptionDescription    ; TRAIT_BURN_FAINT
	dw GasExplosionDescription; TRAIT_POISON_FAINT
	dw NorthStarDescription   ; TRAIT_FREEZE_FAINT
	dw DeathlyHexDescription  ; TRAIT_CURSE_FAINT
	dw MoxieDescription       ; TRAIT_ATTACK_OPP_FAINT
	dw GelidEmbraceDescription ; TRAIT_SP_ATTACK_OPP_FAINT
	dw UnknownEnergyDescription ; TRAIT_RANDOM_STAT_OPP_FAINT
	dw SturdyDescription      ; TRAIT_STURDY
	dw IronFistDescription    ; TRAIT_BOOST_PUNCHING
	dw IronJawsDescription    ; TRAIT_BOOST_BITING
	dw IronClawsDescription   ; TRAIT_BOOST_CUTTING
	dw FocusBeamDescription   ; TRAIT_BOOST_BEAM
	dw PowerDrillDescription  ; TRAIT_BOOST_PERFURATE
	dw RockHeadDescription    ; TRAIT_REDUCE_SELF_RECOIL
	dw SniperDescription      ; TRAIT_BOOST_CRIT_DAMAGE
	dw ShellArmorDescription ; TRAIT_REDUCE_CRIT_DAMAGE
	dw DrainSurgeDescription  ; TRAIT_BOOST_DRAIN
	dw SkillLinkDescription   ; TRAIT_BOOST_MULTI_HIT_COUNT
	dw ChainClipDescription   ; TRAIT_BOOST_MULTI_HIT_DAMAGE
	dw LimitBreakerDescription; TRAIT_BOOST_DAMAGE_PER_TURN
	dw GigaImpactDescription  ; TRAIT_REDUCE_DAMAGE_PER_TURN
	dw SlowStartDescription   ; TRAIT_BOOST_DAMAGE_PER_TURN_SLOW
	dw PendulumDescription    ; TRAIT_ATTACK_SPECIAL_ODD_EVEN
	dw HotPotatoDescription   ; TRAIT_BOOST_BRN_OPP_ITEM
	dw FireworksDescription   ; TRAIT_RANDOM_STAT_BRN
	dw PickupDescription      ; TRAIT_FIND_BERRY
	dw MagicTrickDescription  ; TRAIT_UPGRADE_BERRY
	dw NutritionDescription   ; TRAIT_BOOST_BERRY
	dw HarvestDescription     ; TRAIT_CLONE_BERRY
	dw TagSplashDescription   ; TRAIT_PARTY_WATER_BOOST_DEFENSE
	dw CottonGuardDescription ; TRAIT_PARTY_GRASS_BOOST_DEFENSE
	dw BugColonyDescription   ; TRAIT_PARTY_BUG_BOOST_DEFENSE
	dw SnowFortDescription    ; TRAIT_PARTY_ICE_BOOST_DEFENSE
	dw UpVoltageDescription   ; TRAIT_BATTLE_ELECTRIC_BOOST
	dw ShadowCloakDescription ; TRAIT_BATTLE_DARK_BOOST
	dw MagmaFlowDescription   ; TRAIT_BATTLE_FIRE_BOOST
	dw RainDishDescription    ; TRAIT_REGEN_ON_RAIN
	dw MonsoonDescription     ; TRAIT_RAIN_DURATION
	dw DrizzleDescription     ; TRAIT_RAIN_ON_ENTER
	dw VerdantBodyDescription ; TRAIT_REGEN_ON_SUNSHINE
	dw BlueSkyDescription     ; TRAIT_SUNSHINE_DURATION
	dw DroughtDescription     ; TRAIT_SUNSHINE_ON_ENTER
	dw RebuildDescription     ; TRAIT_REGEN_ON_SANDSTORM
	dw TempestDescription     ; TRAIT_SANDSTORM_DURATION
	dw DustDevilDescription   ; TRAIT_SANDSTORM_ON_ENTER
	dw HealingAromaDescription; TRAIT_HEAL_HP_AND_STATUS
	dw FierceFighterDescription ; TRAIT_RAISE_ATTACK_STAT_LOWERED
	dw ShellPolishDescription ; TRAIT_RAISE_DEFENSE_STAT_LOWERED
	dw ShadowRunDescription   ; TRAIT_RAISE_SPEED_STAT_LOWERED
	dw CompetitiveDescription ; TRAIT_RAISE_SP_ATTACK_STAT_LOWERED
	dw SlimeCoatDescription   ; TRAIT_RAISE_SP_DEFENSE_STAT_LOWERED
	dw ShedSkinDescription    ; TRAIT_HEAL_STATUS
	dw RecklessDescription    ; TRAIT_BOOST_RECOIL
	dw RainyBoon0Description  ; TRAIT_RAIN_ATTACK
	dw RainyBoon1Description  ; TRAIT_RAIN_DEFENSE
	dw RainyBoon2Description  ; TRAIT_RAIN_SPEED
	dw RainyBoon3Description  ; TRAIT_RAIN_SP_ATTACK
	dw RainyBoon4Description  ; TRAIT_RAIN_SP_DEFENSE
	dw RainyBoon5Description  ; TRAIT_RAIN_ACCURACY
	dw RainyBoon6Description  ; TRAIT_RAIN_EVASION
	dw HydrationDescription   ; TRAIT_RAIN_NO_STATUS
	dw SunnyBoon0Description  ; TRAIT_SUNSHINE_ATTACK
	dw SunnyBoon1Description  ; TRAIT_SUNSHINE_DEFENSE 
	dw SunnyBoon2Description  ; TRAIT_SUNSHINE_SPEED
	dw SunnyBoon3Description  ; TRAIT_SUNSHINE_SP_ATTACK
	dw SunnyBoon4Description  ; TRAIT_SUNSHINE_SP_DEFENSE
	dw SunnyBoon5Description  ; TRAIT_SUNSHINE_ACCURACY
	dw SunnyBoon6Description  ; TRAIT_SUNSHINE_EVASION
	dw LeafGuardDescription   ; TRAIT_SUNSHINE_NO_STATUS
	dw StormBoon0Description  ; TRAIT_SANDSTORM_ATTACK
	dw StormBoon1Description  ; TRAIT_SANDSTORM_DEFENSE
	dw StormBoon2Description  ; TRAIT_SANDSTORM_SPEED
	dw StormBoon3Description  ; TRAIT_SANDSTORM_SP_ATTACK
	dw StormBoon4Description  ; TRAIT_SANDSTORM_SP_DEFENS
	dw StormBoon5Description  ; TRAIT_SANDSTORM_ACCURACY
	dw StormBoon6Description  ; TRAIT_SANDSTORM_EVASION
	dw SandFilterDescription  ; TRAIT_SANDSTORM_NO_STATUS
	dw WaterVeilDescription   ; TRAIT_BRN_IMMUNE
	dw HeatUpDescription      ; TRAIT_BOOST_EFFECT_BRN
	dw AntivenomDescription   ; TRAIT_PSN_IMMUNE
	dw PureToxinDescription   ; TRAIT_BOOST_EFFECT_PSN
	dw LimberDescription      ; TRAIT_PRZ_IMMUNE
	dw ConduitDescription     ; TRAIT_BOOST_EFFECT_PRZ
	dw InnerFocusDescription  ; TRAIT_FLINCH_IMMUNE
	dw PresenceDescription    ; TRAIT_BOOST_EFFECT_FLINCH
	dw OwnTempoDescription    ; TRAIT_CONFUSED_IMMUNE
	dw MetronomeTDescription  ; TRAIT_BOOST_EFFECT_CONFUSE
	dw ObliviousDescription   ; TRAIT_IN_LOVE_IMMUNE
	dw InsomniaDescription    ; TRAIT_SLEEP_IMMUNE
	dw InnerFlameDescription  ; TRAIT_FRZ_IMMUNE
	dw HyperCutterDescription ; TRAIT_PREVENT_ATTACK_DOWN
	dw BigPecksDescription    ; TRAIT_PREVENT_DEFENSE_DOWN
	dw HyperCutter3Description ; TRAIT_PREVENT_SPEED_DOWN
	dw HyperCutter4Description ; TRAIT_PREVENT_SP_ATTACK_DOWN
	dw HyperCutter5Description ; TRAIT_PREVENT_SP_DEFENSE_DOWN
	dw KeenEyeDescription     ; TRAIT_PREVENT_ACCURACY_DOWN
	dw MagicBounceDescription ; TRAIT_PREVENT_ALL_DOWN
	dw WonderSkinDescription  ; TRAIT_REDUCE_EFFECT_NO_DAMAGE
	dw SereneGraceDescription ; TRAIT_BOOST_EFFECT_NO_DAMAGE
	dw SilverAuraDescription  ; TRAIT_REDUCE_PHYSICAL_TAKEN_TURNS
	dw GoldAuraDescription    ; TRAIT_REDUCE_SPECIAL_TAKEN_TURNS
	dw ShieldDustDescription  ; TRAIT_REDUCE_EFFECT_WITH_DAMAGE
	dw ViciousFormDescription ; TRAIT_BOOST_EFFECT_WITH_DAMAGE
	dw RiptideDescription     ; TRAIT_BOOST_NOT_STAB_WATER_ICE
	dw BladedWingsDescription ; TRAIT_BOOST_NOT_STAB_GRASS_BUG
	dw PismalityDescription   ; TRAIT_BOOST_NOT_STAB
	dw MasteryDescription     ; TRAIT_REDUCE_NOT_STAB
	dw GrandEntranceDescription ; TRAIT_REDUCE_DAMAGE_TURN_ZERO
	dw FreeShotDescription    ; TRAIT_GAIN_PP_TURN_ZERO
	dw IntimidateDescription  ; TRAIT_LOWER_ATTACK_TURN_ZERO
	dw StrangeSignalDescription ; TRAIT_LOWER_RANDOM_TURN_ZERO
	dw KeenFocusDescription   ; TRAIT_BOOST_ACCURACY_TURN_ZERO
	dw PreparationDescription ; TRAIT_BOOST_ATK_ACC_NOT_ATTACKING
	dw WallDescription        ; TRAIT_BOOST_DEF_ACC_NOT_ATTACKING
	dw StretchingDescription  ; TRAIT_BOOST_SPD_ACC_NOT_ATTACKING
	dw SetupDescription       ; TRAIT_BOOST_SPATK_ACC_NOT_ATTACKING
	dw PatienceDescription    ; TRAIT_ALL_STATS_AFTER_7_TURNS
	dw HeadacheDescription    ; TRAIT_RANDOM_STAT_AFTER_5_TURNS
	dw HealtySpiritDescription; TRAIT_REGEN_FIRST_TURNS
	dw SecretGiftDescription  ; TRAIT_CULL_OPP_LOW_HP
	dw BounceBackDescription  ; TRAIT_REGEN_LOW_HP
	dw PoiseDescription       ; TRAIT_ATTACK_BELOW_THIRD
	dw SolidifyDescription    ; TRAIT_DEFENSE_BELOW_THIRD
	dw ScamperDescription     ; TRAIT_SPEED_BELOW_THIRD
	dw BerserkDescription     ; TRAIT_SP_ATTACK_BELOW_THIRD
	dw GoldGuardDescription   ; TRAIT_SP_DEFENSE_BELOW_THIRD
	dw TakeAimDescription     ; TRAIT_ACCURACY_BELOW_THIRD
	dw DangerSenseDescription ; TRAIT_EVASION_BELOW_THIRD
	dw AllOutDescription      ; TRAIT_CRIT_BELOW_THIRD
	dw AngerDescription       ; TRAIT_ATTACK_AFTER_CRIT
	dw CurlDescription        ; TRAIT_DEFENSE_AFTER_CRIT
	dw ScatterDescription     ; TRAIT_SPEED_AFTER_CRIT
	dw LuckCurseDescription   ; TRAIT_REDUCE_CRIT_MORE
	dw SuperLuckDescription   ; TRAIT_CRITICAL_AFTER_CRIT
	dw GutsDescription        ; TRAIT_ATTACK_STATUSED
	dw MarvelScaleDescription ; TRAIT_DEFENSE_STATUSED
	dw QuickFeetDescription   ; TRAIT_SPEED_STATUSED
	dw DiamondLightDescription; TRAIT_SP_ATTACK_STATUSED
	dw WaterShellDescription  ; TRAIT_SP_DEFENSE_STATUSED
	dw RefineDescription      ; TRAIT_ACCURACY_STATUSED
	dw SmokeVeilDescription   ; TRAIT_EVASION_STATUSED
	dw PointPanicDescription  ; TRAIT_HEAL_PP_STATUSED
	dw DefragDescription      ; TRAIT_REGEN_STATUSED
	dw TagledFeetDescription  ; TRAIT_EVASION_WHEN_CONFUSED
	dw SteadfastDescription   ; TRAIT_RANDOM_STAT_WHEN_FLINCHED
	dw NemesisDescription     ; TRAIT_OPP_SAME_TYPE_DMG_BOOST
	dw PunchOutDescription    ; TRAIT_OPP_SAME_TYPE_CRIT_BOOST
	dw TechnicianDescription  ; TRAIT_BOOST_WEAK_MOVES
	dw PermafrostDescription  ; TRAIT_REDUCE_BRN_AND_FIRE
	dw GroundWireDescription  ; TRAIT_REDUCE_PRZ_AND_ELECTRIC
	dw SteelWingsDescription  ; TRAIT_REDUCE_FLINCH_AND_ROCK
	dw PerseveranceDescription; TRAIT_REDUCE_SLP_AND_PSYCHIC
	dw SurvivalDescription    ; TRAIT_REDUCE_PSN_AND_BUG
	dw IceSheddingDescription ; TRAIT_REDUCE_FRZ_AND_ICE
	dw MindBlockDescription   ; TRAIT_REDUCE_CONFUSE_AND_PSYCHIC
	dw ThickFatDescription    ; TRAIT_DEFENSE_ICE_FIRE_HIT
	dw RattledDescription     ; TRAIT_SPEED_BUG_DARK_HIT
	dw StoneSkinDescription   ; TRAIT_REDUCE_NORMAL
	dw StoneSkin2Description  ; TRAIT_REDUCE_NORMAL_MORE
	dw FadeDescription        ; TRAIT_REDUCE_NORMAL_ACC
	dw WildRageDescription    ; TRAIT_BOOST_NORMAL_STATUSED
	dw HitBreakerDescription  ; TRAIT_REDUCE_FIGHTING
	dw HitBreaker2Description ; TRAIT_REDUCE_FIGHTING_MORE
	dw FlailingRageDescription; TRAIT_BOOST_FIGHTING_STATUSED
	dw CarapaceDescription    ; TRAIT_REDUCE_FLYING
	dw Carapace2Description   ; TRAIT_REDUCE_FLYING_MORE
	dw FlightRushDescription  ; TRAIT_BOOST_FLYING_SPEED
	dw AirRageDescription     ; TRAIT_BOOST_FLYING_STATUSED
	dw IceLegendeDescription  ; TRAIT_FLYING_FRZ
	dw ThunderLegendDescription ; TRAIT_FLYING_PRZ
	dw FireLegendDescription  ; TRAIT_FLYING_BRN
	dw FlyingLegendDescription ; TRAIT_BOOST_FLYING_DURING_WEATHER
	dw ShockAbsorbDescription ; TRAIT_REDUCE_GROUND
	dw ShockAbsorb2Description; TRAIT_REDUCE_GROUND_MORE
	dw TremorRageDescription  ; TRAIT_BOOST_GROUND_STATUSED
	dw ShapeCastDescription   ; TRAIT_REDUCE_ROCK
	dw ShapeCast2Description  ; TRAIT_REDUCE_ROCK_MORE
	dw IronCoatDescription    ; TRAIT_BOOST_ROCK_DEFENSE
	dw GoldCoatDescription    ; TRAIT_BOOST_ROCK_SP_DEFENSE
	dw RollingRockRageDescription ; TRAIT_BOOST_ROCK_STATUSED
	dw FumeCoatDescription    ; TRAIT_REDUCE_BUG
	dw AshCoatDescription     ; TRAIT_REDUCE_BUG_MORE
	dw SwarmDescription       ; TRAIT_BOOST_BUG_HP
	dw BuzzingRageDescription ; TRAIT_BOOST_BUG_STATUSED
	dw HeatproofDescription   ; TRAIT_REDUCE_FIRE
	dw FireproofDescription   ; TRAIT_REDUCE_FIRE_MORE
	dw BlazeDescription       ; TRAIT_BOOST_FIRE_HP
	dw MoltenRageDescription  ; TRAIT_BOOST_FIRE_STATUSED
	dw WaterproofDescription  ; TRAIT_REDUCE_WATER
	dw Waterproof2Description ; TRAIT_REDUCE_WATER_MORE
	dw HardWaterDescription   ; TRAIT_BOOST_WATER_DEFENSE
	dw WaterSurgeDescription  ; TRAIT_BOOST_WATER_HP
	dw DeepSeaRageDescription ; TRAIT_BOOST_WATER_STATUSED
	dw HardeningSandDescription ; TRAIT_REDUCE_WATER_UP_DEFENSE
	dw IceWaterDescription    ; TRAIT_FRZ_SPD_WITH_WATER
	dw AridTouchDescription   ; TRAIT_REDUCE_GRASS
	dw AridShieldDescription  ; TRAIT_REDUCE_GRASS_MORE
	dw OvergrowDescription    ; TRAIT_BOOST_GRASS_HP
	dw ForestRageDescription  ; TRAIT_BOOST_GRASS_STATUSED
	dw SapSipperDescription   ; TRAIT_REDUCE_GRASS_UP_ATTACK
	dw PolenHazardDescription ; TRAIT_PRZ_PSN_WITH_GRASS
	dw IonFieldDescription    ; TRAIT_REDUCE_ELECTRIC
	dw IonField2Description   ; TRAIT_REDUCE_ELECTRIC_MORE
	dw ZapRushDescription     ; TRAIT_BOOST_ELECTRIC_SPEED
	dw ZapRageDescription     ; TRAIT_BOOST_ELECTRIC_STATUSED
	dw ForewarnDescription    ; TRAIT_REDUCE_PSYCHIC
	dw Forewarn2Description   ; TRAIT_REDUCE_PSYCHIC_MORE
	dw TwoSidedRageDescription; TRAIT_BOOST_PSYCHIC_STATUSED
	dw ThickCoatDescription   ; TRAIT_REDUCE_ICE
	dw HibernateDescription   ; TRAIT_REDUCE_ICE_MORE
	dw SouthWindDescription   ; TRAIT_BOOST_ICE_HP
	dw ArcticRageDescription  ; TRAIT_BOOST_ICE_STATUSED
	dw LightBarrierDescription ; TRAIT_REDUCE_DARK
	dw BrawlDescription       ; TRAIT_REDUCE_DARK_MORE
	dw TyrantRageDescription  ; TRAIT_BOOST_DARK_STATUSED
	dw AdaptiveFurDescription ; TRAIT_REDUCE_SUPER_EFFECTIVE
	dw PrismPlateDescription  ; TRAIT_REDUCE_SUPER_EFFECTIVE_MORE
    dw TraitFFDescription


FlameBodyDescription:
	db   "Contact may BURN"
	next "the attacker.@"

PoisonPointDescription:
	db   "Contact may POISON"
	next "the attacker.@"

StaticDescription:
	db   "Contact may PARA-"
	next "LIZE the attacker.@"

StunBodyDescription:
	db   "Contact may FLINCH"
	next "the attacker.@"

HighTempoDescription:
	db   "Contact may CONFU-"
	next "SE the attacker.@"

CuteCharmDescription:
	db   "Contact may INFATU"
	next "ATE the attacker.@"

EffectSporeDescription:
	db   "Contact may PRZ or"
	next "SLP the attacker.@"

IronBarbsDescription:
	db   "Foe takes damage"
	next "on contact.@"

HotCoalsDescription:
	db   "Contact may spread"
	next "hot coals around.@"

LightningFastDescription:
	db   "Ups EVA if SPD is"
	next "higher than foe's.@"

UnleashPowerDescription:
	db   "Ups ATK when it is"
	next "higher than foe's.@"

LifeDrainDescription:
	db   "Regain HP when a"
	next "foe faints.@"

KeepGoingDescription:
	db   "Regain PP when a"
	next "foe faints.@"

EruptionDescription:
	db   "BURNS the foe when"
	next "you faint.@"

GasExplosionDescription:
	db   "POISONS the foe"
	next "when you faint.@"

NorthStarDescription:
	db   "FREEZES the foe"
	next "when you faint.@"

DeathlyHexDescription:
	db   "CURSES the foe"
	next "when you faint.@"

MoxieDescription:
	db   "Raises ATK when"
	next "the foe faints.@"

GelidEmbraceDescription:
	db   "Raises SP.ATK when"
	next "the foe faints.@"

UnknownEnergyDescription:
	db   "Ups a ramdom stat"
	next "when a foe faints.@"

SturdyDescription:
	db   "Survive one-hit"
	next "KO.@"

IronFistDescription:
	db   "Powers Punching"
	next "moves.@"

IronJawsDescription:
	db   "Powers Biting"
	next "moves.@"

IronClawsDescription:
	db   "Powers Slashing"
	next "moves.@"

FocusBeamDescription:
	db   "Powers Beam"
	next "moves.@"

PowerDrillDescription:
	db   "Powers Perfurating"
	next "moves.@"

RockHeadDescription:
	db   "Halves damage taken"
	next "from recoil.@"

SniperDescription:
	db   "Raises the damage"
	next "of critical hits.@"

ShellArmorDescription:
	db   "Lowers damage from"
	next "critical hits.@"

DrainSurgeDescription:
	db   "Ups life drain"
	next "under half health.@"
	
SkillLinkDescription:
	db   "Ups frequency of"
	next "multi-hit moves.@"

ChainClipDescription:
	db   "Multi-hit strikes"
	next "twice, but harder.@"

LimitBreakerDescription:
	db   "Raises damage a"
	next "little every turn.@"

GigaImpactDescription:
	db   "Damage boost that"
	next "lowers over time.@"

SlowStartDescription:
	db   "Start weaker, but"
	next "gain damage later.@"

PendulumDescription:
	db   "Every other turn"
	next "ups SP.ATK or ATK.@"

HotPotatoDescription:
	db   "Ups BRN damage if"
	next "foe has an item.@"

FireworksDescription:
	db   "Ups a random stat"
	next "when causing BRN.@"

PickupDescription:
	db   "May find a berry"
	next "during a fight.@"

MagicTrickDescription:
	db   "May change BERRY"
	next "into GOLD BERRY.@"

NutritionDescription:
	db   "Berries heal more"
	next "in battle.@"

HarvestDescription:
	db   "May regrow a berry"
	next "after eating one.@"

TagSplashDescription:
	db   "Team's WATER type"
	next "raise DEF more.@"

CottonGuardDescription:
	db   "Team's GRASS type"
	next "raise DEF more.@"
	
BugColonyDescription:
	db   "Team's BUG type"
	next "raise DEF more.@"
	
SnowFortDescription:
	db   "Team's ICE type"
	next "raise DEF more.@"
	
UpVoltageDescription:
	db   "All ELECTRIC <PKMN>"
	next "give you power.@"
	
ShadowCloakDescription:
	db   "All DARK <PKMN>"
	next "give you power.@"
	
MagmaFlowDescription:
	db   "All FIRE <PKMN>"
	next "give you power.@"

RainDishDescription:
	db   "Heal HP when rain"
	next "starts.@"

MonsoonDescription:
	db   "Rain lasts one"
	next "extra turn.@"

DrizzleDescription:
	db   "Changes weather to"
	next "rainy (4 turns).@"

VerdantBodyDescription:
	db   "Heal HP when sun-"
	next "shine starts.@"

BlueSkyDescription:
	db   "Sunshine lasts one"
	next "extra turn.@"

DroughtDescription:
	db   "Changes weather to"
	next "sunny (4 turns).@"

RebuildDescription:
	db   "Heal HP when sand-"
	next "storm starts.@"

TempestDescription:
	db   "Sandstorm lasts"
	next "one extra turn.@"

DustDevilDescription:
	db   "Begin a sandstorm"
	next "(4 turns).@"

HealingAromaDescription:
	db   "May heal HP and"
	next "status each turn.@"

FierceFighterDescription:
	db   "May up ATK when a"
	next "stat is lowered.@"

ShellPolishDescription:
	db   "May up DEF when a"
	next "stat is lowered.@"

ShadowRunDescription:
	db   "May up SPD when a"
	next "stat is lowered.@"

CompetitiveDescription:
	db   "May up SP.ATK when"
	next "a stat is lowered.@"

SlimeCoatDescription:
	db   "May up SP.DEF when"
	next "a stat is lowered.@"

ShedSkinDescription:
	db   "May recover from a"
	next "status each turn.@"

RecklessDescription:
	db   "Powers moves with"
	next "recoil.@"

DeviantDescription:
	db   "Lowers damage from"
	next "moves with recoil.@"
	
RainyBoon0Description:
	db   "Raises ATK during"
	next "rain.@"

RainyBoon1Description:
	db   "Raises DEF during"
	next "rain.@"

RainyBoon2Description:
	db   "Raises SPD during"
	next "rain.@"

RainyBoon3Description:
	db   "Raises SP.ATK"
	next "during rain.@"

RainyBoon4Description:
	db   "Raises SP.DEF"
	next "during rain.@"

RainyBoon5Description:
	db   "Raises ACCURACY"
	next "during rain.@"

RainyBoon6Description:
	db   "Raises EVASION"
	next "during rain.@"

HydrationDescription:
	db   "Rain heals status"
	next "conditions.@"

SunnyBoon0Description:
	db   "Raises ATK when"
	next "it's sunny.@"

SunnyBoon1Description:
	db   "Raises DEF when"
	next "it's sunny.@"

SunnyBoon2Description:
	db   "Raises SPD when"
	next "it's sunny.@"

SunnyBoon3Description:
	db   "Raises SP.ATK when"
	next "it's sunny.@"

SunnyBoon4Description:
	db   "Raises SP.DEF when"
	next "it's sunny.@"

SunnyBoon5Description:
	db   "Raises ACCURACY"
	next "when it's sunny.@"

SunnyBoon6Description:
	db   "Raises EVASION"
	next "when it's sunny.@"

LeafGuardDescription:
	db   "Heals status cond-"
	next "itions when sunny.@"

StormBoon0Description:
	db   "Raises ATK in a"
	next "sandstorm.@"

StormBoon1Description:
	db   "Raises DEF in a"
	next "sandstorm.@"

StormBoon2Description:
	db   "Raises SPD in a"
	next "sandstorm.@"

StormBoon3Description:
	db   "Raises SP.ATK when"
	next "in a sandstorm.@"

StormBoon4Description:
	db   "Raises SP.DEF when"
	next "in a sandstorm.@"

StormBoon5Description:
	db   "Raises ACCURACY"
	next "in a sandstorm.@"

StormBoon6Description:
	db   "Raises EVASION"
	next "in a sandstorm.@"

SandFilterDescription:
	db   "Heals statuses"
	next "in a sandstorm.@"

WaterVeilDescription:
	db   "Immunity to being"
	next "BURNED.@"

HeatUpDescription:
	db   "Raises the chance"
	next "of BURNING.@"
   
AntivenomDescription:
	db   "Immunity to being"
	next "POISONED.@"

PureToxinDescription:
	db   "Raises the chance"
	next "of POISONING.@"

LimberDescription:
	db   "Immunity to being"
	next "PARALYZED.@"

ConduitDescription:
	db   "Raises the chance"
	next "of PARALYZING.@"

InnerFocusDescription:
	db   "Immunity to FLIN-"
	next "CHING.@"

PresenceDescription:
	db   "Raises the chance"
	next "of FLINCHING.@"

OwnTempoDescription:
	db   "Immunity to get-"
	next "ting CONFUSED.@"

MetronomeTDescription:
	db   "Raises the chance"
	next "of CONFUSING.@"

ObliviousDescription:
	db   "Immunity to get-"
	next "ting INFATUATED.@"

InsomniaDescription:
	db   "Immunity to fall-"
	next "ing ASLEEP.@"

InnerFlameDescription:
	db   "Immunity to be-"
	next "ing FROZEN.@"

HyperCutterDescription:
	db   "Prevents ATK from"
	next "being lowered.@"

BigPecksDescription:
	db   "Prevents DEF from"
	next "being lowered.@"

HyperCutter3Description:
	db   "Prevents SPD from"
	next "being lowered.@"

HyperCutter4Description:
	db   "Prevents SP.ATK"
	next "being lowered.@"

HyperCutter5Description:
	db   "Prevents SP.DEF"
	next "being lowered.@"

KeenEyeDescription:
	db   "Prevents ACC from"
	next "being lowered.@"

MagicBounceDescription:
	db   "May prevent a stat"
	next "being lowered.@"

WonderSkinDescription:
	db   "Lowers the chance"
	next "of STATUS moves.@"
	
SereneGraceDescription:
	db   "Raises the chance"
	next "of STATUS moves.@"
	
SilverAuraDescription:
	db   "Ups resist to PHY-"
	next "SICAL over time.@"
	
GoldAuraDescription:
	db   "Ups resist to SPE-"
	next "CIAL over time.@"

ShieldDustDescription:
	db   "Lowers the chance"
	next "of ADDED effects.@"
	
ViciousFormDescription:
	db   "Raises the chance"
	next "of ADDED effects.@"

RiptideDescription:
	db   "Powers Non-STAB vs"
	next "WATER and ICE.@"

BladedWingsDescription:
	db   "Powers Non-STAB vs"
	next "GRASS and BUG.@"

PismalityDescription:
	db   "Powers Non-STAB"
	next "moves.@"

MasteryDescription:
	db   "Lowers damage from"
	next "Non-STAB attacks.@"
	
GrandEntranceDescription:
	db   "First damage taken"
	next "is halved.@"
	
FreeShotDescription:
	db   "Don't use PP on"
	next "your first turn.@"
	
IntimidateDescription:
	db   "Lowers the foe's"
	next "ATTACK.@"
	
StrangeSignalDescription:
	db   "Lowers a foe's"
	next "random stat.@"
	
KeenFocusDescription:
	db   "Boosts move ACC on"
	next "your first turns.@"
	
PreparationDescription:
	db   "Ups ATK and ACC by"
	next "not doing damage.@"
	
WallDescription:
	db   "Ups DEF and ACC by"
	next "not doing damage.@"
	
StretchingDescription:
	db   "Ups SPD and ACC by"
	next "not doing damage.@"
	
SetupDescription:
	db   "Ups SP.ATK/ACC by"
	next "not doing damage.@"
	
PatienceDescription:
	db   "Raises all stats"
	next "after 7 turns.@"

HeadacheDescription:
	db   "Ups a random stat"
	next "every 5 turns.@"
	
HealtySpiritDescription:
	db   "Regain HP on your"
	next "first few turns.@"
	
SecretGiftDescription:
	db   "May finish the foe"
	next "off between turns.@"
	
BounceBackDescription:
	db   "Regain HP under"
	next "half health once.@"
	
PoiseDescription:
	db   "Raises ATK under"
	next "one third health.@"

SolidifyDescription:
	db   "Raises DEF under"
	next "one third health.@"
	
ScamperDescription:
	db   "Raises SPD under"
	next "one third health.@"
	
BerserkDescription:
	db   "Raises SP.ATK under"
	next "one third health.@"
	
GoldGuardDescription:
	db   "Raises SP.DEF under"
	next "one third health.@"
	
TakeAimDescription:
	db   "Raises ACC under"
	next "one third health.@"
	
DangerSenseDescription:
	db   "Raises EVASION un-"
	next "der one third hp.@"
	
AllOutDescription:
	db   "Raises CRITICAL"
	next "under 1/3 hp.@"
	
AngerDescription:
	db   "Resist CRITICAL"
	next "hits and ups ATK.@"
	
CurlDescription:
	db   "Resist CRITICAL"
	next "hits and ups DEF.@"
	
ScatterDescription:
	db   "Resist CRITICAL"
	next "hits and ups SPD.@"
	
LuckCurseDescription:
	db   "Lowers foe's CRIT"
	next "when hit by one.@"

SuperLuckDescription:
	db   "Ups CRITICAL when"
	next "hit by one.@"

GutsDescription:
	db   "Volatile status"
	next "raises ATTACK.@"

MarvelScaleDescription:
	db   "Volatile status"
	next "raises DEFENSE.@"

QuickFeetDescription:
	db   "Volatile status"
	next "raises SPEED.@"

DiamondLightDescription:
	db   "Volatile status"
	next "raises SP.ATK.@"

WaterShellDescription:
	db   "Volatile status"
	next "raises SP.DEF.@"

RefineDescription:
	db   "Volatile status"
	next "raises ACCURACY.@"

SmokeVeilDescription:
	db   "Volatile status"
	next "raises EVASION.@"

PointPanicDescription:
	db   "May recover PP un-"
	next "der any status.@"

DefragDescription:
	db   "Regain HP under"
	next "any status.@"

TagledFeetDescription:
	db   "Raises EVASION if"
	next "you get CONFUSED.@"

SteadfastDescription:
	db   "Ups a random stat"
	next "when you flinch.@"

NemesisDescription:
	db   "Ups damage if your"
	next "type equals foe's.@"

PunchOutDescription:
	db   "Ups CRIT if your"
	next "type equals foe's.@"

TechnicianDescription:
	db   "Raises damage of"
	next "weaker moves.@"

PermafrostDescription:
	db   "BRN and FIRE are"
	next "weakened.@"
	
GroundWireDescription:
	db   "PRZ and ELECTRIC"
	next "are weakened.@"
	
SteelWingsDescription:
	db   "FLINCH and ROCK"
	next "are weakened.@"

PerseveranceDescription:
	db   "SLP and DARK are"
	next "weakened.@"

SurvivalDescription:
	db   "PSN and BUG are"
	next "weakened.@"
	
IceSheddingDescription:
	db   "FRZ and ICE are"
	next "weakened.@"

MindBlockDescription:
	db   "CONFUSION and PSY-"
	next "CHIC are weakened.@"

ThickFatDescription:
	db   "Ups DEF when hit"
	next "by ICE or FIRE.@"

RattledDescription:
	db   "Ups DEF when hit"
	next "by BUG or DARK.@"

StoneSkinDescription:
	db   "Reduces NORMAL"
	next "damage taken.@"
	
StoneSkin2Description:
	db   "Resists NORMAL"
	next "under half HP.@"

FadeDescription:
	db   "Reduces NORMAL"
	next "damage accuracy.@"

WildRageDescription:
	db   "Boosts NORMAL un-"
	next "der any status.@"

HitBreakerDescription:
	db   "Reduces FIGHTING"
	next "damage taken.@"

HitBreaker2Description:
	db   "Resists FIGHTING"
	next "under half HP.@"

FlailingRageDescription:
	db   "Boosts FIGHTING"
	next "under any status.@"

CarapaceDescription:
	db   "Reduces FLYING"
	next "damage taken.@"

Carapace2Description:
	db   "Resists FLYING"
	next "under half HP.@"

FlightRushDescription:
	db   "SPEED disparity"
	next "boosts FLYING.@"

AirRageDescription:
	db   "Boosts FLYING un-"
	next "der any status.@"

IceLegendeDescription:
	db   "FLYING moves may"
	next "cause FRZ.@"

ThunderLegendDescription:
	db   "FLYING moves may"
	next "cause PRZ.@"

FireLegendDescription:
	db   "FLYING moves may"
	next "cause BRN.@"

FlyingLegendDescription:
	db   "Boosts FLYING du-"
	next "ring any weather.@"

ShockAbsorbDescription:
	db   "Reduces GROUND"
	next "damage taken.@"
	
ShockAbsorb2Description:
	db   "Resists GROUND"
	next "under half HP.@"
	
TremorRageDescription:
	db   "Boosts GROUND un-"
	next "der any status.@"

ShapeCastDescription:
	db   "Reduces ROCK dam-"
	next "age taken.@"
	
ShapeCast2Description:
	db   "Resists ROCK under"
	next "half HP.@"
	
IronCoatDescription:
	db   "DEFENSE disparity"
	next "boosts ROCK.@"
	
GoldCoatDescription:
	db   "SP.DEF disparity"
	next "boosts ROCK.@"
	
RollingRockRageDescription:
	db   "Boosts ROCK under"
	next "any status.@"

FumeCoatDescription:
	db   "Reduces BUG damage"
	next "taken.@"
	
AshCoatDescription:
	db   "Resists BUG under"
	next "half HP.@"
	
SwarmDescription:
	db   "Missing HEALTH"
	next "boosts BUG.@"
	
BuzzingRageDescription:
	db   "Boosts BUG under"
	next "any status.@"

HeatproofDescription:
	db   "Reduces FIRE dam-"
	next "age taken.@"
	
FireproofDescription:
	db   "Resists FIRE under"
	next "half HP.@"
	
BlazeDescription:
	db   "Missing HEALTH"
	next "boosts FIRE.@"
	
MoltenRageDescription:
	db   "Boosts FIRE under"
	next "any status.@"

WaterproofDescription:
	db   "Reduces WATER dam-"
	next "age taken.@"
	
Waterproof2Description:
	db   "Resists WATER"
	next "under half HP.@"
	
HardWaterDescription:
	db   "DEFENSE disparity"
	next "boosts WATER.@"
	
WaterSurgeDescription:
	db   "Missing HEALTH"
	next "boosts WATER.@"

DeepSeaRageDescription:
	db   "Boosts WATER un-"
	next "der any status.@"

HardeningSandDescription:
	db   "Resists WATER and"
	next "ups DEF when hit.@"

AridTouchDescription:
	db   "Reduces GRASS dam-"
	next "age taken.@"
	
AridShieldDescription:
	db   "Resists GRASS"
	next "under half HP.@"
	
OvergrowDescription:
	db   "Missing HEALTH"
	next "boosts GRASS.@"
	
ForestRageDescription:
	db   "Boosts GRASS un-"
	next "der any status.@"

SapSipperDescription:
	db   "Resists GRASS and"
	next "ups ATK when hit.@"

PolenHazardDescription:
	db   "May PSN or PRZ"
	next "with GRASS moves.@"

IceWaterDescription:
	db   "May FRZ/SPD down"
	next "with WATER moves.@"

IonFieldDescription:
	db   "Reduces ELECTRIC"
	next "damage taken.@"
		
IonField2Description:
	db   "Resists ELECTRIC"
	next "under half HP.@"
		
ZapRushDescription:
	db   "SPEED disparity"
	next "boosts ELECTRIC.@"
	
ZapRageDescription:
	db   "Boosts ELECTRIC"
	next "under any status.@"

ForewarnDescription:
	db   "Reduces PSYCHIC"
	next "damage taken.@"
	
Forewarn2Description:
	db   "Resists PSYCHIC"
	next "under half HP.@"
	
TwoSidedRageDescription:
	db   "Boosts PSYCHIC"
	next "under any status.@"

ThickCoatDescription:
	db   "Reduces ICE damage"
	next "taken.@"

HibernateDescription:
	db   "Resists ICE under"
	next "half HP.@"
	
SouthWindDescription:
	db   "Missing HEALTH"
	next "boosts ICE.@"
	
ArcticRageDescription:
	db   "Boosts ICE under"
	next "any status.@"

LightBarrierDescription:
	db   "Reduces DARK dam-"
	next "age taken.@"
	
BrawlDescription:
	db   "Resists DARK under"
	next "half HP.@"
	
TyrantRageDescription:
	db   "Boosts DARK under"
	next "any status.@"

AdaptiveFurDescription:
	db   "Take less SUPER-"
	next "EFFECTIVE damage@"
	
PrismPlateDescription:
	db   "Resist S.EFFECTIVE"
	next "damage at half HP.@"
	
TraitFFDescription:
	db "?@"
	