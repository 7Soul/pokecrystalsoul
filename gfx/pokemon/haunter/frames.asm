	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $24, $25, $26, $27, $28, $29
.frame2
	db $01 ; bitmask
	db $2a, $2b, $00, $2c, $2d, $2e, $00, $2f, $30, $31, $32
.frame3
	db $01 ; bitmask
	db $33, $34, $00, $35, $36, $37, $00, $2f, $38, $39, $32
.frame4
	db $02 ; bitmask
	db $2c, $2f, $3a, $3b
