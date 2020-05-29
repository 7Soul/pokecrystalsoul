_LoadMapPart::
	ld hl, wSurroundingTiles
	decoord 0, 0
	call .copy
	ld hl, wSurroundingAttributes
	decoord 0, 0, wAttrMap
.copy:
	ld a, [wMetatileStandingY]
	and a
	jr z, .top_row
	ld bc, SURROUNDING_WIDTH * 2
	add hl, bc

.top_row
	ld a, [wMetatileStandingX]
	and a
	jr z, .left_column
	inc hl
	inc hl

.left_column
	ldh a, [rSVBK]
	push af
	ld a, BANK("Surrounding Data")
	ldh [rSVBK], a
	ld b, SCREEN_HEIGHT
.loop
	ld c, SCREEN_WIDTH
.loop2
	ld a, [hli]
	; call ReplaceTile
	ld [de], a
	inc de
	dec c
	jr nz, .loop2
	ld a, l
	add METATILE_WIDTH
	ld l, a
	jr nc, .carry
	inc h

.carry
	dec b
	jr nz, .loop
	pop af
	ldh [rSVBK], a
	ret

; ReplaceTile:
; 	push hl
; 	ld a, [wMapTileset]
; 	cp TILESET_JOHTO
; 	ld a, [hl]
; 	jr nz, .end

; 	cp $3F
; 	jr nz, .tile2
; ; check tile to right
; 	inc hl
; 	ld a, [hl]
; 	cp $3E
; 	jr z, .may_replace1
; 	and a
; 	jr nz, .end
; .may_replace1
; 	dec hl
; 	call CheckTileBelow
; 	cp $1F
; 	jr z, .replace1
; 	and a
; 	jr nz, .end
; .replace1
; 	ld a, $5D ;$C8
; 	jr .end2

; .tile2
; ; 	cp $3E
; ; 	jr nz, .tile3
; ; ; check tile to left
; ; 	dec hl
; ; 	ld a, [hl]
; ; 	cp $3F
; ; 	jr nz, .end
; ; 	ld a, $C9
; ; 	jr .end2

; ; .tile3
; ; 	cp $1F
; ; 	jr nz, .tile4
; ; ; check tile to right
; ; 	inc hl
; ; 	ld a, [hl]
; ; 	cp $1E
; ; 	jr nz, .end
; ; 	ld a, $D8
; ; 	jr .end2

; ; .tile4
; ; 	cp $1E
; ; 	jr nz, .end
; ; ; check tile to left
; ; 	dec hl
; ; 	ld a, [hl]
; ; 	cp $1F
; ; 	jr nz, .end
; ; 	ld a, $D9
; ; 	jr .end2

; .end
; 	pop hl
; 	ld a, [hli]
; 	ret

; .end2
; 	pop hl
; 	inc hl
; 	ret

; CheckTileBelow:
; 	push bc
; 	ld bc, SCREEN_WIDTH + METATILE_WIDTH
; 	add hl, bc
; 	pop bc
; 	ld a, [hl]
; 	ret

	; push bc
	; ld bc, -SCREEN_WIDTH
	; add hl, bc
	; pop bc
	; ld a, [hl]

; ReplaceTile2:
; 	push bc
; 	push hl ; map
; 	ld a, [wMapTileset]
; 	cp TILESET_JOHTO
; 	ld a, [hli]
; 	ld c, a ; c has current tile being drawn
; 	jr nz, .end2
	
; 	ld hl, .TileReplacements
; .loop
; 	ld a, [hli]
; 	cp -1
; 	jr z, .end
; 	cp c
; 	jr nz, .next_tile
; ; ; current tile is in list
; ; 	pop hl ; list
; ; 	ld a, [hli]
; ; 	dec a
; ; 	ld b, 0
; ; 	ld c, a
; ; 	pop hl ; map
; ; 	add hl, bc
; ; 	ld a, [hl]
; ; 	pop bc
; ; 	ret

; .next_tile
; 	inc hl
; 	inc hl
; 	inc hl
; 	jr .loop
; .end
; .end2
; 	pop hl ; map
; 	ld a, [hli]
; 	pop bc
; 	ret

; .TileReplacements:
; ; tile, tiles to move (+1), check this, replace with
; 	db $3F, 1, $3E, $C8
; 	db $3E, SCREEN_HEIGHT + SCREEN_WIDTH - 1, $3F, $C9
; 	db -1
