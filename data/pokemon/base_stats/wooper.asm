	db WOOPER ; 194

	db  55,  45,  45,  15,  25,  25
	;   hp  atk  def  spd  sat  sdf

	db WATER, GROUND ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_VERY_LOW << 2 | CATCH_RATE_EASY
	db NO_ITEM, SHINY_CORAL ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/wooper/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, VENOSHOCK, ROCK_SMASH, HIDDEN_POWER, PROTECT, RAIN_DANCE, ENDURE, AQUA_TAIL, EARTHQUAKE, MUD_BOMB, SWAGGER, WATER_GUN, SLUDGE_BOMB, SANDSTORM, DEFENSE_CURL, ATTRACT, CRUNCH, ROCK_TOMB, JET_STREAM, SURF, REST, SNORE, SLEEP_TALK, HARMONY
	; end
