	db SKIPLOOM ; 188

	db  60,  45,  50,  80,  75,  65
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FLYING ; type
	db GROWTH_MEDIUM_SLOW << 5 | BASE_EXP_HIGH << 2 | CATCH_RATE_MEDIUM
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/skiploom/front.dimensions"
	db 0, 0, 0, 0
	dn EGG_FAIRY, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm CURSE, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, FEATHERGALE, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, SOLARBEAM, PSYCHIC_M, SHADOW_BALL, SWAGGER, DEFENSE_CURL, DREAM_EATER, ATTRACT, NIGHTMARE, PSYWAVE, AIR_SLASH, MAGICAL_LEAF, FLY
	; end
