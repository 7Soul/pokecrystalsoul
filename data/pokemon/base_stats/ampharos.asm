	db AMPHAROS ; 181

	db  90,  80,  75,  55, 100,  90
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db GROWTH_MEDIUM_SLOW << 5 | BASE_EXP_ULTRA_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/ampharos/front.dimensions"
	db 0, 0, 0, 0
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, PRISM_LIGHT, THUNDER, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SWIFT, THUNDERPUNCH, BRICK_BREAK, POWER_GEM, ATTRACT, FIRE_PUNCH, WILD_STORM, HAMMER_ARM, HYPER_SONAR, THUNDERBOLT, REST
	; end
