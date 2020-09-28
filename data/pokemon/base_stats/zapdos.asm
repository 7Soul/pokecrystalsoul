	db ZAPDOS ; 145

	db  60,  105,  50, 100, 90,  85
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, FLYING ; type
	db 3 ; catch rate
	db 216 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/zapdos/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, FELL_STINGER, FEATHERGALE, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, THUNDER, DOUBLE_TEAM, SWAGGER, SWIFT, ATTRACT, FURY_CUTTER, WILD_STORM, AIR_SLASH, FLY, THUNDERBOLT, REST
	; end
