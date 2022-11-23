	db HOPPIP ; 187

	db  40,  35,  40,  50,  55,  55
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FLYING ; type
	db GROWTH_MEDIUM_SLOW << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_EASY
	db NO_ITEM, GRASSWHISTLE ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/hoppip/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_FAIRY, EGG_PLANT ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, FEATHERGALE, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, SOLARBEAM, PSYCHIC_M, SHADOW_BALL, SWAGGER, DEFENSE_CURL, DREAM_EATER, ATTRACT, NIGHTMARE, PSYWAVE, AIR_SLASH, MAGICAL_LEAF, FLY
	; end
