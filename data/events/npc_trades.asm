npctrade: MACRO
; dialog set, requested mon, offered mon, nickname, dvs, item, OT ID, OT name, gender requested
	db \1, \2, \3, \4, \5, \6, \7
	shift
	dw \7
	db \8, \9, 0
ENDM

NPCTrades:
; entries correspond to NPCTRADE_* constants
	npctrade TRADE_DIALOGSET_COLLECTOR, ABRA,       MACHOP,     "Muscle@@@@@", $37, $66, GOLD_BERRY,   37460, "Mike@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, BELLSPROUT, ONIX,       "Rocky@@@@@@", $96, $66, BITTER_BERRY, 48926, "Kyle@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_HAPPY,     KRABBY,     VOLTORB,    "Volty@@@@@@", $98, $88, PRZCUREBERRY, 29189, "Tim@@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      DRAGONAIR,  DODRIO,     "Doris@@@@@@", $77, $66, SMOKE_BALL,   00283, "Emy@@@@@@@@", TRADE_GENDER_FEMALE
	npctrade TRADE_DIALOGSET_NEWBIE,    HAUNTER,    XATU,       "Paul@@@@@@@", $96, $86, MYSTERYBERRY, 15616, "Chris@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      CHANSEY,    AERODACTYL, "Aeroy@@@@@@", $96, $66, GOLD_BERRY,   26491, "Kim@@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, DUGTRIO,    MAGNETON,   "Maggie@@@@@", $96, $66, METAL_COAT,   50082, "Forest@@@@@", TRADE_GENDER_EITHER
