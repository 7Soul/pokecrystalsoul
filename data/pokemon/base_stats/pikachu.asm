	db PIKACHU ; 025

	db  35,  55,  30,  90,  50,  40
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_MEDIUM
	db BERRY, BATTERY ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/pikachu/front.dimensions"
	db TRAIT_CONTACT_PRZ, TRAIT_SPEED_STATUSED, TRAIT_BOOST_ELECTRIC_SPEED, TRAIT_BOOST_SPD_ACC_NOT_ATTACKING
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ZAP_CANNON, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, PROTECT, RAIN_DANCE, ENDURE, THUNDER, DIG, DOUBLE_TEAM, SWAGGER, SWIFT, BRICK_BREAK, ATTRACT, WILD_STORM, HAMMER_ARM, THUNDERBOLT, REST
	; end
