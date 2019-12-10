	db NIDORAN_M ; 032

	db  46,  57,  40,  50,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db GROUND, NORMAL ; type
	db 235 ; catch rate
	db 60 ; base exp
	db NO_ITEM, ACCELEROCK ; items
	db GENDER_F0 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/nidoran_m/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, VENOSHOCK, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, ICY_WIND, PROTECT, ENDURE, LEAF_SHIELD, THUNDER, EARTHQUAKE, MEGAHORN, DIG, MUD_BOMB, DOUBLE_TEAM, SWAGGER, WATER_GUN, SLUDGE_BOMB, SANDSTORM, ATTRACT, CRUNCH, ROCK_TOMB, WILD_STORM, HYPER_SONAR, THUNDERBOLT, ICE_BEAM, REST, SNORE, SLEEP_TALK
	; end
