TraitDescriptions::
; entries correspond to move ids (see constants/move_constants.asm)
	dw FlameBodyDescription
	dw ShockBodyDescription
	dw ToxicBodyDescription
	dw StunBodyDescription
	dw MonsoonDescription
	dw DrizzleDescription
	dw BlueSkyDescription
	dw DroughtDescription
	dw TempestDescription
	dw DustDevilDescription
	dw ClimateBoon0Description
	dw ClimateBoon1Description
	dw ClimateBoon2Description
	dw ClimateBoon3Description
	dw ClimateBoon4Description
	dw ClimateBoon5Description
	dw ClimateBoon6Description
	dw HydrationDescription
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

ClimateBoon0Description:
	db   "Raises ATK during"
	next "rain.@"

ClimateBoon1Description:
	db   "Raises DEF during"
	next "rain.@"

ClimateBoon2Description:
	db   "Raises SPD during"
	next "rain.@"

ClimateBoon3Description:
	db   "Raises SP.ATK"
	next "during rain.@"

ClimateBoon4Description:
	db   "Raises SP.DEF"
	next "during rain.@"

ClimateBoon5Description:
	db   "Raises ACCURACY"
	next "during rain.@"

ClimateBoon6Description:
	db   "Raises EVASION"
	next "during rain.@"

HydrationDescription:
	db   "Rain heals status"
	next "conditions.@"
