	db ONIX ; 095

	  db  75,  85, 160,  70,  55,  50
	; db  75,  85, 200,  30,  55,  65 ; steelix
	; db  95, 125,  74,  81,  60, 95 ; gyarados
	;   hp  atk  def  spd  sat  sdf

	db ROCK, ROCK ; type
	db 45 ; catch rate
	db 108 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 25 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/onix/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ENDURE, EARTHQUAKE, RETURN, DIG, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, REST, ATTRACT
	; end
