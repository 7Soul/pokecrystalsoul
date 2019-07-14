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
	db 30, MURKROW,		1
	db 30, AIPOM,		1
	db 10, VENONAT,		1
	db 10, ABRA,		1
	db 10, MAGNEMITE,	1
	db 10, HERACROSS,	1
	db -1
; rare
	db 30, MURKROW,		1
	db 30, AIPOM,		1
	db 10, VENONAT,		1
	db 10, ABRA,		1
	db 10, MAGNEMITE,	1
	db 10, HERACROSS,	1
	db -1

TreeMonSet_Town:
; common
	db 30, SPEAROW,		1
	db 30, EKANS,		1
	db 10, TANGELA,		1
	db 10, AIPOM,		1
	db 10, GEODUDE,		1
	db 10, YANMA,		1
	db -1
; rare
	db 30, SPEAROW,		1
	db 30, EKANS,		1
	db 10, TANGELA,		1
	db 10, AIPOM,		1
	db 10, GEODUDE,		1
	db 10, YANMA,		1
	db -1

TreeMonSet_Route:
; common
	db 30, HOOTHOOT,	1
	db 30, PINECO,		1
	db 10, CATERPIE,	1
	db 10, MANKEY,		1
	db 10, AIPOM,		1
	db 10, EKANS,		1
	db -1
; rare
	db 30, HOOTHOOT,	1
	db 30, PINECO,		1
	db 10, CATERPIE,	1
	db 10, MANKEY,		1
	db 10, AIPOM,		1
	db 10, EKANS,		1
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
	db 30, HOOTHOOT,	1
	db 30, POLIWAG,		1
	db 10, PINECO,		1
	db 10, AIPOM,		1
	db 10, ABRA,		1
	db 10, EXEGGCUTE,	1
	db -1
; rare
	db 30, HOOTHOOT,	1
	db 30, POLIWAG,		1
	db 10, PINECO,		1
	db 10, AIPOM,		1
	db 10, ABRA,		1
	db 10, EXEGGCUTE,	1
	db -1

TreeMonSet_Forest:
; common
	db 30, CATERPIE,	1
	db 30, VENONAT,		1
	db 10, HOOTHOOT,	1
	db 10, PINECO,		1
	db 10, HERACROSS,	1
	db 10, EXEGGCUTE,	1
	db -1
; rare
	db 30, CATERPIE,	1
	db 30, VENONAT,		1
	db 10, HOOTHOOT,	1
	db 10, PINECO,		1
	db 10, HERACROSS,	1
	db 10, EXEGGCUTE,	1
	db -1

TreeMonSet_Rock:
	db 80, KRABBY,		1
	db 20, SHUCKLE,		1
	db -1
