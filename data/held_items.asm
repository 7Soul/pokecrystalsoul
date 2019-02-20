; 0 = double, 1 = 75% inc, 2 = 50% inc
; 5+ = inc by 5+ 
.AllItems:                    ;	   atk,    satk,   spd,    def,   sdef
	db CATERPIE,	TOUGH_HORN, 	0, 		2, 		2,		2,		2
	db CATERPIE,	CARAPACE, 		2, 		2, 		2,		0,		0
	db WEEDLE,		TOUGH_HORN, 	0, 		2, 		2,		2,		2
	db WEEDLE,		CARAPACE, 		2, 		2, 		2,		0,		0
	db SPINARAK,	TOUGH_HORN, 	0, 		2, 		2,		2,		2
	db SPINARAK,	CARAPACE, 		2, 		2, 		2,		0,		0
	db LEDYBA,		TOUGH_HORN, 	0, 		2, 		2,		2,		2
	db LEDYBA,		CARAPACE, 		2, 		2, 		2,		0,		0
	db PARAS,		TOUGH_HORN, 	1, 		2, 		2,		2,		2
	db PARAS,		CARAPACE, 		2, 		2, 		2,		0,		0
	db VENONAT,		TOUGH_HORN, 	0, 		2, 		2,		2,		2
	db VENONAT,		CARAPACE, 		2, 		2, 		2,		0,		0
	db PINECO,		TOUGH_HORN, 	0, 		2, 		2,		2,		2
	db PINECO,		CARAPACE, 		2, 		2, 		2,		0,		0
	db PIDGEY,		STEEL_WING, 	2, 		2, 		2,		2,		2
	db SPEAROW,		STEEL_WING, 	2, 		2, 		2,		2,		2
	db ZUBAT,		STEEL_WING, 	2, 		2, 		2,		2,		2
	db DODUO,		STEEL_WING, 	2, 		2, 		2,		2,		2
	db HOOTHOOT,	STEEL_WING, 	2, 		2, 		2,		2,		2
	db LEDYBA,		STEEL_WING, 	2, 		2, 		2,		2,		2
	db NATU,		STEEL_WING, 	2, 		2, 		2,		2,		2
	db HOPPIP,		STEEL_WING, 	2, 		2, 		2,		2,		2
	db PIKACHU,		BATTERY, 		2, 		1, 		2,		2,		2
	db VOLTORB,		BATTERY, 		2, 		1, 		2,		2,		2
	db PICHU,		BATTERY, 		2, 		1, 		2,		2,		2
	db MAREEP,		BATTERY, 		2, 		1, 		2,		2,		2
	db ELEKID,		BATTERY, 		2, 		1, 		2,		2,		2
	db MAGNEMITE,	BATTERY, 		2, 		1, 		2,		2,		2
	db CHINCHOU,	BATTERY, 		2, 		1, 		2,		2,		2
	dw 0
	
.SteelWing:
	db PIDGEY,		STEEL_WING, 0
	db SPEAROW,		STEEL_WING, 0
	db ZUBAT,		STEEL_WING, 0
	db DODUO,		STEEL_WING, 0
	db HOOTHOOT,	STEEL_WING, 0
	db LEDYBA,		STEEL_WING, 0
	db NATU,		STEEL_WING, 0
	db HOPPIP,		STEEL_WING, 0
	dw 0