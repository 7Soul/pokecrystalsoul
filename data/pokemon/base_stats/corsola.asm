	db CORSOLA ; 222

	db  55,  55,  105,  35,  90,  85
	;   hp  atk   def   spd  sat  sdf

	db WATER, ROCK ; type
	db 60 ; catch rate
	db 113 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F75 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/corsola/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_FAST ; growth rate
	dn EGG_WATER_1, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, ROCK_SMASH, HIDDEN_POWER, PROTECT, ENDURE, EARTHQUAKE, MEGAHORN, DIG, PSYCHIC_M, SHADOW_BALL, MUD_BOMB, DOUBLE_TEAM, SWAGGER, WATER_GUN, SANDSTORM, DEFENSE_CURL, DREAM_EATER, POWER_GEM, ATTRACT, CRUNCH, NIGHTMARE, ROCK_TOMB, JET_STREAM, PSYWAVE, SURF, ICE_BEAM, REST, SNORE, SLEEP_TALK, HARMONY
	; end
