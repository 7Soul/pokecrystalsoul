	db MR__MIME ; 122

	db  40,  45,  65,  90, 100, 120
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 45 ; catch rate
	db 136 ; base exp
	db NO_ITEM, MYSTERYBERRY ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/mr__mime/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm CURSE, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, SOLARBEAM, THUNDER, PSYCHIC_M, SHADOW_BALL, SWAGGER, DREAM_EATER, BRICK_BREAK, POWER_GEM, FIRE_FLICK, NIGHTMARE, PSYWAVE, MAGICAL_LEAF, THUNDERBOLT, REST, SNORE, SLEEP_TALK, HARMONY
	; end
