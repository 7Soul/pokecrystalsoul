TraitDescriptions::
; entries correspond to move ids (see constants/move_constants.asm)
	dw FlameBodyDescription   ; TRAIT_CONTACT_BRN
	dw ShockBodyDescription   ; TRAIT_CONTACT_PSN
	dw ToxicBodyDescription   ; TRAIT_CONTACT_PRZ
	dw StunBodyDescription    ; TRAIT_CONTACT_FLINCH
	dw HighTempoDescription   ; TRAIT_CONTACT_CONFUSED
	dw WaterVeilDescription   ; TRAIT_BRN_IMMUNE
	dw AntivenomDescription   ; TRAIT_PSN_IMMUNE
	dw TwitchDescription      ; TRAIT_PRZ_IMMUNE
	dw InnerFocusDescription  ; TRAIT_FLINCH_IMMUNE
	dw OwnTempoDescription    ; TRAIT_CONFUSED_IMMUNE
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
	dw HeatUpDescription      ; TRAIT_BOOST_EFFECT_BRN
	dw PureToxinDescription   ; TRAIT_BOOST_EFFECT_PSN
	dw ConduitDescription     ; TRAIT_BOOST_EFFECT_PRZ
	dw SereneGraceDescription ; TRAIT_BOOST_EFFECT_NO_DAMAGE
	dw ViciousFormDescription ; TRAIT_BOOST_EFFECT_WITH_DAMAGE
	dw PismalityDescription   ; TRAIT_BOOST_NOT_STAB
	dw MasteryDescription     ; TRAIT_REDUCE_NOT_STAB
	dw StoneSkinDescription   ; REDUCE_NORMAL
	dw FadeDescription        ; REDUCE_NORMAL_ACC
	dw HitBreakerDescription  ; REDUCE_FIGHTING
	dw CarapaceDescription    ; REDUCE_FLYING
	dw FlightRushDescription  ; REDUCE_BOOST_FLYING_SPEED
	dw ShockAbsorbDescription ; REDUCE_GROUND
	dw ShapeCastDescription   ; REDUCE_ROCK
	dw IronCoatDescription    ; BOOST_ROCK_DEFENSE
	dw GoldCoatDescription    ; BOOST_ROCK_SP_DEFENSE
	dw FumeCoatDescription    ; REDUCE_BUG
	dw HeatproofDescription   ; REDUCE_FIRE
	dw WaterproofDescription  ; REDUCE_WATER
	dw HardWaterDescription   ; BOOST_WATER_DEFENSE
	dw WaterSurgeDescription  ; BOOST_WATER_HP
	dw AridTouchDescription   ; REDUCE_GRASS
	dw IonFieldDescription    ; REDUCE_ELECTRIC
	dw ZapRushDescription     ; BOOST_ELECTRIC_SPEED
	dw ForewarnDescription    ; REDUCE_PSYCHIC
	dw ThickCoatDescription   ; REDUCE_ICE
	dw ShadowBeingDescription ; REDUCE_DARK
	dw PrismArmorDescription  ; REDUCE_SUPER_EFFECTIVE
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

WaterVeilDescription:
	db   "Immunity to being"
	next "burned.@"

AntivenomDescription:
	db   "Immunity to being"
	next "poisoned.@"

TwitchDescription:
	db   "Immunity to being"
	next "paralyzed.@"
	
InnerFocusDescription:
	db   "Immunity to flin-"
	next "ching.@"
	
OwnTempoDescription:
	db   "Immunity to get-"
	next "ting confused.@"

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

HeatUpDescription:
	db   "Raises the chance"
	next "of BURNING.@"
    
PureToxinDescription:
	db   "Raises the chance"
	next "of POISONING.@"

ConduitDescription:
	db   "Raises the chance"
	next "of PARALYZING.@"
 
SereneGraceDescription:
	db   "Raises the chance"
	next "of STATUS moves.@"

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
	