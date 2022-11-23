	db MAGMAR ; 126

	db  65,  95,  57,  93, 100,  85
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_VERY_HIGH << 2 | CATCH_RATE_HARD
	db BURNT_BERRY, BURNT_BERRY ; items
	db GENDER_F25 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/magmar/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, VENOSHOCK, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PROTECT, ENDURE, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, FIRE_BLAST, BRICK_BREAK, ATTRACT, CRUNCH, FIRE_PUNCH, INFERNO, HAMMER_ARM, FLAMETHROWER
	; end
