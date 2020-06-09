VariableMoves::
	db NO_MOVE
	db FIRE_PLAY ; Tide Clash, Flutter Clap
	db CROSS_CHOP ; Stone Edge
	db DOUBLE_EDGE ; Brave Bird, Wood Hammer ; todo anim
	db QUICK_ATTACK ; Ice Shard, Accelerock, Aqua Jet
	db SLASH ; Night Slash, Leaf Blade
	db DRILL_PECK ; Seed Bomb ; todo anim
	db FAINT_ATTACK ; Aerial Ace ; todo anim
	db SCREECH ; Feather Dance ; todo anim
	db HORN_DRILL ; Fissure, Sheer Cold, Guillotine
	db HARDEN ; Withdraw ; todo anim
	db BARRIER ; Iron Defense ; todo anim
	db ROCK_BLAST ; Bone Rush
	db FEATHERGALE ; Bonemerang
	db SHADOW_BALL ; Energy Ball ; todo anim
	db REVERSAL ; Flail ; todo anim
	db ICY_WIND ; Mud Shot ; todo anim
	db JUMP_KICK ; Sand Dive ; todo anim
	db DIZZY_PUNCH ; Hurricane ; todo anim
	db FROZEN_TAIL ; Razor Shell ; todo anim
	db CONSTRICT ; Power Whip ; todo anim
	db AGILITY ; Rock Polish ; todo anim
	db SPARK ; Shock Sting ; todo anim
	db SEISMIC_TOSS ; Rock Tumble ; todo anim
	db SKULL_BASH ; Brutal Vine ; todo anim
	db DOUBLE_KICK ; Double Hit ; todo anim
	db DARK_PULSE ; Waterfall ; todo anim
	db -1

VariableTypesByName:
	db FIRE_PLAY, TIDE_CLASH, GOLDEEN, SEAKING, POLITOED, MANTINE, -1
	db FIRE_PLAY, FLUTTER_CLAP, SPEAROW, FEAROW, FARFETCH_D, ZAPDOS, YANMA, DELIBIRD, -1
	db CROSS_CHOP, STONE_EDGE, GEODUDE, GRAVELER, GOLEM, ONIX, STEELIX, RHYHORN, RHYDON, SUDOWOODO, LARVITAR, PUPITAR, TYRANITAR, - 1
	db DOUBLE_EDGE, BRAVE_BIRD, FARFETCH_D, HO_OH, -1
	db DOUBLE_EDGE, WOOD_HAMMER, GEODUDE, GRAVELER, GOLEM, EXEGGUTOR, CUBONE, MAROWAK, SUDOWOODO, -1
	db QUICK_ATTACK, ICE_SHARD, SEEL, DEWGONG, LAPRAS, SNEASEL, -1
	db QUICK_ATTACK, ACCELEROCK_MOVE, AERODACTYL, -1
	db QUICK_ATTACK, AQUA_JET, VAPOREON, SEEL, DEWGONG, -1
	db SLASH, NIGHT_SLASH, MEOWTH, PERSIAN, FARFETCH_D, -1
	db SLASH, LEAF_BLADE, BELLSPROUT, WEEPINBELL, VICTREEBEL, -1
	db DRILL_PECK, SEED_BOMB, BULBASAUR, IVYSAUR, VENUSAUR, SNORLAX, -1
	db FAINT_ATTACK, AERIAL_ACE, SPEAROW, FEAROW, -1
	db SCREECH, FEATHERDANCE, PIDGEY, PIDGEOTTO, PIDGEOT, -1
	db HORN_DRILL, FISSURE, DIGLETT, DUGTRIO, -1
	db HORN_DRILL, SHEER_COLD, SEEL, DEWGONG, ARTICUNO, SUICUNE, -1
	db HORN_DRILL, GUILLOTINE, KRABBY, KINGLER, PINSIR, GLIGAR, -1
	db HARDEN, WITHDRAW, SQUIRTLE, WARTORTLE, BLASTOISE, SHELLDER, CLOYSTER, KRABBY, KINGLER, OMANYTE, OMASTAR, KABUTO, KABUTOPS, SHUCKLE, -1
	db BARRIER, IRON_DEFENSE, -1
	db ROCK_BLAST, BONE_RUSH, CUBONE, MAROWAK, -1
	db FEATHERGALE, BONEMERANG, CUBONE, MAROWAK, -1
	db SHADOW_BALL, ENERGY_BALL, SUNKERN, SUNFLORA, CELEBI, -1
	db REVERSAL, FLAIL, KRABBY, KINGLER, GOLDEEN, SEAKING, MAGIKARP, GYARADOS, TOTODILE, CROCONAW, FERALIGATR, CHINCHOU, LANTURN, DUNSPARCE, QWILFISH, SWINUB, PILOSWINE, CORSOLA, PHANPY, DONPHAN, -1
	db ICY_WIND, MUD_SHOT, POLIWAG, POLIWHIRL, POLIWRATH, KRABBY, KINGLER, OMANYTE, OMASTAR, KABUTO, KABUTOPS, POLITOED, WOOPER, QUAGSIRE, -1 
	db ICY_WIND, MEGA_SPLASH, MAGIKARP, GYARADOS, -1
	db JUMP_KICK, SAND_DIVE, SPEAROW, FEAROW, -1
	db DIZZY_PUNCH, HURRICANE, PIDGEY, PIDGEOTTO, PIDGEOT, -1
	db FROZEN_TAIL, RAZOR_SHELL, SHELLDER, CLOYSTER, KRABBY, KINGLER -1
	db FROZEN_TAIL, SPIRAL_KICK, HITMONLEE, -1
	db CONSTRICT, POWER_WHIP, LICKITUNG, TANGELA, -1
	db AGILITY, ROCK_POLISH, AERODACTYL, -1
	db SPARK, SHOCK_STING, TENTACOOL, TENTACRUEL, SANDSHREW, SANDSLASH, -1
	db SEISMIC_TOSS, ROCK_TUMBLE, ONIX, STEELIX, -1
	db SKULL_BASH, BRUTAL_VINE, TANGELA, -1
	db DOUBLE_KICK, DOUBLE_HIT, DODUO, DODRIO, -1
	db DARK_PULSE, WATERFALL, DODUO, DODRIO, -1
	db -2

 ; needs animations:
 ; heal bell -> aromatherapy
 ; add lava plume -> scald
 ; strenght / drill peck / seed bomb / x-scissor
