TraitDescriptions::
; entries correspond to move ids (see constants/move_constants.asm)
	dw FlameBodyDescription
	dw ShockBodyDescription
	dw ToxicBodyDescription
	dw StunBodyDescription
	dw HighTempoDescription
	dw WaterVeilDescription
	dw AntivenomDescription
	dw TwitchDescription
	dw InnerFocusDescription
	dw OwnTempoDescription
	dw IronFistDescription
	dw WeaveDescription
	dw VocalPowerDescription
	dw SoundproofDescription
	dw IronJawsDescription
	dw BonePlateDescription
	dw IronClawsDescription
	dw ShellPolishDescription
	dw FocusBeamDescription
	dw DispersalDescription
	dw PowerDrillDescription
	dw SteelCoverDescription
	dw PismalityDescription
	dw MasteryDescription
	dw RecklessDescription
	dw DeviantDescription
	dw RockHeadDescription
	dw MonsoonDescription
	dw DrizzleDescription
	dw BlueSkyDescription
	dw DroughtDescription
	dw TempestDescription
	dw DustDevilDescription
	dw RainyBoon0Description
	dw RainyBoon1Description
	dw RainyBoon2Description
	dw RainyBoon3Description
	dw RainyBoon4Description
	dw RainyBoon5Description
	dw RainyBoon6Description
	dw HydrationDescription
	dw SunnyBoon0Description
	dw SunnyBoon1Description
	dw SunnyBoon2Description
	dw SunnyBoon3Description
	dw SunnyBoon4Description
	dw SunnyBoon5Description
	dw SunnyBoon6Description
	dw LeafGuardDescription
	dw StormBoon0Description
	dw StormBoon1Description
	dw StormBoon2Description
	dw StormBoon3Description
	dw StormBoon4Description
	dw StormBoon5Description
	dw StormBoon6Description
	dw SandFilterDescription
	dw StoneSkinDescription
	dw HitBreakerDescription
	dw CarapaceDescription
	dw ShockAbsorbDescription
	dw ShapeCastDescription
	dw FumeCoatDescription
	dw HeatproofDescription
	dw WaterproofDescription
	dw AridTouchDescription
	dw IonFieldDescription
	dw ForewarnDescription
	dw MagmaSkinDescription
	dw ShadowBeingDescription
	dw PrismArmorDescription
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

PismalityDescription:
	db   "Powers Non-STAB"
	next "moves.@"

MasteryDescription:
	db   "Lowers damage from"
	next "Non-STAB attacks.@"

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

StoneSkinDescription:
	db   "Reduces NORMAL"
	next "damage taken.@"

HitBreakerDescription:
	db   "Reduces FIGHTING"
	next "damage taken.@"

CarapaceDescription
	db   "Reduces FLYING"
	next "damage taken.@"

ShockAbsorbDescription
	db   "Reduces GROUND"
	next "damage taken.@"
	
ShapeCastDescription
	db   "Reduces ROCK dam-"
	next "age taken.@"
	
FumeCoatDescription
	db   "Reduces BUG damage"
	next "taken.@"
	
HeatproofDescription
	db   "Reduces FIRE dam-"
	next "age taken.@"
	
WaterproofDescription
	db   "Reduces WATER dam-"
	next "age taken.@"
	
AridTouchDescription
	db   "Reduces GRASS dam-"
	next "age taken.@"
	
IonFieldDescription
	db   "Reduces ELECTRICT"
	next "damage taken.@"
	
ForewarnDescription
	db   "Reduces PSYCHIC"
	next "damage taken.@"
	
MagmaSkinDescription
	db   "Reduces ICE damage"
	next "taken.@"
	
ShadowBeingDescription
	db   "Reduces DARK dam-"
	next "age taken.@"
	
PrismArmorDescription
	db   "Take less SUPER-"
	next "EFFECTIVE damage@"
	