	db SEEL ; 086

	db  65,  45,  55,  45,  45,  70
	;   hp  atk  def  spd  sat  sdf

	db ICE, WATER ; type
	db 190 ; catch rate
	db 100 ; base exp
	db NO_ITEM, FROZEN_DEW ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/seel/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, AQUA_TAIL, MEGAHORN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, WATER_GUN, DREAM_EATER, POWER_GEM, ATTRACT, CRUNCH, NIGHTMARE, JET_STREAM, PSYWAVE, SURF, ICE_BEAM, REST, SNORE, SLEEP_TALK, HARMONY
	; end
