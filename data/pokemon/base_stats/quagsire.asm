	db QUAGSIRE ; 195

	db  95,  85,  85,  35,  65,  65
	;   hp  atk  def  spd  sat  sdf

	db WATER, GROUND ; type
	db 90 ; catch rate
	db 137 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/quagsire/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, VENOSHOCK, ROCK_SMASH, HIDDEN_POWER, PROTECT, RAIN_DANCE, ENDURE, AQUA_TAIL, EARTHQUAKE, MUD_BOMB, SWAGGER, WATER_GUN, SLUDGE_BOMB, SANDSTORM, DEFENSE_CURL, ATTRACT, CRUNCH, ROCK_TOMB, JET_STREAM, SURF, REST, SNORE, SLEEP_TALK, HARMONY
	; end
