BattleCommand_BrickBreak:
;brickbreak
; start checking reflect
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens1
	ld hl, wPlayerScreens
.got_screens1
	bit SCREENS_REFLECT, [hl]
	jr z, .no_reflect

	res SCREENS_REFLECT, [hl]
	ld hl, BrickBreakText1
	call StdBattleTextBox
	
.no_reflect ; start checking light_screen
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens2
	ld hl, wPlayerScreens
.got_screens2
	bit SCREENS_LIGHT_SCREEN, [hl]
	ret z

	res SCREENS_LIGHT_SCREEN, [hl]
	ld hl, BrickBreakText2
	jp StdBattleTextBox
	