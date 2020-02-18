	db VAPOREON ; 134

	db 130,  65,  60,  65, 110,  95
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 196 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 35 ; step cycles to hatch
	INCBIN "gfx/pokemon/vaporeon/front.dimensions"
	db TRAIT_RAIN_SPEED, TRAIT_PSN_IMMUNE, TRAIT_RAIN_DURATION, TRAIT_REDUCE_CONFUSE_AND_PSYCHIC
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, AQUA_TAIL, DIG, DOUBLE_TEAM, SWAGGER, WATER_GUN, SWIFT, ATTRACT, CRUNCH, JET_STREAM, HYPER_SONAR, SURF, ICE_BEAM, REST
	; end
