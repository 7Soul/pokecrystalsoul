	db ARTICUNO ; 144

	db  90,  85, 100,  85,  95, 125
	;   hp  atk  def  spd  sat  sdf

	db ICE, FLYING ; type
	db 3 ; catch rate
	db 215 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/articuno/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, ZAP_CANNON, HIDDEN_POWER, FEATHERGALE, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, WATER_GUN, SWIFT, DREAM_EATER, ATTRACT, NIGHTMARE, JET_STREAM, PSYWAVE, AIR_SLASH, HYPER_SONAR, FLY, ICE_BEAM, REST, SNORE, SLEEP_TALK, HARMONY
	; end
