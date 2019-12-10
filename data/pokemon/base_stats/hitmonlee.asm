	db HITMONLEE ; 106

	db  50, 130,  53,  87,  35, 110
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 139 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F0 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/hitmonlee/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, EARTHQUAKE, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SANDSTORM, SWIFT, BRICK_BREAK, ATTRACT, CRUNCH, ROCK_TOMB, SNORE, SLEEP_TALK, HARMONY
	; end
