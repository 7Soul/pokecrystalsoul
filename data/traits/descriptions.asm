TraitDescriptions::
; entries correspond to move ids (see constants/move_constants.asm)
	dw FlameBodyDescription   ; TRAIT_CONTACT_BRN
	dw ShockBodyDescription   ; TRAIT_CONTACT_PSN
	dw ToxicBodyDescription   ; TRAIT_CONTACT_PRZ
	dw StunBodyDescription    ; TRAIT_CONTACT_FLINCH
	dw HighTempoDescription   ; TRAIT_CONTACT_CONFUSED
	dw CuteCharmDescription   ; TRAIT_CONTACT_IN_LOVE
	dw KeepGoingDescription   ; TRAIT_HEAL_PP_FAINT
	dw IronFistDescription    ; TRAIT_BOOST_PUNCHING
	dw WeaveDescription       ; TRAIT_REDUCE_PUNCHING
	dw VocalPowerDescription  ; TRAIT_BOOST_SOUND
	dw SoundproofDescription  ; TRAIT_REDUCE_SOUND
	dw IronJawsDescription    ; TRAIT_BOOST_BITING
	dw BonePlateDescription   ; TRAIT_REDUCE_BITING
	dw IronClawsDescription   ; TRAIT_BOOST_CUTTING
	dw ShellPolishDescription ; TRAIT_REDUCE_CUTTING
	dw FocusBeamDescription   ; TRAIT_BOOST_BEAM
	dw DispersalDescription   ; TRAIT_REDUCE_BEAM
	dw PowerDrillDescription  ; TRAIT_BOOST_PERFURATE
	dw SteelCoverDescription  ; TRAIT_REDUCE_PERFURATE
	dw RockHeadDescription    ; TRAIT_REDUCE_SELF_RECOIL
	dw BattleArmorDescription ; TRAIT_REDUCE_CRIT_DAMAGE
	dw DrainSurgeDescription  ; TRAIT_BOOST_DRAIN
	dw SkillLinkDescription   ; TRAIT_BOOST_MULTI_HIT_COUNT
	dw ChainClipDescription   ; TRAIT_BOOST_MULTI_HIT_DAMAGE
	dw MonsoonDescription     ; TRAIT_RAIN_DURATION
	dw DrizzleDescription     ; TRAIT_RAIN_ON_ENTER
	dw BlueSkyDescription     ; TRAIT_SUNSHINE_DURATION
	dw DroughtDescription     ; TRAIT_SUNSHINE_ON_ENTER
	dw TempestDescription     ; TRAIT_SANDSTORM_DURATION
	dw DustDevilDescription   ; TRAIT_SANDSTORM_ON_ENTER
	dw RecklessDescription    ; TRAIT_BOOST_RECOIL
	dw DeviantDescription     ; TRAIT_REDUCE_RECOIL
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
	dw BurnResistDescription  ; TRAIT_REDUCE_EFFECT_BRN
	dw HeatUpDescription      ; TRAIT_BOOST_EFFECT_BRN
	dw AntivenomDescription   ; TRAIT_PSN_IMMUNE
	dw VenomResistDescription ; TRAIT_REDUCE_EFFECT_PSN
	dw PureToxinDescription   ; TRAIT_BOOST_EFFECT_PSN
	dw TwitchDescription      ; TRAIT_PRZ_IMMUNE
	dw LimberDescription      ; TRAIT_REDUCE_EFFECT_PRZ
	dw ConduitDescription     ; TRAIT_BOOST_EFFECT_PRZ
	dw InnerFocusDescription  ; TRAIT_FLINCH_IMMUNE
	dw AttentionDescription   ; TRAIT_REDUCE_EFFECT_FLINCH
	dw PresenceDescription    ; TRAIT_BOOST_EFFECT_FLINCH
	dw OwnTempoDescription    ; TRAIT_CONFUSED_IMMUNE
	dw OblivionDescription    ; TRAIT_REDUCE_EFFECT_CONFUSED
	dw MetronomeTDescription  ; TRAIT_BOOST_EFFECT_CONFUSE
	dw ObliviousDescription   ; TRAIT_IN_LOVE_IMMUNE
	dw InsomniaDescription    ; TRAIT_SLEEP_IMMUNE
	dw AlertDescription       ; TRAIT_REDUCE_EFFECT_SLEEP
	dw InnerFlameDescription  ; TRAIT_FRZ_IMMUNE
	dw WonderSkinDescription  ; TRAIT_BOOST_EFFECT_NO_DAMAGE
	dw SereneGraceDescription ; TRAIT_BOOST_EFFECT_NO_DAMAGE
	dw ShieldDustDescription  ; TRAIT_REDUCE_EFFECT_WITH_DAMAGE
	dw ViciousFormDescription ; TRAIT_BOOST_EFFECT_WITH_DAMAGE
	dw PismalityDescription   ; TRAIT_BOOST_NOT_STAB
	dw MasteryDescription     ; TRAIT_REDUCE_NOT_STAB
	dw FreeShotDescription    ; TRAIT_GAIN_PP_TURN_ZERO
	dw KeenFocusDescription   ; TRAIT_BOOST_ACCURACY_TURN_ZERO
	dw BerserkDescription     ; TRAIT_ATTACK_BELOW_THIRD
	dw SolidifyDescription    ; TRAIT_DEFENSE_BELOW_THIRD
	dw ScamperDescription     ; TRAIT_SPEED_BELOW_THIRD
	dw PoiseDescription       ; TRAIT_SP_ATTACK_BELOW_THIRD
	dw GoldGuardDescription   ; TRAIT_SP_DEFENSE_BELOW_THIRD
	dw TakeAimDescription     ; TRAIT_ACCURACY_BELOW_THIRD
	dw DangerSenseDescription ; TRAIT_EVASION_BELOW_THIRD
	dw AllOutDescription      ; TRAIT_CRIT_BELOW_THIRD
	dw PermafrostDescription  ; TRAIT_REDUCE_BRN_AND_FIRE
	dw GroundWireDescription  ; TRAIT_REDUCE_PRZ_AND_ELECTRIC
	dw SteelWingsDescription  ; TRAIT_REDUCE_FLINCH_AND_ROCK
	dw PerseveranceDescription; TRAIT_REDUCE_SLP_AND_PSYCHIC
	dw SurvivalDescription    ; TRAIT_REDUCE_PSN_AND_BUG
	dw IceSheddingDescription ; TRAIT_REDUCE_FRZ_AND_ICE
	dw MindBlockDescription   ; TRAIT_REDUCE_CONFUSE_AND_PSYCHIC
	dw StoneSkinDescription   ; TRAIT_REDUCE_NORMAL
	dw StoneSkin2Description  ; TRAIT_REDUCE_NORMAL_MORE
	dw FadeDescription        ; TRAIT_REDUCE_NORMAL_ACC
	dw HitBreakerDescription  ; TRAIT_REDUCE_FIGHTING
	dw HitBreaker2Description ; TRAIT_REDUCE_FIGHTING_MORE
	dw CarapaceDescription    ; TRAIT_REDUCE_FLYING
	dw Carapace2Description   ; TRAIT_REDUCE_FLYING_MORE
	dw FlightRushDescription  ; TRAIT_BOOST_FLYING_SPEED
	dw ShockAbsorbDescription ; TRAIT_REDUCE_GROUND
	dw ShockAbsorb2Description; TRAIT_REDUCE_GROUND_MORE
	dw ShapeCastDescription   ; TRAIT_REDUCE_ROCK
	dw ShapeCast2Description  ; TRAIT_REDUCE_ROCK_MORE
	dw IronCoatDescription    ; TRAIT_BOOST_ROCK_DEFENSE
	dw GoldCoatDescription    ; TRAIT_BOOST_ROCK_SP_DEFENSE
	dw FumeCoatDescription    ; TRAIT_REDUCE_BUG
	dw FumeCoat2Description   ; TRAIT_REDUCE_BUG_MORE
	dw HeatproofDescription   ; TRAIT_REDUCE_FIRE
	dw Heatproof2Description  ; TRAIT_REDUCE_FIRE_MORE
	dw WaterproofDescription  ; TRAIT_REDUCE_WATER
	dw Waterproof2Description ; TRAIT_REDUCE_WATER_MORE
	dw HardWaterDescription   ; TRAIT_BOOST_WATER_DEFENSE
	dw WaterSurgeDescription  ; TRAIT_BOOST_WATER_HP
	dw AridTouchDescription   ; TRAIT_REDUCE_GRASS
	dw AridTouch2Description  ; TRAIT_REDUCE_GRASS_MORE
	dw IonFieldDescription    ; TRAIT_REDUCE_ELECTRIC
	dw IonField2Description   ; TRAIT_REDUCE_ELECTRIC_MORE
	dw ZapRushDescription     ; TRAIT_BOOST_ELECTRIC_SPEED
	dw ForewarnDescription    ; TRAIT_REDUCE_PSYCHIC
	dw Forewarn2Description   ; TRAIT_REDUCE_PSYCHIC_MORE
	dw ThickCoatDescription   ; TRAIT_REDUCE_ICE
	dw ThickCoat2Description  ; TRAIT_REDUCE_ICE_MORE
	dw ShadowBeingDescription ; TRAIT_REDUCE_DARK
	dw ShadowBeing2Description; TRAIT_REDUCE_DARK_MORE
	dw PrismArmorDescription  ; TRAIT_REDUCE_SUPER_EFFECTIVE
	dw PrismPlateDescription  ; TRAIT_REDUCE_SUPER_EFFECTIVE_MORE
    dw TraitFFDescription
	dw Trait00Description

TraitFFDescription:
Trait00Description:
	db "?@"

FlameBodyDescription:
	db   "May cause BRN on"
	next "contact.@"

ShockBodyDescription:
	db   "May cause PRZ on"
	next "contact.@"

ToxicBodyDescription:
	db   "May cause PSN on"
	next "contact.@"

StunBodyDescription:
	db   "May Flinch foe on"
	next "contact.@"

HighTempoDescription:
	db   "May Confuse foe on"
	next "contact.@"

CuteCharmDescription:
	db   "May Infatuate foe"
	next "on contact.@"

KeepGoingDescription:
	db   "Regain PP when a"
	next "foe faints.@"

IronFistDescription:
	db   "Powers Punching"
	next "moves.@"

WeaveDescription:
	db   "Lowers damage from"
	next "Punching moves.@"

VocalPowerDescription:
	db   "Powers Sound"
	next "moves.@"

SoundproofDescription:
	db   "Lowers damage from"
	next "Sound moves.@"

IronJawsDescription:
	db   "Powers Biting"
	next "moves.@"

BonePlateDescription:
	db   "Lowers damage from"
	next "Biting moves.@"

IronClawsDescription:
	db   "Powers Cutting"
	next "moves.@"

ShellPolishDescription:
	db   "Lowers damage from"
	next "Cutting moves.@"

FocusBeamDescription:
	db   "Powers Beam"
	next "moves.@"

DispersalDescription:
	db   "Lowers damage from"
	next "Beam moves.@"

PowerDrillDescription:
	db   "Powers Perfurating"
	next "moves.@"

SteelCoverDescription:
	db   "Lowers damage from"
	next "Puncturing moves.@"

RockHeadDescription:
	db   "Halves damage taken"
	next "from recoil.@"

BattleArmorDescription:
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

MonsoonDescription:
	db   "Rain lasts one"
	next "extra turn.@"

DrizzleDescription:
	db   "Changes weather to"
	next "rainy (4 turns).@"

BlueSkyDescription:
	db   "Sunshine lasts one"
	next "extra turn.@"

DroughtDescription:
	db   "Changes weather to"
	next "sunny (4 turns).@"

TempestDescription:
	db   "Sandstorm lasts"
	next "one extra turn.@"

DustDevilDescription:
	db   "Begin a sandstorm"
	next "(4 turns).@"

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

BurnResistDescription:
	db   "Reduces chance of"
	next "being BURNED.@"

HeatUpDescription:
	db   "Raises the chance"
	next "of BURNING.@"
   
AntivenomDescription:
	db   "Immunity to being"
	next "POISONED.@"

VenomResistDescription:
	db   "Reduces chance of"
	next "being POISONED.@"

PureToxinDescription:
	db   "Raises the chance"
	next "of POISONING.@"

TwitchDescription:
	db   "Immunity to being"
	next "PARALYZED.@"

LimberDescription:
	db   "Reduces chance of"
	next "being PARALYZED.@"

ConduitDescription:
	db   "Raises the chance"
	next "of PARALYZING.@"

InnerFocusDescription:
	db   "Immunity to FLIN-"
	next "CHING.@"

AttentionDescription:
	db   "Reduces chance of"
	next "getting FLINCHED.@"

PresenceDescription:
	db   "Raises the chance"
	next "of FLINCHING.@"

OwnTempoDescription:
	db   "Immunity to get-"
	next "ting CONFUSED.@"

OblivionDescription:
	db   "Reduces chance of"
	next "being CONFUSED.@"

MetronomeTDescription:
	db   "Raises the chance"
	next "of CONFUSING.@"

ObliviousDescription:
	db   "Immunity to get-"
	next "ting INFATUATED.@"

InsomniaDescription:
	db   "Immunity to fal-"
	next "ling ASLEEP.@"

AlertDescription:
	db   "Reduces chance of"
	next "falling ASLEEP.@"

InnerFlameDescription:
	db   "Immunity to be-"
	next "ing FROZEN.@"

WonderSkinDescription:
	db   "Lowers the chance"
	next "of STATUS moves.@"
	
SereneGraceDescription:
	db   "Raises the chance"
	next "of STATUS moves.@"

ShieldDustDescription:
	db   "Lowers the chance"
	next "of ADDED effects.@"
	
ViciousFormDescription:
	db   "Raises the chance"
	next "of ADDED effects.@"

PismalityDescription:
	db   "Powers Non-STAB"
	next "moves.@"

MasteryDescription:
	db   "Lowers damage from"
	next "Non-STAB attacks.@"
	
FreeShotDescription:
	db   "Don't use PP on"
	next "your first turn.@"
	
KeenFocusDescription:
	db   "Boosts move ACC on"
	next "your first turn.@"
	
BerserkDescription:
	db   "Raises ATK under"
	next "one third health.@"

SolidifyDescription:
	db   "Raises DEF under"
	next "one third health.@"
	
ScamperDescription:
	db   "Raises SPD under"
	next "one third health.@"
	
PoiseDescription:
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

StoneSkinDescription:
	db   "Reduces NORMAL"
	next "damage taken.@"
	
StoneSkin2Description:
	db   "Resists NORMAL"
	next "under half HP.@"

FadeDescription:
	db   "Reduces NORMAL"
	next "damage accuracy.@"

HitBreakerDescription:
	db   "Reduces FIGHTING"
	next "damage taken.@"

HitBreaker2Description:
	db   "Resists FIGHTING"
	next "under half HP.@"

CarapaceDescription:
	db   "Reduces FLYING"
	next "damage taken.@"

Carapace2Description:
	db   "Resists FLYING"
	next "under half HP.@"

FlightRushDescription:
	db   "SPEED disparity"
	next "boosts FLYING.@"

ShockAbsorbDescription:
	db   "Reduces GROUND"
	next "damage taken.@"
	
ShockAbsorb2Description:
	db   "Resists GROUND"
	next "under half HP.@"
	
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
	
FumeCoatDescription:
	db   "Reduces BUG damage"
	next "taken.@"
	
FumeCoat2Description:
	db   "Resists BUG under"
	next "half HP.@"
	
HeatproofDescription:
	db   "Reduces FIRE dam-"
	next "age taken.@"
	
Heatproof2Description:
	db   "Resists FIRE under"
	next "half HP.@"
	
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
	
AridTouchDescription:
	db   "Reduces GRASS dam-"
	next "age taken.@"
	
AridTouch2Description:
	db   "Resists GRASS"
	next "under half HP.@"
	
IonFieldDescription:
	db   "Reduces ELECTRIC"
	next "damage taken.@"
		
IonField2Description:
	db   "Resists ELECTRIC"
	next "under half HP.@"
		
ZapRushDescription:
	db   "SPEED disparity"
	next "boosts ELECTRIC.@"
	
ForewarnDescription:
	db   "Reduces PSYCHIC"
	next "damage taken.@"
	
Forewarn2Description:
	db   "Resists PSYCHIC"
	next "under half HP.@"
	
ThickCoatDescription:
	db   "Reduces ICE damage"
	next "taken.@"
	
ThickCoat2Description:
	db   "Resists ICE under"
	next "half HP.@"
	
ShadowBeingDescription:
	db   "Reduces DARK dam-"
	next "age taken.@"
	
ShadowBeing2Description:
	db   "Resists DARK under"
	next "half HP.@"
	
PrismArmorDescription:
	db   "Take less SUPER-"
	next "EFFECTIVE damage@"
	
PrismPlateDescription:
	db   "Resist S.EFFECTIVE"
	next "damage at half HP.@"
	