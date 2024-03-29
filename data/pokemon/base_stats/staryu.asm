	db STARYU ; 120

	db  30,  45,  55,  85,  75,  55
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db GROWTH_SLOW << 5 | BASE_EXP_MEDIUM << 2 | CATCH_RATE_EASY
	db STARDUST, STAR_PIECE ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/staryu/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, ZAP_CANNON, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, PRISM_LIGHT, PSYCHIC_M, SHADOW_BALL, MUD_BOMB, DOUBLE_TEAM, SWAGGER, WATER_GUN, SWIFT, DREAM_EATER, POWER_GEM, ATTRACT, CRUNCH, JET_STREAM, PSYWAVE, SURF, ICE_BEAM, REST, SNORE, SLEEP_TALK, HARMONY
	; end
