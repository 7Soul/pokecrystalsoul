	db QWILFISH ; 211

	db  55,  95,  105,  65,  55,  95
	;   hp  atk  def  spd  sat  sdf

	db WATER, POISON ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_MEDIUM << 2 | CATCH_RATE_MEDIUM
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/qwilfish/front.dimensions"
	db 0, 0, 0, 0
	dn EGG_WATER_2, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, VENOSHOCK, HIDDEN_POWER, FELL_STINGER, PROTECT, RAIN_DANCE, ENDURE, AQUA_TAIL, SWAGGER, WATER_GUN, SLUDGE_BOMB, SWIFT, DEFENSE_CURL, ATTRACT, JET_STREAM, SURF
	; end
