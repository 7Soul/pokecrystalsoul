	db VICTREEBEL ; 071

	db  80, 120,  65,  70, 95,  60
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON ; type
	db GROWTH_MEDIUM_SLOW << 5 | BASE_EXP_ULTRA_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/victreebel/front.dimensions"
	db 0, 0, 0, 0
	dn EGG_PLANT, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm CURSE, HIDDEN_POWER, PROTECT, RAIN_DANCE, ENDURE, SWAGGER, ATTRACT
	; end
