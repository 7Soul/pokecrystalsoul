	db NIDORINO ; 033

	db  61,  72,  57,  65,  55,  55
	;   hp  atk  def  spd  sat  sdf

	db GROUND, NORMAL ; type
	db 120 ; catch rate
	db 118 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F0 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/nidorino/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, VENOSHOCK, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, ICY_WIND, PROTECT, ENDURE, LEAF_SHIELD, THUNDER, EARTHQUAKE, MEGAHORN, DIG, MUD_BOMB, DOUBLE_TEAM, SWAGGER, WATER_GUN, SLUDGE_BOMB, SANDSTORM, ATTRACT, CRUNCH, ROCK_TOMB, WILD_STORM, HYPER_SONAR, THUNDERBOLT, ICE_BEAM, REST, SNORE, SLEEP_TALK
	; end
