	db FEAROW ; 022

	db  65,  90,  65, 100,  61,  61
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_VERY_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, SHARP_BEAK ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/fearow/front.dimensions"
	db 0, 0, 0, 0
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, FEATHERGALE, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SWIFT, ATTRACT, CRUNCH, AIR_SLASH, FLY
	; end
