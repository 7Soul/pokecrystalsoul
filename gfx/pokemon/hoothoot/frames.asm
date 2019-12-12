	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
.frame1
	db $00 ; bitmask
	db $19, $1a, $1b, $1c, $1d, $1e, $1f, $20, $21
.frame2
	db $01 ; bitmask
	db $22
.frame3
	db $02 ; bitmask
	db $19, $1a, $1c, $23, $1f, $20
.frame4
	db $03 ; bitmask
	db $24, $25, $26, $19, $1a, $27, $1c, $23, $28, $1f, $20, $29
	db $2a
.frame5
	db $02 ; bitmask
	db $19, $1a, $1c, $1d, $1f, $20
