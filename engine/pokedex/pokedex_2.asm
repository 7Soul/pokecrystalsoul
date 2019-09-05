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
	ld a, [wPokedexStatus]
	cp 2 ; check for page 2
	jp z, .skip_pic
	farcall Pokedex_PlaceFrontpicTopLeftCorner
.skip_pic

	call GetPokemonName
	hlcoord 9, 1
	call PlaceString ; mon species
	ld a, [wTempSpecies]

	ld [wTempEnemyMonSpecies], a
	predef GetFoughtMonCount
	ld a, [wPokedexFoughtCount]

	ld a, [wTempSpecies]
	ld [wCurSpecies], a
	ld b, a
	call GetDexEntryPointer
	ld a, b
	push af
	hlcoord 8, 2
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
; .skip_pic
	call GetBaseData

	ld a, [wTempSpecies]
	dec a
	call CheckCaughtMon
	ld [wPokedexInfoSeenCheck], a
	;call DrawBaseStats
	;call DrawEggGroups

; ; Check to see if we caught it.  Get out of here if we haven't.
; 	ld a, [wTempSpecies]
; 	dec a
; 	call CheckCaughtMon
	pop hl
	pop bc
	; ret z
	
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
	; push de
	; ld hl, sp+$0
	; ld d, h
	; ld e, l
	; hlcoord 11, 9
	; lb bc, 2, PRINTNUM_RIGHTALIGN | 5
	; call PrintNum
	; pop de

.skip_weight
; Page 1
; clear area

	ld a, [wPokedexStatus]
	cp 2 ; check for page 2
	jp z, .page3

	lb bc, 6, 11
	hlcoord 9, 4
	call ClearBox ; clear top-right area
	lb bc, 3, SCREEN_WIDTH - 2
	hlcoord 2, 9
	call ClearBox ; clear middle area
	lb bc, 3, SCREEN_WIDTH - 2
	hlcoord 2, 13
	call ClearBox ; clear text area

	call DrawBaseStatsNames

; egg group text
	hlcoord 2, 10
	ld de, .egg_text
	call PlaceString
; vertical line after egg group text
	hlcoord 7, 10
	ld a, $5a
	ld [hl], a
	hlcoord 7, 11
	ld a, $5a
	ld [hl], a

	ld a, [wPokedexInfoSeenCheck]
	and a
	jr nz, .skip_egg_groups ; skip not caught
	hlcoord 8, 10
	ld de, ThreeDashes
	call PlaceString

.skip_egg_groups
; horizontal divider before text
	hlcoord 1, 12
	ld bc, SCREEN_WIDTH - 1
	ld a, $6e 
	call ByteFill
	hlcoord 1, 12
	ld [hl], $5f ; pencil icon
; page number
	hlcoord 9, 3
	ld [hl], $56 ; P.
	inc hl
	ld [hl], $57 ; 1
	
; Check to see if we caught it.  Get out of here if we haven't.
	ld a, [wPokedexInfoSeenCheck]
	and a
	jr z, .skip_page1_info

	call DrawBaseStats
	call DrawEggGroups

	pop de
	inc de
	pop af
	hlcoord 2, 13
	push af
	call FarString ; pokedex text part 1
	pop bc
	jr .check_page2

.skip_page1_info
	pop de
	inc de
	pop bc
.check_page2
	ld a, [wPokedexStatus]
	cp 0 ; check for page 2
	ret z
	cp 2 ; check for page 2
	jp z, .page3

; Page 2
	push bc
	push de
	; call GetBaseData
; clear area
	lb bc, 6, 11
	hlcoord 9, 4
	call ClearBox ; clear top-right area
	lb bc, 3, SCREEN_WIDTH - 2
	hlcoord 2, 9
	call ClearBox ; clear middle area
	lb bc, 3, SCREEN_WIDTH - 2
	hlcoord 2, 13
	call ClearBox ; clear text area

; draw types
	hlcoord 9, 4
	ld a, [wBaseType1]
	ld b, a
	predef PrintType

	ld a, [wBaseType1]
	ld b, a
	ld a, [wBaseType2]
	cp b
	jr z, .hide_type_2
	hlcoord 11, 5
	ld b, a
	predef PrintType
	hlcoord 10, 5
	ld a, "/"
	ld [hl], a

.hide_type_2
; catch text
	hlcoord 9, 7
	ld de, .catch_text
	call PlaceString
; vertical line after catch text
	hlcoord 14, 7
	ld a, $5a
	ld [hl], a

	ld a, [wPokedexInfoSeenCheck]
	and a
	jr nz, .print_rate_caught ; skip not caught
	hlcoord 15, 7
	ld de, ThreeDashes
	call PlaceString
	jr .skip_rate_notCaught

.print_rate_caught
	hlcoord 15, 7
	ld de, wBaseCatchRate
	ld a, [de]
	cp 250
	jr nc, .dontadd
	add 5
.dontadd
	ld [de], a
	lb bc, 1, PRINTNUM_RIGHTALIGN | 3
	call PrintNum

.skip_rate_notCaught
; exp text
	hlcoord 9, 8
	ld de, .exp_text
	call PlaceString
; vertical line after exp text
	hlcoord 14, 8
	ld a, $5a
	ld [hl], a

	ld a, [wPokedexInfoSeenCheck]
	and a
	jr nz, .print_exp_caught ; skip not caught
	hlcoord 15, 8
	ld de, ThreeDashes
	call PlaceString
	jr .skip_exp_notCaught

.print_exp_caught
	hlcoord 15, 8
	ld de, wBaseExp
	ld a, [de]
	cp 128
	jr nc, .dont_increase
	add 6
	
	cp 80
	jr nc, .dont_increase
	add 9
.dont_increase
	ld [de], a
	lb bc, 1, PRINTNUM_RIGHTALIGN | 3
	call PrintNum

.skip_exp_notCaught
; items text
	hlcoord 2, 9
	ld de, .items_text
	call PlaceString
; vertical line after items text
	hlcoord 2, 10
	ld a, $5a
	ld [hl], a
	hlcoord 2, 11
	ld a, $5a
	ld [hl], a
	
	ld a, [wPokedexInfoSeenCheck]
	and a
	jr nz, .print_items_caught ; skip not caught
	hlcoord 4, 10
	ld de, ThreeDashes
	call PlaceString
	jr .skip_items_notCaught

.print_items_caught
; item percentages text
	hlcoord 3, 10
	ld de, .item1_percent
	call PlaceString
	hlcoord 5, 10
	ld a, $60
	ld [hl], a
	hlcoord 4, 11
	ld de, .item2_percent
	call PlaceString
	hlcoord 5, 11
	ld a, $60
	ld [hl], a

; item names
	call .GetItem1Name	
	hlcoord 7, 10
	call PlaceString

	call .GetItem2Name	
	hlcoord 7, 11
	call PlaceString

.skip_items_notCaught
; horizontal divider
	hlcoord 1, 12
	ld bc, SCREEN_WIDTH - 1
	ld a, $6e 
	call ByteFill
	hlcoord 2, 12
	ld [hl], $5f ; pencil icon
; page number
	hlcoord 9, 3
	ld [hl], $56 ; P.
	inc hl
	ld [hl], $58 ; 2
; Check to see if we caught it.  Get out of here if we haven't.
	ld a, [wPokedexInfoSeenCheck]
	and a
	jr z, .skip_page2_info

	pop de
	inc de
	pop af
	hlcoord 2, 13
	call FarString ; pokedex text part 2
	jr .check_page3

.skip_page2_info
	pop de
	inc de
	pop af

.check_page3
	ld a, [wPokedexStatus]
	cp 1 ; check for page 2
	ret z

.page3
; page 3

; clear area
	lb bc, 8, 7
	hlcoord 1, 1
	call ClearBox ; clear top-right area
	lb bc, 6, 11
	hlcoord 9, 4
	call ClearBox ; clear top-right area
	lb bc, 3, SCREEN_WIDTH - 2
	hlcoord 2, 9
	call ClearBox ; clear middle area
	lb bc, 4, SCREEN_WIDTH - 1
	hlcoord 1, 12
	call ClearBox ; clear text area
	hlcoord 1, 3
	ld bc, SCREEN_WIDTH - 1
	ld a, $6e ; horizontal divider
	call ByteFill
	pop de
	inc de
	pop af
	ret

.GetItem1Name:
	ld de, ThreeDashes
	ld a, [wBaseItem1]
	and a
	ret z
	ld a, [wBaseItem1]
	ld [wNamedObjectIndexBuffer], a	
	call GetItemName
	ret

.GetItem2Name:
	ld de, ThreeDashes
	ld a, [wBaseItem2]
	and a
	ret z
	ld a, [wBaseItem2]
	ld [wNamedObjectIndexBuffer], a	
	call GetItemName
	ret


.egg_text:
	db "  Egg"
	line2 "Group@"

.catch_text:
	db "Catch@"

.exp_text:
	db "Exp@"

.items_text:
	db "Items@"

.item1_percent:
	db "12@"

.item2_percent:
	db "3@"


UnreferencedPOKeString:
; unused
	db "#@"

DrawEggGroups:
	ld a, [wBaseEggGroups]
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

DrawBaseStatsNames:
; hp
	hlcoord 9, 4 
	ld a, "H"
	ld [hli], a
	ld a, "P"
	ld [hli], a	
	
; atk
	hlcoord 9, 6 
	ld a, $62
	ld [hli], a
	ld a, $63
	ld [hli], a
; def
	hlcoord 9, 8 
	ld a, $64
	ld [hli], a
	ld a, $65
	ld [hli], a
; speed
	hlcoord 15, 4 
	ld a, $6c
	ld [hli], a
	ld a, $6d
	ld [hli], a
; sp.atk
	hlcoord 15, 6 
	ld a, $5e
	ld [hli], a
	ld a, $62
	ld [hli], a
	ld a, $63
	ld [hli], a
; sp.def
	hlcoord 15, 8 
	ld a, $5e
	ld [hli], a
	ld a, $64
	ld [hli], a
	ld a, $65
	ld [hli], a	

	ld a, [wPokedexInfoSeenCheck]
	and a
	jr nz, .skip_unknown
	ld de, ThreeDashes
	hlcoord 11, 5
	call PlaceString
	ld de, ThreeDashes
	hlcoord 11, 7
	call PlaceString
	ld de, ThreeDashes
	hlcoord 11, 9
	call PlaceString
	ld de, ThreeDashes
	hlcoord 17, 5
	call PlaceString
	ld de, ThreeDashes
	hlcoord 17, 7
	call PlaceString
	ld de, ThreeDashes
	hlcoord 17, 9
	call PlaceString
.skip_unknown
	ret

ThreeDashes:
	db "---@"

DrawBaseStats:
; hp
	ld de, wBaseHP
	hlcoord 11, 5
	lb bc, 1, PRINTNUM_RIGHTALIGN | 3
	call PrintNum
	inc de
; atk	
	hlcoord 11, 7
	lb bc, 1, PRINTNUM_RIGHTALIGN | 3
	call PrintNum
	inc de
; def
	hlcoord 11, 9
	lb bc, 1, PRINTNUM_RIGHTALIGN | 3
	call PrintNum
	inc de
; speed
	hlcoord 17, 5
	lb bc, 1, PRINTNUM_RIGHTALIGN | 3
	call PrintNum
	inc de
; sp.atk
	hlcoord 17, 7
	lb bc, 1, PRINTNUM_RIGHTALIGN | 3
	call PrintNum
	inc de
; sp.def
	hlcoord 17, 9
	lb bc, 1, PRINTNUM_RIGHTALIGN | 3
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
