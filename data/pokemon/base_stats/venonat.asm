	db VENONAT ; 048

	db  60,  55,  50,  45,  40,  55
	;   hp  atk  def  spd  sat  sdf

	db BUG, BUG ; type
	db 190 ; catch rate
	db 75 ; base exp
	db NO_ITEM, TOUGH_HORN ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/venonat/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm CURSE, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, GIGA_DRAIN, ENDURE, SOLARBEAM, PSYCHIC_M, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SWIFT, REST, ATTRACT, BULK_UP
	; end
