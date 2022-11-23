	db LEDYBA ; 165

	db  40,  30,  30,  55,  40,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING ; type
	db GROWTH_FAST << 5 | BASE_EXP_VERY_LOW << 2 | CATCH_RATE_EASY
	db NO_ITEM, TOUGH_HORN ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/ledyba/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_BUG, EGG_BUG ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, FEATHERGALE, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SWIFT, THUNDERPUNCH, BRICK_BREAK, CRUNCH, FIRE_PUNCH, AIR_SLASH, HAMMER_ARM, HYPER_SONAR, FLY
	; end
