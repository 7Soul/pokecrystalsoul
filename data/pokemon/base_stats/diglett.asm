	db DIGLETT ; 050

	db  10,  55,  25,  95,  35,  45
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_EASY
	db NO_ITEM, HARDENEDSAND ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/diglett/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_GROUND, EGG_GROUND ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PROTECT, ENDURE, EARTHQUAKE, DIG, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SANDSTORM, POWER_GEM, ATTRACT, CRUNCH, ROCK_TOMB
	; end
