	db POLITOED ; 186

	db  100,  75,  75,  70,  105, 100
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db GROWTH_MEDIUM_SLOW << 5 | BASE_EXP_ULTRA_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, KINGS_ROCK ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/politoed/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_WATER_1, EGG_WATER_1 ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, VENOSHOCK, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, WATER_GUN, SLUDGE_BOMB, THUNDERPUNCH, BRICK_BREAK, ATTRACT, CRUNCH, FIRE_PUNCH, JET_STREAM, HAMMER_ARM, HYPER_SONAR, SURF, ICE_BEAM, REST, SNORE, SLEEP_TALK, HARMONY
	; end
