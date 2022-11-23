	db SCIZOR ; 212

	db  70, 130, 100,  65,  55,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, STEEL ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_ULTRA_HIGH << 2 | CATCH_RATE_VERY_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/scizor/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_BUG, EGG_BUG ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, FELL_STINGER, FEATHERGALE, HYPER_BEAM, PROTECT, ENDURE, LEAF_SHIELD, DOUBLE_TEAM, SWAGGER, SWIFT, BRICK_BREAK, CRUNCH, AIR_SLASH, HAMMER_ARM, X_SCISSOR, FLY
	; end
