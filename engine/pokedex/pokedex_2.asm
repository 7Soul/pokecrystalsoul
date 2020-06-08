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
	lb bc, 15,  SCREEN_WIDTH - 1
	hlcoord 1, 1
	call ClearBox ; clear area

	ld a, [wPokedexStatus]
	cp 2 ; check for page 2
	jp z, .skip_pic
	farcall Pokedex_PlaceFrontpicTopLeftCorner
.skip_pic
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndexBuffer], a

	call GetPokemonName
	hlcoord 9, 1
	call PlaceString ; mon species
	ld a, [wCurPartySpecies]
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

	lb bc, 6, 12
	hlcoord 8, 4
	call ClearBox ; clear top-right area
	lb bc, 3, SCREEN_WIDTH - 2
	hlcoord 2, 9
	call ClearBox ; clear middle area
	lb bc, 3, SCREEN_WIDTH - 2
	hlcoord 2, 13
	call ClearBox ; clear text area

	call DrawBaseStatsNames

; traits text
	hlcoord 2, 10
	ld de, .trait_text
	call PlaceString
; vertical line after traits text
	hlcoord 2, 11
	ld a, $5f
	ld [hl], a
	hlcoord 2, 12
	ld a, $5f
	ld [hl], a
	hlcoord 2, 13
	ld a, $5f
	ld [hl], a
	hlcoord 2, 14
	ld a, $5f
	ld [hl], a

	ld a, [wPokedexInfoSeenCheck]
	and a
	jr nz, .skip_traits ; skip not caught
	hlcoord 3, 11
	ld de, ThreeDashes
	call PlaceString
	hlcoord 3, 12
	ld de, ThreeDashes
	call PlaceString
	hlcoord 3, 13
	ld de, ThreeDashes
	call PlaceString
	hlcoord 3, 14
	ld de, ThreeDashes
	call PlaceString

.skip_traits
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
	call DrawTraits

	pop de
	inc de
	pop af
	; hlcoord 2, 13
	push af
	; call FarString ; pokedex text part 1
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
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetBaseData
; clear area
	lb bc, 6, 11
	hlcoord 9, 4
	call ClearBox ; clear top-right area
	lb bc, 7, SCREEN_WIDTH - 2
	hlcoord 2, 9
	call ClearBox ; clear middle area
	; lb bc, 3, SCREEN_WIDTH - 2
	; hlcoord 2, 13
	; call ClearBox ; clear text area

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
	ld a, $5f
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
	ld a, $5f
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
; egg text
	hlcoord 2, 10
	ld de, .egg_text
	call PlaceString
; vertical line after egg group text
	hlcoord 7, 10
	ld a, $5f
	ld [hl], a
	hlcoord 7, 11
	ld a, $5f
	ld [hl], a

	ld a, [wPokedexInfoSeenCheck]
	and a
	jr nz, .skip_egg_groups ; skip not caught
	hlcoord 8, 10
	ld de, ThreeDashes
	call PlaceString

.skip_egg_groups	
; items text
	hlcoord 2, 13
	ld de, .items_text
	call PlaceString
; vertical line after items text
	hlcoord 2, 14
	ld a, $5f
	ld [hl], a
	hlcoord 2, 15
	ld a, $5f
	ld [hl], a
	
	ld a, [wPokedexInfoSeenCheck]
	and a
	jr nz, .print_items_caught ; skip not caught
	hlcoord 4, 14
	ld de, ThreeDashes
	call PlaceString
	jr .skip_items_notCaught


.print_items_caught
; item percentages text
	hlcoord 3, 14
	ld de, .item1_percent
	call PlaceString
	hlcoord 5, 14
	ld a, $60
	ld [hl], a
	hlcoord 4, 15
	ld de, .item2_percent
	call PlaceString
	hlcoord 5, 15
	ld a, $60
	ld [hl], a

; item names
	call .GetItem1Name	
	hlcoord 7, 14
	call PlaceString

	call .GetItem2Name	
	hlcoord 7, 15
	call PlaceString

	call DrawEggGroups

.skip_items_notCaught
; horizontal divider
	; hlcoord 1, 12
	; ld bc, SCREEN_WIDTH - 1
	; ld a, $6e 
	; call ByteFill
	; hlcoord 2, 12
	; ld [hl], $5f ; pencil icon
; page number
	hlcoord 9, 3
	ld [hl], $56 ; P.
	inc hl
	ld [hl], $58 ; 2
; Check to see if we caught it.  Get out of here if we haven't.
	; ld a, [wPokedexInfoSeenCheck]
	; and a
	; jr z, .skip_page2_info

	; pop de
	; inc de
	; pop af
	; hlcoord 2, 13
	; call FarString ; pokedex text part 2
	; jr .check_page3

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
	lb bc, 15,  SCREEN_WIDTH - 1
	hlcoord 1, 1
	call ClearBox ; clear area
	; lb bc, 16, SCREEN_WIDTH - 1
	; hlcoord 1, 1
	; call ClearBox ; clear middle area
	; lb bc, 4, SCREEN_WIDTH - 1
	; hlcoord 1, 12
	; call ClearBox ; clear text area
	; hlcoord 1, 3
	; ld bc, SCREEN_WIDTH - 1
	; ld a, $6e ; horizontal divider
	; call ByteFill

; 	ld a, 0
; 	ld [wPokedexStatus], a
; 	ld a, [wTempSpecies]
; 	ld [wCurPartySpecies], a
; 	dec a
	
; 	ld c, a
; 	ld b, 0
; 	ld hl, EvosAttacksPointers
; 	add hl, bc
; 	add hl, bc
; ; hl = the species' entry from EvosAttacksPointers
; 	ld a, BANK(EvosAttacksPointers)
; 	call GetFarHalfword
; ; a = the first byte of the species' EvosAttacks data
; 	ld a, BANK("Evolutions and Attacks")
; 	call GetFarByte
; .loop ; get to the first move
; 	ld a, BANK("Evolutions and Attacks")
; 	call GetFarByte
; 	and a
; 	cp 0	
; 	jp z, .loop_moves
; 	inc hl
; 	jr .loop

; .loop_moves
; 	inc hl
; 	ld a, BANK("Evolutions and Attacks")
; 	call GetFarByte
; 	cp 0
; 	jp z, .no_moves
; 	call .PlaceLevelString

; 	inc hl
; 	ld a, BANK("Evolutions and Attacks")
; 	call GetFarByte
; 	call .PlaceMoveString
; 	ld a, [wPokedexStatus]
; 	inc a
; 	ld [wPokedexStatus], a
; 	jr .loop_moves


; .no_moves
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

.trait_text:
	db "Traits@"

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
	


Pokedex_GetMoves:
	ldh a, [rSVBK]
	push af
	push de
	call ClearSprites
	call ClearTileMap
	
	xor a
	ldh [hBGMapMode], a
	ld b, SCGB_POKEDEX_SEARCH_OPTION
	call GetSGBLayout
	call SetPalettes

	hlcoord 0, 0
	lb bc, 16, 18
	call PokedexMoves_PlaceBorder
	hlcoord 2, 3
	ld bc, SCREEN_WIDTH - 4
	ld a, $6e ; horizontal divider
	call ByteFill
	call GetPokemonName
	hlcoord 2, 1
	call PlaceString ; mon species
	ld de, .lvl_moves_text
	hlcoord 2, 4
	call PlaceString 
	ld de, .next_text
	hlcoord 14, 16
	call PlaceString 
; page number	
	hlcoord 2, 3
	ld [hl], $56 ; P.
	inc hl
	ld [hl], $57 ; 1

	ld a, [wTempSpecies]
	ld [wTempEnemyMonSpecies], a
	predef GetFoughtMonCount
	ld a, [$c001]

	hlcoord 18, 2
	ld a, $60
	ld [hl], a

	ld a, 0
	ld [wPokedexStatus], a
	ld [wMovesPage], a
	ld [wMovesMaxCount], a
	ld [wMovesLevelOneCount], a
	ld a, [wTempSpecies]
	ld [wCurOTMon], a
	ld [wCurPartySpecies], a	
	dec a

	ld de, wDecompressScratch
	
	ld c, a
	ld b, 0
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
; hl = the species' entry from EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call GetFarHalfword
; a = the first byte of the species' EvosAttacks data
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
.loop_evo ; get to the first move
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	and a
	cp 0	
	jp z, .loop_moves1
	inc hl
	jr .loop_evo

.loop_moves1
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a
.loop_moves
	inc hl
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte ; a has level
	ld [de], a
	ld b, a
	inc de
	cp 0	
	jp z, .calc_list

	cp 1
	jr nz, .notLevelOne
	ld a, [wMovesLevelOneCount]
	inc a
	ld [wMovesLevelOneCount], a

.notLevelOne
	inc hl
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte ; a has move id
	ld [de], a
	inc de
	ld a, [wMovesMaxCount]
	inc a
	ld [wMovesMaxCount], a
	jr .loop_moves

.calc_list
	ld a, [$c001]
	ldh [hMultiplicand + 0], a
	ld a, 100
	ldh [hMultiplier], a
	call Multiply
	
	ld a, $ff
	ldh [hDivisor], a
	ld b, 2
	call Divide
	ldh a, [hQuotient + 3]
	ld [$c001], a ; c001 now has percentage of data collected

	hlcoord 15, 2
	ld [wStringBuffer1], a
	ld de, wStringBuffer1
	lb bc, 1, PRINTNUM_RIGHTALIGN | 3
	call PrintNum

.print_list	
	lb bc, 8,  17
	hlcoord 2, 6
	call ClearBox ; clear area

	ld de, wDecompressScratch
	ld a, [wMovesPage]
	ld c, 8
	call SimpleMultiply
	ld c, a
	ld b, 0
	ld h, d
	ld l, e
	add hl, bc
	add hl, bc
	ld d, h
	ld e, l

.print_list_loop
	ld a, [de]
	cp 0
	jr z, .list_end
	inc de
	call .PlaceLevelString
	ld a, [de]
	inc de
	call .PlaceMoveString
	ld a, [wPokedexStatus] ; number of moves temp
	inc a
	cp 8
	jr z, .max
	ld [wPokedexStatus], a
	jr .print_list_loop
.max
.list_end
	call WaitBGMap

.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON
	jr nz, .a
	ld a, [hl]
	and B_BUTTON
	jr nz, .b
	call DelayFrame
	jr .loop

.a
	ld a, [wMovesPage]
	xor 1
	ld [wMovesPage], a
	cp 1
	hlcoord 2, 3
	jr z, .page_2
; page number	
	ld [hl], $56 ; P.
	inc hl
	ld [hl], $57 ; 1
	jr .finished_page_no
.page_2
	ld [hl], $56 ; P.
	inc hl
	ld [hl], $58 ; 2
.finished_page_no
	xor a
	ld [wPokedexStatus], a
	jp .print_list

.b
	xor a
	ld [wPokedexStatus], a
	call ClearSprites
	pop de
	pop af
	ldh [rSVBK], a
	ret

;;;;;;;;;
.PlaceLevelString:
	push hl
	push de
	ld [wStringBuffer1], a
	hlcoord 2, 6
	ld a, [wPokedexStatus]
	ld c, a
	ld a, SCREEN_WIDTH
	call SimpleMultiply

	ld b, 0
	ld c, a
	add hl, bc
	ld de, wStringBuffer1
	lb bc, 1, 3
	call PrintNum
	pop de
	pop hl
	ret

.PlaceMoveString:
	push hl
	push de
	ld [wNamedObjectIndexBuffer], a	
	ld a, [wCurOTMon]
	ld [wCurPartySpecies], a
	
; get position
	hlcoord 6, 6
	ld a, [wPokedexStatus]
	ld c, a
	ld a, SCREEN_WIDTH
	call SimpleMultiply

	ld b, 0
	ld c, a
	add hl, bc ; save position to draw text

	ld a, [wMovesMaxCount]
	ldh [hMultiplicand + 0], a	
	ld a, [$c001] ; data collected
	ldh [hMultiplier], a
	call Multiply

	ld a, 100
	ldh [hDivisor], a
	ld b, 2
	call Divide

	ldh a, [hQuotient + 3]
	cp 0
	jr nz, .dont_increase_min
	inc a
.dont_increase_min
	ld b, a ; b holds how many moves we know
	ld a, [wMovesLevelOneCount]
	dec a ; level 1 count is 0-index
	add b ; add level 1 moves to known count
	ld b, a
	ld de, .unknown_text

	ld a, [wMovesPage]
	ld c, 8
	call SimpleMultiply
	ld c, a

	ld a, [wPokedexStatus]
	add c  ; current move index
	push hl
	cp b
	jr nc, .unknown_move

; levelOneMove
	ld a, [wNamedObjectIndexBuffer]
	ld [wCurSpecies], a
	ld e, a
	farcall IsVariableMove
	jr nc, .not_variable
	farcall GetVariableMoveType
	jr nc, .not_variable
	farcall GetVariableMoveName
	ld de, wStringBuffer1
	jr .unknown_move
.not_variable
	call GetMoveName
.unknown_move
	pop hl
	call PlaceString
	pop de
	pop hl
	ret

.lvl_moves_text:
	db "Lvl  Move@"

.next_text:
	db "Next▶@"

.unknown_text:
	db "???@"

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

DrawTraits:
; trait 1
	ld hl, wBaseTraits
	call .get_trait_name
	hlcoord 3, 11
	call PlaceString
; atk
	ld hl, wBaseTraits + 1
	call .get_trait_name
	hlcoord 3, 12
	call PlaceString
; def
	ld hl, wBaseTraits + 2
	call .get_trait_name
	hlcoord 3, 13
	call PlaceString
; speed
	ld hl, wBaseTraits + 3
	call .get_trait_name
	hlcoord 3, 14
	call PlaceString
	ret

.get_trait_name:
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetTraitName
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
	ld a, BANK("Pokedex Entries")
	ld b, a
	pop hl
	ret

GetDexEntryPagePointer:
; 	call GetDexEntryPointer
; 	push hl
; 	ld h, d
; 	ld l, e
; ; skip species name
; .loop1
; 	ld a, b
; 	call GetFarByte
; 	inc hl
; 	cp "@"
; 	jr nz, .loop1
; ; skip height and weight
; rept 4
; 	inc hl
; endr
; ; if c != 1: skip entry
; 	dec c
; 	jr z, .done
; ; skip entry
; .loop2
; 	ld a, b
; 	call GetFarByte
; 	inc hl
; 	cp "@"
; 	jr nz, .loop2

; .done
; 	ld d, h
; 	ld e, l
; 	pop hl
	ret

INCLUDE "data/pokemon/dex_entry_pointers.asm"

PokedexMoves_PlaceBorder:
	push hl
	ld a, $33
	ld [hli], a
	ld d, $34
	call .FillRow
	ld a, $35
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.loop
	push hl
	ld a, $36
	ld [hli], a
	ld d, $7f
	call .FillRow
	ld a, $37
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop
	ld a, $38
	ld [hli], a
	ld d, $39
	call .FillRow
	ld a, $3a
	ld [hl], a
	ret

.FillRow:
	ld e, c
.row_loop
	ld a, e
	and a
	ret z
	ld a, d
	ld [hli], a
	dec e
	jr .row_loop

GetFoughtMonCount:
	ld a, [wTempEnemyMonSpecies]
	ld [wCurPartySpecies], a
	predef GetPreEvolution
	predef GetPreEvolution
	ld a, [wCurPartySpecies]
	ld b, a
	ld c, 0

	ld hl, EvolutionLinesList
.loop
	ld a, [hli]
	cp b
	jr z, .got_it
	inc c
	cp $ff
	ret z
	jr .loop
.got_it
	ld b, 0
	ld hl, wPokemonFought
	add hl, bc
	ld a, [hl]
	ld [wPokedexFoughtCount], a
	ld [$c001], a
	ret

AddFoughtPokemon:	
	ld a, [wCurPartySpecies]
	predef GetPreEvolution
	predef GetPreEvolution
	ld a, [wCurPartySpecies]
	ld b, a
	ld c, 0

	ld hl, EvolutionLinesList
.loop
	ld a, [hli]
	cp b
	jr z, .increase
	inc c
	cp $ff
	ret z
	jr .loop

.increase
	ld b, 0
	ld hl, wPokemonFought
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .maxed
	ld d, a ; d holds current total

	ld a, [wTempMonLevel]
	cp 6
	ld b, 1
	jr c, .dontfloor
	ld c, 6
	call SimpleDivide
	cp 6 ; check remainder
	jr c, .dontfloor
	inc b
.dontfloor
	ld a, b
	inc a
	call RandomRange
	add d
rept 16
	inc a
endr
	ld [hl], a
.maxed
	ret

EvolutionLinesList:
	db BULBASAUR
	db CHARMANDER
	db SQUIRTLE
	db CATERPIE
	db WEEDLE
	db PIDGEY
	db RATTATA
	db EKANS
	db SANDSHREW
	db NIDORAN_F
	db NIDORAN_M
	db VULPIX
	db ZUBAT
	db PARAS
	db VENONAT
	db DIGLETT
	db MEOWTH
	db PSYDUCK
	db MANKEY
	db GROWLITHE
	db POLIWAG
	db ABRA
	db MACHOP
	db BELLSPROUT
	db TENTACOOL
	db PONYTA
	db GEODUDE
	db PONYTA
	db SLOWPOKE
	db MAGNEMITE
	db FARFETCH_D
	db DODUO
	db SEEL
	db GRIMER
	db SHELLDER
	db GASTLY
	db ONIX
	db DROWZEE
	db KRABBY
	db VOLTORB
	db EXEGGCUTE
	db CUBONE
	db LICKITUNG
	db KOFFING
	db RHYHORN
	db CHANSEY
	db TANGELA
	db KANGASKHAN
	db HORSEA
	db GOLDEEN
	db STARYU
	db MR__MIME
	db SCYTHER
	db PINSIR
	db TAUROS
	db MAGIKARP
	db LAPRAS
	db DITTO
	db EEVEE
	db PORYGON
	db OMANYTE
	db KABUTO
	db AERODACTYL
	db SNORLAX
	db ARTICUNO
	db ZAPDOS
	db MOLTRES
	db DRATINI
	db MEWTWO
	db MEW
	db CHIKORITA
	db CYNDAQUIL
	db TOTODILE
	db SENTRET
	db HOOTHOOT
	db LEDYBA
	db SPINARAK
	db CHINCHOU
	db PICHU
	db CLEFFA
	db IGGLYBUFF
	db TOGEPI
	db NATU
	db MAREEP
	db MARILL
	db SUDOWOODO
	db HOPPIP
	db AIPOM
	db SUNKERN
	db YANMA
	db WOOPER
	db MURKROW
	db MISDREAVUS
	db UNOWN
	db WOBBUFFET
	db GIRAFARIG
	db PINECO
	db DUNSPARCE
	db SNUBBULL
	db QWILFISH
	db SHUCKLE
	db HERACROSS
	db SNEASEL
	db TEDDIURSA
	db SLUGMA
	db SWINUB
	db CORSOLA
	db REMORAID
	db DELIBIRD
	db MANTINE
	db SKARMORY
	db HOUNDOUR
	db PHANPY
	db STANTLER
	db SMEARGLE
	db TYROGUE
	db SMOOCHUM
	db ELEKID
	db MAGBY
	db MILTANK
	db BLISSEY
	db RAIKOU
	db ENTEI
	db SUICUNE
	db LARVITAR
	db LUGIA
	db HO_OH
	db CELEBI
	dw -1
	