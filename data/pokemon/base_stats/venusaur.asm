	db VENUSAUR ; 003

	db  80,  82,  78,  80, 100,  95
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db GROWTH_MEDIUM_SLOW << 5 | BASE_EXP_EXTREME << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/venusaur/front.dimensions"
	db 0, 0, 0, 0
	dn EGG_MONSTER, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, VENOSHOCK, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, FELL_STINGER, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, LEAF_SHIELD, SOLARBEAM, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, DEFENSE_CURL, ATTRACT, CRUNCH, X_SCISSOR
	; end
