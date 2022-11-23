	db RAIKOU ; 243

	db  80,  75,  55, 112, 92, 90
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db GROWTH_SLOW << 5 | BASE_EXP_EXTREME << 2 | CATCH_RATE_VERY_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/raikou/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_NONE, EGG_NONE ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ZAP_CANNON, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, THUNDER, DIG, PSYCHIC_M, DOUBLE_TEAM, SWAGGER, SWIFT, POWER_GEM, ATTRACT, CRUNCH, WILD_STORM, PSYWAVE, THUNDERBOLT, REST, SNORE, SLEEP_TALK, HARMONY
	; end
