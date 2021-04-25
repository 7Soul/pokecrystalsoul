	db CLEFABLE ; 036

	db  95,  70,  73,  60,  85,  90
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db GROWTH_FAST << 5 | BASE_EXP_HIGH << 2 | CATCH_RATE_VERY_HARD
	db MYSTERYBERRY, MOON_STONE ; items
	db GENDER_F75 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/clefable/front.dimensions"
	db 0, 0, 0, 0
	dn EGG_FAIRY, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, ZAP_CANNON, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, THUNDER, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, WATER_GUN, DEFENSE_CURL, DREAM_EATER, BRICK_BREAK, POWER_GEM, ATTRACT, CRUNCH, NIGHTMARE, PSYWAVE, HAMMER_ARM, MAGICAL_LEAF, HYPER_SONAR, FLAMETHROWER, THUNDERBOLT, ICE_BEAM, REST, SNORE, SLEEP_TALK
	; end
