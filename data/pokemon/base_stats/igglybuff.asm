	db IGGLYBUFF ; 174

	db  90,  30,  15,  15,  40,  20
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 170 ; catch rate
	db 39 ; base exp
	db NO_ITEM, CUTE_RIBBON ; items
	db GENDER_F75 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/igglybuff/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, SHADOW_BALL, MUD_BOMB, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SANDSTORM, DEFENSE_CURL, THUNDERPUNCH, DREAM_EATER, POWER_GEM, ATTRACT, FIRE_FLICK, FIRE_PUNCH, REST, SNORE, SLEEP_TALK
	; end
