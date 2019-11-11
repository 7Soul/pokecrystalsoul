	db DROWZEE ; 096

	db  60,  48,  45,  42,  48,  90
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 190 ; catch rate
	db 102 ; base exp
	db NO_ITEM, EYE_GLYPH ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/drowzee/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm CURSE, VENOSHOCK, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, EARTHQUAKE, PSYCHIC_M, SHADOW_BALL, MUD_BOMB, ICE_PUNCH, SWAGGER, SLUDGE_BOMB, SANDSTORM, THUNDERPUNCH, DREAM_EATER, POWER_GEM, FIRE_FLICK, FIRE_PUNCH, NIGHTMARE, ROCK_TOMB, PSYWAVE, MAGICAL_LEAF, REST, SNORE, SLEEP_TALK
	; end
