	db AZUMARILL ; 184

	db 100,  50,  80,  50,  75,  80
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db GROWTH_FAST << 5 | BASE_EXP_VERY_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/azumarill/front.dimensions"
	db 0, 0, 0, 0
	dn EGG_WATER_1, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, ROCK_SMASH, HIDDEN_POWER, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, AQUA_TAIL, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, WATER_GUN, SWIFT, BRICK_BREAK, ATTRACT, CRUNCH, JET_STREAM, HAMMER_ARM, HYPER_SONAR, ICE_BEAM, REST, SNORE, SLEEP_TALK, HARMONY
	; end
