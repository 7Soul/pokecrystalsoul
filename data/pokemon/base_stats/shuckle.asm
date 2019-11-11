	db SHUCKLE ; 213

	db  20,  10, 230,  05,  10, 230
	;   hp  atk  def  spd  sat  sdf

	db BUG, ROCK ; type
	db 190 ; catch rate
	db 80 ; base exp
	db BERRY, BERRY ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/shuckle/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, HIDDEN_POWER, SUNNY_DAY, PROTECT, ENDURE, LEAF_SHIELD, EARTHQUAKE, DIG, MUD_BOMB, SWAGGER, SANDSTORM, DEFENSE_CURL, POWER_GEM, ROCK_TOMB, SURF, REST, SNORE, SLEEP_TALK, HARMONY
	; end
