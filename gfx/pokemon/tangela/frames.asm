	dw .frame1
	dw .frame2
.frame1
	db $00 ; bitmask
	db $24, $00, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e
	db $2f, $30, $31, $00, $32, $33, $34, $35, $00, $36, $37
.frame2
	db $01 ; bitmask
	db $38, $39, $3a
