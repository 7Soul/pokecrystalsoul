	db JYNX ; 124

	db  65,  50,  35,  95, 115,  95
	;   hp  atk  def  spd  sat  sdf

	db ICE, PSYCHIC ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_HIGH << 2 | CATCH_RATE_HARD
	db ICE_BERRY, ICE_BERRY ; items
	db GENDER_F100 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/jynx/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, HIDDEN_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, DREAM_EATER, POWER_GEM, ATTRACT, CRUNCH, NIGHTMARE, PSYWAVE, ICE_BEAM, REST, SNORE, SLEEP_TALK, HARMONY
	; end
