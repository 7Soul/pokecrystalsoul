	db HAUNTER ; 093

	db  45,  50,  45,  95, 115,  55
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db GROWTH_MEDIUM_SLOW << 5 | BASE_EXP_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/haunter/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, VENOSHOCK, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, THUNDER, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, DREAM_EATER, POWER_GEM, NIGHTMARE, WILD_STORM, PSYWAVE, THUNDERBOLT
	; end
