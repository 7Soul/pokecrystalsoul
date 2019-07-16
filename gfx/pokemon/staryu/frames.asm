	dw .frame1
	dw .frame2
	dw .frame3
.frame1
	db $00 ; bitmask
	db $24, $25, $26, $27, $28, $29, $00, $2a, $2b, $2c, $2d, $2e
	db $00
.frame2
	db $01 ; bitmask
	db $2f, $30
.frame3
	db $01 ; bitmask
	db $31, $32
