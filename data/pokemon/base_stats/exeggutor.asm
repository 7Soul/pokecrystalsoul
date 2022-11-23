	db EXEGGUTOR ; 103

	db  95,  95,  85,  55, 125,  65
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db GROWTH_SLOW << 5 | BASE_EXP_ULTRA_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/exeggutor/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_PLANT, EGG_PLANT ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, SOLARBEAM, EARTHQUAKE, PSYCHIC_M, SHADOW_BALL, MUD_BOMB, DOUBLE_TEAM, SWAGGER, DREAM_EATER, POWER_GEM, NIGHTMARE, PSYWAVE, MAGICAL_LEAF, REST, SNORE, SLEEP_TALK
	; end
