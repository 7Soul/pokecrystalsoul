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
	db -1

VariableTypesByName:
	db SLASH, MEOWTH, DARK
	db SLASH, PERSIAN, DARK
	db SLASH, FARFETCH_D, DARK
	db QUICK_ATTACK, VAPOREON, NORMAL 
	db DRILL_PECK, SNORLAX, GRASS
	db DOUBLE_EDGE, CUBONE, NORMAL
	db -2

VariableMoves::
	db NO_MOVE
	db FIRE_PLAY
	db CROSS_CHOP
	db DOUBLE_EDGE
	db QUICK_ATTACK
	db SLASH
	db DRILL_PECK
	db FAINT_ATTACK
	db SCREECH
	db -1

 ; needs animations:
 ; heal bell -> aromatherapy
 ; can do it with -> fissure / horn drill / guillotine
 ; swift -> magical leaf / shock wave
 ; add lava plume -> scald
 ; strenght / drill peck / seed bomb / x-scissor
