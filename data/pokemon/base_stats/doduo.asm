	db DODUO ; 084

	db  35,  85,  45,  75,  35,  35
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_MEDIUM << 2 | CATCH_RATE_MEDIUM
	db NO_ITEM, STEEL_WING ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/doduo/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_FLYING, EGG_FLYING ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, THUNDER, DOUBLE_TEAM, SWAGGER, SWIFT, ATTRACT, CRUNCH, WILD_STORM, HYPER_SONAR, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
