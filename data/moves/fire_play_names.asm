VariableTypes:
	; pokemon type to check, type to change the move to, etc, etc, -1
	db FIRE, FIRE, 			WATER, WATER, 			FLYING, FLYING, 	-1				; Kindle Clash -> Tide Clash, Flutter Clap
	db NORMAL, FIGHTING, 	FIGHTING, FIGHTING, 	ROCK, ROCK, 		DARK, ROCK, -1	; Cross Chop -> Stone Edge
	db BUG, NORMAL, 		FLYING, FLYING, 		NORMAL, NORMAL, 	-1				; Double Edge -> Brave Bird
	db -1

VariableMoves::
	db FIRE_PLAY
	db CROSS_CHOP
	db DOUBLE_EDGE
	db -1

FirePlayNames:
	db "Flutter Clap@"
	db "Kindle Clash@"
	db "Tide Clash@"
	db "@"
