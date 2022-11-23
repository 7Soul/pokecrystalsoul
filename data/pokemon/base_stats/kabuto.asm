	db KABUTO ; 140

	db  30,  80,  90,  55,  55,  45
	;   hp  atk  def  spd  sat  sdf

	db ROCK, WATER ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_MEDIUM << 2 | CATCH_RATE_HARD
	db NO_ITEM, ACCELEROCK ; items
	db GENDER_F12_5 ; gender ratio
	db 30 ; step cycles to hatch
	INCBIN "gfx/pokemon/kabuto/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_WATER_1, EGG_WATER_3 ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROCK_SMASH, HIDDEN_POWER, FELL_STINGER, BLIZZARD, ICY_WIND, PROTECT, GIGA_DRAIN, ENDURE, AQUA_TAIL, EARTHQUAKE, DIG, MUD_BOMB, DOUBLE_TEAM, SWAGGER, WATER_GUN, SANDSTORM, ATTRACT, CRUNCH, ROCK_TOMB, JET_STREAM, X_SCISSOR, SURF, ICE_BEAM
	; end
