	db HO_OH ; 250

	db 106, 130,  90,  90, 110, 154
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FLYING ; type
	db 3 ; catch rate
	db 220 ; base exp
	db SACRED_ASH, SACRED_ASH ; items
	db GENDER_UNKNOWN ; gender ratio
	db 120 ; step cycles to hatch
	INCBIN "gfx/pokemon/ho_oh/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, HIDDEN_POWER, SUNNY_DAY, FELL_STINGER, FEATHERGALE, HYPER_BEAM, PROTECT, ENDURE, PRISM_LIGHT, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, FIRE_BLAST, SWIFT, ATTRACT, FURY_CUTTER, WILD_STORM, PSYWAVE, INFERNO, AIR_SLASH, X_SCISSOR, FLY, FLAMETHROWER
	; end
