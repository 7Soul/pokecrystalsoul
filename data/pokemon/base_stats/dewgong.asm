	db DEWGONG ; 087

	db  90,  70,  80,  70,  100,  95
	;   hp  atk  def  spd  sat  sdf

	db ICE, WATER ; type
	db 75 ; catch rate
	db 176 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/dewgong/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, HIDDEN_POWER, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, SURF,  ICE_BEAM
	; end
