	db BELLSPROUT ; 069

	db  55,  80,  35,  40,  65,  30
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FIGHTING ; type
	db 255 ; catch rate
	db 84 ; base exp
	db NO_ITEM, GRASSWHISTLE ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/bellsprout/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_PLANT, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, VENOSHOCK, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, FELL_STINGER, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, SOLARBEAM, SWAGGER, SLUDGE_BOMB, ATTRACT, CRUNCH, FURY_CUTTER, X_SCISSOR
	; end
