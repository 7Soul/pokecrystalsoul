	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
.frame1
	db $00 ; bitmask
	db $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c
	db $3d
.frame2
	db $00 ; bitmask
	db $3e, $3f, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49
	db $4a
.frame3
	db $01 ; bitmask
	db $4b, $4c, $4d, $4e
.frame4
	db $02 ; bitmask
	db $4f
.frame5
	db $02 ; bitmask
	db $4f
