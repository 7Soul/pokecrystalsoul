	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
	dw .frame7
.frame1
	db $00 ; bitmask
	db $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c
.frame2
	db $01 ; bitmask
	db $3d, $05, $3e, $31, $32, $3f, $40, $41, $42, $33, $34, $43
	db $44, $39, $3a, $3b, $3c
.frame3
	db $02 ; bitmask
	db $31, $32, $33, $34, $45, $46, $47, $48, $49, $4a, $05, $4b
	db $39, $3a, $4c, $4d, $4e, $3b, $3c, $4f, $05
.frame4
	db $03 ; bitmask
	db $3d, $05, $31, $32, $50, $51, $52, $33, $34, $53, $54, $55
	db $56, $57, $58, $59, $5a, $39, $3a, $4c, $4d, $4e, $3b, $3c
	db $4f, $05
.frame5
	db $04 ; bitmask
	db $5b, $5c, $5d, $5e
.frame6
	db $03 ; bitmask
	db $3d, $05, $31, $32, $50, $51, $52, $33, $34, $53, $5f, $55
	db $60, $05, $58, $61, $5a, $39, $3a, $4c, $4d, $4e, $3b, $3c
	db $4f, $05
.frame7
	db $05 ; bitmask
