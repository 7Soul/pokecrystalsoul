	db GRANBULL ; 210

	db  90, 120,  75,  45,  60,  60
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db GROWTH_FAST << 5 | BASE_EXP_VERY_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F75 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/granbull/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROAR, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, THUNDER, EARTHQUAKE, DIG, MUD_BOMB, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SANDSTORM, DEFENSE_CURL, THUNDERPUNCH, BRICK_BREAK, ATTRACT, CRUNCH, FIRE_PUNCH, ROCK_TOMB, WILD_STORM, HAMMER_ARM, THUNDERBOLT, REST, SNORE
	; end
