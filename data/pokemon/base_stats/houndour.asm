	db HOUNDOUR ; 228

	db  45,  60,  30,  65,  80,  50
	;   hp  atk  def  spd  sat  sdf

	db DARK, FIRE ; type
	db GROWTH_SLOW << 5 | BASE_EXP_MEDIUM << 2 | CATCH_RATE_MEDIUM
	db NO_ITEM, DARK_MIRROR ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/houndour/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_GROUND, EGG_GROUND ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PROTECT, ENDURE, EARTHQUAKE, DIG, SHADOW_BALL, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SANDSTORM, FIRE_BLAST, SWIFT, CRUNCH, ROCK_TOMB, INFERNO, FLAMETHROWER
	; end
