DefaultOptions:
; wOptions: med text speed
	db TEXT_DELAY_FAST ;+ 1 << BATTLE_SCENE
; wSaveFileExists: no
	db FALSE
; wTextBoxFrame: frame 1
	db FRAME_1
; wTextBoxFlags: use text speed
	db 1 << FAST_TEXT_DELAY_F
; wGBPrinter: normal brightness
	db GBPRINTER_NORMAL
; wNuzlocke
	db $00
; wOptions2: menu account on
	db 0 << MENU_ACCOUNT

	db $00
