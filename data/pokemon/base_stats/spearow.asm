	db SPEAROW ; 021

	db  40,  60,  30,  70,  31,  31
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_VERY_LOW << 2 | CATCH_RATE_EASY
	db NO_ITEM, STEEL_WING ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/spearow/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_FLYING, EGG_FLYING ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, FEATHERGALE, PROTECT, RAIN_DANCE, ENDURE, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SWIFT, ATTRACT, CRUNCH, AIR_SLASH, FLY
	; end
