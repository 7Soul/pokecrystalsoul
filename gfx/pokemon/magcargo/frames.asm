	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f
	db $30
.frame2
	db $01 ; bitmask
	db $24, $25, $26, $27, $28, $29, $31, $32, $2c, $2d, $33, $34
	db $35, $36, $37, $38, $39, $3a
.frame3
	db $01 ; bitmask
	db $24, $25, $3b, $3c, $28, $29, $3d, $2b, $2c, $2d, $2e, $2f
	db $00, $3e, $37, $3f, $39, $3a
.frame4
	db $01 ; bitmask
	db $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f
	db $00, $3e, $37, $00, $39, $3a
