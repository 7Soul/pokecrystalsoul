	db MARILL ; 183

	db  70,  20,  50,  40,  20,  50
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db GROWTH_FAST << 5 | BASE_EXP_VERY_LOW << 2 | CATCH_RATE_EASY
	db NO_ITEM, SHINY_CORAL ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/marill/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_WATER_1, EGG_FAIRY ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, ROCK_SMASH, HIDDEN_POWER, PROTECT, RAIN_DANCE, ENDURE, AQUA_TAIL, DOUBLE_TEAM, SWAGGER, WATER_GUN, SWIFT, DEFENSE_CURL, ATTRACT, CRUNCH, JET_STREAM, HYPER_SONAR, SURF, ICE_BEAM, REST, SNORE, SLEEP_TALK, HARMONY
	; end
