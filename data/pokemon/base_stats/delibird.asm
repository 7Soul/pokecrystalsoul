	db DELIBIRD ; 225

	db  100,  85,  45,  75,  90,  125
	;   hp  atk  def  spd  sat  sdf

	db ICE, FLYING ; type
	db GROWTH_FAST << 5 | BASE_EXP_ULTRA_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/delibird/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, PROTECT, RAIN_DANCE, ENDURE, DIG, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, WATER_GUN, SWIFT, DREAM_EATER, ATTRACT, CRUNCH, NIGHTMARE, PSYWAVE, ICE_BEAM, REST, SNORE, SLEEP_TALK, HARMONY
	; end
