BattleStart_TrainerHuds:
	ld a, $e4
	ldh [rOBP0], a
	call LoadBallIconGFX
	call ShowPlayerMonsRemaining
	ld a, [wBattleMode]
	dec a
	ret z
	jp ShowOTTrainerMonsRemaining

EnemySwitch_TrainerHud:
	ld a, $e4
	ldh [rOBP0], a
	call LoadBallIconGFX
	jp ShowOTTrainerMonsRemaining

ShowPlayerMonsRemaining:
	call DrawPlayerPartyIconHUDBorder
	ld hl, wPartyMon1HP
	ld de, wPartyCount
	call StageBallTilesData
	; ldpixel wPlaceBallsX, 12, 12
	ld a, 12 * 8
	ld hl, wPlaceBallsX
	ld [hli], a
	ld [hl], a
	ld a, 8
	ld [wPlaceBallsDirection], a
	ld hl, wVirtualOAMSprite00
	jp LoadTrainerHudOAM

ShowOTTrainerMonsRemaining:
	call DrawEnemyHUDBorder
	hlcoord 10, 1 ;
	ld [hl], $7f ; replace shiny tile from previous pokemon
	ld hl, wOTPartyMon1HP
	ld de, wOTPartyCount
	call StageBallTilesData
	; ldpixel wPlaceBallsX, 9, 4
	ld hl, wPlaceBallsX
	ld a, 9 * 8
	ld [hli], a
	ld [hl], 4 * 8
	ld a, -8
	ld [wPlaceBallsDirection], a
	ld hl, wVirtualOAMSprite00 + PARTY_LENGTH * SPRITEOAMSTRUCT_LENGTH
	jp LoadTrainerHudOAM

StageBallTilesData:
	ld a, [de]
	push af
	ld de, wBuffer1
	ld c, PARTY_LENGTH
	ld a, $34 ; empty slot
.loop1
	ld [de], a
	inc de
	dec c
	jr nz, .loop1
	pop af
	ld de, wBuffer1
.loop2
	push af
	call .GetHUDTile
	inc de
	pop af
	dec a
	jr nz, .loop2
	ret

.GetHUDTile:
	ld a, [hli]
	and a
	jr nz, .got_hp
	ld a, [hl]
	and a
	ld b, $33 ; fainted
	jr z, .fainted

.got_hp
	dec hl
	dec hl
	dec hl
	ld a, [hl]
	and a
	ld b, $32 ; statused
	jr nz, .load
	dec b ; normal
	jr .load

.fainted
	dec hl
	dec hl
	dec hl

.load
	ld a, b
	ld [de], a
	ld bc, PARTYMON_STRUCT_LENGTH + MON_HP - MON_STATUS
	add hl, bc
	ret

DrawPlayerHUDBorder:
	ld hl, .tiles
	ld de, wTrainerHUDTiles
	ld bc, .tiles_end - .tiles
	call CopyBytes
	hlcoord 18, 10
	ld de, -1 ; start on right
	jp PlaceHUDBorderTiles

.tiles
	db $73 ; right side
	db $77 ; bottom right
	db $6f ; bottom left
	db $76 ; bottom side
.tiles_end

DrawPlayerPartyIconHUDBorder:
	ld hl, .tiles
	ld de, wTrainerHUDTiles
	ld bc, .tiles_end - .tiles
	call CopyBytes
	hlcoord 18, 10
	ld de, -1 ; start on right
	jp PlaceHUDBorderTiles

.tiles
	db $73 ; right side
	db $5c ; bottom right
	db $6f ; bottom left
	db $76 ; bottom side
.tiles_end

DrawEnemyHUDBorder:
	ld hl, .tiles
	ld de, wTrainerHUDTiles
	ld bc, .tiles_end - .tiles
	call CopyBytes
	hlcoord 1, 2
	ld de, 1 ; start on left
	call PlaceHUDBorderTiles
	ld a, [wTempEnemyMonSpecies]
	cp 0
	jr z, .no_trainer_item
	dec a
	; check trainer mon item and show icon
	push hl
	ld hl, wEnemyMonItem
	ld a, [hl]
	pop hl
	cp NO_ITEM
	jr z, .no_trainer_item
	hlcoord 1, 2
	ld [hl], $5e
.no_trainer_item	
	farcall BattleCheckEnemyShininess
	jr nc, .not_shiny
	hlcoord 10, 1
	ld [hl], $5f
.not_shiny
	ld a, [wBattleMode]
	dec a
	ret nz
; wild pokemon
	ld a, [wTempEnemyMonSpecies]
	dec a
	call CheckCaughtMon
	jr z, .not_caught
	hlcoord 1, 2
	ld [hl], $5d

	; check wild mon item and show icon
	push hl
	ld hl, wEnemyMonItem
	ld a, [hl]
	pop hl
	cp NO_ITEM
	jr z, .end
	hlcoord 1, 3
	ld [hl], $5e ; item icon
	jr .end

.not_caught
	push hl
	ld hl, wEnemyMonItem
	ld a, [hl]
	pop hl
	cp NO_ITEM
	jr z, .end
	hlcoord 1, 2
	ld [hl], $5e ; item icon
.end
	call DoesNuzlockeModePreventCapture
	jr c, .nuzlocke
	ret

.nuzlocke
	hlcoord 1, 1
	ld [hl], $75
	ret

.tiles
	db $7F ; left side
	db $7F ; bottom left
	db $7F ; bottom right
	db $7F ; bottom side
.tiles_end

PlaceHUDBorderTiles:
	ld a, [wTrainerHUDTiles + 0]
	ld [hl], a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld a, [wTrainerHUDTiles + 1]
	ld [hl], a
	ld b, 8
.loop
	add hl, de
	ld a, [wTrainerHUDTiles + 3]
	ld [hl], a
	dec b
	jr nz, .loop
	add hl, de
	ld a, [wTrainerHUDTiles + 2]
	ld [hl], a
	ret

LinkBattle_TrainerHuds:
	call LoadBallIconGFX
	ld hl, wPartyMon1HP
	ld de, wPartyCount
	call StageBallTilesData
	ld hl, wPlaceBallsX
	ld a, 10 * 8
	ld [hli], a
	ld [hl], 8 * 8
	ld a, 8
	ld [wPlaceBallsDirection], a
	ld hl, wVirtualOAMSprite00
	call LoadTrainerHudOAM

	ld hl, wOTPartyMon1HP
	ld de, wOTPartyCount
	call StageBallTilesData
	ld hl, wPlaceBallsX
	ld a, 10 * 8
	ld [hli], a
	ld [hl], 13 * 8
	ld hl, wVirtualOAMSprite00 + PARTY_LENGTH * SPRITEOAMSTRUCT_LENGTH
	jp LoadTrainerHudOAM

LoadTrainerHudOAM:
	ld de, wBuffer1
	ld c, PARTY_LENGTH
.loop
	ld a, [wPlaceBallsY]
	ld [hli], a ; y
	ld a, [wPlaceBallsX]
	ld [hli], a ; x
	ld a, [de]
	ld [hli], a ; tile id
	ld a, PAL_BATTLE_OB_YELLOW
	ld [hli], a ; attributes
	ld a, [wPlaceBallsX]
	ld b, a
	ld a, [wPlaceBallsDirection]
	add b
	ld [wPlaceBallsX], a
	inc de
	dec c
	jr nz, .loop
	ret

LoadBallIconGFX:
	ld de, .gfx
	ld hl, vTiles0 tile $31
	lb bc, BANK(LoadBallIconGFX), 4
	call Get2bpp_2
	ret

.gfx
INCBIN "gfx/battle/balls.2bpp"

_ShowLinkBattleParticipants:
	call ClearBGPalettes
	call LoadFontsExtra
	hlcoord 2, 3
	ld b, 9
	ld c, 14
	call TextBox
	hlcoord 4, 5
	ld de, wPlayerName
	call PlaceString
	hlcoord 4, 10
	ld de, wOTPlayerName
	call PlaceString
	hlcoord 9, 8
	ld a, "<BOLD_V>"
	ld [hli], a
	ld [hl], "<BOLD_S>"
	farcall LinkBattle_TrainerHuds ; no need to farcall
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	ld a, $e4
	ldh [rOBP0], a
	ret

DoesNuzlockeModePreventCapture:
	; Is nuzlocke mode on?
	ld a, [wNuzlocke]
	cp 0
	jr z, .no

	; Is enemy shiny?
	farcall BattleCheckEnemyShininess
	jr c, .no

	; Is location already done?
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	ld c, a
	ld hl, wNuzlockeLandmarkFlags
	; Use landmark as index into flag array
	ld b, CHECK_FLAG
	ld d, $0
	predef SmallFarFlagAction
	ld a, c
	and a
	jr z, .no

	scf
	ret

.no
	xor a
	ret

HandleNuzlockeFlags:
	ld a, [wBattleMode]
	cp WILD_BATTLE
	ret nz

	; Dupes clause: don't count duplicate encounters
	ld a, [wTempEnemyMonSpecies]
	dec a
	call CheckCaughtMon
	ret nz

	; Only flag landmarks for Nuzlocke runs after getting Poké Balls
	ld de, EVENT_LEARNED_TO_CATCH_POKEMON
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	ret z

	; Get current landmark
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	; Use landmark as index into flag array
	ld c, a
	ld hl, wNuzlockeLandmarkFlags
	ld b, SET_FLAG
	predef SmallFarFlagAction
	ret
