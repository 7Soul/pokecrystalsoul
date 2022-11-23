	db PSYDUCK ; 054

	db  50,  52,  48,  55,  65,  50
	;   hp  atk  def  spd  sat  sdf

	db WATER, PSYCHIC ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_MEDIUM
	db NO_ITEM, SHINY_CORAL ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/psyduck/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, PRISM_LIGHT, AQUA_TAIL, DIG, PSYCHIC_M, SHADOW_BALL, SWAGGER, WATER_GUN, SWIFT, DREAM_EATER, POWER_GEM, NIGHTMARE, JET_STREAM, PSYWAVE, SURF, ICE_BEAM, REST, SNORE, SLEEP_TALK
	; end
