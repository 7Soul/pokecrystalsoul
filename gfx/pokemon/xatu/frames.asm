	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $01, $24, $01, $25, $26, $27, $28, $29, $01, $2a, $2b, $01
	db $01
.frame2
	db $00 ; bitmask
	db $01, $24, $01, $2c, $26, $2d, $28, $29, $01, $2a, $2b, $01
	db $01
.frame3
	db $01 ; bitmask
	db $2e, $2f, $29
.frame4
	db $02 ; bitmask
	db $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b
