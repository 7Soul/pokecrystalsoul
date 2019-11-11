	db POLIWAG ; 060

	db  40,  50,  40,  90,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 255 ; catch rate
	db 77 ; base exp
	db NO_ITEM, SHINY_CORAL ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/poliwag/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, HIDDEN_POWER, PROTECT, RAIN_DANCE, ENDURE, AQUA_TAIL, MUD_BOMB, DOUBLE_TEAM, SWAGGER, WATER_GUN, ATTRACT, JET_STREAM, SURF, REST, SNORE, SLEEP_TALK, HARMONY
	; end
