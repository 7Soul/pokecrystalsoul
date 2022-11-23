	db BEEDRILL ; 015

	db  75,  95,  40,  80,  45,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_VERY_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/beedrill/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_BUG, EGG_BUG ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, VENOSHOCK, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, FELL_STINGER, FEATHERGALE, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, SWIFT, CRUNCH, AIR_SLASH, X_SCISSOR, HYPER_SONAR, FLY
	; end
