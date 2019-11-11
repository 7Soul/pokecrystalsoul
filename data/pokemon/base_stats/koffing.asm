	db KOFFING ; 109

	db  40,  65,  95,  35,  60,  45
	;   hp  atk  def  spd  sat  sdf

	db ROCK, FIRE ; type
	db 190 ; catch rate
	db 114 ; base exp
	db NO_ITEM, DARK_MIRROR ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/koffing/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, VENOSHOCK, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PROTECT, ENDURE, THUNDER, SHADOW_BALL, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, SANDSTORM, FIRE_BLAST, POWER_GEM, ATTRACT, CRUNCH, FIRE_FLICK, ROCK_TOMB, WILD_STORM, INFERNO, FLY, FLAMETHROWER, THUNDERBOLT
	; end
