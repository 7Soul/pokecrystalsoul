	db VOLTORB ; 100

	db  40,  30,  50, 100,  55,  55
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db GROWTH_MEDIUM_FAST << 5 | BASE_EXP_MEDIUM << 2 | CATCH_RATE_MEDIUM
	db NO_ITEM, BATTERY ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/voltorb/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, ZAP_CANNON, HIDDEN_POWER, PROTECT, RAIN_DANCE, ENDURE, THUNDER, DOUBLE_TEAM, SWAGGER, SWIFT, ATTRACT, WILD_STORM, HYPER_SONAR, THUNDERBOLT
	; end
