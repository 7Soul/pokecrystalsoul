PrintMoveDesc:
	push hl
	ld a, [wCurVariableMove]
	cp -1
	jr z, .not_variable1
	ld hl, VariableMoveDescriptions
	jr .got_data
.not_variable1
	ld hl, MoveDescriptions
	ld a, [wCurSpecies]
	dec a
.got_data
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
; if the description points to $0000, use original description
	ld a, d
	and a
	jr nz, .ok
	ld a, e
	and a
	jr z, .not_variable1
.ok
	pop hl
	jp PlaceString
