	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
.frame1
	db $00 ; bitmask
	db $03, $03, $31, $32, $03, $03, $33, $34, $35, $36, $03, $03
	db $37, $38, $03, $03, $03, $39
.frame2
	db $01 ; bitmask
	db $3a, $3b, $3c, $3d, $3e, $3f, $40, $41
.frame3
	db $02 ; bitmask
	db $03, $03, $31, $32, $3a, $3b, $03, $03, $33, $34, $3c, $3d
	db $35, $36, $3e, $3f, $03, $03, $37, $38, $40, $41, $03, $03
	db $03, $39
.frame4
	db $03 ; bitmask
	db $42, $43, $44, $45, $46, $47, $03, $48, $49, $03
.frame5
	db $04 ; bitmask
	db $03, $03, $31, $32, $42, $43, $03, $03, $33, $34, $44, $45
	db $35, $36, $46, $47, $03, $03, $03, $37, $38, $48, $49, $03
	db $03, $03, $03, $39
