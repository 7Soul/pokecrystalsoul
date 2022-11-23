	db BLISSEY ; 242

	db 200,  30,  30,  55,  75, 135
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db GROWTH_FAST << 5 | BASE_EXP_EXTREME << 2 | CATCH_RATE_VERY_HARD
	db NO_ITEM, LUCKY_EGG ; items
	db GENDER_F100 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/blissey/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_FAIRY, EGG_FAIRY ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, THUNDER, EARTHQUAKE, PSYCHIC_M, SHADOW_BALL, MUD_BOMB, ICE_PUNCH, SWAGGER, SANDSTORM, DEFENSE_CURL, THUNDERPUNCH, BRICK_BREAK, POWER_GEM, ATTRACT, CRUNCH, FIRE_PUNCH, ROCK_TOMB, PSYWAVE, HAMMER_ARM, MAGICAL_LEAF, HYPER_SONAR, FLAMETHROWER, THUNDERBOLT, ICE_BEAM, REST, SNORE, SLEEP_TALK
	; end
