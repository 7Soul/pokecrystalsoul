	db LUGIA ; 249

	db 106,  90, 130, 110,  90, 154
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FLYING ; type
	db GROWTH_SLOW << 5 | BASE_EXP_EXTREME << 2 | CATCH_RATE_VERY_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 120 ; step cycles to hatch
	INCBIN "gfx/pokemon/lugia/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_NONE, EGG_NONE ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, FEATHERGALE, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, PSYCHIC_M, SHADOW_BALL, SWAGGER, SWIFT, PSYWAVE, AIR_SLASH, HYPER_SONAR, FLY, REST, SNORE, SLEEP_TALK, HARMONY
	; end
