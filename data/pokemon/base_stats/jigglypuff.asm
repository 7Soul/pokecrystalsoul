	db JIGGLYPUFF ; 039

	db 115,  45,  20,  20,  45,  25
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db GROWTH_FAST << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_EASY
	db NO_ITEM, CUTE_RIBBON ; items
	db GENDER_F75 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/jigglypuff/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_FAIRY, EGG_FAIRY ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, ZAP_CANNON, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, EARTHQUAKE, PSYCHIC_M, SHADOW_BALL, MUD_BOMB, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, WATER_GUN, SANDSTORM, DEFENSE_CURL, THUNDERPUNCH, DREAM_EATER, BRICK_BREAK, POWER_GEM, ATTRACT, CRUNCH, FIRE_PUNCH, NIGHTMARE, ROCK_TOMB, PSYWAVE, HAMMER_ARM, MAGICAL_LEAF, REST, SNORE, SLEEP_TALK
	; end
