; TrainerCard.Jumptable indexes
	const_def
	const TRAINERCARDSTATE_PAGE1_LOADGFX ; 0
	const TRAINERCARDSTATE_PAGE1_JOYPAD  ; 1
	const TRAINERCARDSTATE_PAGE2_LOADGFX ; 2
	const TRAINERCARDSTATE_PAGE2_JOYPAD  ; 3
	const TRAINERCARDSTATE_PAGE3_LOADGFX ; 4
	const TRAINERCARDSTATE_PAGE3_JOYPAD  ; 5
	const TRAINERCARDSTATE_QUIT          ; 6

TrainerCard:
	ld a, [wVramState]
	push af
	xor a
	ld [wVramState], a
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call .InitRAM
.loop
	call UpdateTime
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .quit
	ldh a, [hJoyLast]
	and B_BUTTON
	jr nz, .quit
	call .RunJumptable
	call DelayFrame
	jr .loop

.quit
	pop af
	ld [wOptions], a
	pop af
	ld [wVramState], a
	ret

.InitRAM:
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call DisableLCD

	farcall GetCardPic

	call EnableLCD
	call TrainerCard_PrintTopHalfOfCard
	ld hl, CardStatusGFX
	ld de, vTiles2 tile $6f
	ld bc, 86 tiles
	ld a, BANK(CardStatusGFX)
	call FarCopyBytes
	
	call WaitBGMap
	ld b, SCGB_TRAINER_CARD
	call GetSGBLayout
	call SetPalettes
	call WaitBGMap
	ld hl, wJumptableIndex
	xor a ; TRAINERCARDSTATE_PAGE1_LOADGFX
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wTrainerCardBadgeFrameCounter
	ld [hli], a ; wTrainerCardBadgeTileID
	ld [hl], a  ; wTrainerCardBadgeAttributes
	ret

.RunJumptable:
	jumptable .Jumptable, wJumptableIndex

.Jumptable:
; entries correspond to TRAINERCARDSTATE_* constants
	dw TrainerCard_Page1_LoadGFX
	dw TrainerCard_Page1_Joypad
	dw TrainerCard_Page2_LoadGFX
	dw TrainerCard_Page2_Joypad
	dw TrainerCard_Page3_LoadGFX
	dw TrainerCard_Page3_Joypad
	dw TrainerCard_Quit

TrainerCard_IncrementJumptable:
	ld hl, wJumptableIndex
	inc [hl]
	ret

TrainerCard_Quit:
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

TrainerCard_Page1_LoadGFX:
	call ClearSprites
	; hlcoord 0, 8
	; ld d, 6
	; call TrainerCard_InitBorder
	hlcoord 1, 9
	lb bc, 8, 18
	call ClearBox
	call WaitBGMap
	call TrainerCard_Page1_PrintDexCaught_GameTime
	call TrainerCard_IncrementJumptable
	ret

TrainerCard_Page1_Joypad:
	call TrainerCard_Page1_PrintGameTime
	ld hl, hJoyLast
	ld a, [hl]
	and D_RIGHT | A_BUTTON
	jr nz, .pressed_right_a
	ret

.pressed_right_a
	ld a, TRAINERCARDSTATE_PAGE2_LOADGFX
	ld [wJumptableIndex], a
	ret

.Unreferenced_KantoCheck:
	ld a, [wKantoBadges]
	and a
	ret z
	ld a, TRAINERCARDSTATE_PAGE3_LOADGFX
	ld [wJumptableIndex], a
	ret

TrainerCard_Page2_LoadGFX:
	call ClearSprites
	; hlcoord 0, 8
	; ld d, 6
	; call TrainerCard_InitBorder
	hlcoord 1, 9
	lb bc, 7, 18
	call ClearBox
	call WaitBGMap
	ld de, LeaderGFX
	ld hl, vTiles2 tile $29
	lb bc, BANK(LeaderGFX), 70
	call Request2bpp
	ld de, BadgeGFX
	ld hl, vTiles0 tile $00
	lb bc, BANK(BadgeGFX), 32
	call Request2bpp
	call TrainerCard_Page2_3_InitObjectsAndStrings
	call TrainerCard_Page2_3_InitBadgeDrawingsJohto
	call TrainerCard_IncrementJumptable
	ret

TrainerCard_Page2_Joypad:
	ld hl, TrainerCard_JohtoBadgesOAM
	call TrainerCard_Page2_3_AnimateBadges
	ld hl, hJoyLast
	ld a, [hl]
	and D_RIGHT
	jr nz, .d_right
	ld a, [hl]
	and A_BUTTON
	jr nz, .pressed_a
	ld a, [hl]
	and D_LEFT
	jr nz, .d_left
	ret

.d_right:
	; ld a, [wKantoBadges]
	; and a
	; ret z
	ld a, TRAINERCARDSTATE_PAGE3_LOADGFX
	ld [wJumptableIndex], a
	ret

.pressed_a
	; ld a, [wKantoBadges]
	; and a
	; jr z, .quit
	ld a, TRAINERCARDSTATE_PAGE3_LOADGFX
	ld [wJumptableIndex], a
	ret

.quit:
	ld a, TRAINERCARDSTATE_QUIT
	ld [wJumptableIndex], a
	ret

.d_left
	ld a, TRAINERCARDSTATE_PAGE1_LOADGFX
	ld [wJumptableIndex], a
	ret

TrainerCard_Page3_LoadGFX:
	call ClearSprites
	; hlcoord 0, 8
	; ld d, 6
	; call TrainerCard_InitBorder
	hlcoord 1, 9
	lb bc, 7, 18
	call ClearBox
	call WaitBGMap
	ld de, LeaderGFX2
	ld hl, vTiles2 tile $29
	lb bc, BANK(LeaderGFX2), 70
	call Request2bpp
	ld de, BadgeGFX2
	ld hl, vTiles0 tile $00
	lb bc, BANK(BadgeGFX2), 32
	call Request2bpp
	call TrainerCard_Page2_3_InitObjectsAndStrings
	call TrainerCard_Page2_3_InitBadgeDrawingsKanto
	call TrainerCard_IncrementJumptable
	ret

TrainerCard_Page3_Joypad:
	ld hl, TrainerCard_KantoBadgesOAM
	call TrainerCard_Page2_3_AnimateBadges
	ld hl, hJoyLast
	ld a, [hl]
	and A_BUTTON
	jr nz, .quit
	ld a, [hl]
	and D_LEFT
	jr nz, .d_left
	ret

.d_left
	ld a, TRAINERCARDSTATE_PAGE2_LOADGFX
	ld [wJumptableIndex], a
	ret

.quit
	ld a, TRAINERCARDSTATE_QUIT
	ld [wJumptableIndex], a
	ret

TrainerCard_PrintTopHalfOfCard:
	hlcoord 0, 0
	ld d, 14
	call TrainerCard_InitBorder
	hlcoord 2, 2
	ld de, .Name_Money
	call PlaceString
	hlcoord 2, 4
	ld de, .ID_No
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 7, 2
	ld de, wPlayerName
	call PlaceString
	hlcoord 5, 4
	ld de, wPlayerID
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 2, 6
	ld de, wMoney
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	; hlcoord 1, 3
	; ld de, .HorizontalDivider
	; call TrainerCardSetup_PlaceTilemapString
	hlcoord 14, 1
	lb bc, 5, 7
	xor a
	ldh [hGraphicStartTile], a
	predef PlaceGraphic
	ret

.Name_Money:
	db   "NAME/@"

.ID_No:
	db $27, $28, -1 ; ID NO

.HorizontalDivider:
	db $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $26, -1 ; ____________>

TrainerCard_Page1_PrintDexCaught_GameTime:
	hlcoord 2, 10
	ld de, .Dex_PlayTime
	call PlaceString
	hlcoord 10, 15
	ld de, .Badges
	call PlaceString
	ld hl, wPokedexCaught
	ld b, wEndPokedexCaught - wPokedexCaught
	call CountSetBits
	ld de, wNumSetBits
	hlcoord 15, 10
	lb bc, 1, 3
	call PrintNum
	call TrainerCard_Page1_PrintGameTime

	hlcoord 2, 8
	ld e, SCREEN_WIDTH - 4
.loop
	ld a, $77
	ld [hli], a
	dec e
	jr nz, .loop

	hlcoord 7, 8
	ld de, .StatusTilemap	
	call TrainerCardSetup_PlaceTilemapString

	ld a, [wStatusFlags]
	bit STATUSFLAGS_POKEDEX_F, a
	ret nz
	hlcoord 1, 9
	lb bc, 2, 17
	call ClearBox
	ret

.Dex_PlayTime:
	db   "#DEX"
	next "PLAY TIME@@"

.Badges:
	db "  BADGES▶@"

.StatusTilemap:
	db $79, $7a, $7b, $7c, $7d, $7e, -1 ; "STATUS"

TrainerCard_Page2_3_InitObjectsAndStrings:
	hlcoord 2, 8
	ld e, SCREEN_WIDTH - 4
.loop
	ld a, $77
	ld [hli], a
	dec e
	jr nz, .loop

	hlcoord 7, 8
	ld de, .BadgesTilemap	
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 16, 16
	ld de, .RegionTilemap
	call TrainerCardSetup_PlaceTilemapString
	ret

.BadgesTilemap:
	db $69, $6a, $6b, $6c, $6d, $6e, -1 ; "BADGES"

.RegionTilemap:
	db $66, $67, $68, -1 ; "Johto"

.HorizontalDivider:
	db $77, $77, $77, $77, $77, $77, $77, $77, $77, $77, $77, $77, $77, -1 ; ____________>

TrainerCard_Page2_3_InitBadgeDrawingsJohto:
; Johto 1st half
	hlcoord 3, 10
	ld a, $29
	ld c, 4
.loop1
	push af
	push de
	push hl
	push bc
	ld a, 4
	sub c
	ld c, a
	ld hl, wJohtoBadges
	ld b, CHECK_FLAG
	ld d, $0
	predef SmallFarFlagAction
    ld a, c
	and a
	jr nz, .skipBadge1
	pop bc
	pop hl
	pop de
	pop af
	call TrainerCard_Page2_3_PlaceLeadersFaces
	jr .contBadge1
.skipBadge1
	pop bc
	pop hl
	pop de
	pop af
rept 4
	inc a
endr
.contBadge1
rept 4 ; moves 4 tiles right
	inc hl
endr
	dec c
	jr nz, .loop1

; Johto 2nd half
	hlcoord 3, 13
	ld c, 4
	ld a, $39
.loop2
	push af
	push de
	push hl
	push bc
	ld a, 4
	sub c
rept 4
	inc a
endr
	ld c, a	
	ld hl, wJohtoBadges
	ld b, CHECK_FLAG
	ld d, $0
	predef SmallFarFlagAction
    ld a, c
	and a
	jr nz, .skipBadge2
	pop bc
	pop hl
	pop de
	pop af
	call TrainerCard_Page2_3_PlaceLeadersFaces
	jr .contBadge2
.skipBadge2
	pop bc
	pop hl
	pop de
	pop af
rept 4
	inc a
endr
.contBadge2
rept 4 ; moves 4 tiles right
	inc hl
endr
	dec c
	jr nz, .loop2

	xor a
	ld [wTrainerCardBadgeFrameCounter], a
	ld hl, TrainerCard_JohtoBadgesOAM
	call TrainerCard_Page2_3_OAMUpdate
	ret

TrainerCard_Page2_3_InitBadgeDrawingsKanto:
; Kanto 1st half
	hlcoord 3, 10
	ld a, $29
	ld c, 4
.loop1
	push af
	push de
	push hl
	push bc
	ld a, 4
	sub c
	ld c, a
	ld hl, wKantoBadges
	ld b, CHECK_FLAG
	ld d, $0
	predef SmallFarFlagAction
    ld a, c
	and a
	jr nz, .skipBadge1
	pop bc
	pop hl
	pop de
	pop af
	call TrainerCard_Page2_3_PlaceLeadersFaces
	jr .contBadge1
.skipBadge1
	pop bc
	pop hl
	pop de
	pop af
rept 4
	inc a
endr
.contBadge1
rept 4 ; moves 4 tiles right
	inc hl
endr
	dec c
	jr nz, .loop1

; Kanto 2nd half
	hlcoord 3, 13
	ld c, 4
	ld a, $39
.loop2
	push af
	push de
	push hl
	push bc
	ld a, 4
	sub c
rept 4
	inc a
endr
	ld c, a	
	ld hl, wKantoBadges
	ld b, CHECK_FLAG
	ld d, $0
	predef SmallFarFlagAction
    ld a, c
	and a
	jr nz, .skipBadge2
	pop bc
	pop hl
	pop de
	pop af
	call TrainerCard_Page2_3_PlaceLeadersFaces
	jr .contBadge2
.skipBadge2
	pop bc
	pop hl
	pop de
	pop af
rept 4
	inc a
endr
.contBadge2
rept 4 ; moves 4 tiles right
	inc hl
endr
	dec c
	jr nz, .loop2

	xor a
	ld [wTrainerCardBadgeFrameCounter], a
	ld hl, TrainerCard_KantoBadgesOAM
	call TrainerCard_Page2_3_OAMUpdate
	ret

TrainerCardSetup_PlaceTilemapString:
.loop
	ld a, [de]
	cp -1
	ret z
	ld [hli], a
	inc de
	jr .loop

TrainerCard_InitBorder:
	ld a, $6F ; top left
	ld [hli], a
	dec e

	ld e, SCREEN_WIDTH - 2
.loop1
	ld a, $70
	ld [hli], a
	dec e
	jr nz, .loop1

	ld a, $71 ; top right
	ld [hli], a
	dec e

	ld a, $72
	ld [hli], a
	ld e, SCREEN_HEIGHT - 1
	ld a, " "
.loop2
	ld [hli], a
	dec e
	jr nz, .loop2

	ld a, " "
	ld [hli], a

	ld a, $73
	ld [hli], a
.loop3
	ld a, $72
	ld [hli], a

	ld e, SCREEN_HEIGHT
	ld a, " "
.loop4
	ld [hli], a
	dec e
	jr nz, .loop4

	ld a, $73
	ld [hli], a
	dec d
	jr nz, .loop3

	ld a, $72
	ld [hli], a
	ld a, " "
	ld [hli], a

	ld e, SCREEN_HEIGHT - 1
	ld a, " "
.loop5
	ld [hli], a
	dec e
	jr nz, .loop5
	ld a, $73
	ld [hli], a
	ld a, $74
	ld [hli], a
	ld e, SCREEN_WIDTH - 2
.loop6
	ld a, $75
	ld [hli], a
	dec e
	jr nz, .loop6
	ld a, $76
	ld [hli], a
	ret

TrainerCard_Page2_3_PlaceLeadersFaces:
	push de
	push hl
	ld [hli], a ; puts top left part
	inc a
	ld [hli], a
	inc a
	ld de, SCREEN_WIDTH - 2
	add hl, de 
	ld [hli], a ; puts bottom left part
	inc a
	ld [hli], a
	inc a
	pop hl
	pop de
	ret

TrainerCard_Page1_PrintGameTime:
	hlcoord 11, 12
	ld de, wGameTimeHours
	lb bc, 2, 4
	call PrintNum
	inc hl
	ld de, wGameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ldh a, [hVBlankCounter]
	and $1f
	ret nz
	hlcoord 15, 12
	ld a, [hl]
	xor " " ^ $25 ; alternate between space and small colon ($2e) tiles
	ld [hl], a
	ret

TrainerCard_Page2_3_AnimateBadges:
	; ldh a, [hVBlankCounter]
	; and %111
	; ret nz
	; ld a, [wTrainerCardBadgeFrameCounter]
	; inc a
	; and %111
	; ld [wTrainerCardBadgeFrameCounter], a
	jr TrainerCard_Page2_3_OAMUpdate

TrainerCard_Page2_3_OAMUpdate:
; copy flag array pointer
	ld a, [hli]
	ld e, a
	ld a, [hli]
; get flag array
	ld d, a
	ld a, [de]
	ld c, a
	ld de, wVirtualOAMSprite00
	ld b, NUM_JOHTO_BADGES
.loop
	srl c
	push bc
	jr nc, .skip_badge
	push hl
	ld a, [hli] ; y
	ld b, a
	ld a, [hli] ; x
	ld c, a
	ld a, [hli] ; pal
	ld [wTrainerCardBadgeAttributes], a
	ld a, [wTrainerCardBadgeFrameCounter]
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hl]
	ld [wTrainerCardBadgeTileID], a
	call .PrepOAM
	pop hl
.skip_badge
	ld bc, $b ; 3 + 2 * 4
	add hl, bc
	pop bc
	dec b
	jr nz, .loop
	ret

.PrepOAM:
	ld a, [wTrainerCardBadgeTileID]
	and 1 << 7
	jr nz, .xflip
	ld hl, .facing1
	jr .loop2

.xflip
	ld hl, .facing2
.loop2
	ld a, [hli]
	cp -1
	ret z
	add b
	ld [de], a ; y
	inc de

	ld a, [hli]
	add c
	ld [de], a ; x
	inc de

	ld a, [wTrainerCardBadgeTileID]
	and $ff ^ (1 << 7)
	add [hl]
	ld [de], a ; tile id
	inc hl
	inc de

	ld a, [wTrainerCardBadgeAttributes]
	add [hl]
	ld [de], a ; attributes
	inc hl
	inc de
	jr .loop2

.facing1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $01, 0
	dsprite  1,  0,  0,  0, $02, 0
	dsprite  1,  0,  1,  0, $03, 0
	db -1

.facing2
	dsprite  0,  0,  0,  0, $00, 1
	dsprite  0,  0,  1,  0, $01, 2
	dsprite  1,  0,  0,  0, $02, 4
	dsprite  1,  0,  1,  0, $03, 5
	db -1

TrainerCard_JohtoBadgesOAM:
; Template OAM data for each badge on the trainer card.
; Format:
	; y, x, palette
	; cycle 1: face tile, in1 tile, in2 tile, in3 tile
	; cycle 2: face tile, in1 tile, in2 tile, in3 tile

	dw wJohtoBadges

	; Zephyrbadge
	db $60, $20, 0
	db $00, $20, $24, $20 | (1 << 7)
	db $00, $20, $24, $20 | (1 << 7)

	; Hivebadge
	db $60, $40, 1
	db $04, $20, $24, $20 | (1 << 7)
	db $04, $20, $24, $20 | (1 << 7)

	; Plainbadge
	db $60, $60, 2
	db $08, $20, $24, $20 | (1 << 7)
	db $08, $20, $24, $20 | (1 << 7)

	; Fogbadge
	db $60, $80, 0
	db $0c, $20, $24, $20 | (1 << 7)
	db $0c, $20, $24, $20 | (1 << 7)

	; Mineralbadge
	db $78, $20, 0
	db $10, $20, $24, $20 | (1 << 7)
	db $10, $20, $24, $20 | (1 << 7)

	; Stormbadge
	db $78, $40, 6
	db $14, $20, $24, $20 | (1 << 7)
	db $14, $20, $24, $20 | (1 << 7)

	; Glacierbadge
	db $78, $60, 3
	db $18, $20, $24, $20 | (1 << 7)
	db $18, $20, $24, $20 | (1 << 7)

	; Risingbadge
	; X-flips on alternate cycles.
	db $78, $80, 1
	db $1c,            $20, $24, $20 | (1 << 7)
	db $1c | (1 << 7), $20, $24, $20 | (1 << 7)

TrainerCard_KantoBadgesOAM:
; Template OAM data for each badge on the trainer card.
; Format:
	; y, x, palette1, palette2, palette3, palette4
	; cycle 1: face tile, in1 tile, in2 tile, in3 tile
	; cycle 2: face tile, in1 tile, in2 tile, in3 tile

	dw wKantoBadges

	; Boulder Badge
	db $60, $20, 0
	db $00, $20, $24, $20 | (1 << 7)
	db $00, $20, $24, $20 | (1 << 7)

	; Cascade Badge
	db $60, $40, 3
	db $04, $20, $24, $20 | (1 << 7)
	db $04, $20, $24, $20 | (1 << 7)

	; Thunder Badge
	db $60, $60, 6
	db $08, $20, $24, $20 | (1 << 7)
	db $08, $20, $24, $20 | (1 << 7)

	; Rainbow Badge
	db $60, $80, 0
	db $0c | (1 << 7), $20, $24, $20 | (1 << 7)
	db $0c | (1 << 7), $20, $24, $20 | (1 << 7)

	; Soul Badge
	db $78, $20, 4
	db $10, $20, $24, $20 | (1 << 7)
	db $10, $20, $24, $20 | (1 << 7)

	; Marsh Badge
	db $78, $40, 2
	db $14, $20, $24, $20 | $80
	db $14, $20, $24, $20 | $80

	; Volcano Badge
	db $78, $60, 1
	db $18, $20, $24, $20 | (1 << 7)
	db $18, $20, $24, $20 | (1 << 7)

	; Earth Badge
	db $78, $80, 5
	db $1c, $20, $24, $20 | (1 << 7)
	db $1c | (1 << 7), $20, $24, $20 | (1 << 7)

CardStatusGFX: INCBIN "gfx/trainer_card/card_status.2bpp"
LeaderGFX:  INCBIN "gfx/trainer_card/leaders.2bpp"
LeaderGFX2: INCBIN "gfx/trainer_card/leaders2.2bpp"
BadgeGFX:   INCBIN "gfx/trainer_card/badges.2bpp"
BadgeGFX2:  INCBIN "gfx/trainer_card/badges2.2bpp"

CardRightCornerGFX: INCBIN "gfx/trainer_card/card_right_corner.2bpp"
