	db SEEL ; 086

	db  65,  45,  55,  45,  45,  70
	;   hp  atk  def  spd  sat  sdf

	db ICE, WATER ; type
	db 190 ; catch rate
	db 100 ; base exp
	db NO_ITEM, FROZEN_DEW ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/seel/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, HIDDEN_POWER, SNORE, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, SURF,  ICE_BEAM
	; end
