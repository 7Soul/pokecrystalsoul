	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $00, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e
	db $2f, $30, $31
.frame2
	db $00 ; bitmask
	db $00, $24, $25, $26, $27, $28, $29, $2a, $2b, $32, $33, $34
	db $35, $36, $37
.frame3
	db $01 ; bitmask
	db $38, $39, $3a
.frame4
	db $02 ; bitmask
	db $38, $3b, $3c, $3d, $3e
