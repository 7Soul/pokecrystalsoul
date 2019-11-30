	db NIDORAN_F ; 029

	db  55,  47,  52,  41,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db GROUND, NORMAL ; type
	db 235 ; catch rate
	db 59 ; base exp
	db NO_ITEM, ACCELEROCK ; items
	db GENDER_F100 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/nidoran_f/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, VENOSHOCK, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, ICY_WIND, PROTECT, ENDURE, LEAF_SHIELD, THUNDER, EARTHQUAKE, DIG, MUD_BOMB, DOUBLE_TEAM, SWAGGER, WATER_GUN, SLUDGE_BOMB, SANDSTORM, ATTRACT, CRUNCH, ROCK_TOMB, WILD_STORM, HYPER_SONAR, THUNDERBOLT, ICE_BEAM, REST, SNORE, SLEEP_TALK
	; end
