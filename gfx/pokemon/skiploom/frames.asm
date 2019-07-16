	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $24, $00, $25, $26, $27, $28, $29, $2a, $2b, $00, $2c, $2d
.frame2
	db $01 ; bitmask
	db $24, $00, $25, $26, $27, $28, $2e, $29, $2a, $2b, $2f, $00
	db $2c, $2d
.frame3
	db $01 ; bitmask
	db $24, $30, $25, $31, $32, $33, $2e, $34, $35, $36, $2f, $00
	db $2c, $2d
.frame4
	db $02 ; bitmask
	db $24, $37, $38, $2d
