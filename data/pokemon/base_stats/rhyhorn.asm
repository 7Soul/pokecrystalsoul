	db RHYHORN ; 111

	db  80,  85,  95,  25,  30,  30
	;   hp  atk  def  spd  sat  sdf

	db GROUND, ROCK ; type
	db GROWTH_SLOW << 5 | BASE_EXP_HIGH << 2 | CATCH_RATE_MEDIUM
	db NO_ITEM, ACCELEROCK ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/rhyhorn/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PROTECT, ENDURE, THUNDER, EARTHQUAKE, MEGAHORN, DIG, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SANDSTORM, FIRE_BLAST, BRICK_BREAK, ATTRACT, CRUNCH, ROCK_TOMB, WILD_STORM, INFERNO, THUNDERBOLT
	; end
