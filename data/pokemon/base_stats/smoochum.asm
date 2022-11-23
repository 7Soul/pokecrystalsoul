	db SMOOCHUM ; 238

	db  45,  30,  15,  65,  85,  65
	;   hp  atk  def  spd  sat  sdf

	db ICE, PSYCHIC ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_EASY
	db FROZEN_DEW, EYE_GLYPH ; items
	db GENDER_F100 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/smoochum/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_NONE, EGG_NONE ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, WATER_GUN, DREAM_EATER, POWER_GEM, NIGHTMARE, PSYWAVE, ICE_BEAM
	; end
