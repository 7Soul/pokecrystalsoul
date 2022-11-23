	db FARFETCH_D ; 083

	db  68,  65,  55,  60,  58,  62
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_MEDIUM << 2 | CATCH_RATE_HARD
	db STICK, LEEK ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/farfetch_d/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_FLYING, EGG_GROUND ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, FELL_STINGER, FEATHERGALE, PROTECT, RAIN_DANCE, ENDURE, DOUBLE_TEAM, SWAGGER, SWIFT, ATTRACT, CRUNCH, AIR_SLASH, X_SCISSOR, FLY
	; end
