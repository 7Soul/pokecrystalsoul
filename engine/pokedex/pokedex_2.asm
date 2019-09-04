AnimateDexSearchSlowpoke:
	ld hl, .FrameIDs
	ld b, 25
.loop
	ld a, [hli]

	; Wrap around
	cp $fe
	jr nz, .ok
	ld hl, .FrameIDs
	ld a, [hli]
.ok

	ld [wDexSearchSlowpokeFrame], a
	ld a, [hli]
	ld c, a
	push bc
	push hl
	call DoDexSearchSlowpokeFrame
	pop hl
	pop bc
	call DelayFrames
	dec b
	jr nz, .loop
	xor a
	ld [wDexSearchSlowpokeFrame], a
	call DoDexSearchSlowpokeFrame
	ld c, 32
	call DelayFrames
	ret

.FrameIDs:
	; frame ID, duration
	db 0, 7
	db 1, 7
	db 2, 7
	db 3, 7
	db 4, 7
	db -2

DoDexSearchSlowpokeFrame:
	ld a, [wDexSearchSlowpokeFrame]
	ld hl, .SlowpokeSpriteData
	ld de, wVirtualOAMSprite00
.loop
	ld a, [hli]
	cp -1
	ret z
	ld [de], a ; y
	inc de
	ld a, [hli]
	ld [de], a ; x
	inc de
	ld a, [wDexSearchSlowpokeFrame]
	ld b, a
	add a
	add b
	add [hl]
	inc hl
	ld [de], a ; tile id
	inc de
	ld a, [hli]
	ld [de], a ; attributes
	inc de
	jr .loop

.SlowpokeSpriteData:
	dsprite 11, 0,  9, 0, $00, 0
	dsprite 11, 0, 10, 0, $01, 0
	dsprite 11, 0, 11, 0, $02, 0
	dsprite 12, 0,  9, 0, $10, 0
	dsprite 12, 0, 10, 0, $11, 0
	dsprite 12, 0, 11, 0, $12, 0
	dsprite 13, 0,  9, 0, $20, 0
	dsprite 13, 0, 10, 0, $21, 0
	dsprite 13, 0, 11, 0, $22, 0
	db -1

DisplayDexEntry:
	call GetPokemonName
	hlcoord 9, 1
	call PlaceString ; mon species
	ld a, [wTempSpecies]
	ld [wCurSpecies], a
	ld b, a
	call GetDexEntryPointer
	ld a, b
	push af
	hlcoord 9, 2
	call FarString ; dex species
	ld h, b
	ld l, c
	push de
; Print dex number
	hlcoord 2, 8
	ld a, $5c ; No
	ld [hli], a
	ld a, $5d ; .
	ld [hli], a
	ld de, wTempSpecies
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum

	hlcoord 9, 3
	ld bc, SCREEN_WIDTH - 9
	ld a, $6e ; horizontal divider
	call ByteFill
	hlcoord 8, 3
	ld a, $6f
	ld [hli], a
	
	call GetBaseData
	call DrawBaseStats
	call DrawEggGroups
	
; Check to see if we caught it.  Get out of here if we haven't.
	ld a, [wTempSpecies]
	dec a
	call CheckCaughtMon
	pop hl
	pop bc
	ret z
; Get the height of the Pokemon.
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	inc hl
	ld a, b
	push af
	push hl
	call GetFarHalfword
	ld d, l
	ld e, h
	pop hl
	inc hl
	inc hl
	ld a, d
	or e
	jr z, .skip_height
	push hl
	push de
	; ld hl, sp+$0
	; ld d, h
	; ld e, l
	; hlcoord 12, 7
	; lb bc, 2, PRINTNUM_MONEY | 4
	; call PrintNum
	; hlcoord 14, 7
	; ld [hl], $5e ; ft symbol
	pop af
	pop hl

.skip_height
	pop af
	push af
	inc hl
	push hl
	dec hl
	call GetFarHalfword
	ld d, l
	ld e, h
	ld a, e
	or d
	jr z, .skip_weight
	push de
	; ld hl, sp+$0
	; ld d, h
	; ld e, l
	; hlcoord 11, 9
	; lb bc, 2, PRINTNUM_RIGHTALIGN | 5
	; call PrintNum
	pop de

.skip_weight
; Page 1
	lb bc, 6, 11
	hlcoord 9, 4
	call ClearBox

	call DrawBaseStats
	call DrawEggGroups

	; egg group
	hlcoord 2, 10
	ld de, .egg_text
	call PlaceString

	hlcoord 7, 10
	ld a, $5a
	ld [hl], a
	hlcoord 7, 11
	ld a, $5a
	ld [hl], a

	lb bc, 3, SCREEN_WIDTH - 2
	hlcoord 2, 13
	call ClearBox
; horizontal divider
	hlcoord 1, 12
	ld bc, SCREEN_WIDTH - 1
	ld a, $6e 
	call ByteFill
	hlcoord 1, 12
	ld [hl], $5f
; page number
	hlcoord 9, 3
	ld [hl], $56 ; P.
	inc hl
	ld [hl], $57 ; 1
	pop de
	inc de
	pop af
	hlcoord 2, 13
	push af
	call FarString
	pop bc
	ld a, [wPokedexStatus]
	or a ; check for page 2
	ret z

; Page 2
	push bc
	push de
	lb bc, 6, 11
	hlcoord 9, 4
	call ClearBox

	lb bc, 3, SCREEN_WIDTH - 2
	hlcoord 2, 13
	call ClearBox
; horizontal divider
	hlcoord 1, 12
	ld bc, SCREEN_WIDTH - 1
	ld a, $6e 
	call ByteFill
	hlcoord 2, 12
	ld [hl], $5f
; page number
	hlcoord 9, 3
	ld [hl], $56 ; P.
	inc hl
	ld [hl], $58 ; 2
	pop de
	inc de
	pop af
	hlcoord 2, 13
	call FarString
	ret

.egg_text:
	db "  Egg"
	line2 "Group@"

UnreferencedPOKeString:
; unused
	db "#@"

DrawEggGroups:
	;call GetBaseData
	ld a, [wBaseEggGroups]
	ld [$C001], a
	push af
	and $f
	ld d, a
	pop af
	and $f0
	swap a
	ld e, a

	ld hl, .EggNames
	ld a, d
	ld bc, $d
	call AddNTimes
	ld d, h
	ld e, l
	hlcoord 8, 10
	call PlaceString ; egg group 1

	ld a, [wBaseEggGroups]
	push af
	and $f
	ld d, a
	pop af
	and $f0
	swap a
	ld e, a
	cp d
	jr z, .equal

	ld hl, .EggNames
	ld a, e
	ld bc, $d
	call AddNTimes
	ld d, h
	ld e, l
	hlcoord 8, 11
	call PlaceString ; egg group 2
.equal
	ret

	
.EggNames:
	db "None        @"
	db "Monster     @"
	db "Amphibian   @"
	db "Bug         @"
	db "Flying      @"
	db "Field       @"
	db "Fairy       @"
	db "Grass       @"
	db "Human-Like  @"
	db "Invertebrate@"
	db "Mineral     @"
	db "Amorphous   @"
	db "Fish        @"
	db "Ditto       @"
	db "Dragon      @"
	db "Undiscovered@"

DrawBaseStats:
	hlcoord 9, 4 ; hp
	ld a, "H"
	ld [hli], a
	ld a, "P"
	ld [hli], a	
	
	ld de, wBaseHP
	hlcoord 11, 5
	lb bc, PRINTNUM_RIGHTALIGN | 1, 3
	call PrintNum
	inc de

	hlcoord 9, 6 ; atk
	ld a, $62
	ld [hli], a
	ld a, $63
	ld [hli], a
	hlcoord 11, 7
	lb bc, PRINTNUM_RIGHTALIGN | 1, 3
	call PrintNum
	inc de

	hlcoord 9, 8 ; def
	ld a, $64
	ld [hli], a
	ld a, $65
	ld [hli], a
	hlcoord 11, 9
	lb bc, PRINTNUM_RIGHTALIGN | 1, 3
	call PrintNum
	inc de

	hlcoord 15, 4 ; speed
	ld a, $6c
	ld [hli], a
	ld a, $6d
	ld [hli], a
	hlcoord 17, 5
	lb bc, PRINTNUM_RIGHTALIGN | 1, 3
	call PrintNum
	inc de

	hlcoord 15, 6 ; sp.atk
	ld a, $5e
	ld [hli], a
	ld a, $62
	ld [hli], a
	ld a, $63
	ld [hli], a	
	hlcoord 17, 7
	lb bc, PRINTNUM_RIGHTALIGN | 1, 3
	call PrintNum
	inc de

	hlcoord 15, 8 ; sp.def
	ld a, $5e
	ld [hli], a
	ld a, $64
	ld [hli], a
	ld a, $65
	ld [hli], a
	hlcoord 17, 9
	lb bc, PRINTNUM_RIGHTALIGN | 1, 3
	call PrintNum
	ret
GetDexEntryPointer:
; return dex entry pointer b:de
	push hl
	ld hl, PokedexDataPointerTable
	ld a, b
	dec a
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	rlca
	rlca
	maskbits NUM_DEX_ENTRY_BANKS
	ld hl, .PokedexEntryBanks
	ld d, 0
	ld e, a
	add hl, de
	ld b, [hl]
	pop de
	pop hl
	ret

.PokedexEntryBanks:
	db BANK("Pokedex Entries 001-064")
	db BANK("Pokedex Entries 065-128")
	db BANK("Pokedex Entries 129-192")
	db BANK("Pokedex Entries 193-251")

GetDexEntryPagePointer:
	call GetDexEntryPointer
	push hl
	ld h, d
	ld l, e
; skip species name
.loop1
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop1
; skip height and weight
rept 4
	inc hl
endr
; if c != 1: skip entry
	dec c
	jr z, .done
; skip entry
.loop2
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop2

.done
	ld d, h
	ld e, l
	pop hl
	ret

INCLUDE "data/pokemon/dex_entry_pointers.asm"
