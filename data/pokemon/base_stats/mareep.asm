	db MAREEP ; 179

	db  55,  40,  40,  35,  65,  45
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 235 ; catch rate
	db 59 ; base exp
	db NO_ITEM, BATTERY ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/mareep/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ZAP_CANNON, HIDDEN_POWER, SNORE, PROTECT, RAIN_DANCE, ENDURE, THUNDER, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, REST, ATTRACT, THUNDERBOLT
	; end
