	db MURKROW ; 198

	db  60,  105,  42,  91,  85,  42
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db GROWTH_MEDIUM_SLOW << 5 | BASE_EXP_MEDIUM << 2 | CATCH_RATE_MEDIUM
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/murkrow/front.dimensions"
	db 0, 0, 0, 0
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm CURSE, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, FEATHERGALE, PROTECT, RAIN_DANCE, ENDURE, DOUBLE_TEAM, SWAGGER, SWIFT, AIR_SLASH, FLY, HARMONY
	; end
