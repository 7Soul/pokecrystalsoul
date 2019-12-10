	db AIPOM ; 190

	db  55,  70,  55,  85,  40,  55
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 94 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/aipom/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, THUNDER, EARTHQUAKE, DIG, MUD_BOMB, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SANDSTORM, SWIFT, DEFENSE_CURL, THUNDERPUNCH, BRICK_BREAK, ATTRACT, CRUNCH, FIRE_PUNCH, ROCK_TOMB, WILD_STORM, HAMMER_ARM, THUNDERBOLT, REST, SNORE, SLEEP_TALK
	; end
