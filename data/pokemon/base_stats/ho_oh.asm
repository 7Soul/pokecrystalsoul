	db HO_OH ; 250

	db 106, 130,  90,  90, 110, 154
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FLYING ; type
	db GROWTH_SLOW << 5 | BASE_EXP_EXTREME << 2 | CATCH_RATE_VERY_HARD
	db SACRED_ASH, SACRED_ASH ; items
	db GENDER_UNKNOWN ; gender ratio
	db 120 ; step cycles to hatch
	INCBIN "gfx/pokemon/ho_oh/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_NONE, EGG_NONE ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, HIDDEN_POWER, SUNNY_DAY, FELL_STINGER, FEATHERGALE, HYPER_BEAM, PROTECT, ENDURE, PRISM_LIGHT, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, FIRE_BLAST, SWIFT, ATTRACT, WILD_STORM, PSYWAVE, INFERNO, AIR_SLASH, X_SCISSOR, FLY, FLAMETHROWER
	; end
