	db RAICHU ; 026

	db  60,  90,  55, 100,  90,  80
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, BERRY ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/raichu/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ZAP_CANNON, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, THUNDER, DIG, DOUBLE_TEAM, SWAGGER, SWIFT, BRICK_BREAK, ATTRACT, WILD_STORM, HAMMER_ARM, THUNDERBOLT, REST
	; end
