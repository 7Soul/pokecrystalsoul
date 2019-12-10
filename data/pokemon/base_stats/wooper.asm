	db WOOPER ; 194

	db  55,  45,  45,  15,  25,  25
	;   hp  atk  def  spd  sat  sdf

	db WATER, GROUND ; type
	db 255 ; catch rate
	db 52 ; base exp
	db NO_ITEM, SHINY_CORAL ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/wooper/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, VENOSHOCK, ROCK_SMASH, HIDDEN_POWER, PROTECT, RAIN_DANCE, ENDURE, AQUA_TAIL, EARTHQUAKE, MUD_BOMB, SWAGGER, WATER_GUN, SLUDGE_BOMB, SANDSTORM, DEFENSE_CURL, ATTRACT, CRUNCH, ROCK_TOMB, JET_STREAM, SURF, REST, SNORE, SLEEP_TALK, HARMONY
	; end
