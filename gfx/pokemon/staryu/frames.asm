	dw .frame1
	dw .frame2
	dw .frame3
.frame1
	db $00 ; bitmask
	db $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $00, $2e
	db $2f, $30, $31, $32, $00
.frame2
	db $01 ; bitmask
	db $33, $34
.frame3
	db $01 ; bitmask
	db $35, $36
