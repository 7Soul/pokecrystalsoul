	db ODDISH ; 043

	db  45,  50,  55,  30,  75,  65
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON ; type
	db GROWTH_MEDIUM_SLOW << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_EASY
	db NO_ITEM, GRASSWHISTLE ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/oddish/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_PLANT, EGG_PLANT ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, VENOSHOCK, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, LEAF_SHIELD, SOLARBEAM, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, ATTRACT
	; end
