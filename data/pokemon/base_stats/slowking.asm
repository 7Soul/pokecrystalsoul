	db SLOWKING ; 199

	db  95,  75,  80,  30, 100, 110
	;   hp  atk  def  spd  sat  sdf

	db WATER, PSYCHIC ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_VERY_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, KINGS_ROCK ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/slowking/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, EARTHQUAKE, DIG, PSYCHIC_M, SHADOW_BALL, MUD_BOMB, ICE_PUNCH, SWAGGER, WATER_GUN, SANDSTORM, FIRE_BLAST, SWIFT, DREAM_EATER, POWER_GEM, NIGHTMARE, ROCK_TOMB, JET_STREAM, PSYWAVE, SURF, FLAMETHROWER, ICE_BEAM, REST, SNORE, SLEEP_TALK
	; end
