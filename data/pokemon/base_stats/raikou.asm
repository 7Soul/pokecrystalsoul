	db RAIKOU ; 243

	db  80,  75,  55, 112, 92, 90
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 3 ; catch rate
	db 216 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/raikou/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ZAP_CANNON, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, THUNDER, DIG, PSYCHIC_M, DOUBLE_TEAM, SWAGGER, SWIFT, POWER_GEM, ATTRACT, CRUNCH, WILD_STORM, PSYWAVE, THUNDERBOLT, REST, SNORE, SLEEP_TALK, HARMONY
	; end
