	db MEOWTH ; 052

	db  40,  45,  35,  90,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_EASY
	db NO_ITEM, CUTE_RIBBON ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/meowth/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_GROUND, EGG_GROUND ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ZAP_CANNON, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, FELL_STINGER, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, PRISM_LIGHT, THUNDER, DIG, MUD_BOMB, DOUBLE_TEAM, SWAGGER, WATER_GUN, SWIFT, BRICK_BREAK, ATTRACT, CRUNCH, HAMMER_ARM, X_SCISSOR
	; end
