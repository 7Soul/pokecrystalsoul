	db EKANS ; 023

	db  35,  65,  44,  55,  40,  54
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_EASY
	db NO_ITEM, DARK_MIRROR ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/ekans/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_GROUND, EGG_DRAGON ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, VENOSHOCK, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, EARTHQUAKE, DIG, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, SANDSTORM, CRUNCH, ROCK_TOMB
	; end
