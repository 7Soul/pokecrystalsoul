.AtkItems:
	db CATERPIE,	TOUGH_HORN, 0 ; 0 = double, 1 = 75% inc, 2 = 50% inc
	db WEEDLE,		TOUGH_HORN, 0 ; 10+ = inc by 10+ 
	db SPINARAK,	TOUGH_HORN, 0
	db LEDYBA,		TOUGH_HORN, 0
	db PARAS,		TOUGH_HORN, 0
	db PINECO,		CARAPACE,   0
	dw 0
	
.SpAtkItems:
	db PINECO,		CARAPACE, 	0
	db VENONAT,		CARAPACE, 	0
	dw 0
	
.SpdItems:
	db MEW,			POKE_BALL, 	0
	dw 0
	
.DefItems:
	db MEW,			POKE_BALL,	0
	db CUBONE,		THICK_CLUB, 0
	dw 0
	
.SpDefItems:
	db MEW,			POKE_BALL, 	0
	dw 0
	
.HpItems:
	db MEW,			POKE_BALL, 	0
	db CHARMANDER,	POTION,     50
	dw 0