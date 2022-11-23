	db STANTLER ; 234

	db  73,  95,  62,  85,  85,  65
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db GROWTH_SLOW << 5 | BASE_EXP_VERY_HIGH << 2 | CATCH_RATE_MEDIUM
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/stantler/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_GROUND, EGG_GROUND ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, PRISM_LIGHT, THUNDER, EARTHQUAKE, MEGAHORN, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SANDSTORM, SWIFT, ATTRACT, CRUNCH, ROCK_TOMB, WILD_STORM, HYPER_SONAR, THUNDERBOLT, REST, SNORE, SLEEP_TALK
	; end
