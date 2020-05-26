_TitleScreen:
	; call ClearBGPalettes
	call ClearSprites
	call ClearTileMap

; Turn BG Map update off
	xor a
	ldh [hBGMapMode], a

; Reset timing variables
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wIntroSceneFrameCounter
	ld [hli], a ; wTitleScreenTimer
	ld [hl], a  ; wTitleScreenTimer + 1

; Turn LCD off
	call DisableLCD

; VRAM bank 1
	ld a, 1
	ldh [rVBK], a

; Decompress running Suicune gfx
	ld hl, TitlePokeballGFX
	ld de, vTiles1
	call Decompress

; Clear screen palettes
	hlbgcoord 0, 0
	ld bc, 20 * BG_MAP_WIDTH
	xor a
	call ByteFill

; Fill tile palettes:

; BG Map 1:

; line 0 (copyright)
	hlbgcoord 0, 0, vBGMap1
	ld bc, BG_MAP_WIDTH
	ld a, 4 ; palette
	call ByteFill

; BG Map 0:

; Apply logo gradient:

; lines 3-4
	hlbgcoord 0, 3
	ld bc, 2 * BG_MAP_WIDTH
	ld a, 2
	call ByteFill
; line 5
	hlbgcoord 0, 5
	ld bc, BG_MAP_WIDTH
	ld a, 3
	call ByteFill
; line 6
	hlbgcoord 0, 6
	ld bc, BG_MAP_WIDTH
	ld a, 4
	call ByteFill
; line 7
	hlbgcoord 0, 7
	ld bc, BG_MAP_WIDTH
	ld a, 5
	call ByteFill
; lines 8-9
	hlbgcoord 0, 8
	ld bc, 2 * BG_MAP_WIDTH
	ld a, 6
	call ByteFill

; 'CRYSTAL VERSION'
	hlbgcoord 5, 9
	ld bc, NAME_LENGTH ; length of version text
	ld a, 1
	call ByteFill

; Suicune gfx
	hlbgcoord 0, 12
	ld bc, 6 * BG_MAP_WIDTH ; the rest of the screen
	ld a, 0 | VRAM_BANK_1
	call ByteFill

; Back to VRAM bank 0
	ld a, $0
	ldh [rVBK], a

; Decompress logo
	ld hl, TitleLogoGFX
	ld de, vTiles1
	call Decompress

; Decompress background crystal
	ld hl, TitleCrystalGFX
	ld de, vTiles0
	call Decompress

	ld hl, LetterOGFX
	ld de, vTiles0 tile $3C
	call Decompress

; Clear screen tiles
	hlbgcoord 0, 0
	ld bc, 64 * BG_MAP_WIDTH
	ld a, " "
	call ByteFill

; Draw Pokemon logo
	hlcoord 0, 3
	lb bc, 7, 20
	ld d, $80
	ld e, $14
	call DrawTitleGraphic

; Draw copyright text
	hlbgcoord 0, 0, vBGMap1
	lb bc, 1, 13
	ld d, $c
	ld e, $10
	call DrawTitleGraphic

; Initialize running Suicune?
	ld d, $0
	call LoadSuicuneFrame

; Initialize background crystal
	; call InitializeBackground

	call InitializeO

; Save WRAM bank
	ldh a, [rSVBK]
	push af
; WRAM bank 5
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

; Update palette colors
	ld hl, TitleScreenPalettes
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes

	ld hl, TitleScreenPalettes
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes

; Restore WRAM bank
	pop af
	ldh [rSVBK], a

; LY/SCX trickery starts here

	ldh a, [rSVBK]
	push af
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a

; Make alternating lines come in from opposite sides

; (This part is actually totally pointless, you can't
;  see anything until these values are overwritten!)

	ld b, 80 / 2 ; alternate for 80 lines
	ld hl, wLYOverrides
.loop
; $00 is the middle position
	ld [hl], +112 ; coming from the left
	inc hl
	ld [hl], -112 ; coming from the right
	inc hl
	dec b
	jr nz, .loop

; Make sure the rest of the buffer is empty
	ld hl, wLYOverrides + 80
	xor a
	ld bc, wLYOverridesEnd - (wLYOverrides + 80)
	call ByteFill

; Let LCD Stat know we're messing around with SCX
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a

	pop af
	ldh [rSVBK], a

; Reset audio
	call ChannelsOff
	call EnableLCD

; Set sprite size to 8x16
	ldh a, [rLCDC]
	set rLCDC_SPRITE_SIZE, a
	ldh [rLCDC], a

	ld a, +112
	ldh [hSCX], a
	ld a, 8
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, -112
	ldh [hWY], a

	ld a, $1
	ldh [hCGBPalUpdate], a

; Update BG Map 0 (bank 0)
	ldh [hBGMapMode], a

	xor a
	ld [wd002], a

; Play starting sound effect
	call SFXChannelsOff
	ld de, SFX_TITLE_SCREEN_ENTRANCE
	call PlaySFX

	ret

SuicuneFrameIterator:
	ld hl, wd002
	ld a, [hl]
	ld c, a
	inc [hl]

; Only do this once every eight frames
	and %111
	ret nz

	ld a, c
	and %11111000
	sla a
	swap a
	ld e, a
	ld d, $0
	ld hl, .Frames
	add hl, de
	ld d, [hl]
	xor a
	ldh [hBGMapMode], a
	call LoadSuicuneFrame
	ld a, $1
	ldh [hBGMapMode], a
	ld a, $3
	ldh [hBGMapThird], a
	ret

.Frames:
	db $80
	db $83
	db $86
	db $89
	db $8C
	db $8F
	db $92
	db $95
	db $B0
	db $B3
	db $B6
	db $B9
	db $BC
	db $BF
	db $C2
	db $C5

LoadSuicuneFrame:
	hlcoord 8, 12
	ld b, 2
.bgrows
	ld c, 3
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	ld a, SCREEN_WIDTH - 3
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, 21
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret

DrawTitleGraphic:
; input:
;   hl: draw location
;   b: height
;   c: width
;   d: tile to start drawing from
;   e: number of tiles to advance for each bgrows
.bgrows
	push de
	push bc
	push hl
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	pop de
	ld a, e
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret

InitializeBackground:
	ld hl, wVirtualOAMSprite00
	ld d, -$22
	ld e, $0
	ld c, 5 ; columns
.loop
	push bc
	call .InitColumn
	pop bc
	ld a, $10
	add d
	ld d, a
	dec c
	jr nz, .loop
	ret

.InitColumn:
	ld c, $6 ; column
	ld b, $40
.loop2
	ld a, d
	ld [hli], a ; y
	ld a, b
	ld [hli], a ; x
	add $8
	ld b, a
	ld a, e
	ld [hli], a ; tile id
	inc e
	inc e
	ld a, 0 | PRIORITY
	ld [hli], a ; attributes
	dec c
	jr nz, .loop2
	ret

InitializeO:
	ld hl, wVirtualOAMSprite00
	ld d, -$8 ; y pos
	ld e, $3C ; tile id
	ld c, 2 ; columns
.loop
	push bc
	call .InitColumn
	pop bc
	ld a, $10 ; 16
	add d
	ld d, a
	dec c
	jr nz, .loop
	ret

.InitColumn:
	ld c, $4 ; columns of tiles to print
	ld b, $28 ; x pos
.loop2
	ld a, d
	ld [hli], a ; y
	ld a, b
	ld [hli], a ; x
	add $8
	ld b, a
	ld a, e
	ld [hli], a ; tile id
	inc e
	inc e ; tile
	ld a, d
	cp $F8
	jr z, .pal1
	ld a, 2 ; pal
	jr .got_pal
.pal1
	ld a, 1
.got_pal
	ld [hli], a ; attributes
	dec c
	jr nz, .loop2
	ret

AnimateTitleCrystal:
; Move the title screen crystal downward until it's fully visible

; Stop at y=6
; y is really from the bottom of the sprite, which is two tiles high
	ld hl, wVirtualOAMSprite00YCoord
	ld a, [hl]
	cp $28
	ret z

; Move all 30 parts of the crystal down by 2
	ld c, 8
.loop
	ld a, [hl]
	add 4
	ld [hli], a ; y
rept SPRITEOAMSTRUCT_LENGTH + -1
	inc hl
endr
	dec c
	jr nz, .loop

	ret

TitlePokeballGFX:
INCBIN "gfx/title/pokeball.2bpp.lz"

TitleLogoGFX:
INCBIN "gfx/title/logo.2bpp.lz"

TitleCrystalGFX:
INCBIN "gfx/title/crystal.2bpp.lz"

LetterOGFX:
INCBIN "gfx/title/letter_o.2bpp.lz"

TitleScreenPalettes:
INCLUDE "gfx/title/title.pal"
