	db AERODACTYL ; 142

	db  85, 105,  70, 130,  60,  75
	;   hp  atk  def  spd  sat  sdf

	db ROCK, FLYING ; type
	db GROWTH_SLOW << 5 | BASE_EXP_ULTRA_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 35 ; step cycles to hatch
	INCBIN "gfx/pokemon/aerodactyl/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_FLYING, EGG_FLYING ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, FEATHERGALE, HYPER_BEAM, PROTECT, ENDURE, EARTHQUAKE, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SANDSTORM, SWIFT, ATTRACT, CRUNCH, ROCK_TOMB, AIR_SLASH, HYPER_SONAR, FLY
	; end
	