	db NIDORAN_F ; 029

	db  55,  47,  52,  41,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db ROCK, NORMAL ; type
	db 235 ; catch rate
	db 59 ; base exp
	db NO_ITEM, ACCELEROCK ; items
	db GENDER_F100 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/nidoran_f/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, HIDDEN_POWER, SUNNY_DAY, SNORE, BLIZZARD, PROTECT, RAIN_DANCE, ENDURE, THUNDER, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, DEFENSE_CURL, REST, ATTRACT, BULK_UP, THUNDERBOLT
	; end
