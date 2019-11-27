VariableTypes:
	; pokemon type to check, type to change the move to, etc, etc, -1
	db NORMAL, NORMAL, -1
	db FIRE, FIRE, 			WATER, WATER, 			FLYING, FLYING, 	-1 ; Kindle Clash -> Tide Clash, Flutter Clap
	db NORMAL, FIGHTING, 	FIGHTING, FIGHTING, 	ROCK, ROCK, 		DARK, ROCK,     -1 ; Cross Chop -> Stone Edge
	db BUG, NORMAL, 		FLYING, FLYING, 		NORMAL, NORMAL, 	GRASS, GRASS,   ROCK, GRASS,      -1 ; Double Edge -> Brave Bird, Wood Hammer
	db NORMAL, NORMAL, 		ICE, ICE,               -1 ; Quick Attack -> Ice Shard
	db NORMAL, NORMAL, 		DARK, DARK,             GRASS, GRASS, -1 ; Slash -> Night Slash, Leaf Blade
	db GRASS, GRASS, 		-1 ; Drill Peck -> Seed Bomb
	db -1

VariableTypesByName:
	db SLASH, MEOWTH, DARK ; Meowth - Slash -> Night Slash
	db SLASH, PERSIAN, DARK ;
	db SLASH, FARFETCH_D, DARK ;
	db QUICK_ATTACK, VAPOREON, NORMAL
	db DRILL_PECK, SNORLAX, GRASS
	db -2

VariableMoves::
	db NO_MOVE
	db FIRE_PLAY
	db CROSS_CHOP
	db DOUBLE_EDGE
	db QUICK_ATTACK
	db SLASH
	db DRILL_PECK
	db -1

