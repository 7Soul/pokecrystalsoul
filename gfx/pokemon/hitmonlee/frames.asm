	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
.frame1
	db $00 ; bitmask
	db $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c
	db $3d, $3e, $3f, $00
.frame2
	db $00 ; bitmask
	db $31, $40, $41, $42, $43, $36, $44, $45, $46, $00, $47, $00
	db $00, $00, $00, $00
.frame3
	db $01 ; bitmask
	db $48, $49, $4a, $4b, $4c, $4d, $4e, $4f, $50, $00, $00, $47
	db $00, $00, $00, $00, $00
.frame4
	db $02 ; bitmask
	db $51, $52, $53, $54, $55, $56, $57, $58, $50, $19, $59, $5a
	db $5b, $47, $00, $00, $00, $00, $00
.frame5
	db $03 ; bitmask
	db $5c, $5d, $5e
