	db KADABRA ; 064

	db  40,  35,  30, 105, 120,  70
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db GROWTH_MEDIUM_SLOW << 5 | BASE_EXP_HIGH << 2 | CATCH_RATE_MEDIUM
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/kadabra/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, DREAM_EATER, POWER_GEM, CRUNCH, NIGHTMARE, PSYWAVE, MAGICAL_LEAF, REST, SNORE, SLEEP_TALK
	; end
