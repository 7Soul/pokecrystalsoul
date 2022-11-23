	db QUAGSIRE ; 195

	db  95,  85,  85,  35,  65,  65
	;   hp  atk  def  spd  sat  sdf

	db WATER, GROUND ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/quagsire/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, VENOSHOCK, ROCK_SMASH, HIDDEN_POWER, PROTECT, RAIN_DANCE, ENDURE, AQUA_TAIL, EARTHQUAKE, MUD_BOMB, SWAGGER, WATER_GUN, SLUDGE_BOMB, SANDSTORM, DEFENSE_CURL, ATTRACT, CRUNCH, ROCK_TOMB, JET_STREAM, SURF, REST, SNORE, SLEEP_TALK, HARMONY
	; end
