	dw .frame1
	dw .frame2
	dw .frame3
.frame1
	db $00 ; bitmask
	db $24, $25, $26, $27, $28, $29, $2a
.frame2
	db $01 ; bitmask
	db $24, $25, $27, $2b, $2c, $29, $2d, $00, $00, $00
.frame3
	db $02 ; bitmask
	db $25, $27, $28, $29, $2a
