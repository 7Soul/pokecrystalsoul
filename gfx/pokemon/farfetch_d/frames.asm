	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
.frame1
	db $00 ; bitmask
	db $24, $25, $26, $27, $28, $29
.frame2
	db $01 ; bitmask
	db $2a, $2b, $25, $2c, $22, $2d, $2e, $2f, $30, $22, $31, $32
	db $33, $34
.frame3
	db $01 ; bitmask
	db $2a, $2b, $25, $26, $22, $35, $36, $37, $38, $22, $31, $39
	db $3a, $3b
.frame4
	db $02 ; bitmask
	db $25
.frame5
	db $02 ; bitmask
	db $3c
