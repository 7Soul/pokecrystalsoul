	db SHUCKLE ; 213

	db  20,  10, 230,  05,  10, 230
	;   hp  atk  def  spd  sat  sdf

	db BUG, ROCK ; type
	db GROWTH_MEDIUM_SLOW << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_MEDIUM
	db BERRY, BERRY ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/shuckle/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_BUG, EGG_BUG ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, HIDDEN_POWER, SUNNY_DAY, PROTECT, ENDURE, LEAF_SHIELD, EARTHQUAKE, DIG, MUD_BOMB, SWAGGER, SANDSTORM, DEFENSE_CURL, POWER_GEM, ROCK_TOMB, SURF, REST, SNORE, SLEEP_TALK, HARMONY
	; end
