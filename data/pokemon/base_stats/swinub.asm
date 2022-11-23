	db SWINUB ; 220

	db  50,  50,  40,  50,  30,  30
	;   hp  atk  def  spd  sat  sdf

	db ICE, GROUND ; type
	db GROWTH_SLOW << 5 | BASE_EXP_LOW << 2 | CATCH_RATE_EASY
	db NO_ITEM, FROZEN_DEW ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/swinub/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_GROUND, EGG_GROUND ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, EARTHQUAKE, MUD_BOMB, SWAGGER, SANDSTORM, DEFENSE_CURL, POWER_GEM, ATTRACT, CRUNCH, ROCK_TOMB, ICE_BEAM, REST, SNORE, SLEEP_TALK, HARMONY
	; end
