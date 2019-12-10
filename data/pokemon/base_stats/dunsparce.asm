	db DUNSPARCE ; 206

	db 120,  80,  70,  45,  65,  65
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 190 ; catch rate
	db 75 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/dunsparce/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, AQUA_TAIL, EARTHQUAKE, MEGAHORN, DIG, MUD_BOMB, SWAGGER, SANDSTORM, DEFENSE_CURL, POWER_GEM, ATTRACT, ROCK_TOMB, HYPER_SONAR, REST, SNORE, SLEEP_TALK
	; end
