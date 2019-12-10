	db SNORLAX ; 143

	db 160, 100,  65,  30,  65, 110
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 25 ; catch rate
	db 154 ; base exp
	db LEFTOVERS, LEFTOVERS ; items
	db GENDER_F12_5 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/snorlax/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, ZAP_CANNON, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, LEAF_SHIELD, THUNDER, EARTHQUAKE, MUD_BOMB, SWAGGER, SANDSTORM, FIRE_BLAST, DEFENSE_CURL, BRICK_BREAK, ATTRACT, CRUNCH, ROCK_TOMB, WILD_STORM, HAMMER_ARM, FLAMETHROWER, THUNDERBOLT, ICE_BEAM, REST, SNORE, SLEEP_TALK
	; end
