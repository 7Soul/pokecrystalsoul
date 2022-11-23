	db GRAVELER ; 075

	db  55,  95, 115,  35,  45,  45
	;   hp  atk  def  spd  sat  sdf

	db ROCK, ROCK ; type
	db GROWTH_MEDIUM_SLOW << 5 | BASE_EXP_HIGH << 2 | CATCH_RATE_MEDIUM
	db NO_ITEM, EVERSTONE ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/graveler/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PROTECT, ENDURE, LEAF_SHIELD, EARTHQUAKE, DIG, MUD_BOMB, SWAGGER, SANDSTORM, FIRE_BLAST, BRICK_BREAK, ATTRACT, CRUNCH, ROCK_TOMB, INFERNO, HAMMER_ARM, FLAMETHROWER
	; end
