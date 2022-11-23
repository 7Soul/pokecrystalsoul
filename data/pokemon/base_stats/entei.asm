	db ENTEI ; 244

	db 115, 115,  85, 100,  90,  75
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db GROWTH_SLOW << 5 | BASE_EXP_EXTREME << 2 | CATCH_RATE_VERY_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/entei/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_NONE, EGG_NONE ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, ENDURE, DIG, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, FIRE_BLAST, SWIFT, ATTRACT, CRUNCH, PSYWAVE, FLAMETHROWER, REST, SNORE, SLEEP_TALK, HARMONY
	; end
