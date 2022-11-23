	db ARCANINE ; 059

	db  90, 100,  65,  95, 100,  80
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db GROWTH_SLOW << 5 | BASE_EXP_ULTRA_HIGH << 2 | CATCH_RATE_HARD
	db BURNT_BERRY, BURNT_BERRY ; items
	db GENDER_F25 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/arcanine/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_GROUND, EGG_GROUND ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, ENDURE, PRISM_LIGHT, DIG, DOUBLE_TEAM, SWAGGER, FIRE_BLAST, SWIFT, ATTRACT, CRUNCH, INFERNO, FLAMETHROWER
	; end
