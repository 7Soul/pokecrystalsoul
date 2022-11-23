	db CLEFFA ; 173

	db  50,  25,  28,  15,  45,  55
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db GROWTH_FAST << 5 | BASE_EXP_VERY_LOW << 2 | CATCH_RATE_MEDIUM
	db MYSTERYBERRY, CUTE_RIBBON ; items
	db GENDER_F75 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/cleffa/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_NONE, EGG_NONE ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, WATER_GUN, DEFENSE_CURL, DREAM_EATER, POWER_GEM, ATTRACT, CRUNCH, MAGICAL_LEAF, REST, SNORE, SLEEP_TALK
	; end
