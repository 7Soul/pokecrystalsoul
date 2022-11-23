	db LICKITUNG ; 108

	db  130,  65,  75,  30,  60,  75
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/lickitung/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, AQUA_TAIL, EARTHQUAKE, MUD_BOMB, ICE_PUNCH, SWAGGER, SANDSTORM, DEFENSE_CURL, THUNDERPUNCH, ATTRACT, CRUNCH, FIRE_PUNCH, ROCK_TOMB, REST, SNORE, SLEEP_TALK
	; end
