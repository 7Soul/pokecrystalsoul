	db NATU ; 177

	db  40,  50,  45,  70,  75,  45
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FLYING ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_EASY
	db NO_ITEM, EYE_GLYPH ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/natu/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_FLYING, EGG_FLYING ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, FEATHERGALE, PROTECT, RAIN_DANCE, ENDURE, PSYCHIC_M, SHADOW_BALL, SWAGGER, SWIFT, DREAM_EATER, NIGHTMARE, PSYWAVE, AIR_SLASH, MAGICAL_LEAF, FLY, REST, SNORE, SLEEP_TALK, HARMONY
	; end
