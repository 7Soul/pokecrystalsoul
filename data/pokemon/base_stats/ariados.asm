	db ARIADOS ; 168

	db  70,  90,  70,  50,  60,  70
	;   hp  atk  def  spd  sat  sdf

	db BUG, DARK ; type
	db 90 ; catch rate
	db 134 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/ariados/front.dimensions"
	db 1, 1, 1, 1
	db GROWTH_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, VENOSHOCK, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, FELL_STINGER, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, MEGAHORN, DIG, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, CRUNCH, FURY_CUTTER, X_SCISSOR
	; end
