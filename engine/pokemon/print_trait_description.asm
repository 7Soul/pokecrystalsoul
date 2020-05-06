PrintTraitDesc:
	push hl
	ld hl, TraitDescriptions
	ld a, [wCurSpecies]
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	jp PlaceString
