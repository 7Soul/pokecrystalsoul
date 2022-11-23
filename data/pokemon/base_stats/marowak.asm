	db MAROWAK ; 105

	db  60,  85, 110,  45,  50,  90
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, THICK_CLUB ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/marowak/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, HIDDEN_POWER, SUNNY_DAY, PROTECT, ENDURE, LEAF_SHIELD, EARTHQUAKE, DIG, SWAGGER, ATTRACT
	; end
