	db MUK ; 089

	db 105, 105,  75,  50,  65, 100
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_VERY_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NUGGET ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/muk/front.dimensions"
	db 0, 0, 0, 0
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm CURSE, VENOSHOCK, ZAP_CANNON, HIDDEN_POWER, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, SOLARBEAM, THUNDER, PSYCHIC_M, SHADOW_BALL, SWAGGER, WATER_GUN, SLUDGE_BOMB, DREAM_EATER, POWER_GEM, ATTRACT, NIGHTMARE, JET_STREAM, WILD_STORM, PSYWAVE, THUNDERBOLT, ICE_BEAM
	; end
