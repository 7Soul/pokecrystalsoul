	db SLUGMA ; 218

	db  40,  40,  40,  20,  70,  40
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 190 ; catch rate
	db 78 ; base exp
	db NO_ITEM, CINDERS ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/slugma/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ENDURE, MUD_BOMB, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, DEFENSE_CURL, REST, ATTRACT, FLAMETHROWER
	; end
