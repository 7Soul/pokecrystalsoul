LoadBattleMenu:
	ld hl, BattleMenuHeader
	ld a, [wBattleMode]
	cp 2
	jr nz, .wild_battle
	ld hl, BattleMenuHeader2
.wild_battle
	call LoadMenuHeader
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	call InterpretBattleMenu
	ld a, [wMenuCursorBuffer]
	ld [wBattleMenuCursorBuffer], a
	call ExitMenu
	ret

SafariBattleMenu:
; untranslated
	ld hl, MenuHeader_0x24f4e
	call LoadMenuHeader
	jr Function24f19

ContestBattleMenu:
	ld hl, MenuHeader_0x24f89
	call LoadMenuHeader

Function24f19:
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	call _2DMenu
	ld a, [wMenuCursorBuffer]
	ld [wBattleMenuCursorBuffer], a
	call ExitMenu
	ret

BattleMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 12, 15, SCREEN_HEIGHT - 1
	dw BattleMenuData
	db 1 ; default option

BattleMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 6 ; spacing
	dba BattleMenuStrings
	dbw BANK(BattleMenuData), 0

BattleMenuStrings:
	db "Fight@"
	db "<PKMN>@"
	db "Bag@"
	db "Run@"


BattleMenuHeader2:
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 12, 15, SCREEN_HEIGHT - 1
	dw BattleMenuData2
	db 1 ; default option

BattleMenuData2:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 6 ; spacing
	dba BattleMenuStrings2
	dbw BANK(BattleMenuData2), 0

BattleMenuStrings2:
	db "Fight@"
	db "<PKMN>@"
	db "Bag@"
	db "Foe@"

MenuHeader_0x24f4e:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw MenuData_0x24f56
	db 1 ; default option

MenuData_0x24f56:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 11 ; spacing
	dba Strings24f5f
	dba Function24f7c

Strings24f5f:
	db "サファりボール×　　@" ; "SAFARI BALL×  @"
	db "エサをなげる@" ; "THROW BAIT"
	db "いしをなげる@" ; "THROW ROCK"
	db "にげる@" ; "RUN"

Function24f7c:
	hlcoord 17, 13
	ld de, wSafariBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

MenuHeader_0x24f89:
	db MENU_BACKUP_TILES ; flags
	menu_coords 2, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw MenuData_0x24f91
	db 1 ; default option

MenuData_0x24f91:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 12 ; spacing
	dba Strings24f9a
	dba Function24fb2

Strings24f9a:
	db "FIGHT@"
	db "<PKMN>", "@"
	db "PARKBALL×  @"
	db "RUN@"

Function24fb2:
	hlcoord 13, 16
	ld de, wParkBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret
