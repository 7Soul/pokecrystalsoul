	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $24, $25, $26, $27, $00, $28, $29, $2a, $2b, $00, $2c, $2d
	db $2e, $2f, $30, $31, $32, $33
.frame2
	db $01 ; bitmask
	db $34
.frame3
	db $02 ; bitmask
	db $34, $35, $36, $37, $38, $39, $3a, $00, $20, $21, $3b, $00
.frame4
	db $03 ; bitmask
	db $3c, $3d, $3e
