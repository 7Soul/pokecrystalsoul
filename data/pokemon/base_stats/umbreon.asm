	db UMBREON ; 197

	db  95,  65, 110,  65,  60, 130
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_ULTRA_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 35 ; step cycles to hatch
	INCBIN "gfx/pokemon/umbreon/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_GROUND, EGG_GROUND ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, DIG, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SWIFT, DREAM_EATER, POWER_GEM, CRUNCH, NIGHTMARE, PSYWAVE, REST, SNORE, SLEEP_TALK, HARMONY
	; end
