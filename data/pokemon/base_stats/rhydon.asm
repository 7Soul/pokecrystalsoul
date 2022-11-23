	db RHYDON ; 112

	db 105, 130, 120,  40,  45,  45
	;   hp  atk  def  spd  sat  sdf

	db GROUND, ROCK ; type
	db GROWTH_SLOW << 5 | BASE_EXP_ULTRA_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/rhydon/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, ENDURE, THUNDER, EARTHQUAKE, MEGAHORN, DIG, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SANDSTORM, FIRE_BLAST, BRICK_BREAK, ATTRACT, CRUNCH, ROCK_TOMB, WILD_STORM, INFERNO, THUNDERBOLT
	; end
