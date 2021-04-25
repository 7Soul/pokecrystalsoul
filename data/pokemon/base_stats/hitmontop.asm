	db HITMONTOP ; 237

	db  50, 105,  95,  70,  35, 110
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F0 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/hitmontop/front.dimensions"
	db 0, 0, 0, 0
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, EARTHQUAKE, DIG, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SANDSTORM, SWIFT, BRICK_BREAK, ATTRACT, CRUNCH, ROCK_TOMB, HAMMER_ARM
	; end
