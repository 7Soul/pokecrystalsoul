	db SLOWKING ; 199

	db  95,  75,  80,  30, 100, 110
	;   hp  atk  def  spd  sat  sdf

	db WATER, PSYCHIC ; type
	db 70 ; catch rate
	db 164 ; base exp
	db NO_ITEM, KINGS_ROCK ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/slowking/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, EARTHQUAKE, DIG, PSYCHIC_M, SHADOW_BALL, MUD_BOMB, ICE_PUNCH, SWAGGER, WATER_GUN, SANDSTORM, FIRE_BLAST, SWIFT, DREAM_EATER, POWER_GEM, NIGHTMARE, ROCK_TOMB, JET_STREAM, PSYWAVE, SURF, FLAMETHROWER, ICE_BEAM, REST, SNORE, SLEEP_TALK
	; end
