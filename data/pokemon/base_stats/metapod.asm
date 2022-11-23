	db METAPOD ; 011

	db  50,  20,  55,  30,  25,  25
	;   hp  atk  def  spd  sat  sdf

	db BUG, BUG ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_MEDIUM
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/metapod/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_BUG, EGG_BUG ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, FELL_STINGER, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, LEAF_SHIELD, MEGAHORN, SWAGGER, DEFENSE_CURL, ATTRACT, CRUNCH
	; end
