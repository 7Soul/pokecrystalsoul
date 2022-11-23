	db PARASECT ; 047

	db  65,  95,  95,  30,  65,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, GRASS ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_MEDIUM << 2 | CATCH_RATE_HARD
	db TINYMUSHROOM, BIG_MUSHROOM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/parasect/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_BUG, EGG_PLANT ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, HIDDEN_POWER, SUNNY_DAY, FELL_STINGER, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, SOLARBEAM, DIG, DOUBLE_TEAM, SWAGGER, X_SCISSOR
	; end
