	db NINETALES ; 038

	db  73,  76,  75, 100,  91, 100
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_VERY_HIGH << 2 | CATCH_RATE_HARD
	db BURNT_BERRY, BURNT_BERRY ; items
	db GENDER_F75 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/ninetales/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_GROUND, EGG_GROUND ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, ENDURE, PRISM_LIGHT, DIG, DOUBLE_TEAM, SWAGGER, FIRE_BLAST, SWIFT, ATTRACT, CRUNCH, INFERNO, FLAMETHROWER, REST, SNORE, SLEEP_TALK, HARMONY
	; end
