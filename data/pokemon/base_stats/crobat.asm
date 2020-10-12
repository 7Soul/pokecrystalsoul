	db CROBAT ; 169

	db  60,  80,  72, 130,  65,  72
	;   hp  atk  def  spd  sat  sdf

	db DARK, FLYING ; type
	db 90 ; catch rate
	db 204 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/crobat/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm CURSE, VENOSHOCK, HIDDEN_POWER, SUNNY_DAY, FELL_STINGER, FEATHERGALE, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, SOLARBEAM, THUNDER, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, SWIFT, CRUNCH, WILD_STORM, AIR_SLASH, X_SCISSOR, HYPER_SONAR, FLY, THUNDERBOLT, ICE_BEAM
	; end
