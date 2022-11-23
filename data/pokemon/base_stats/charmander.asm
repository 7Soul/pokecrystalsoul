	db CHARMANDER ; 004

	db  39,  52,  43,  65,  60,  50
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db GROWTH_MEDIUM_SLOW << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_MEDIUM
	db NO_ITEM, CINDERS ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/charmander/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_MONSTER, EGG_DRAGON ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROAR, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PROTECT, ENDURE, DIG, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, FIRE_BLAST, SWIFT, DEFENSE_CURL, THUNDERPUNCH, BRICK_BREAK, ATTRACT, CRUNCH, FIRE_PUNCH, INFERNO, HAMMER_ARM, FLAMETHROWER
	; end
