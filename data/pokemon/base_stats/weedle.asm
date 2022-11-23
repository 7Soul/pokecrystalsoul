	db WEEDLE ; 013

	db  40,  35,  30,  50,  20,  20
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_VERY_LOW << 2 | CATCH_RATE_EASY
	db NO_ITEM, TOUGH_HORN ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/weedle/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_BUG, EGG_BUG ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, HIDDEN_POWER, SUNNY_DAY, FELL_STINGER, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, ATTRACT
	; end
