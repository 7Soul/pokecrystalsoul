	db ONIX ; 095

	db  75, 105, 160,  80,  55,  50
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_MEDIUM << 2 | CATCH_RATE_MEDIUM
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/onix/front.dimensions"
	db 0, 0, 0, 0
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, ENDURE, EARTHQUAKE, DIG, MUD_BOMB, SWAGGER, SANDSTORM, ATTRACT, CRUNCH, ROCK_TOMB
	; end
