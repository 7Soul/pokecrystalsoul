PrintTraitDesc:
	push hl
	; ld a, [wCurSpecies]
	; and $f
	; ld hl, wBaseTraits
	; ld b, 0
	; ld c, a
	; add hl, bc
	; ld a, [hl]
	
	ld hl, TraitDescriptions
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	jp PlaceString
