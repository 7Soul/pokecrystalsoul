	db SLOWPOKE ; 079

	db  90,  65,  65,  15,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db WATER, PSYCHIC ; type
	db 190 ; catch rate
	db 99 ; base exp
	db NO_ITEM, SHINY_CORAL ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/slowpoke/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, AQUA_TAIL, EARTHQUAKE, DIG, PSYCHIC_M, SHADOW_BALL, MUD_BOMB, SWAGGER, WATER_GUN, SANDSTORM, FIRE_BLAST, SWIFT, DREAM_EATER, POWER_GEM, NIGHTMARE, ROCK_TOMB, JET_STREAM, PSYWAVE, SURF, FLAMETHROWER, ICE_BEAM, REST, SNORE, SLEEP_TALK
	; end
