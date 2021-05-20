TMHMPocket:
	ld a, $1
	ldh [hInMenu], a
	call TMHM_PocketLoop
	ld a, $0
	ldh [hInMenu], a
	ret nc
	call PlaceHollowCursor
	call WaitBGMap
	ld a, [wCurItem]
	dec a
	ld [wCurItemQuantity], a
	ld hl, wTMsHMs
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wItemQuantityBuffer], a
	call .ConvertItemToTMHMNumber
	scf
	ret

.ConvertItemToTMHMNumber:
	ld a, [wCurItem]
	ld c, a
	callfar GetNumberedTMHM
	ld a, c
	ld [wCurItem], a
	ret

ConvertCurItemIntoCurTMHM:
	ld a, [wCurItem]
	ld c, a
	callfar GetTMHMNumber
	ld a, c
	ld [wTempTMHM], a
	ret

GetTMHMItemMove:
	call ConvertCurItemIntoCurTMHM
	predef GetTMHMMove
	ret

AskTeachTMHM:
	hlcoord 5, 10
	lb bc, 2, 20
	call ClearBox
	hlcoord 0, 11
	ld bc, 5
	ld a, $24
	call ByteFill
	ld hl, wOptions
	ld a, [hl]
	push af
	res NO_TEXT_SCROLL, [hl]
	ld a, [wCurItem]
	cp TM01
	jr c, .NotTMHM
	call GetTMHMItemMove
	ld a, [wTempTMHM]
	ld [wPutativeTMHMMove], a
	call GetMoveName
	call CopyName1
	ld hl, Text_BootedTM ; Booted up a TM
	call PrintText
	ld hl, Text_ItContained
	call PrintText
	call YesNoBox
.NotTMHM:
	pop bc
	ld a, b
	ld [wOptions], a
	ret

ChooseMonToLearnTMHM:
	ld hl, wStringBuffer2
	ld de, wTMHMMoveNameBackup
	ld bc, 12
	call CopyBytes
	call ClearBGPalettes
ChooseMonToLearnTMHM_NoRefresh:
	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuGFX
	ld a, PARTYMENUACTION_TEACH_TMHM
	ld [wPartyMenuActionText], a
.loopback
	farcall WritePartyMenuTilemap
	farcall PrintPartyMenuText
	call WaitBGMap
	call SetPalettes
	call DelayFrame
	farcall PartyMenuSelect
	push af
	ld a, [wCurPartySpecies]
	cp EGG
	pop bc ; now contains the former contents of af
	jr z, .egg
	push bc
	ld hl, wTMHMMoveNameBackup
	ld de, wStringBuffer2
	ld bc, 12
	call CopyBytes
	pop af ; now contains the original contents of af
	ret

.egg
	push hl
	push de
	push bc
	push af
	ld de, SFX_WRONG
	call PlaySFX
	call WaitSFX
	pop af
	pop bc
	pop de
	pop hl
	jr .loopback

TeachTMHM:
	predef CanLearnTMHMMove

	push bc
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNick
	pop bc

	ld a, c
	and a
	jr nz, .compatible
	push de
	ld de, SFX_WRONG
	call PlaySFX
	pop de
	ld hl, Text_TMHMNotCompatible
	call PrintText
	jr .nope

.compatible
	callfar KnowsMove
	jr c, .nope

	predef LearnMove
	ld a, b
	and a
	jr z, .nope

	farcall StubbedTrainerRankings_TMsHMsTaught
	ld a, [wCurItem]
	and a
	ret c

	ld c, HAPPINESS_LEARNMOVE
	callfar ChangeHappiness
	call ConsumeTM
	jr .learned_move

.nope
	and a
	ret

.learned_move
	scf
	ret

Text_BootedTM:
	; Booted up a TM.
	text_jump _Text_BootedUpTM
	db "@"

Text_ItContained:
	; It contained @ . Teach @ to a #MON?
	text_jump UnknownText_0x1c0396
	db "@"

Text_TMHMNotCompatible:
	; is not compatible with @ . It can't learn @ .
	text_jump UnknownText_0x1c03c2
	db "@"

TMHM_PocketLoop:
	xor a
	ldh [hBGMapMode], a
	call TMHM_DisplayPocketItems
	ld a, 1
	ld [w2DMenuCursorInitY], a
	ld a, 7
	ld [w2DMenuCursorInitX], a
	ld a, 1
	ld [w2DMenuNumCols], a
	ld a, 5
	sub d
	inc a
	cp 6
	jr nz, .okay
	dec a
.okay
	ld [w2DMenuNumRows], a
	ld a, $c
	ld [w2DMenuFlags1], a
	xor a
	ld [w2DMenuFlags2], a
	ld a, $20
	ld [w2DMenuCursorOffsets], a
	ld a, A_BUTTON | B_BUTTON | D_UP | D_DOWN | D_LEFT | D_RIGHT
	ld [wMenuJoypadFilter], a
	ld a, [wTMHMPocketCursor]
	inc a
	ld [wMenuCursorY], a
	ld a, $1
	ld [wMenuCursorX], a
	jr TMHM_ShowTMMoveDescription

TMHM_JoypadLoop:
	call TMHM_DisplayPocketItems
	call StaticMenuJoypad
	ld b, a
	ld a, [wMenuCursorY]
	dec a
	ld [wTMHMPocketCursor], a
	xor a
	ldh [hBGMapMode], a
	ld a, [w2DMenuFlags2]
	bit 7, a
	jp nz, TMHM_ScrollPocket
	ld a, b
	ld [wMenuJoypad], a
	bit A_BUTTON_F, a
	jp nz, TMHM_ChooseTMorHM
	bit B_BUTTON_F, a
	jp nz, TMHM_ExitPack
	bit D_RIGHT_F, a
	jp nz, TMHM_ExitPocket
	bit D_LEFT_F, a
	jp nz, TMHM_ExitPocket
TMHM_ShowTMMoveDescription:
	call TMHM_CheckHoveringOverCancel
	jp nc, TMHM_ExitPocket
	jr nc, .not_cancel
	; clear TM info when hovering cancel
	hlcoord 5, 10
	lb bc, 2, 20
	call ClearBox
	hlcoord 0, 11
	ld bc, 5
	ld a, $24
	call ByteFill
.not_cancel
	hlcoord 0, 12
	ld b, 4
	ld c, SCREEN_WIDTH - 2
	call TextBox
	ld a, [wCurItem]
	cp NUM_TMS + 1
	jr nc, TMHM_JoypadLoop
	ld [wTempTMHM], a
	predef GetTMHMMove
	ld a, [wTempTMHM]
	ld [wCurSpecies], a
	hlcoord 1, 14
	call PrintMoveDesc
	hlcoord 0, 11
	lb bc, 3, 18
	call ClearBox
	call TMHM_CheckHoveringOverCancel
	call c, PlaceTMMoveData
	jp TMHM_JoypadLoop

PlaceTMMoveData:
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 11
	ld de, StringTM_MoveType_Top
	call PlaceString
	hlcoord 0, 12
	ld de, StringTM_MoveType_Bottom
	call PlaceString
	hlcoord 12, 12 ; MoveAtk string
	ld de, StringTM_MoveAtk
	call PlaceString
	ld a, [wCurSpecies]
	ld b, a
	farcall GetMoveCategoryName
	hlcoord 1, 12
	ld de, wStringBuffer1
	call PlaceString
	ld a, [wCurSpecies]
	ld b, a
	hlcoord 0, 13
	ld [hl], "│"
	inc hl
	ld [hl], "/"
	inc hl
	predef PrintMoveType
	ld a, [wCurSpecies]
	dec a
	ld hl, Moves + MOVE_POWER
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	hlcoord 16, 12
	cp 2
	jr c, .no_power
	ld [wDeciramBuffer], a
	ld de, wDeciramBuffer
	lb bc, 1, 3
	call PrintNum
	jr .place_acc

.no_power
	ld de, StringTM_na
	call PlaceString

.place_acc
	hlcoord 12, 13 ; MoveAcc string
	ld de, StringTM_MoveAcc
	call PlaceString
	ld a, [wCurVariableMove]
	cp -1
	jr z, .not_variable2
	ld hl, VarMoves + MOVE_ACC
	jr .got_move_acc
.not_variable2
	ld a, [wCurSpecies]
	dec a
	ld hl, Moves + MOVE_ACC
.got_move_acc
	ld bc, MOVE_LENGTH
	call AddNTimes
	; convert internal accuracy representation to a number
	; between 0-100
	ld a, BANK(Moves)
	call GetFarByte
	ld [hMultiplicand], a
	ld a, 100
	ld [hMultiplier], a
	call Multiply
	ld a, [hProduct]
	; don't increase a for 0% moves
	and a
	jr z, .no_inc
	inc a
.no_inc
	hlcoord 16, 13
	cp 2
	jr c, .no_acc
	ld [wd265], a
	ld de, wd265
	lb bc, 1, 3
	jp PrintNum
.no_acc
	ld de, StringTM_na
	jp PlaceString

StringTM_MoveType_Top:
	db "┌────────┐ ┌───────┐@"
StringTM_MoveType_Bottom:
	db "│        └─┘       │@"
StringTM_MoveAtk:
	db "ATK/@"
StringTM_MoveAcc:
	db "ACC/@"
StringTM_na:
	db "---@"

TMHM_ChooseTMorHM:
	call TMHM_PlaySFX_ReadText2
	call CountTMsHMs ; This stores the count to wTempTMHM.
	ld a, [wMenuCursorY]
	dec a
	ld b, a
	ld a, [wTMHMPocketScrollPosition]
	add b
	ld b, a
	ld a, [wTempTMHM]
	cp b
	jr z, _TMHM_ExitPack ; our cursor was hovering over CANCEL
TMHM_CheckHoveringOverCancel:
	call TMHM_GetCurrentPocketPosition
	ld a, [wMenuCursorY]
	ld b, a
.loop
	inc c
	ld a, c
	cp NUM_TMS + 1
	jr nc, .okay
	ld a, [hli]
	and a
	jr z, .loop
	dec b
	jr nz, .loop
	ld a, c
.okay
	ld [wCurItem], a
	cp -1
	ret

TMHM_ExitPack:
	call TMHM_PlaySFX_ReadText2
_TMHM_ExitPack:
	ld a, $2
	ld [wMenuJoypad], a
	and a
	ret

TMHM_ExitPocket:
	and a
	ret

TMHM_ScrollPocket:
	ld a, b
	bit 7, a
	jr nz, .skip
	ld hl, wTMHMPocketScrollPosition
	ld a, [hl]
	and a
	jp z, TMHM_JoypadLoop
	dec [hl]
	call TMHM_DisplayPocketItems
	jp TMHM_ShowTMMoveDescription

.skip
	call TMHM_GetCurrentPocketPosition
	ld b, 5
.loop
	inc c
	ld a, c
	cp NUM_TMS + 1
	jp nc, TMHM_JoypadLoop
	ld a, [hli]
	and a
	jr z, .loop
	dec b
	jr nz, .loop
	ld hl, wTMHMPocketScrollPosition
	inc [hl]
	call TMHM_DisplayPocketItems
	jp TMHM_ShowTMMoveDescription

TMHM_DisplayPocketItems:
	xor a
	dec a
	ld [wCurVariableMove], a
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jp z, Tutorial_TMHMPocket

	hlcoord 5, 0
	lb bc, 10, 15
	ld a, " "
	call ClearBox
	call TMHM_GetCurrentPocketPosition
	ld d, $5
.loop2
	inc c
	ld a, c
	cp NUM_TMS + 1
	jr nc, .NotTMHM
	ld a, [hli]
	and a
	jr z, .loop2
	ld b, a
	ld a, c
	ld [wTempTMHM], a
	push hl
	push de
	push bc
	call TMHMPocket_GetCurrentLineCoord
	push hl
	ld a, [wTempTMHM]
	ld de, wTempTMHM
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	jr .okay

.okay
	predef GetTMHMMove
	ld a, [wNamedObjectIndexBuffer]
	ld [wPutativeTMHMMove], a
	call GetMoveName
	pop hl
	ld bc, 3 ; move text 3 tiles to the right
	add hl, bc
	push hl
	call PlaceString
	pop hl
	pop bc
	ld a, c
	push bc
	; cp NUM_TMS + 1
	; jr nc, .hm2
	ld bc, SCREEN_WIDTH + 9
	add hl, bc
	ld [hl], "×"
	inc hl
	ld a, "0" ; why are we doing this?
	pop bc
	push bc
	ld a, b
	ld [wTempTMHM], a
	ld de, wTempTMHM
	lb bc, 1, 2
	call PrintNum
; .hm2
	pop bc
	pop de
	pop hl
	dec d
	jr nz, .loop2
	jr .done

.NotTMHM:
	call TMHMPocket_GetCurrentLineCoord
	inc hl
	inc hl
	inc hl
	push de
	ld de, TMHM_String_Cancel
	call PlaceString
	pop de
.done
	ret

TMHMPocket_GetCurrentLineCoord:
	hlcoord 5, -1
	ld bc, 2 * SCREEN_WIDTH
	ld a, 6
	sub d
	ld e, a
	; AddNTimes
.loop
	add hl, bc
	dec e
	jr nz, .loop
	ret

TMHM_String_Cancel:
	db "CANCEL@"

TMHM_GetCurrentPocketPosition:
	ld hl, wTMsHMs
	ld a, [wTMHMPocketScrollPosition]
	ld b, a
	inc b
	ld c, 0
.loop
	inc c
	ld a, [hli]
	and a
	jr z, .loop
	dec b
	jr nz, .loop
	dec hl
	dec c
	ret

Tutorial_TMHMPocket:
	hlcoord 9, 3
	push de
	ld de, TMHM_String_Cancel
	call PlaceString
	pop de
	ret

TMHM_PlaySFX_ReadText2:
	push de
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	pop de
	ret

.NoRoomText:
	; You have no room for any more @ S.
	text_jump UnknownText_0x1c03fa
	db "@"

.ReceivedText:
	; You received @ !
	text_jump UnknownText_0x1c0421
	db "@"

.CheckHaveRoomForTMHM:
	ld a, [wTempTMHM]
	dec a
	ld hl, wTMsHMs
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	inc a
	cp NUM_TMS * 2
	ret nc
	ld [hl], a
	ret

ConsumeTM:
	call ConvertCurItemIntoCurTMHM
	ld a, [wTempTMHM]
	dec a
	ld hl, wTMsHMs
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	and a
	ret z
	dec a
	ld [hl], a
	ret nz
	ld a, [wTMHMPocketScrollPosition]
	and a
	ret z
	dec a
	ld [wTMHMPocketScrollPosition], a
	ret

CountTMsHMs:
	ld b, 0
	ld c, NUM_TMS
	ld hl, wTMsHMs
.loop
	ld a, [hli]
	and a
	jr z, .skip
	inc b
.skip
	dec c
	jr nz, .loop
	ld a, b
	ld [wTempTMHM], a
	ret
