	db BLASTOISE ; 009

	db  79,  83, 100,  78,  85, 105
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 210 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/blastoise/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, AQUA_TAIL, EARTHQUAKE, MUD_BOMB, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, WATER_GUN, SANDSTORM, BRICK_BREAK, ATTRACT, CRUNCH, ROCK_TOMB, JET_STREAM, HAMMER_ARM, SURF, ICE_BEAM, REST, SNORE, SLEEP_TALK, HARMONY
	; end
