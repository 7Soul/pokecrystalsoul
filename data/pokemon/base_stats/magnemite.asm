	db MAGNEMITE ; 081

	db  25,  35,  70,  45,  95,  55
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, STEEL ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_EASY
	db NO_ITEM, BATTERY ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/magnemite/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, PROTECT, RAIN_DANCE, ENDURE, PRISM_LIGHT, THUNDER, DOUBLE_TEAM, SWAGGER, SWIFT, ATTRACT, WILD_STORM, HYPER_SONAR, THUNDERBOLT, HARMONY
	; end
