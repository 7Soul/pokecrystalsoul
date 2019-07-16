	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
.frame1
	db $00 ; bitmask
	db $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f
	db $30, $31, $32, $33, $34, $35, $36, $37, $38
.frame2
	db $01 ; bitmask
	db $39, $3a, $03, $3b, $3c, $3d, $2a, $2b, $2c, $2e, $2f, $30
	db $31, $32, $3e, $33, $34, $35, $36, $3f, $40, $38
.frame3
	db $02 ; bitmask
	db $24, $25, $26, $27, $28, $41, $2d
.frame4
	db $03 ; bitmask
	db $39, $3a, $03, $3b, $3c, $3d
.frame5
	db $04 ; bitmask
	db $2b, $2c, $2e, $2f, $30, $33, $34, $37, $38
