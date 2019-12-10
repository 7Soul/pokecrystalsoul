	db CHIKORITA ; 152

	db  45,  49,  65,  45,  49,  65
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 45 ; catch rate
	db 64 ; base exp
	db NO_ITEM, GRASSWHISTLE ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/chikorita/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, VENOSHOCK, ROCK_SMASH, HIDDEN_POWER, FELL_STINGER, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, LEAF_SHIELD, SOLARBEAM, EARTHQUAKE, PSYCHIC_M, SHADOW_BALL, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, DREAM_EATER, POWER_GEM, ATTRACT, CRUNCH, FURY_CUTTER, NIGHTMARE, PSYWAVE, MAGICAL_LEAF
	; end
