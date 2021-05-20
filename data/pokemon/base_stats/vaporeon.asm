	db VAPOREON ; 134

	db 130,  65,  60,  65, 110,  95
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	; catch rate 2 bits 0, 1, 2, 3 - easy, medium, hard, very hard
							; easy: unevolved pokemon
							; medium: 2nd stage/single stage weak
							; hard: 3rd stage/single stage strong
							; very hard: legendary
	; base exp 3 bits 0~7
							; 0: up to 28
							; 1: up to 56
							; 2: up to 84
							; 3: up to 112
							; 4: up to 140
							; 5: up to 168
							; 6: up to 196
							; 7: up to 224
	; growth rate 3 bits 0~5
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_ULTRA_HIGH << 2 | CATCH_RATE_HARD
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 35 ; step cycles to hatch
	INCBIN "gfx/pokemon/vaporeon/front.dimensions"
	db TRAIT_BOOST_PUNCHING, TRAIT_BOOST_PUNCHING, TRAIT_BOOST_PUNCHING, TRAIT_BOOST_PUNCHING
	dn EGG_GROUND, EGG_GROUND ; egg groups
	
	; World actions
	; One of these have to not be ones that show in the menu

	; First action is usable past a certain level
	; Second action requires attunement
	; Third action requires attunement and max pokedex data

	; db ACTION_SURF << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	; db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT
	
	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, AQUA_TAIL, DIG, DOUBLE_TEAM, SWAGGER, WATER_GUN, SWIFT, ATTRACT, CRUNCH, JET_STREAM, HYPER_SONAR, SURF, ICE_BEAM, REST
	; end

