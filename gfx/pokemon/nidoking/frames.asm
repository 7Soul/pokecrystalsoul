	dw .frame1
	dw .frame2
	dw .frame3
.frame1
	db $00 ; bitmask
	db $2a, $2a, $2a, $31, $32, $33, $34, $35, $36, $37, $38, $39
	db $3a, $3b, $3c, $3d, $3e, $3f, $40, $41, $42, $43, $44, $45
	db $2a, $2a, $46, $47, $48, $49
.frame2
	db $00 ; bitmask
	db $2a, $2a, $2a, $4a, $32, $33, $4b, $4c, $4d, $37, $38, $4e
	db $3a, $3b, $4f, $50, $3e, $51, $52, $41, $42, $53, $44, $45
	db $2a, $2a, $46, $47, $48, $49
.frame3
	db $01 ; bitmask
	db $54, $55, $49
