	db BULBASAUR ; 001

	db  45,  49,  44,  45,  65,  60
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db GROWTH_MEDIUM_SLOW << 5 | BASE_EXP_VERY_LOW << 2 | CATCH_RATE_HARD
	db NO_ITEM, GRASSWHISTLE ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/bulbasaur/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_MONSTER, EGG_PLANT ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	dn ACTION_ROCKSMASH, ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, VENOSHOCK, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, FELL_STINGER, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, LEAF_SHIELD, SOLARBEAM, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, DEFENSE_CURL, ATTRACT, CRUNCH, X_SCISSOR
	; end
