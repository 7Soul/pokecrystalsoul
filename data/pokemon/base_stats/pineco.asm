	db PINECO ; 204

	db  50,  65,  90,  15,  35,  35
	;   hp  atk  def  spd  sat  sdf

	db BUG, BUG ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_VERY_LOW << 2 | CATCH_RATE_MEDIUM
	db NO_ITEM, TOUGH_HORN ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/pineco/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_BUG, EGG_BUG ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, VENOSHOCK, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, EARTHQUAKE, DIG, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, SANDSTORM, DEFENSE_CURL, ROCK_TOMB
	; end
