	db GROWLITHE ; 058

	db  55,  70,  45,  60,  70,  50
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db GROWTH_SLOW << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_MEDIUM
	db BURNT_BERRY, CINDERS ; items
	db GENDER_F25 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/growlithe/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_GROUND, EGG_GROUND ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PROTECT, ENDURE, PRISM_LIGHT, EARTHQUAKE, DIG, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SANDSTORM, FIRE_BLAST, SWIFT, ATTRACT, CRUNCH, ROCK_TOMB, INFERNO, FLAMETHROWER
	; end
