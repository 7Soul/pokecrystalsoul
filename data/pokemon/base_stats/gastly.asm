	db GASTLY ; 092

	db  30,  35,  30,  80, 100,  35
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db GROWTH_MEDIUM_SLOW << 5 | BASE_EXP_MEDIUM << 2 | CATCH_RATE_MEDIUM
	db NO_ITEM, DARK_MIRROR ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/gastly/front.dimensions"
	db 0, 0, 0, 0
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm CURSE, VENOSHOCK, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, THUNDER, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, DREAM_EATER, POWER_GEM, NIGHTMARE, WILD_STORM, PSYWAVE, THUNDERBOLT
	; end
