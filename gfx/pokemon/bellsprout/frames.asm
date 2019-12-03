	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
.frame1
	db $00 ; bitmask
	db $19, $1a, $1b, $1c, $1d
.frame2
	db $00 ; bitmask
	db $19, $1a, $1e, $1c, $1d
.frame3
	db $01 ; bitmask
	db $1f, $20, $0f, $21, $22, $23, $24, $25, $0f, $26
.frame4
	db $02 ; bitmask
	db $1f, $20, $0f, $21, $22, $23, $1c, $1d
.frame5
	db $03 ; bitmask
	db $1f, $20, $27, $24, $25, $0f, $26
.frame6
	db $04 ; bitmask
	db $19, $1a, $1c, $1d
