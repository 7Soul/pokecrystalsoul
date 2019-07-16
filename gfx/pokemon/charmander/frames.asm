	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
.frame1
	db $00 ; bitmask
	db $19, $1a, $1b, $1c, $1d, $1e, $1f, $20
.frame2
	db $01 ; bitmask
	db $18, $21, $22, $1a, $23, $24, $25, $1b, $26, $27, $28, $1f
	db $20
.frame3
	db $02 ; bitmask
	db $29, $2a, $2b
.frame4
	db $03 ; bitmask
	db $2b, $18, $2c, $2d, $2e, $2f, $30
