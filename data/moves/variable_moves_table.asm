VariableTypes:
	; pokemon type to check, type to change the move to, etc, etc, -1
	db NORMAL, NORMAL, -1
	db WATER, WATER, 		FLYING, FLYING, 	    -1 ; Kindle Clash -> Tide Clash, Flutter Clap
	db NORMAL, FIGHTING, 	FIGHTING, FIGHTING, 	ROCK, ROCK, 		DARK, ROCK,     -1 ; Cross Chop -> Stone Edge
	db BUG, NORMAL, 		FLYING, FLYING, 		NORMAL, NORMAL, 	GRASS, GRASS,   ROCK, GRASS,      -1 ; Double Edge -> Brave Bird, Wood Hammer
	db NORMAL, NORMAL, 		ICE, ICE,               -1 ; Quick Attack -> Ice Shard
	db NORMAL, NORMAL, 		DARK, DARK,             GRASS, GRASS,       -1 ; Slash -> Night Slash, Leaf Blade
	db GRASS, GRASS, 		-1 ; Drill Peck -> Seed Bomb
	db DARK, DARK,          FLYING, FLYING, 		-1 ; Faint Attack -> Aerial Ace
	db FLYING, FLYING, 		-1 ; Screech -> Feather Dance
	db GROUND, GROUND,      ROCK, GROUND, 		    ICE, ICE,           DARK, DARK,     WATER, DARK,    BUG, DARK, -1 ; Horn Drill (normal) -> Fissure (ground), Sheer Cold (ice), Guillotine (dark)
	db WATER, WATER,        ICE, WATER, -1 ; Withdraw (water)
	db ROCK, ROCK,          WATER, ROCK, -1 ; Iron Defense (rock)
	db GROUND, GROUND,      -1 ; Bone Rush (ground)
	db GROUND, GROUND,      -1 ; Bonemerang (ground)
	db GRASS, GRASS,        -1 ; Energy Ball (grass)
	db WATER, WATER,        GROUND, WATER,           -1 ; Energy Ball (grass)
	db WATER, GROUND,       GROUND, GROUND,          -1 ; Mud Shot (ground)
	db -1

VariableTypesByName:
	db SLASH, MEOWTH, DARK
	db SLASH, PERSIAN, DARK
	db SLASH, FARFETCH_D, DARK
	db QUICK_ATTACK, VAPOREON, NORMAL 
	db DRILL_PECK, SNORLAX, GRASS
	db DOUBLE_EDGE, CUBONE, NORMAL
	db DOUBLE_EDGE, MAROWAK, NORMAL
	db HORN_DRILL, GLIGAR, DARK
	db HORN_DRILL, GOLDEEN, NORMAL
	db HORN_DRILL, SEAKING, NORMAL
	db HORN_DRILL, SUICUNE, ICE
	db ICY_WIND, SEEL, ICE
	db ICY_WIND, SWINUB, ICE
	db ICY_WIND, PILOSWINE, ICE
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
	db -1

 ; needs animations:
 ; heal bell -> aromatherapy
 ; add lava plume -> scald
 ; strenght / drill peck / seed bomb / x-scissor
