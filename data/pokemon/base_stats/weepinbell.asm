	db WEEPINBELL ; 070

	db  65, 100,  50,  55,  80,  45
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FIGHTING ; type
	db 120 ; catch rate
	db 151 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/weepinbell/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_PLANT, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm CURSE, HIDDEN_POWER, PROTECT, RAIN_DANCE, ENDURE, SWAGGER, ATTRACT
	; end
