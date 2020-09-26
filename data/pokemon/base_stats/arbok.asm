	db ARBOK ; 024

	db  60,  100,  69,  80,  65,  79
	;   hp   atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 90 ; catch rate
	db 147 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/arbok/front.dimensions"
	db TRAIT_CONTACT_DAMAGE_ROCK, TRAIT_CONTACT_DAMAGE_ROCK, TRAIT_CONTACT_DAMAGE_ROCK, TRAIT_CONTACT_DAMAGE_ROCK
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, VENOSHOCK, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, EARTHQUAKE, DIG, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, SANDSTORM, CRUNCH, ROCK_TOMB
	; end
