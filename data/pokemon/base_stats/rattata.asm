	db RATTATA ; 019

	db  30,  56,  35,  72,  25,  35
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_VERY_LOW << 2 | CATCH_RATE_EASY
	db NO_ITEM, CUTE_RIBBON ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/rattata/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_GROUND, EGG_GROUND ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, THUNDER, DIG, DOUBLE_TEAM, SWAGGER, WATER_GUN, SWIFT, ATTRACT, CRUNCH, WILD_STORM, THUNDERBOLT, REST
	; end
