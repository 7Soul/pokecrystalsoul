	db LARVITAR ; 246

	db  50,  64,  50,  41,  45,  50
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND ; type
	db GROWTH_SLOW << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_MEDIUM
	db NO_ITEM, ACCELEROCK ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/larvitar/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROAR, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, ENDURE, LEAF_SHIELD, EARTHQUAKE, MEGAHORN, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SANDSTORM, BRICK_BREAK, ATTRACT, CRUNCH, ROCK_TOMB, HAMMER_ARM, FLAMETHROWER
	; end
