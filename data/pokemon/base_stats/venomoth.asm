	db VENOMOTH ; 049

	db  80,  65,  60,  90,  105,  75
	;   hp  atk  def  spd  sat  sdf

	db BUG, DARK ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/venomoth/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_BUG, EGG_BUG ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, HIDDEN_POWER, SUNNY_DAY, FEATHERGALE, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, SOLARBEAM, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SWIFT, AIR_SLASH, HYPER_SONAR, FLY, REST, SNORE, SLEEP_TALK, HARMONY
	; end
