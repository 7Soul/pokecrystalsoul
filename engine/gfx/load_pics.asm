GetUnownLetter: ; Return Unown letter in wUnownLetter based on DVs at hl
	inc hl
	ld a, [hl]
	and DV_MASK
	ld [wUnownLetter], a
	ret

GetMonFrontpic:
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call IsAPokemon
	ret c
	ldh a, [rSVBK]
	push af
	call _GetFrontpic
	pop af
	ldh [rSVBK], a
	ret

GetAnimatedFrontpic:
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call IsAPokemon
	ret c
	ldh a, [rSVBK]
	push af
	xor a
	ldh [hBGMapMode], a
	call _GetFrontpic
	call GetAnimatedEnemyFrontpic
	pop af
	ldh [rSVBK], a
	ret

_GetFrontpic:
	push de
	call GetBaseData
	ld a, [wBasePicSize]
	and $f
	ld b, a
	push bc
	call GetFrontpicPointer
	ld a, BANK(wDecompressEnemyFrontpic)
	ldh [rSVBK], a
	ld a, b
	ld de, wDecompressEnemyFrontpic
	call FarDecompress
	pop bc
	ld hl, wDecompressScratch
	ld de, wDecompressEnemyFrontpic
	call PadFrontpic
	pop hl
	push hl
	ld de, wDecompressScratch
	ld c, 7 * 7
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp
	pop hl
	ret

GetFrontpicPointer:
	ld a, [wCurPartySpecies]
	cp UNOWN
	jr z, .unown
	ld a, [wCurPartySpecies]
	ld hl, PokemonPicPointers
	ld d, BANK(PokemonPicPointers)
	jr .ok

.unown
	ld a, [wUnownLetter]
	cp 0
	jr nz, .valid_unown
	inc a ; unown fix
.valid_unown
	ld hl, UnownPicPointers
	ld d, BANK(UnownPicPointers)

.ok
	dec a
	ld bc, 6
	call AddNTimes
	ld a, d
	call GetFarByte
	push af
	inc hl
	ld a, d
	call GetFarHalfword
	pop bc
	ret

GetAnimatedEnemyFrontpic:
	ld a, BANK(vTiles3)
	ldh [rVBK], a
	push hl
	ld de, wDecompressScratch
	ld c, 7 * 7
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp
	pop hl
	ld de, 7 * 7 tiles
	add hl, de
	push hl
	ld a, BANK(wBasePicSize)
	ld hl, wBasePicSize
	call GetFarWRAMByte
	pop hl
	and $f
	ld de, wDecompressEnemyFrontpic + 5 * 5 tiles
	ld c, 5 * 5
	cp 5
	jr z, .got_dims
	ld de, wDecompressEnemyFrontpic + 6 * 6 tiles
	ld c, 6 * 6
	cp 6
	jr z, .got_dims
	ld de, wDecompressEnemyFrontpic + 7 * 7 tiles
	ld c, 7 * 7
.got_dims
	push hl
	push bc
	call LoadFrontpicTiles
	pop bc
	pop hl
	ld de, wDecompressScratch
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp
	xor a
	ldh [rVBK], a
	ret

LoadFrontpicTiles:
	ld hl, wDecompressScratch
	swap c
	ld a, c
	and $f
	ld b, a
	ld a, c
	and $f0
	ld c, a
	push bc
	call LoadOrientedFrontpic
	pop bc
.loop
	push bc
	ld c, 0
	call LoadOrientedFrontpic
	pop bc
	dec b
	jr nz, .loop
	ret

GetMonBackpic:
	ld a, [wCurPartySpecies]
	call IsAPokemon
	ret c

	ld a, [wCurPartySpecies]
	ld b, a
	ld a, [wUnownLetter]
	ld c, a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a
	push de

	ld a, b
	ld hl, PokemonPicPointers
	ld d, BANK(PokemonPicPointers)
	cp UNOWN
	jr nz, .ok
	ld a, c
	ld hl, UnownPicPointers
	ld d, BANK(UnownPicPointers)
.ok
	dec a
	ld bc, 6
	call AddNTimes
	ld bc, 3
	add hl, bc
	ld a, d
	call GetFarByte
	push af
	inc hl
	ld a, d
	call GetFarHalfword
	ld de, wDecompressScratch
	pop af
	call FarDecompress
	ld hl, wDecompressScratch
	ld c, 6 * 6
	call FixBackpicAlignment
	pop hl
	ld de, wDecompressScratch
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp
	pop af
	ldh [rSVBK], a
	ret

Function511ec:
	ld a, c
	push de
	ld hl, PokemonPicPointers
	dec a
	ld bc, 6
	call AddNTimes
	ld a, BANK(PokemonPicPointers)
	call GetFarByte
	push af
	inc hl
	ld a, BANK(PokemonPicPointers)
	call GetFarHalfword
	pop af
	pop de
	call FarDecompress
	ret

GetTrainerPic:
	ld a, [wTrainerClass]
	and a
	ret z
	cp NUM_TRAINER_CLASSES
	ret nc
	call WaitBGMap
	xor a
	ldh [hBGMapMode], a
	ld hl, TrainerPicPointers
	ld a, [wTrainerClass]
	dec a
	ld bc, 3
	call AddNTimes
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a
	push de
	ld a, BANK(TrainerPicPointers)
	call GetFarByte
	push af
	inc hl
	ld a, BANK(TrainerPicPointers)
	call GetFarHalfword
	pop af
	ld de, wDecompressScratch
	call FarDecompress
	pop hl
	ld de, wDecompressScratch
	ld c, 7 * 7
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp
	pop af
	ldh [rSVBK], a
	call WaitBGMap
	ld a, $1
	ldh [hBGMapMode], a
	ret

DecompressGet2bpp:
; Decompress lz data from b:hl to scratch space at 6:d000, then copy it to address de.

	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a

	push de
	push bc
	ld a, b
	ld de, wDecompressScratch
	call FarDecompress
	pop bc
	ld de, wDecompressScratch
	pop hl
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp

	pop af
	ldh [rSVBK], a
	ret

FixBackpicAlignment:
	push de
	push bc
	ld a, [wBoxAlignment]
	and a
	jr z, .keep_dims
	ld a, c
	cp 7 * 7
	ld de, 7 * 7 tiles
	jr z, .got_dims
	cp 6 * 6
	ld de, 6 * 6 tiles
	jr z, .got_dims
	ld de, 5 * 5 tiles

.got_dims
	ld a, [hl]
	ld b, 0
	ld c, 8
.loop
	rra
	rl b
	dec c
	jr nz, .loop
	ld a, b
	ld [hli], a
	dec de
	ld a, e
	or d
	jr nz, .got_dims

.keep_dims
	pop bc
	pop de
	ret

PadFrontpic:
; pads frontpic to fill 7x7 box
	ld a, b
	cp 6
	jr z, .six
	cp 5
	jr z, .five

.seven_loop
	ld c, 7 << 4
	call LoadOrientedFrontpic
	dec b
	jr nz, .seven_loop
	ret

.six
	ld c, 7 << 4
	call .Fill
.six_loop
	ld c, (7 - 6) << 4
	call .Fill
	ld c, 6 << 4
	call LoadOrientedFrontpic
	dec b
	jr nz, .six_loop
	ret

.five
	ld c, 7 << 4
	call .Fill
.five_loop
	ld c, (7 - 5) << 4
	call .Fill
	ld c, 5 << 4
	call LoadOrientedFrontpic
	dec b
	jr nz, .five_loop
	ld c, 7 << 4
	call .Fill
	ret

.Fill:
	xor a
.fill_loop
	ld [hli], a
	dec c
	jr nz, .fill_loop
	ret

LoadOrientedFrontpic:
	ld a, [wBoxAlignment]
	and a
	jr nz, .x_flip
.left_loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .left_loop
	ret

.x_flip
	push bc
.right_loop
	ld a, [de]
	inc de
	ld b, a
	xor a
rept 8
	rr b
	rla
endr
	ld [hli], a
	dec c
	jr nz, .right_loop
	pop bc
	ret
