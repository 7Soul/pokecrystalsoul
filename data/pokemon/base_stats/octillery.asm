	db OCTILLERY ; 224

	db  75, 105,  75,  45, 105,  75
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_VERY_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/octillery/front.dimensions"
	db 0, 0, 0, 0
	dn EGG_WATER_1, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm CURSE, HIDDEN_POWER, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, AQUA_TAIL, DOUBLE_TEAM, SWAGGER, WATER_GUN, DEFENSE_CURL, ATTRACT, JET_STREAM, SURF, ICE_BEAM, REST, SNORE, SLEEP_TALK, HARMONY
	; end
