	const_def 1
	const PINK_PAGE  ; 1
	const GREEN_PAGE ; 2
	const BLUE_PAGE  ; 3
NUM_STAT_PAGES EQU const_value + -1

BattleStatsScreenInit:
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jr nz, StatsScreenInit

	ld a, [wBattleMode]
	and a
	jr z, StatsScreenInit
	jr _MobileStatsScreenInit

StatsScreenInit:
	ld hl, StatsScreenMain
	jr StatsScreenInit_gotaddress

_MobileStatsScreenInit:
	ld hl, StatsScreenMobile
	jr StatsScreenInit_gotaddress

StatsScreenInit_gotaddress:
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a ; disable overworld tile animations
	ld a, [wBoxAlignment] ; whether sprite is to be mirrorred
	push af
	ld a, [wJumptableIndex]
	ld b, a
	ld a, [wcf64]
	ld c, a

	push bc
	push hl
	call ClearBGPalettes
	call ClearTileMap
	call UpdateSprites
	farcall StatsScreen_LoadFont
	pop hl
	call _hl_
	call ClearBGPalettes
	call ClearTileMap
	pop bc

	; restore old values
	ld a, b
	ld [wJumptableIndex], a
	ld a, c
	ld [wcf64], a
	pop af
	ld [wBoxAlignment], a
	pop af
	ldh [hMapAnims], a
	ret

StatsScreenMain:
	xor a
	ld [wJumptableIndex], a
	; stupid interns
	ld [wcf64], a
	ld a, [wcf64]
	and %11111100
	or 1
	ld [wcf64], a
.loop
	ld a, [wJumptableIndex]
	and $ff ^ (1 << 7)
	ld hl, StatsScreenPointerTable
	rst JumpTable
	call StatsScreen_WaitAnim ; check for keys?
	ld a, [wJumptableIndex]
	bit 7, a
	jr z, .loop
	ret

StatsScreenMobile:
	xor a
	ld [wJumptableIndex], a
	; stupid interns
	ld [wcf64], a
	ld a, [wcf64]
	and %11111100
	or 1
	ld [wcf64], a
.loop
	farcall Mobile_SetOverworldDelay
	ld a, [wJumptableIndex]
	and $ff ^ (1 << 7)
	ld hl, StatsScreenPointerTable
	rst JumpTable
	call StatsScreen_WaitAnim
	farcall MobileComms_CheckInactivityTimer
	jr c, .exit
	ld a, [wJumptableIndex]
	bit 7, a
	jr z, .loop

.exit
	ret

StatsScreenPointerTable:
	dw MonStatsInit       ; regular pokémon
	dw EggStatsInit       ; egg
	dw StatsScreenWaitCry
	dw EggStatsJoypad
	dw StatsScreen_LoadPage
	dw StatsScreenWaitCry
	dw MonStatsJoypad
	dw StatsScreen_Exit

StatsScreen_WaitAnim:
	ld hl, wcf64
	bit 6, [hl]
	jr nz, .try_anim
	bit 5, [hl]
	jr nz, .finish
	call DelayFrame
	ret

.try_anim
	farcall SetUpPokeAnim
	jr nc, .finish
	ld hl, wcf64
	res 6, [hl]
.finish
	ld hl, wcf64
	res 5, [hl]
	farcall HDMATransferTileMapToWRAMBank3
	ret

StatsScreen_SetJumptableIndex:
	ld a, [wJumptableIndex]
	and $80
	or h
	ld [wJumptableIndex], a
	ret

StatsScreen_Exit:
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

MonStatsInit:
	ld hl, wcf64
	res 6, [hl]
	call ClearBGPalettes
	call ClearTileMap
	farcall HDMATransferTileMapToWRAMBank3
	call StatsScreen_CopyToTempMon
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	call StatsScreen_InitUpperHalf
	ld hl, wcf64
	set 4, [hl]
	ld h, 4
	call StatsScreen_SetJumptableIndex
	ret

.egg
	ld h, 1
	call StatsScreen_SetJumptableIndex
	ret

EggStatsInit:
	call EggStatsScreen
	ld a, [wJumptableIndex]
	inc a
	ld [wJumptableIndex], a
	ret

EggStatsJoypad:
	call StatsScreen_GetJoypad
	jr nc, .check
	ld h, 0
	call StatsScreen_SetJumptableIndex
	ret

.check
	bit A_BUTTON_F, a
	jr nz, .quit
	and D_DOWN | D_UP | A_BUTTON | B_BUTTON
	jp StatsScreen_JoypadAction

.quit
	ld h, 7
	call StatsScreen_SetJumptableIndex
	ret

StatsScreen_LoadPage:
	call StatsScreen_LoadGFX
	ld hl, wcf64
	res 4, [hl]
	ld a, [wJumptableIndex]
	inc a
	ld [wJumptableIndex], a
	ret

MonStatsJoypad:
	call StatsScreen_GetJoypad
	jr nc, .next
	ld h, 0
	call StatsScreen_SetJumptableIndex
	ret

.next
	and D_DOWN | D_UP | D_LEFT | D_RIGHT | A_BUTTON | B_BUTTON
	jp StatsScreen_JoypadAction

StatsScreenWaitCry:
	call IsSFXPlaying
	ret nc
	ld a, [wJumptableIndex]
	inc a
	ld [wJumptableIndex], a
	ret

StatsScreen_CopyToTempMon:
	ld a, [wMonType]
	cp TEMPMON
	jr nz, .breedmon
	ld a, [wBufferMonSpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld hl, wBufferMon
	ld de, wTempMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	jr .done

.breedmon
	farcall CopyMonToTempMon
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .done
	ld a, [wMonType]
	cp BOXMON
	jr c, .done
	farcall CalcTempmonStats
.done
	and a
	ret

StatsScreen_GetJoypad:
	call GetJoypad
	ld a, [wMonType]
	cp TEMPMON
	jr nz, .notbreedmon
	push hl
	push de
	push bc
	farcall StatsScreenDPad
	pop bc
	pop de
	pop hl
	ld a, [wMenuJoypad]
	and D_DOWN | D_UP
	jr nz, .set_carry
	ld a, [wMenuJoypad]
	jr .clear_flags

.notbreedmon
	ldh a, [hJoyPressed]
.clear_flags
	and a
	ret

.set_carry
	scf
	ret

StatsScreen_JoypadAction:
	push af
	ld a, [wcf64]
	maskbits NUM_STAT_PAGES
	ld c, a
	pop af
	bit B_BUTTON_F, a
	jp nz, .b_button
	bit D_LEFT_F, a
	jr nz, .d_left
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit A_BUTTON_F, a
	jr nz, .a_button
	bit D_UP_F, a
	jr nz, .d_up
	bit D_DOWN_F, a
	jr nz, .d_down
	jr .done

.d_down
	ld a, [wBuffer6]
	cp $AA
	ret z
	ld a, [wMonType]
	cp BOXMON
	jr nc, .done
	and a
	ld a, [wPartyCount]
	jr z, .next_mon
	ld a, [wOTPartyCount]
.next_mon
	ld b, a
	ld a, [wCurPartyMon]
	inc a
	cp b
	jr z, .done
	ld [wCurPartyMon], a
	ld b, a
	ld a, [wMonType]
	and a
	jr nz, .load_mon
	ld a, b
	inc a
	ld [wPartyMenuCursor], a
	jr .load_mon

.d_up
	ld a, [wBuffer6]
	cp $AA
	ret z
	ld a, [wCurPartyMon]
	and a
	jr z, .done
	dec a
	ld [wCurPartyMon], a
	ld b, a
	ld a, [wMonType]
	and a
	jr nz, .load_mon
	ld a, b
	inc a
	ld [wPartyMenuCursor], a
	jr .load_mon

.a_button
	ld a, c
	cp BLUE_PAGE ; last page
	jr z, .b_button
.d_right
	inc c
	ld a, BLUE_PAGE ; last page
	cp c
	jr nc, .set_page
	ld c, PINK_PAGE ; first page
	jr .set_page

.d_left
	dec c
	jr nz, .set_page
	ld c, BLUE_PAGE ; last page
	jr .set_page

.done
	ret

.set_page
	ld a, [wcf64]
	and %11111100
	or c
	ld [wcf64], a
	ld h, 4
	call StatsScreen_SetJumptableIndex
	ret

.load_mon
	ld h, 0
	call StatsScreen_SetJumptableIndex
	ret

.b_button
	ld h, 7
	call StatsScreen_SetJumptableIndex
	ret

StatsScreen_InitUpperHalf:
	call .PlaceHPBar
	xor a
	ldh [hBGMapMode], a
	
	hlcoord 2, 3
	call PrintLevel
	ld a, [wBuffer6]
	cp $AA
	jr nz, .copy_partymon_nickname
	ld a, [wEnemyMonSpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	jr .place_name
.copy_partymon_nickname
	ld hl, .NicknamePointers
	call GetNicknamePointer
	call CopyNickname
.place_name
	hlcoord 1, 2
	call PlaceString
	hlcoord 6, 3
	call .PlaceGenderChar
	;hlcoord 9, 3
	;ld a, "/"
	;ld [hli], a
	;ld a, [wBaseDexNo]
	;ld [wNamedObjectIndexBuffer], a
	;call GetPokemonName
	;call PlaceString
	;call StatsScreen_PlaceHorizontalDivider
	call StatsScreen_PlaceShinyIcon
	ret

.PlaceHPBar:
	ld hl, wTempMonHP
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wTempMonMaxHP
	ld a, [hli]
	ld d, a
	ld e, [hl]
	farcall ComputeHPBarPixels
	ld hl, wCurHPPal
	call SetHPPal
	ld b, SCGB_STATS_SCREEN_HP_PALS
	call GetSGBLayout
	call DelayFrame
	ret

.PlaceGenderChar:
	push hl
	farcall GetGender
	pop hl
	ret c
	ld a, "♂"
	jr nz, .got_gender
	ld a, "♀"
.got_gender
	ld [hl], a
	ret

.NicknamePointers:
	dw wPartyMonNicknames
	dw wOTPartyMonNicknames
	dw sBoxMonNicknames
	dw wBufferMonNick

StatsScreen_PlaceHorizontalDividerTopBlue:
	hlcoord 0, 7
	ld b, SCREEN_WIDTH
	ld a, $bb ; horizontal divider
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	
	hlcoord 0, 7 
	ld a, $ba ; top left corner
	ld [hli], a
	hlcoord 19, 7
	ld a, $bc ; top right corner
	ld [hli], a

	; mid divider :
	hlcoord 1, 11
	ld b, SCREEN_WIDTH - 2
	ld a, $bb ; horizontal divider
.loop2
	ld [hli], a
	dec b
	jr nz, .loop2
	
	hlcoord 0, 11
	ld a, $c2 ; mid left
	ld [hli], a
	hlcoord 19, 11
	ld a, $c3 ; mid right
	ld [hli], a

	ret
	
StatsScreen_PlaceHorizontalDividerBotBlue:
	hlcoord 0, 17
	ld b, SCREEN_WIDTH
	ld a, $bb ; horizontal divider
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	
	hlcoord 0, 17
	ld a, $be ; top left corner
	ld [hli], a
	hlcoord 19, 17
	ld a, $bf ; top right corner
	ld [hli], a
	ret

StatsScreen_PlaceHorizontalDividerTopPink:
	hlcoord 0, 7
	ld b, SCREEN_WIDTH
	ld a, $bb ; horizontal divider
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	
	hlcoord 0, 7 
	ld a, $ba ; top left corner
	ld [hli], a
	hlcoord 11, 7
	ld a, $c1
	ld [hli], a
	hlcoord 11, 8
	ld a, $bd
	ld [hli], a
	; hlcoord 11, 9
	; ld a, $bd
	; ld [hli], a
	hlcoord 11, 9
	ld a, $bd
	ld [hli], a
	hlcoord 19, 7
	ld a, $bc ; top right corner
	ld [hli], a
	ret
	
StatsScreen_PlaceHorizontalDividerBotPink: ;and mid
	hlcoord 0, 17
	ld b, SCREEN_WIDTH
	ld a, $bb ; horizontal divider
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	
	; mid divider :
	hlcoord 1, 10
	ld b, SCREEN_WIDTH - 2
	ld a, $bb ; horizontal divider
.loop2
	ld [hli], a
	dec b
	jr nz, .loop2
	
	hlcoord 0, 10
	ld a, $c2 ; mid left
	ld [hli], a
	hlcoord 11, 10
	ld a, $c0 ; mid facing up
	ld [hli], a
	hlcoord 19, 10
	ld a, $c3 ; mid right
	ld [hli], a
	
	hlcoord 0, 17
	ld a, $be ; bot left
	ld [hli], a
	hlcoord 19, 17
	ld a, $bf ; bot right
	ld [hli], a
	ret

StatsScreen_PlaceHorizontalDividerTopGreen:
	hlcoord 0, 7
	ld b, SCREEN_WIDTH
	ld a, $bb ; horizontal divider
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	
	hlcoord 0, 7 
	ld a, $ba ; top left corner
	ld [hli], a
	hlcoord 19, 7
	ld a, $bc ; top right corner
	ld [hli], a
	ret
	
StatsScreen_PlaceHorizontalDividerMidGreen:
	hlcoord 0, 9
	ld b, SCREEN_WIDTH
	ld a, $bb ; horizontal divider
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	
	hlcoord 0, 9
	ld a, $c2 ; 
	ld [hli], a
	hlcoord 19, 9
	ld a, $c3 ; 
	ld [hli], a
	ret
	
StatsScreen_PlaceHorizontalDividerBotGreen:
	hlcoord 0, 17
	ld b, SCREEN_WIDTH
	ld a, $bb ; horizontal divider
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	
	hlcoord 0, 17
	ld a, $be ; bot left corner
	ld [hli], a
	hlcoord 19, 17
	ld a, $bf ; bot right corner
	ld [hli], a
	ret

StatsScreen_PlaceShinyIcon:
	ld bc, wTempMonDVs
	farcall CheckShininess
	ret nc
	hlcoord 7, 3
	ld [hl], $39
	ret

StatsScreen_LoadGFX:
	ld a, [wBaseDexNo]
	ld [wTempSpecies], a
	ld [wCurSpecies], a
	xor a
	ldh [hBGMapMode], a
	call .ClearBox
	call .PageTilemap
	call .LoadPals
	ld hl, wcf64
	bit 4, [hl]
	jr nz, .place_frontpic
	call SetPalettes
	ret

.place_frontpic
	call StatsScreen_PlaceFrontpic
	ret

.ClearBox:
	ld a, [wcf64]
	maskbits NUM_STAT_PAGES
	ld c, a
	call StatsScreen_LoadPageIndicators
	hlcoord 0, 8
	lb bc, 10, 20
	call ClearBox
	ret

.LoadPals:
	ld a, [wcf64]
	maskbits NUM_STAT_PAGES
	ld c, a
	farcall LoadStatsScreenPals
	call DelayFrame
	ld hl, wcf64
	set 5, [hl]
	ret

.PageTilemap:
	ld a, [wcf64]
	maskbits NUM_STAT_PAGES
	dec a
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable:
; entries correspond to *_PAGE constants
	dw .PinkPage
	dw .GreenPage
	dw .BluePage

.PinkPage:
	call StatsScreen_PlaceHorizontalDividerTopPink	
	
	hlcoord 0, 8
	ld de, SCREEN_WIDTH
	ld b, 9
	ld a, $bd ; vertical divider
.PinkPageVerticalDivider1:
	ld [hl], a
	add hl, de
	dec b
	jr nz, .PinkPageVerticalDivider1

	hlcoord 19, 8
	ld de, SCREEN_WIDTH
	ld b, 9
	ld a, $bd ; vertical divider
.PinkPageVerticalDivider2:
	ld [hl], a
	add hl, de
	dec b
	jr nz, .PinkPageVerticalDivider2	
	
	call .PlaceOTInfo

	hlcoord 10, 11
	ld b, $0
	predef DrawPlayerHP
	; ld a, [wBaseDexNo]
	; ld [wCurSpecies], a
	; hlcoord 12, 11
	; ld [hl], "S"
	; inc hl
	; ld [hl], "T"
	; inc hl
	; ld [hl], "A"
	; inc hl
	; hlcoord 16, 11
	; ld a, [wTempMonStamina]
	; ld [wDeciramBuffer], a
	; lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	; ld de, wDeciramBuffer
	; call PrintNum
	
	ld de, .Status_String
	hlcoord 1, 11
	call PlaceString
	ld de, .Type_String
	hlcoord 10, 13
	call PlaceString
	ld a, [wTempMonPokerusStatus]
	ld b, a
	and $f
	jr nz, .HasPokerus
	ld a, b
	and $f0
	jr z, .NotImmuneToPkrs
	hlcoord 11, 11
	ld [hl], "." ; Pokérus immunity dot
.NotImmuneToPkrs:
	ld a, [wMonType]
	cp BOXMON
	jr z, .StatusOK
	hlcoord 6, 12
	push hl
	ld de, wTempMonStatus
	predef PlaceStatusString
	pop hl
	jr nz, .done_status
	jr .StatusOK
.HasPokerus:
	ld de, .PkrsStr
	hlcoord 2, 14
	call PlaceString
	jr .done_status
.StatusOK:
	ld de, .OK_str
	call PlaceString
.done_status
	hlcoord 11, 14
	predef PrintMonTypes
	hlcoord 10, 11
	ld de, SCREEN_WIDTH
	ld b, 10
	ld a, $31 ; vertical divider
	ld de, .ExpPointStr
	hlcoord 1, 8
	call PlaceString
	; hlcoord 16, 10
	; call .PrintNextLevel
	hlcoord 4, 8
	lb bc, 3, 7
	ld de, wTempMonExp
	call PrintNum
	call .CalcExpToNextLevel
	hlcoord 12, 9
	lb bc, 3, 7
	ld de, wBuffer1
	call PrintNum
	ld de, .LevelUpStr
	hlcoord 12, 8
	call PlaceString
	; ld de, .ToStr
	; hlcoord 13, 10
	; call PlaceString
	hlcoord 2, 9
	ld a, [wTempMonLevel]
	ld b, a
	ld de, wTempMonExp + 2
	predef FillInExpBar
	hlcoord 1, 9
	ld [hl], $3a ; left exp bar end cap
	hlcoord 10, 9
	ld [hl], $3b ; right exp bar end cap
	call StatsScreen_PlaceHorizontalDividerBotPink
	ret

.CalcExpToNextLevel:
	ld a, [wTempMonLevel]
	cp MAX_LEVEL
	jr z, .AlreadyAtMaxLevel
	inc a
	ld d, a
	farcall CalcExpAtLevel
	ld hl, wTempMonExp + 2
	ld hl, wTempMonExp + 2
	ldh a, [hQuotient + 3]
	sub [hl]
	dec hl
	ld [wBuffer3], a
	ldh a, [hQuotient + 2]
	sbc [hl]
	dec hl
	ld [wBuffer2], a
	ldh a, [hQuotient + 1]
	sbc [hl]
	ld [wBuffer1], a
	ret

.AlreadyAtMaxLevel:
	ld hl, wBuffer1
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

.PlaceOTInfo:
	ld de, OTString
	hlcoord 1, 13
	call PlaceString
	
	ld a, [wBuffer6]
	cp $AA
	jr nz, .copy_partymon_nickname
	callfar Battle_GetTrainerName
	jr .place_ot_name
.copy_partymon_nickname
	ld hl, .OTNamePointers
	call GetNicknamePointer
	call CopyNickname
.place_ot_name
	hlcoord 3, 14
	call PlaceString

	ld a, [wBuffer6]
	cp $AA
	jr z, .done
	ld de, IDNoString
	hlcoord 1, 16
	call PlaceString
	hlcoord 4, 16
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	ld de, wTempMonID
	call PrintNum
.done
	ret

.OTNamePointers:
	dw wPartyMonOT
	dw wOTPartyMonOT
	dw sBoxMonOT
	dw wBufferMonOT

.Status_String:
	db "STATUS/@"

.Type_String:
	db "TYPE/@"

.OK_str:
	db "OK@"

.ExpPointStr:
	db "EXP@"

.LevelUpStr:
	db "NEED@"

.PkrsStr:
	db "#RUS@"

.GreenPage:
	hlcoord 0, 8
	ld de, SCREEN_WIDTH
	ld b, 9
	ld a, $bd ; vertical divider
.GreenPageVerticalDivider1:
	ld [hl], a
	add hl, de
	dec b
	jr nz, .GreenPageVerticalDivider1
	hlcoord 19, 8
	ld de, SCREEN_WIDTH
	ld b, 9
	ld a, $bd ; vertical divider
.GreenPageVerticalDivider2:
	ld [hl], a
	add hl, de
	dec b
	jr nz, .GreenPageVerticalDivider2
	call StatsScreen_PlaceHorizontalDividerTopGreen
	ld de, .Item
	hlcoord 1, 8
	call PlaceString
	call .GetItemName
	hlcoord 7, 8
	call PlaceString
	ld hl, wTempMonMoves
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call CopyBytes
	hlcoord 5, 10
	ld a, SCREEN_WIDTH * 2
	ld [wBuffer1], a
	ld a, [wBaseType1]
	ld [wBattleMonType1], a
	ld a, [wBaseType2]
	ld [wBattleMonType2], a
	predef ListMoves
	hlcoord 1, 10
	ld a, SCREEN_WIDTH * 2
	ld [wBuffer1], a
	predef ListMovePP
	call StatsScreen_PlaceHorizontalDividerMidGreen
	call StatsScreen_PlaceHorizontalDividerBotGreen
	ret

.GetItemName:
	ld de, .ThreeDashes
	ld a, [wTempMonItem]
	and a
	ret z
	ld b, a
	farcall TimeCapsule_ReplaceTeruSama
	ld a, b
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ret

.Item:
	db "Item:@"

.ThreeDashes:
	db "---@"

.BluePage:
	hlcoord 0, 8
	ld de, SCREEN_WIDTH
	ld b, 9
	ld a, $bd ; vertical divider
.BluePageVerticalDivider2:
	ld [hl], a
	add hl, de
	dec b
	jr nz, .BluePageVerticalDivider2
		
	hlcoord 19, 8
	ld de, SCREEN_WIDTH
	ld b, 9
	ld a, $bd ; vertical divider
.BluePageVerticalDivider3: ; StatsScreen_LoadGFX.BluePageVerticalDivider3
	ld [hl], a
	add hl, de
	dec b
	jr nz, .BluePageVerticalDivider3	

	call StatsScreen_PlaceHorizontalDividerTopBlue
	
	call StatsScreen_PlaceHorizontalDividerBotBlue

	predef PrintTempMonStatsShort

	; ld de, .Trait
	; hlcoord 1, 12
	; call PlaceString

	ld a, [wTempMonTrait]
	and FIRST_TRAIT_MASK
	ld [wNamedObjectIndexBuffer], a
	call StatsScreen_GetBaseTrait
	call GetTraitName
	hlcoord 1, 12
	call PlaceString
	
	; ld a, [wTempMonTrait]
	; and SECOND_TRAIT_MASK
	; rra
	; rra
	; add 4
	; ld [wNamedObjectIndexBuffer], a
	; call StatsScreen_GetBaseTrait
	; call GetTraitName
	; hlcoord 1, 14
	; call PlaceString
	
	ld a, [wTempMonTrait]
	ld [wCurSpecies], a
	hlcoord 1, 14
	predef PrintTraitDesc
	ret

.Trait:
	db "Trait:@"

IDNoString:
	db "ID.@"

OTString:
	db "OT/@"

StatsScreen_GetBaseTrait:
	ld hl, wBaseTraits
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ret

StatsScreen_PlaceFrontpic:
	ld hl, wTempMonDVs
	predef GetUnownLetter
	call StatsScreen_GetAnimationParam
	jr c, .egg
	and a
	jr z, .no_cry
	jr .cry

.egg
	call .AnimateEgg
	call SetPalettes
	ret

.no_cry
	call .AnimateMon
	call SetPalettes
	ret

.cry
	call SetPalettes
	call .AnimateMon
	ld a, [wCurPartySpecies]
	call PlayMonCry2
	ret

.AnimateMon:
	ld hl, wcf64
	set 5, [hl]
	ld a, [wCurPartySpecies]
	cp UNOWN
	jr z, .unown
	hlcoord 12, 0
	call PrepMonFrontpic
	ret

.unown
	xor a
	ld [wBoxAlignment], a
	hlcoord 12, 0
	call _PrepMonFrontpic
	ret

.AnimateEgg:
	ld a, [wCurPartySpecies]
	cp UNOWN
	jr z, .unownegg
	ld a, TRUE
	ld [wBoxAlignment], a
	call .get_animation
	ret

.unownegg
	xor a
	ld [wBoxAlignment], a
	call .get_animation
	ret

.get_animation
	ld a, [wCurPartySpecies]
	call IsAPokemon
	ret c
	call StatsScreen_LoadTextBoxSpaceGFX
	ld de, vTiles2 tile $00
	predef GetAnimatedFrontpic
	hlcoord 12, 0
	ld d, $0
	ld e, ANIM_MON_MENU
	predef LoadMonAnimation
	ld hl, wcf64
	set 6, [hl]
	ret

StatsScreen_GetAnimationParam:
	ld a, [wMonType]
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable:
	dw .PartyMon
	dw .OTPartyMon
	dw .BoxMon
	dw .Tempmon
	dw .Wildmon

.PartyMon:
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld b, h
	ld c, l
	jr .CheckEggFaintedFrzSlp

.OTPartyMon:
	xor a
	ret

.BoxMon:
	ld hl, sBoxMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld b, h
	ld c, l
	ld a, BANK(sBoxMons)
	call GetSRAMBank
	call .CheckEggFaintedFrzSlp
	push af
	call CloseSRAM
	pop af
	ret

.Tempmon:
	ld bc, wTempMonSpecies
	jr .CheckEggFaintedFrzSlp ; utterly pointless

.CheckEggFaintedFrzSlp:
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	call CheckFaintedFrzSlp
	jr c, .FaintedFrzSlp
.egg
	xor a
	scf
	ret

.Wildmon:
	ld a, $1
	and a
	ret

.FaintedFrzSlp:
	xor a
	ret

StatsScreen_LoadTextBoxSpaceGFX:
	nop
	push hl
	push de
	push bc
	push af
	call DelayFrame
	ldh a, [rVBK]
	push af
	ld a, $1
	ldh [rVBK], a
	ld de, TextBoxSpaceGFX
	lb bc, BANK(TextBoxSpaceGFX), 1
	ld hl, vTiles2 tile " "
	call Get2bpp
	pop af
	ldh [rVBK], a
	pop af
	pop bc
	pop de
	pop hl
	ret

Unreferenced_4e32a:
; A blank space tile?
	ds 16

EggStatsScreen:
	xor a
	ldh [hBGMapMode], a
	ld hl, wCurHPPal
	call SetHPPal
	ld b, SCGB_STATS_SCREEN_HP_PALS
	call GetSGBLayout
	;call StatsScreen_PlaceHorizontalDivider
	ld de, EggString
	hlcoord 2, 2
	call PlaceString
	ld de, IDNoString
	hlcoord 2, 4
	call PlaceString
	ld de, OTString
	hlcoord 2, 6
	call PlaceString
	ld de, FiveQMarkString
	hlcoord 5, 4
	call PlaceString
	ld de, FiveQMarkString
	hlcoord 5, 6
	call PlaceString
	ld a, [wTempMonHappiness] ; egg status
	ld de, EggSoonString
	cp $6
	jr c, .picked
	ld de, EggCloseString
	cp $b
	jr c, .picked
	ld de, EggMoreTimeString
	cp $29
	jr c, .picked
	ld de, EggALotMoreTimeString
.picked
	hlcoord 1, 9
	call PlaceString
	ld hl, wcf64
	set 5, [hl]
	call SetPalettes ; pals
	call DelayFrame
	hlcoord 12, 0
	call PrepMonFrontpic
	farcall HDMATransferTileMapToWRAMBank3
	call StatsScreen_AnimateEgg

	ld a, [wTempMonHappiness]
	cp 6
	ret nc
	ld de, SFX_2_BOOPS
	call PlaySFX
	ret

EggString:
	db "EGG@"

FiveQMarkString:
	db "?????@"

EggSoonString:
	db   "It's making sounds"
	next "inside. It's going"
	next "to hatch soon!@"

EggCloseString:
	db   "It moves around"
	next "inside sometimes."
	next "It must be close"
	next "to hatching.@"

EggMoreTimeString:
	db   "Wonder what's"
	next "inside? It needs"
	next "more time, though.@"

EggALotMoreTimeString:
	db   "This EGG needs a"
	next "lot more time to"
	next "hatch.@"

StatsScreen_AnimateEgg:
	call StatsScreen_GetAnimationParam
	ret nc
	ld a, [wTempMonHappiness]
	ld e, $7
	cp 6
	jr c, .animate
	ld e, $8
	cp 11
	jr c, .animate
	ret

.animate
	push de
	ld a, $1
	ld [wBoxAlignment], a
	call StatsScreen_LoadTextBoxSpaceGFX
	ld de, vTiles2 tile $00
	predef GetAnimatedFrontpic
	pop de
	hlcoord 12, 0
	ld d, $0
	predef LoadMonAnimation
	ld hl, wcf64
	set 6, [hl]
	ret

StatsScreen_LoadPageIndicators:
	hlcoord 2, 5
	ld a, $31 ; first of 4 small square tiles
	call .load_square
	hlcoord 4, 5
	ld a, $31 ; " " " "
	call .load_square
	hlcoord 6, 5
	ld a, $31 ; " " " "
	call .load_square
	ld a, c
	cp GREEN_PAGE
	ld a, $35 ; first of 4 large square tiles
	hlcoord 2, 5 ; PINK_PAGE (< GREEN_PAGE)
	jr c, .load_square
	hlcoord 4, 5 ; GREEN_PAGE (= GREEN_PAGE)
	jr z, .load_square
	hlcoord 6, 5 ; BLUE_PAGE (> GREEN_PAGE)
.load_square
	push bc
	ld [hli], a
	inc a
	ld [hld], a
	ld bc, SCREEN_WIDTH
	add hl, bc
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	pop bc
	ret

CopyNickname:
	ld de, wStringBuffer1
	ld bc, MON_NAME_LENGTH
	ld a, [wMonType]
	cp BOXMON
	jr nz, .partymon
	ld a, BANK(sBoxMonNicknames)
	call GetSRAMBank
	push de
	call CopyBytes
	pop de
	call CloseSRAM
	ret

.partymon
	push de
	call CopyBytes
	pop de
	ret

GetNicknamePointer:
	ld a, [wMonType]
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMonType]
	cp TEMPMON
	ret z
	ld a, [wCurPartyMon]
	jp SkipNames

CheckFaintedFrzSlp:
	ld hl, MON_HP
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .fainted_frz_slp
	ld hl, MON_STATUS
	add hl, bc
	ld a, [hl]
	and 1 << FRZ | SLP
	jr nz, .fainted_frz_slp
	and a
	ret

.fainted_frz_slp
	scf
	ret

; by Aurelio Mannara - BitBuilt 2017
; ShockSlayer helped ( °v°)
TN_PrintDVs:
    ; print labels
	
    ; hlcoord 2, 11
    ; ld [wBuffer2], a
    ; ld de, .label_DV ; DV
    ; call PlaceString
    
    hlcoord 1, 8
    ld [wBuffer2], a
    ld de, .label_HP ; hp
    call PlaceString
    
    hlcoord 1, 9
    ld [wBuffer2], a
    ld de, .label_ATK ; atk
    call PlaceString
    
    hlcoord 1, 10
    ld [wBuffer2], a
    ld de, .label_DEF ; def
    call PlaceString
    
    hlcoord 1, 11
    ld [wBuffer2], a
    ld de, .label_SPE ; spe
    call PlaceString
    
    hlcoord 1, 12
    ld [wBuffer2], a
    ld de, .label_SPC ; spc
    call PlaceString
    
    ; print 16 bit value of DVs
    ld hl, wTempMonDVs
    ld a, [hl]
	swap a
	and $f
	cp $2 ; 0 to 1
	jr c, .atkdv0
	cp $4 ; 2 to 3
	jr c, .atkdv1
	cp $7 ; 4 to 6
	jr c, .atkdv2
	cp $9 ; 7 to 9
	jr c, .atkdv3
	hlcoord 4, 9 ; 10
	jr .atkgo
.atkdv0
	hlcoord 8, 9
	jr .atkgo
.atkdv1
	hlcoord 7, 9
	jr .atkgo
.atkdv2
	hlcoord 6, 9
	jr .atkgo
.atkdv3
	hlcoord 5, 9
.atkgo
	ld [wStringBuffer1], a
	ld de, wStringBuffer1
    lb bc, 1, PRINTNUM_RIGHTALIGN | 2
    call PrintNum

	; DEF
   	ld hl, wTempMonDVs
	ld a, [hl]
    and $f
    cp $2
	jr c, .defdv0
	cp $4
	jr c, .defdv1
	cp $7
	jr c, .defdv2
	cp $9
	jr c, .defdv3	
	hlcoord 4, 10 ; def disp coords
	jr .defgo
.defdv0
	hlcoord 8, 10
	jr .defgo
.defdv1
	hlcoord 7, 10
	jr .defgo
.defdv2
	hlcoord 6, 10
	jr .defgo
.defdv3
	hlcoord 5, 10
.defgo
	ld [wStringBuffer1], a
	ld de, wStringBuffer1
    lb bc, 1, PRINTNUM_RIGHTALIGN | 2    
    call PrintNum

	; SPD
    ld hl, wTempMonDVs
	inc hl
	ld a, [hl]
    swap a
	and $f
    cp $2
	jr c, .spedv0
	cp $4
	jr c, .spedv1
	cp $7
	jr c, .spedv2
	cp $9
	jr c, .spedv3
	hlcoord 4, 11 ; speed disp coords
	jr .spego
.spedv0
	hlcoord 8, 11
	jr .spego
.spedv1
	hlcoord 7, 11
	jr .spego
.spedv2
	hlcoord 6, 11
	jr .spego
.spedv3
	hlcoord 5, 11
.spego
    ld [wStringBuffer1], a
	ld de, wStringBuffer1
    lb bc, 1, PRINTNUM_RIGHTALIGN | 2    
    call PrintNum

	; SPCL
    ld hl, wTempMonDVs
    inc hl
	ld a, [hl]
	and $f
    cp $2
	jr c, .spcdv0
	cp $4
	jr c, .spcdv1
	cp $7
	jr c, .spcdv2
	cp $9
	jr c, .spcdv3
	hlcoord 4, 12 ; special disp coords
	jr .spcgo
.spcdv0
	hlcoord 8, 12
	jr .spcgo
.spcdv1
	hlcoord 7, 12
	jr .spcgo
.spcdv2
	hlcoord 6, 12
	jr .spcgo
.spcdv3
	hlcoord 5, 12
.spcgo
    ld [wStringBuffer1], a
	ld de, wStringBuffer1
    lb bc, 1, PRINTNUM_RIGHTALIGN | 2    
    call PrintNum
    
	; HP
	ld hl, wTempMonDVs
    ld a, [hl]
	swap a
	and 1
	add a
	add a
	add a
	ld b, a
	ld a, [hli]
	and 1
	add a
	add a
	add b
	ld b, a
	ld a, [hl]
	swap a
	and 1
	add a
	add b
	ld b, a
	ld a, [hl]
	and 1
	add b
.mod_hp
	cp 11
	jr c, .hpok
	sub 11
	jr .mod_hp
.hpok
    cp $2
	jr c, .hpdv0
	cp $4
	jr c, .hpdv1 
	cp $7
	jr c, .hpdv2
	cp $9
	jr c, .hpdv3
	hlcoord 4, 8
	jr .hpgo
.hpdv0
	hlcoord 8, 8
	jr .hpgo
.hpdv1
	hlcoord 7, 8
	jr .hpgo
.hpdv2
	hlcoord 6, 8
	jr .hpgo
.hpdv3
	hlcoord 5, 8
.hpgo
    ld [wStringBuffer1], a
	ld de, wStringBuffer1
    lb bc, 1, PRINTNUM_RIGHTALIGN | 2    
    call PrintNum
	ret

.label_DV
    db "DVs:@"
.label_HP
    db " HP<DASH><DASH><DASH><DASH><DASH><DASH>@"
.label_ATK
    db "ATK<DASH><DASH><DASH><DASH><DASH><DASH>@"
.label_DEF
    db "DEF<DASH><DASH><DASH><DASH><DASH><DASH>@"
.label_SPE
    db "SPD<DASH><DASH><DASH><DASH><DASH><DASH>@"
.label_SPC
    db "SPC<DASH><DASH><DASH><DASH><DASH><DASH>@"    
     