	db HOOTHOOT ; 163

	db  60,  30,  30,  50,  36,  56
	;   hp  atk  def  spd  sat  sdf

	db DARK, FLYING ; type
	db 255 ; catch rate
	db 58 ; base exp
	db NO_ITEM, STEEL_WING ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/hoothoot/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm CURSE, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ENDURE, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DREAM_EATER, REST, ATTRACT, BULK_UP, NIGHTMARE, FLY
	; end
