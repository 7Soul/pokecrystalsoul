	db HOUNDOUR ; 228

	db  45,  60,  30,  65,  80,  50
	;   hp  atk  def  spd  sat  sdf

	db DARK, FIRE ; type
	db 120 ; catch rate
	db 114 ; base exp
	db NO_ITEM, DARK_MIRROR ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/houndour/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ENDURE, SOLARBEAM, SHADOW_BALL, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, FIRE_BLAST, SWIFT, DREAM_EATER, REST, ATTRACT, BULK_UP, NIGHTMARE, FLAMETHROWER
	; end
