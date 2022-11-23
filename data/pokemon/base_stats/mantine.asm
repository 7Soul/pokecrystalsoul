	db MANTINE ; 226

	db  65,  40,  70,  70,  80, 140
	;   hp  atk  def  spd  sat  sdf

	db WATER, FLYING ; type
	db GROWTH_SLOW << 5 | BASE_EXP_VERY_HIGH << 2 | CATCH_RATE_VERY_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/mantine/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_WATER_1, EGG_WATER_1 ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, HIDDEN_POWER, FEATHERGALE, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, DOUBLE_TEAM, SWAGGER, WATER_GUN, SWIFT, ATTRACT, JET_STREAM, AIR_SLASH, HYPER_SONAR, SURF, ICE_BEAM, REST, SNORE, SLEEP_TALK, HARMONY
	; end
