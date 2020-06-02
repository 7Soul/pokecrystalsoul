VariableTypes:
	; pokemon type to check, type to change the move to, etc, etc, -1
	db NORMAL, NORMAL, -1
	db WATER, TIDE_CLASH, 	FLYING, FLUTTER_CLAP, 	-1 ; Kindle Clash -> Tide Clash, Flutter Clap
	db ROCK, STONE_EDGE, 	DARK, STONE_EDGE,       -1 ; Cross Chop -> Stone Edge
	db FLYING, BRAVE_BIRD, 	GRASS, WOOD_HAMMER,     ROCK, WOOD_HAMMER,      -1 ; Double Edge -> Brave Bird, Wood Hammer
	db ICE, ICE_SHARD,      -1 ; Quick Attack -> Ice Shard
	db DARK, NIGHT_SLASH,   GRASS, LEAF_BLADE,      -1 ; Slash -> Night Slash, Leaf Blade
	db GRASS, GRASS, 		-1 ; Drill Peck -> Seed Bomb
	db FLYING, AERIAL_ACE, 	-1 ; Faint Attack -> Aerial Ace
	db FLYING, FEATHERDANCE,-1 ; Screech -> Feather Dance
	db GROUND, FISSURE,     ROCK, FISSURE, 		    ICE, SHEER_COLD,           DARK, GUILLOTINE_,     WATER, GUILLOTINE_,    BUG, GUILLOTINE_, -1 ; Horn Drill (normal) -> Fissure (ground), Sheer Cold (ice), Guillotine (dark)
	db WATER, WITHDRAW,     ICE, WITHDRAW, -1 ; Withdraw (water)
	db ROCK, IRON_DEFENSE,  -1 ; Iron Defense (rock)
	db GROUND, BONE_RUSH,   -1 ; Bone Rush (ground)
	db GROUND, BONEMERANG,  -1 ; Bonemerang (ground)
	db GRASS, ENERGY_BALL,  -1 ; Energy Ball (grass)
	db WATER, FLAIL,        GROUND, FLAIL,           -1 ; Flail (water)
	db GROUND, MUD_SHOT,    ROCK, MUD_SHOT,          -1 ; Mud Shot (ground)
	db FLYING, SAND_DIVE,   GROUND, SAND_DIVE,          -1 ; Sand Dive (ground)
	db FLYING, HURRICANE,   -1 ; Hurricane (flying)
	db WATER, RAZOR_SHELL,  -1 ; Razor Shell (water)
	db -1

VariableTypesByName: ; -1 = forced original move
	db FIRE_PLAY, VAPOREON, FLUTTER_CLAP
	db SLASH, MEOWTH, NIGHT_SLASH
	db SLASH, PERSIAN, NIGHT_SLASH
	db SLASH, FARFETCH_D, NIGHT_SLASH
	db QUICK_ATTACK, VAPOREON, ICE_SHARD
	db DRILL_PECK, SNORLAX, SEED_BOMB
	db DOUBLE_EDGE, CUBONE, WOOD_HAMMER
	db DOUBLE_EDGE, MAROWAK, WOOD_HAMMER
	db HORN_DRILL, GLIGAR, GUILLOTINE_
	db HORN_DRILL, GOLDEEN, -1
	db HORN_DRILL, SEAKING, -1
	db HORN_DRILL, SUICUNE, SHEER_COLD
	db ICY_WIND, SWINUB, -1
	db ICY_WIND, PILOSWINE, -1
	db ICY_WIND, MAGIKARP, MEGA_SPLASH
	db ICY_WIND, GYARADOS, MEGA_SPLASH
	db FROZEN_TAIL, PILOSWINE, RAZOR_SHELL
	db -2

VariableMoves::
	db NO_MOVE
	db FIRE_PLAY ; Tide Clash (water), Flutter Clap (flying)
	db CROSS_CHOP ; Stone Edge (rock)
	db DOUBLE_EDGE ; Brave Bird (flying), Wood Hammer (grass) ; todo anim
	db QUICK_ATTACK ; Ice Shard (ice)
	db SLASH ; Night Slash (dark), Leaf Blade (grass)
	db DRILL_PECK ; Seed Bomb (grass) ; todo anim
	db FAINT_ATTACK ; Aerial Ace (flying) ; todo anim
	db SCREECH ; Feather Dance (flying) ; todo anim
	db HORN_DRILL ; Fissure (ground), Sheer Cold (ice), Guillotine (dark)
	db HARDEN ; Withdraw (water) ; todo anim
	db BARRIER ; Iron Defense (rock) ; todo anim
	db ROCK_BLAST ; Bone Rush (ground)
	db FEATHERGALE ; Bonemerang (ground)
	db SHADOW_BALL ; Energy Ball (grass) ; todo anim
	db REVERSAL ; Flail (normal) ; todo anim
	db ICY_WIND ; Mud Shot (ground) ; todo anim
	db JUMP_KICK ; Sand Dive (ground) ; todo anim
	db DIZZY_PUNCH ; Hurricane (flying) ; todo anim
	db FROZEN_TAIL ; Razor Shell (water) ; todo anim
	db -1

 ; needs animations:
 ; heal bell -> aromatherapy
 ; add lava plume -> scald
 ; strenght / drill peck / seed bomb / x-scissor

