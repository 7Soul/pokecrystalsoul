	db FLAREON ; 136

	db  65, 130,  60,  65,  100, 110
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 198 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 35 ; step cycles to hatch
	INCBIN "gfx/pokemon/flareon/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, ENDURE, DIG, PSYCHIC_M, SHADOW_BALL, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SANDSTORM, FIRE_BLAST, SWIFT, DREAM_EATER, ATTRACT, CRUNCH, FIRE_FLICK, NIGHTMARE, ROCK_TOMB, PSYWAVE, INFERNO, FLAMETHROWER
	; end
