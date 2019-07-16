	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
.frame1
	db $00 ; bitmask
	db $03, $31, $32, $33, $34, $35, $36, $37, $03, $38, $39, $3a
	db $3b, $3c, $03, $3d, $3e
.frame2
	db $01 ; bitmask
	db $03, $3f, $40, $33, $41, $35, $38, $39, $3a, $42, $3d, $3e
	db $43, $44
.frame3
	db $02 ; bitmask
	db $45, $46, $47, $48, $49, $4a, $4b, $4c, $4d, $42, $4e, $4f
	db $50, $43, $44
.frame4
	db $03 ; bitmask
	db $03, $3f, $40, $33, $41, $35, $38, $39, $3a, $42, $3d, $3e
.frame5
	db $04 ; bitmask
	db $42, $43, $44
