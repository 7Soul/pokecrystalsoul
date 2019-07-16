	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
	dw .frame7
	dw .frame8
.frame1
	db $00 ; bitmask
	db $19, $1a, $1b, $00, $1c, $1d, $1e, $1f, $20, $21, $22, $23
.frame2
	db $01 ; bitmask
	db $19, $1a, $1b, $00, $1c, $1d, $1e, $00, $1f, $20, $21, $08
	db $09, $22, $0e, $24, $25, $26, $13
.frame3
	db $02 ; bitmask
	db $19, $27, $1c, $1d, $1e, $00, $20, $21, $08, $09, $0e, $25
	db $26, $13
.frame4
	db $03 ; bitmask
	db $19, $27, $28, $29, $2a, $2b
.frame5
	db $03 ; bitmask
	db $19, $27, $28, $1e, $2c, $21
.frame6
	db $04 ; bitmask
	db $19, $27, $1b, $00, $1c, $1d, $2c, $23
.frame7
	db $05 ; bitmask
	db $19, $27, $1b, $00, $28, $00, $1f, $20, $08, $09, $22, $0e
	db $24, $25, $26, $13
.frame8
	db $06 ; bitmask
	db $19, $27, $1c, $1d, $00, $20, $08, $09, $0e, $25, $26, $13
