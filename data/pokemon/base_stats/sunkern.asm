	db SUNKERN ; 191

	db  50,  70,  45,  40,  70,  30
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 235 ; catch rate
	db 52 ; base exp
	db NO_ITEM, GRASSWHISTLE ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/sunkern/front.dimensions"
	db 0, 0, 0, 0
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_PLANT, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm CURSE, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, SOLARBEAM, PRISM_LIGHT, EARTHQUAKE, MUD_BOMB, DOUBLE_TEAM, SWAGGER, ATTRACT, REST, SNORE, SLEEP_TALK, HARMONY
	; end
