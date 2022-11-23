	db LAPRAS ; 131

	db 130,  85,  80,  60,  85,  95
	;   hp  atk  def  spd  sat  sdf

	db WATER, ICE ; type
	db GROWTH_SLOW << 5 | BASE_EXP_EXTREME << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/lapras/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, ZAP_CANNON, HIDDEN_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, PRISM_LIGHT, MEGAHORN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, WATER_GUN, POWER_GEM, ATTRACT, JET_STREAM, PSYWAVE, HYPER_SONAR, SURF, ICE_BEAM, REST, SNORE, SLEEP_TALK, HARMONY
	; end
