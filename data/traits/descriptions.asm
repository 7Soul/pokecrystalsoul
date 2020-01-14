TraitDescriptions::
; entries correspond to move ids (see constants/move_constants.asm)
	dw FlameBodyDescription   ; TRAIT_CONTACT_BRN
	dw ShockBodyDescription   ; TRAIT_CONTACT_PSN
	dw ToxicBodyDescription   ; TRAIT_CONTACT_PRZ
	dw StunBodyDescription    ; TRAIT_CONTACT_FLINCH
	dw HighTempoDescription   ; TRAIT_CONTACT_CONFUSED
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
	dw RecklessDescription    ; TRAIT_BOOST_RECOIL
	dw DeviantDescription     ; TRAIT_REDUCE_RECOIL
	dw RockHeadDescription    ; TRAIT_REDUCE_SELF_RECOIL
	dw MonsoonDescription     ; TRAIT_RAIN_DURATION
	dw DrizzleDescription     ; TRAIT_RAIN_ON_ENTER
	dw BlueSkyDescription     ; TRAIT_SUNSHINE_DURATION
	dw DroughtDescription     ; TRAIT_SUNSHINE_ON_ENTER
	dw TempestDescription     ; TRAIT_SANDSTORM_DURATION
	dw DustDevilDescription   ; TRAIT_SANDSTORM_ON_ENTER
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
	dw WonderSkinDescription  ; TRAIT_BOOST_EFFECT_NO_DAMAGE
	dw SereneGraceDescription ; TRAIT_BOOST_EFFECT_NO_DAMAGE
	dw ShieldDustDescription  ; TRAIT_REDUCE_EFFECT_WITH_DAMAGE
	dw ViciousFormDescription ; TRAIT_BOOST_EFFECT_WITH_DAMAGE
	dw PismalityDescription   ; TRAIT_BOOST_NOT_STAB
	dw MasteryDescription     ; TRAIT_REDUCE_NOT_STAB
	dw StoneSkinDescription   ; TRAIT_REDUCE_NORMAL
	dw FadeDescription        ; TRAIT_REDUCE_NORMAL_ACC
	dw HitBreakerDescription  ; TRAIT_REDUCE_FIGHTING
	dw CarapaceDescription    ; TRAIT_REDUCE_FLYING
	dw FlightRushDescription  ; TRAIT_BOOST_FLYING_SPEED
	dw ShockAbsorbDescription ; TRAIT_REDUCE_GROUND
	dw ShapeCastDescription   ; TRAIT_REDUCE_ROCK
	dw IronCoatDescription    ; TRAIT_BOOST_ROCK_DEFENSE
	dw GoldCoatDescription    ; TRAIT_BOOST_ROCK_SP_DEFENSE
	dw FumeCoatDescription    ; TRAIT_REDUCE_BUG
	dw HeatproofDescription   ; TRAIT_REDUCE_FIRE
	dw WaterproofDescription  ; TRAIT_REDUCE_WATER
	dw HardWaterDescription   ; TRAIT_BOOST_WATER_DEFENSE
	dw WaterSurgeDescription  ; TRAIT_BOOST_WATER_HP
	dw AridTouchDescription   ; TRAIT_REDUCE_GRASS
	dw IonFieldDescription    ; TRAIT_REDUCE_ELECTRIC
	dw ZapRushDescription     ; TRAIT_BOOST_ELECTRIC_SPEED
	dw ForewarnDescription    ; TRAIT_REDUCE_PSYCHIC
	dw ThickCoatDescription   ; TRAIT_REDUCE_ICE
	dw ShadowBeingDescription ; TRAIT_REDUCE_DARK
	dw PrismArmorDescription  ; TRAIT_REDUCE_SUPER_EFFECTIVE
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

RecklessDescription:
	db   "Powers moves with"
	next "recoil.@"

DeviantDescription:
	db   "Lowers damage from"
	next "moves with recoil.@"

RockHeadDescription:
	db   "Lowers damage from"
	next "recoil.@"

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
	
StoneSkinDescription:
	db   "Reduces NORMAL"
	next "damage taken.@"

FadeDescription:
	db   "Reduces NORMAL"
	next "damage accuracy.@"

HitBreakerDescription:
	db   "Reduces FIGHTING"
	next "damage taken.@"

CarapaceDescription:
	db   "Reduces FLYING"
	next "damage taken.@"

FlightRushDescription:
	db   "SPEED disparity"
	next "boosts FLYING.@"

ShockAbsorbDescription:
	db   "Reduces GROUND"
	next "damage taken.@"
	
ShapeCastDescription:
	db   "Reduces ROCK dam-"
	next "age taken.@"
	
IronCoatDescription:
	db   "DEFENSE disparity"
	next "boosts ROCK.@"
	
GoldCoatDescription:
	db   "SP.DEF disparity"
	next "boosts ROCK.@"
	
FumeCoatDescription:
	db   "Reduces BUG damage"
	next "taken.@"
	
HeatproofDescription:
	db   "Reduces FIRE dam-"
	next "age taken.@"
	
WaterproofDescription:
	db   "Reduces WATER dam-"
	next "age taken.@"
	
HardWaterDescription:
	db   "DEFENSE disparity"
	next "boosts WATER.@"
	
WaterSurgeDescription:
	db   "Missing HEALTH"
	next "boosts WATER.@"
	
AridTouchDescription:
	db   "Reduces GRASS dam-"
	next "age taken.@"
	
IonFieldDescription:
	db   "Reduces ELECTRIC"
	next "damage taken.@"
		
ZapRushDescription:
	db   "SPEED disparity"
	next "boosts ELECTRIC.@"
	
ForewarnDescription:
	db   "Reduces PSYCHIC"
	next "damage taken.@"
	
ThickCoatDescription:
	db   "Reduces ICE damage"
	next "taken.@"
	
ShadowBeingDescription:
	db   "Reduces DARK dam-"
	next "age taken.@"
	
PrismArmorDescription:
	db   "Take less SUPER-"
	next "EFFECTIVE damage@"
	