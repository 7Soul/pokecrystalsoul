	db OMASTAR ; 139

	db  70,  60, 125,  55, 115,  70
	;   hp  atk  def  spd  sat  sdf

	db ROCK, WATER ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_ULTRA_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 30 ; step cycles to hatch
	INCBIN "gfx/pokemon/omastar/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_WATER_1, EGG_WATER_3 ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, HIDDEN_POWER, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, PRISM_LIGHT, EARTHQUAKE, DIG, MUD_BOMB, DOUBLE_TEAM, SWAGGER, WATER_GUN, SANDSTORM, ATTRACT, ROCK_TOMB, JET_STREAM, REST, SNORE, SLEEP_TALK, HARMONY
	; end
