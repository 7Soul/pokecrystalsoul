	db STEELIX ; 208

	db  75, 105, 200,  40,  55,  65
	;   hp  atk  def  spd  sat  sdf

	db STEEL, GROUND ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_ULTRA_HIGH << 2 | CATCH_RATE_VERY_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/steelix/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, ENDURE, PRISM_LIGHT, EARTHQUAKE, DIG, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SANDSTORM, DEFENSE_CURL, ATTRACT, CRUNCH, ROCK_TOMB, ICE_BEAM
	; end
