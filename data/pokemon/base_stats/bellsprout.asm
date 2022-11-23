	db BELLSPROUT ; 069

	db  55,  80,  35,  40,  65,  30
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON ; type
	db GROWTH_MEDIUM_SLOW << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_EASY
	db NO_ITEM, GRASSWHISTLE ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/bellsprout/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_PLANT, EGG_PLANT ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, VENOSHOCK, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, FELL_STINGER, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, SOLARBEAM, SWAGGER, SLUDGE_BOMB, ATTRACT, CRUNCH, X_SCISSOR
	; end
