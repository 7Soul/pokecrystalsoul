	db TYRANITAR ; 248

	db 100, 134, 110,  61,  95, 100
	;   hp  atk  def  spd  sat  sdf

	db ROCK, DARK ; type
	db 45 ; catch rate
	db 218 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/tyranitar/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, FELL_STINGER, HYPER_BEAM, PROTECT, ENDURE, LEAF_SHIELD, AQUA_TAIL, EARTHQUAKE, MUD_BOMB, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SANDSTORM, THUNDERPUNCH, BRICK_BREAK, CRUNCH, FIRE_PUNCH, FURY_CUTTER, ROCK_TOMB, HAMMER_ARM, X_SCISSOR, FLAMETHROWER
	; end
