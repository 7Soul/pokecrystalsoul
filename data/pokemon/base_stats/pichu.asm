	db PICHU ; 172

	db  20,  40,  15,  60,  35,  35
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_VERY_LOW << 2 | CATCH_RATE_EASY
	db BERRY, BATTERY ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/pichu/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_NONE, EGG_NONE ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, PROTECT, RAIN_DANCE, ENDURE, DOUBLE_TEAM, SWAGGER, SWIFT, ATTRACT, REST
	; end
