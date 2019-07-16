	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
.frame1
	db $00 ; bitmask
	db $31, $32, $33, $34, $35, $36, $37, $38, $39
.frame2
	db $01 ; bitmask
	db $00, $00, $00, $3a, $3b, $3c, $3d, $3e, $3f
.frame3
	db $02 ; bitmask
	db $00, $00, $40, $41, $00, $3a, $3b, $3c, $42, $43, $3d, $44
	db $3f, $45
.frame4
	db $03 ; bitmask
	db $46, $47, $48, $49
.frame5
	db $04 ; bitmask
	db $4a
.frame6
	db $05 ; bitmask
	db $4b, $4c
