	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
	dw .frame7
.frame1
	db $00 ; bitmask
	db $31, $32, $33, $34
.frame2
	db $01 ; bitmask
	db $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e, $3f, $40
	db $41, $42, $43, $44, $45, $46
.frame3
	db $02 ; bitmask
	db $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f, $50, $51, $52
	db $53, $54, $55, $56
.frame4
	db $03 ; bitmask
	db $47, $57, $58, $59, $4c, $4d, $4f, $5a, $52, $5b, $5c, $55
	db $56
.frame5
	db $04 ; bitmask
	db $5d, $5e
.frame6
	db $05 ; bitmask
	db $5f, $60
.frame7
	db $05 ; bitmask
	db $61, $62
