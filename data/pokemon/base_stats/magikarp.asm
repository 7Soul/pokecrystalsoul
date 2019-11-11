	db MAGIKARP ; 129

	db  20,  10,  55,  80,  15,  20
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 255 ; catch rate
	db 20 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/magikarp/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_2, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm CURSE, PSYCH_UP, HIDDEN_POWER, PROTECT, RAIN_DANCE, ENDURE, SWAGGER, SWIFT, ATTRACT, HARMONY
	; end
