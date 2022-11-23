	db MAGCARGO ; 219

	db  50,  50, 120,  30,  80,  80
	;   hp  atk  def  spd  sat  sdf

	db FIRE, ROCK ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_VERY_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/magcargo/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, HIDDEN_POWER, SUNNY_DAY, PROTECT, ENDURE, EARTHQUAKE, MUD_BOMB, SWAGGER, SANDSTORM, FIRE_BLAST, POWER_GEM, ATTRACT, ROCK_TOMB, INFERNO, FLAMETHROWER
	; end
