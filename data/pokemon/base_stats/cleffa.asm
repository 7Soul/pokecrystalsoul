	db CLEFFA ; 173

	db  50,  25,  28,  15,  45,  55
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 150 ; catch rate
	db 37 ; base exp
	db MYSTERYBERRY, CUTE_RIBBON ; items
	db GENDER_F75 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/cleffa/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, WATER_GUN, DEFENSE_CURL, DREAM_EATER, POWER_GEM, ATTRACT, CRUNCH, FIRE_FLICK, MAGICAL_LEAF, REST, SNORE, SLEEP_TALK
	; end
