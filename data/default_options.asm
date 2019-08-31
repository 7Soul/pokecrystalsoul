DefaultOptions:
; wOptions: med text speed
	db TEXT_DELAY_FAST
; wSaveFileExists: no
	db FALSE
; wTextBoxFrame: frame 1
	db FRAME_1
; wTextBoxFlags: use text speed
	db 1 << FAST_TEXT_DELAY_F
; wGBPrinter: normal brightness
	db GBPRINTER_NORMAL
; wNuzlocke
	db 0
; wOptions2: menu account on
	db 0 << MENU_ACCOUNT

	db $00
	db $00
