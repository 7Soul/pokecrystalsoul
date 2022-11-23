	db TENTACOOL ; 072

	db  40,  40,  35,  70,  50, 100
	;   hp  atk  def  spd  sat  sdf

	db WATER, POISON ; type
	db GROWTH_SLOW << 5 | BASE_EXP_MEDIUM << 2 | CATCH_RATE_EASY
	db NO_ITEM, SHINY_CORAL ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/tentacool/front.dimensions"
	db 0, 0, 0, 0
	db 0, 0, 0
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	db ACTION_FLY << 4 | 25 / ACTION_LEVEL ; Action | Level/ACTION_LEVEL (max level is 60)
	db ACTION_ROCKSMASH << 4 | ACTION_SWEETSCENT

	; tm/hm learnset
	tmhm CURSE, VENOSHOCK, HIDDEN_POWER, PROTECT, RAIN_DANCE, ENDURE, PRISM_LIGHT, DOUBLE_TEAM, SWAGGER, WATER_GUN, SLUDGE_BOMB, ATTRACT, JET_STREAM, SURF, ICE_BEAM, REST, SNORE, SLEEP_TALK, HARMONY
	; end
