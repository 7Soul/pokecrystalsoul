	db TYROGUE ; 236

	db  35,  45,  45,  45,  45,  45
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_HARD
	db NO_ITEM, DUMBELL ; items
	db GENDER_F0 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/tyrogue/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_NONE, EGG_NONE ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SWIFT, THUNDERPUNCH, BRICK_BREAK, ATTRACT, CRUNCH, FIRE_PUNCH, HAMMER_ARM
	; end
