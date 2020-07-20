varmove: MACRO
	db \1 ; id
	dw \2 ; pointer
ENDM

VariableMoves::
	db NO_MOVE
	db DOUBLESLAP ; Bone Rush, Pin Missile, Rock Blast, Icicle Spear
	db ACUPRESSURE ; Gather Sand
	db FIRE_PLAY ; Tide Clash, Flutter Clap
	db CROSS_CHOP ; Stone Edge
	db DOUBLE_EDGE ; Brave Bird, Wood Hammer, Flare Blitz
	db QUICK_ATTACK ; Ice Shard, Accelerock, Aqua Jet
	db SLASH ; Night Slash, Leaf Blade
	db DRILL_PECK ; Seed Bomb
	db FAINT_ATTACK ; Aerial Ace
	db SCREECH ; Feather Dance
	db HORN_DRILL ; Fissure, Sheer Cold, Guillotine
	db HARDEN ; Withdraw
	db BARRIER ; Iron Defense
	db FEATHERGALE ; Bonemerang
	db SHADOW_BALL ; Energy Ball
	db REVERSAL ; Flail
	db ICY_WIND ; Mud Shot, Mega Splash
	db JUMP_KICK ; Sand Dive
	db DIZZY_PUNCH ; Hurricane
	db IRON_TAIL ; Razor Shell, Spiral Kick
	db CONSTRICT ; Power Whip
	db AGILITY ; Rock Polish
	db LICK ; Shock Sting
	db SEISMIC_TOSS ; Rock Tumble
	db SKULL_BASH ; Brutal Vine
	db DOUBLE_KICK ; Double Hit
	db DARK_PULSE ; Waterfall
	db -1

VariablePointers:
	varmove DOUBLESLAP,   DoubleSlapVariables
	varmove ACUPRESSURE,  AcupressureVariables
	varmove FIRE_PLAY,    FirePlayVariables
	varmove CROSS_CHOP,   CrossChopVariables
	varmove DOUBLE_EDGE,  DoubleEdgeVariables
	varmove QUICK_ATTACK, QuickAttackVariables
	varmove SLASH,        SlashVariables
	varmove DRILL_PECK,   DrillPeckVariables
	varmove FAINT_ATTACK, FaintAttackVariables
	varmove SCREECH,      ScreechVariables
	varmove HORN_DRILL,   HornDrillVariables
	varmove HARDEN,       HardenVariables
	varmove BARRIER,      BarrierVariables
	varmove FEATHERGALE,  FeathergaleVariables
	varmove SHADOW_BALL,  ShadowBallVariables
	varmove REVERSAL,     ReversalVariables
	varmove ICY_WIND,     IcyWindVariables
	varmove JUMP_KICK,    JumpKickVariables
	varmove DIZZY_PUNCH,  DizzyPunchVariables
	varmove IRON_TAIL,  FrozenTailVariables
	varmove CONSTRICT,    ConstrictVariables
	varmove AGILITY,      AgilityVariables
	varmove LICK,         LickVariables
	varmove SEISMIC_TOSS, SeismicTossVariables
	varmove SKULL_BASH,   SkullBashVariables
	varmove DOUBLE_KICK,  DoubleKickVariables
	varmove DARK_PULSE,   DarkPulseVariables

DoubleSlapVariables:
	db BONE_RUSH, CUBONE, MAROWAK, -1
	db PIN_MISSILE, CATERPIE, METAPOD, BUTTERFREE, WEEDLE, KAKUNA, BEEDRILL, JOLTEON, PINECO, FORRETRESS, QWILFISH, HERACROSS, -1
	db ROCK_BLAST, GEODUDE, GRAVELER, GOLEM, RHYHORN, RHYDON, OMANYTE, OMASTAR, SHUCKLE, -1
	db ICICLE_SPEAR, SHELLDER, CLOYSTER, -1
	db -2

AcupressureVariables:
	db GATHER_SAND, EKANS, ARBOK, SANDSHREW, SANDSLASH, DIGLETT, DUGTRIO, -1
	db -2

FirePlayVariables:
	db TIDE_CLASH, GOLDEEN, SEAKING, POLITOED, MANTINE, -1
	db FLUTTER_CLAP, PIDGEY, PIDGEOTTO, PIDGEOT, SPEAROW, FEAROW, FARFETCH_D, ZAPDOS, YANMA, DELIBIRD, -1
	db -2

CrossChopVariables:
	db STONE_EDGE, GEODUDE, GRAVELER, GOLEM, ONIX, STEELIX, RHYHORN, RHYDON, SUDOWOODO, LARVITAR, PUPITAR, TYRANITAR, - 1
	db -2

DoubleEdgeVariables:
	db BRAVE_BIRD, FARFETCH_D, HO_OH, -1
	db WOOD_HAMMER, GEODUDE, GRAVELER, GOLEM, EXEGGUTOR, CUBONE, MAROWAK, SUDOWOODO, -1
	db FLARE_BLITZ, CHARMANDER, CHARMELEON, CHARIZARD, PONYTA, RAPIDASH, -1
	db -2

QuickAttackVariables:
	db ICE_SHARD, SEEL, DEWGONG, LAPRAS, SHELLDER, CLOYSTER, SNEASEL, -1
	db ACCELEROCK_MOVE, AERODACTYL, -1
	db AQUA_JET, SEEL, DEWGONG, -1
	db -2

SlashVariables:
	db NIGHT_SLASH, MEOWTH, PERSIAN, FARFETCH_D, -1
	db LEAF_BLADE, BELLSPROUT, WEEPINBELL, VICTREEBEL, -1
	db -2

DrillPeckVariables:
	db SEED_BOMB, BULBASAUR, IVYSAUR, VENUSAUR, BELLSPROUT, WEEPINBELL, VICTREEBEL, SNORLAX, HOPPIP, SKIPLOOM, JUMPLUFF, -1
	db -2
	
FaintAttackVariables:
	db AERIAL_ACE, SPEAROW, FEAROW, -1
	db -2
	
ScreechVariables:
	db FEATHERDANCE, PIDGEY, PIDGEOTTO, PIDGEOT, SPEAROW, FEAROW, FARFETCH_D, HOOTHOOT, NOCTOWL, NATU, XATU, MURKROW, -1
	db -2
	
HornDrillVariables:
	db FISSURE, DIGLETT, DUGTRIO, -1
	db SHEER_COLD, SEEL, DEWGONG, ARTICUNO, SUICUNE, -1
	db GUILLOTINE, KRABBY, KINGLER, PINSIR, GLIGAR, -1
	db -2
	
HardenVariables:
	db WITHDRAW, SQUIRTLE, WARTORTLE, BLASTOISE, SHELLDER, CLOYSTER, KRABBY, KINGLER, OMANYTE, OMASTAR, KABUTO, KABUTOPS, SHUCKLE, -1
	db -2
	
BarrierVariables:
	db IRON_DEFENSE, SHELLDER, CLOYSTER, PINECO, FORRETRESS, SCIZOR, CORSOLA, SKARMORY, LARVITAR, PUPITAR, TYRANITAR, MAGNEMITE, MAGNETON, -1
	db -2
	
FeathergaleVariables:
	db BONEMERANG, CUBONE, MAROWAK, -1
	db -2
	
ShadowBallVariables:
	db ENERGY_BALL, SUNKERN, SUNFLORA, CELEBI, -1
	db -2
	
ReversalVariables:
	db FLAIL, KRABBY, KINGLER, GOLDEEN, SEAKING, MAGIKARP, GYARADOS, TOTODILE, CROCONAW, FERALIGATR, CHINCHOU, LANTURN, DUNSPARCE, QWILFISH, SWINUB, PILOSWINE, CORSOLA, PHANPY, DONPHAN, -1
	db -2
	
IcyWindVariables:
	db MUD_SHOT, SANDSHREW, SANDSLASH, POLIWAG, POLIWHIRL, POLIWRATH, KRABBY, KINGLER, SHELLDER, CLOYSTER, GOLDEEN, SEAKING, OMANYTE, OMASTAR, KABUTO, KABUTOPS, POLITOED, WOOPER, QUAGSIRE, -1 
	db MEGA_SPLASH, MAGIKARP, GYARADOS, -1
	db -2
	
JumpKickVariables:
	db SAND_DIVE, SPEAROW, FEAROW, -1
	db -2
	
DizzyPunchVariables:
	db HURRICANE, PIDGEY, PIDGEOTTO, PIDGEOT, -1
	db -2
	
FrozenTailVariables:
	db RAZOR_SHELL, SHELLDER, CLOYSTER, KRABBY, KINGLER, -1
	db SPIRAL_KICK, HITMONLEE, -1
	db -2
	
ConstrictVariables:
	db POWER_WHIP, LICKITUNG, TANGELA, -1
	db -2
	
AgilityVariables:
	db ROCK_POLISH, AERODACTYL, -1
	db -2
	
LickVariables:
	db SHOCK_STING, TENTACOOL, TENTACRUEL, SANDSHREW, SANDSLASH, -1
	db -2
	
SeismicTossVariables:
	db ROCK_TUMBLE, ONIX, STEELIX, -1
	db -2
	
SkullBashVariables:
	db BRUTAL_VINE, TANGELA, -1
	db -2
	
DoubleKickVariables:
	db DOUBLE_HIT, KOFFING, WEEZING, DODUO, DODRIO, -1
	db -2
	
DarkPulseVariables:
	db WATERFALL, SEEL, DEWGONG, GOLDEEN, SEAKING, HORSEA, SEADRA, EEVEE, VAPOREON, KINGDRA -1
	db -2

 ; needs animations:
 ; heal bell -> aromatherapy
 ; add lava plume -> scald
 ; strenght / drill peck / seed bomb / x-scissor
