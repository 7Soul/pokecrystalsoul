	db HYPNO ; 097

	db  90,  73,  70,  67,  83, 115
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 75 ; catch rate
	db 165 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/hypno/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm CURSE, VENOSHOCK, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, EARTHQUAKE, PSYCHIC_M, SHADOW_BALL, MUD_BOMB, ICE_PUNCH, SWAGGER, SLUDGE_BOMB, SANDSTORM, THUNDERPUNCH, DREAM_EATER, POWER_GEM, FIRE_FLICK, FIRE_PUNCH, NIGHTMARE, ROCK_TOMB, PSYWAVE, MAGICAL_LEAF, REST, SNORE, SLEEP_TALK
	; end
