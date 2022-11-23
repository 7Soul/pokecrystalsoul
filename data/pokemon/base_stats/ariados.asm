	db ARIADOS ; 168

	db  70,  90,  70,  50,  60,  70
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON ; type
	db GROWTH_FAST << 5 | BASE_EXP_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/ariados/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_BUG, EGG_BUG ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, VENOSHOCK, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, FELL_STINGER, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, MEGAHORN, DIG, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, CRUNCH, X_SCISSOR
	; end
