	db TOGETIC ; 176

	db  55,  40,  85,  40,  80, 105
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db GROWTH_FAST << 5 | BASE_EXP_MEDIUM << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/togetic/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_FLYING, EGG_FAIRY ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, FEATHERGALE, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, DOUBLE_TEAM, SWAGGER, SWIFT, ATTRACT, INFERNO, AIR_SLASH, FLY, FLAMETHROWER, REST, SNORE, SLEEP_TALK
	; end
