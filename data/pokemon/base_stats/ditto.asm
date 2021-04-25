	db DITTO ; 132

	db  48,  48,  48,  48,  48,  48
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/ditto/front.dimensions"
	db TRAIT_SPEED_TRANSFORM, TRAIT_SPEED_TRANSFORM, TRAIT_SPEED_TRANSFORM, TRAIT_SPEED_TRANSFORM
	dn EGG_DITTO, EGG_DITTO ; egg groups

	; tm/hm learnset
	tmhm CURSE, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, SWAGGER, ATTRACT, REST, SNORE, SLEEP_TALK
	; end
