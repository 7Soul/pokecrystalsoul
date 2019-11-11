	db JOLTEON ; 135

	db  65,  65,  60, 130, 110,  95
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 197 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 35 ; step cycles to hatch
	INCBIN "gfx/pokemon/jolteon/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, FELL_STINGER, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, THUNDER, DIG, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SWIFT, ATTRACT, WILD_STORM, THUNDERBOLT
	; end
