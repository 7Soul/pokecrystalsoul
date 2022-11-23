	db VULPIX ; 037

	db  38,  41,  40,  65,  50,  65
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_VERY_LOW << 2 | CATCH_RATE_MEDIUM
	db BURNT_BERRY, CINDERS ; items
	db GENDER_F75 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/vulpix/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_GROUND, EGG_GROUND ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, ENDURE, PRISM_LIGHT, DIG, DOUBLE_TEAM, SWAGGER, FIRE_BLAST, SWIFT, ATTRACT, CRUNCH, INFERNO, FLAMETHROWER, REST, SNORE, SLEEP_TALK, HARMONY
	; end
