	db POLIWHIRL ; 061

	db  65,  65,  65,  90,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 120 ; catch rate
	db 131 ; base exp
	db NO_ITEM, KINGS_ROCK ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/poliwhirl/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, ROLLOUT, HIDDEN_POWER, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, MUD_BOMB, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, WATER_GUN, THUNDERPUNCH, BRICK_BREAK, ATTRACT, FIRE_PUNCH, JET_STREAM, SURF, REST, SNORE, SLEEP_TALK, HARMONY
	; end
