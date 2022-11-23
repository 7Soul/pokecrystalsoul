	db GIRAFARIG ; 203

	db  70,  80,  65,  85,  90,  65
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, NORMAL ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/girafarig/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_GROUND, EGG_GROUND ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ZAP_CANNON, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, PRISM_LIGHT, THUNDER, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SWIFT, DREAM_EATER, POWER_GEM, CRUNCH, NIGHTMARE, PSYWAVE, HYPER_SONAR, THUNDERBOLT, REST, SNORE, SLEEP_TALK
	; end
