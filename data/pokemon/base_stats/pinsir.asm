	db PINSIR ; 127

	db  65, 125, 100,  85,  55,  70
	;   hp  atk  def  spd  sat  sdf

	db BUG, BUG ; type
	db GROWTH_SLOW << 5 | BASE_EXP_VERY_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/pinsir/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_BUG, EGG_BUG ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, FELL_STINGER, FEATHERGALE, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, MEGAHORN, SWAGGER, BRICK_BREAK, CRUNCH, AIR_SLASH, HAMMER_ARM, X_SCISSOR, REST, SNORE, SLEEP_TALK, HARMONY
	; end
