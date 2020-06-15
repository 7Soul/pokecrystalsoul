PrintMoveDesc:
	push hl
	ld hl, MoveDescriptions
	ld a, [wCurSpecies]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl

	ld a, [wCurVariableMove]
	cp -1
	jr z, .not_variable
	cp GATHER_SAND
	jr nz, .not_variable
	ld de, .GatherSandDesc

.not_variable
	jp PlaceString

.GatherSandDesc:
	db   "Ups DEF or SP.DEF"
	next "two times.@"
