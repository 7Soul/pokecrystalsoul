	db CROCONAW ; 159

	db  65,  80,  80,  58,  59,  63
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db GROWTH_MEDIUM_SLOW << 5 | BASE_EXP_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/croconaw/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROAR, ROCK_SMASH, HIDDEN_POWER, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, AQUA_TAIL, EARTHQUAKE, DIG, MUD_BOMB, DOUBLE_TEAM, SWAGGER, WATER_GUN, SANDSTORM, BRICK_BREAK, ATTRACT, CRUNCH, ROCK_TOMB, JET_STREAM, HAMMER_ARM, SURF, ICE_BEAM
	; end
