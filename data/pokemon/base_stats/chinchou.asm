	db CHINCHOU ; 170

	db  75,  38,  38,  67,  56,  56
	;   hp  atk  def  spd  sat  sdf

	db WATER, ELECTRIC ; type
	db 190 ; catch rate
	db 90 ; base exp
	db NO_ITEM, SHINY_CORAL ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/chinchou/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_2, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm CURSE, ZAP_CANNON, HIDDEN_POWER, PROTECT, RAIN_DANCE, ENDURE, PRISM_LIGHT, AQUA_TAIL, THUNDER, PSYCHIC_M, SWAGGER, WATER_GUN, DREAM_EATER, ATTRACT, NIGHTMARE, JET_STREAM, WILD_STORM, PSYWAVE, SURF, THUNDERBOLT, ICE_BEAM, REST, SNORE, SLEEP_TALK, HARMONY
	; end
