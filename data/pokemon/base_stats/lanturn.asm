	db LANTURN ; 171

	db 125,  58,  58,  67,  76,  76
	;   hp  atk  def  spd  sat  sdf

	db WATER, ELECTRIC ; type
	db 75 ; catch rate
	db 156 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/lanturn/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_2, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm CURSE, ZAP_CANNON, HIDDEN_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, PRISM_LIGHT, AQUA_TAIL, THUNDER, PSYCHIC_M, DOUBLE_TEAM, SWAGGER, WATER_GUN, DREAM_EATER, ATTRACT, NIGHTMARE, JET_STREAM, WILD_STORM, PSYWAVE, SURF, THUNDERBOLT, ICE_BEAM, REST, SNORE, SLEEP_TALK, HARMONY
	; end
