	db TANGELA ; 114

	db  70,  55, 115,  60, 105,  40
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_VERY_HIGH << 2 | CATCH_RATE_MEDIUM
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/tangela/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_PLANT, EGG_PLANT ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, VENOSHOCK, PSYCH_UP, HIDDEN_POWER, FELL_STINGER, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, SOLARBEAM, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, ATTRACT, X_SCISSOR
	; end
