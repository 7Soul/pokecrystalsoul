TreeMons:
; entries correspond to TREEMON_SET_* constants
	dw TreeMonSet_City
	dw TreeMonSet_Canyon
	dw TreeMonSet_Town
	dw TreeMonSet_Route
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	dw TreeMonSet_Rock
	dw TreeMonSet_City

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_City:
TreeMonSet_Canyon:
; common
	db 50, SPEAROW,    2
	db 15, SPEAROW,    2
	db 15, SPEAROW,    2
	db 10, AIPOM,      2
	db  5, AIPOM,      3
	db  5, HERACROSS,  3
	db -1
; rare
	db 50, SPEAROW,    2
	db 15, SPEAROW,    2
	db 15, SPEAROW,    2
	db 10, AIPOM,      2
	db  5, AIPOM,      3
	db  5, HERACROSS,  3
	db -1

TreeMonSet_Town:
; common
	db 50, SPEAROW,		2
	db 15, EKANS,		2
	db 15, SPEAROW,		2
	db 10, AIPOM,		2
	db  5, AIPOM,		3
	db  5, MANKEY,		3
	db -1
; rare
	db 50, SPEAROW,		2
	db 15, EKANS,		2
	db 15, SPEAROW,		2
	db 10, AIPOM,		2
	db  5, AIPOM,		3
	db  5, MANKEY,		3
	db -1

TreeMonSet_Route:
; common
	db 50, HOOTHOOT,	2
	db 15, METAPOD,		2
	db 15, KAKUNA,		2
	db 10, PINECO,		2
	db  5, AIPOM,		3
	db  5, EXEGGCUTE,	3
	db -1
; rare
	db 50, HOOTHOOT,	2
	db 15, METAPOD,		2
	db 15, KAKUNA,		2
	db 10, PINECO,		2
	db  5, AIPOM,		3
	db  5, EXEGGCUTE,	3
	db -1

TreeMonSet_Kanto:
; common
	db 50, HOOTHOOT,	2
	db 15, METAPOD,		2
	db 15, KAKUNA,		2
	db 10, PINECO,		2
	db  5, AIPOM,		3
	db  5, EXEGGCUTE,	3
	db -1
; rare
	db 50, HOOTHOOT,	2
	db 15, METAPOD,		2
	db 15, KAKUNA,		2
	db 10, PINECO,		2
	db  5, AIPOM,		3
	db  5, EXEGGCUTE,	3
	db -1

TreeMonSet_Lake:
; common
	db 50, HOOTHOOT,	2
	db 15, METAPOD,		2
	db 15, KAKUNA,		2
	db 10, PINECO,		2
	db  5, MANKEY,		3
	db  5, EXEGGCUTE,	3
	db -1
; rare
	db 50, HOOTHOOT,	2
	db 15, METAPOD,		2
	db 15, KAKUNA,		2
	db 10, PINECO,		2
	db  5, MANKEY,		3
	db  5, EXEGGCUTE,	3
	db -1

TreeMonSet_Forest:
; common
	db 50, HOOTHOOT,	2
	db 15, METAPOD,		2
	db 15, KAKUNA,		2
	db 10, PINECO,		2
	db  5, HERACROSS,	3
	db  5, VENONAT,		3
	db -1
; rare
	db 50, HOOTHOOT,	2
	db 15, METAPOD,		2
	db 15, KAKUNA,		2
	db 10, PINECO,		2
	db  5, HERACROSS,	3
	db  5, VENONAT,		3
	db -1

TreeMonSet_Rock:
	db 60, KRABBY,		3
	db 25, SHUCKLE,		3
	db 10, POLITOED,	3
	db 5, DUNSPARCE,	3
	db -1
