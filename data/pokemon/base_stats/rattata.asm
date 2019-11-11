	db RATTATA ; 019

	db  30,  56,  35,  72,  25,  35
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 255 ; catch rate
	db 57 ; base exp
	db NO_ITEM, CUTE_RIBBON ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/rattata/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, SNORE, BLIZZARD, ICY_WIND, PROTECT, ENDURE, THUNDER, DIG, SHADOW_BALL, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, REST, ATTRACT, BULK_UP
	; end
