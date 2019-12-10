	db PINSIR ; 127

	db  65, 125, 100,  85,  55,  70
	;   hp  atk  def  spd  sat  sdf

	db BUG, BUG ; type
	db 45 ; catch rate
	db 200 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/pinsir/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_SLOW ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, FELL_STINGER, FEATHERGALE, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, MEGAHORN, SWAGGER, BRICK_BREAK, CRUNCH, FURY_CUTTER, AIR_SLASH, HAMMER_ARM, X_SCISSOR, REST, SNORE, SLEEP_TALK, HARMONY
	; end
