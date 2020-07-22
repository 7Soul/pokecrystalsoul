	const_def
	const PALETTE_POS_DEX
	const PALETTE_POS_STATS
	const PALETTE_POS_BATTLE

; Replaces the functionality of sgb.asm to work with CGB hardware.
CheckCGB:
	ldh a, [hCGB]
	and a
	ret

LoadSGBLayoutCGB:
	ld a, b
	cp SCGB_RAM
	jr nz, .not_ram
	ld a, [wSGBPredef]
.not_ram
	cp SCGB_PARTY_MENU_HP_PALS
	jp z, CGB_ApplyPartyMenuHPPals
	call ResetBGPals
	ld l, a
	ld h, 0
	add hl, hl
	ld de, .dw
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .ReturnFromJumpTable
	push de
	jp hl

.ReturnFromJumpTable:
	ret

.dw
	dw _CGB_BattleGrayscale
	dw _CGB_BattleColors
	dw _CGB_PokegearPals
	dw _CGB_StatsScreenHPPals
	dw _CGB_Pokedex
	dw _CGB_SlotMachine
	dw _CGB_BetaTitleScreen
	dw _CGB_GSIntro
	dw _CGB_Diploma
	dw _CGB_MapPals
	dw _CGB_PartyMenu
	dw _CGB_Evolution
	dw _CGB_GSTitleScreen
	dw _CGB0d
	dw _CGB_MoveList
	dw _CGB_BetaPikachuMinigame
	dw _CGB_PokedexSearchOption
	dw _CGB_BetaPoker
	dw _CGB_Pokepic
	dw _CGB_MagnetTrain
	dw _CGB_PackPals
	dw _CGB_TrainerCard
	dw _CGB_PokedexUnownMode
	dw _CGB_BillsPC
	dw _CGB_UnownPuzzle
	dw _CGB_GamefreakLogo
	dw _CGB_PlayerOrMonFrontpicPals
	dw _CGB_TradeTube
	dw _CGB_TrainerOrMonFrontpicPals
	dw _CGB_MysteryGift
	dw _CGB1e

_CGB_BattleGrayscale:
	ld hl, PalPacket_BattleGrayscale + 1
	ld de, wBGPals1
	ld c, 4
	call CopyPalettes
	ld hl, PalPacket_BattleGrayscale + 1
	ld de, wBGPals1 palette PAL_BATTLE_BG_EXP
	ld c, 4
	call CopyPalettes
	ld hl, PalPacket_BattleGrayscale + 1
	ld de, wOBPals1
	ld c, 2
	call CopyPalettes
	jr _CGB_FinishBattleScreenLayout

_CGB_BattleColors:
	ld de, wBGPals1
	call GetBattlemonBackpicPalettePointer
	push hl
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_PLAYER
	call GetEnemyFrontpicPalettePointer
	push hl
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_ENEMY
	ld a, [wTempEnemyMonSpecies]
	and a
	jp nz, .get_hp_palettes
	ld a, $1
	ld [wLoad3rdPalette], a
	call GetExtraEnemyFrontpicPalettePointer
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_ENEMY_HP
	jr .skip_trainer_hp_palettes
.get_hp_palettes
	ld a, [wEnemyHPPal]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_ENEMY_HP
.skip_trainer_hp_palettes
	ld a, [wPlayerHPPal]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_PLAYER_HP
	ld hl, ExpBarPalette
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_EXP

	call GetExtraBattlemonBackpicPalettePointer
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_PLAYER_EX
	ld a, $0
	ld [wLoad3rdPalette], a
	call GetExtraEnemyFrontpicPalettePointer
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_ENEMY_EX

	ld de, wOBPals1
	pop hl
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_OB_ENEMY
	pop hl
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_OB_PLAYER
	ld a, SCGB_BATTLE_COLORS
	ld [wSGBPredef], a
	call ApplyPals
_CGB_FinishBattleScreenLayout:
	call InitPartyMenuBGPal7
	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, PAL_BATTLE_BG_ENEMY_HP
	call ByteFill
	hlcoord 0, 4, wAttrMap
	lb bc, 8, 10
	ld a, PAL_BATTLE_BG_PLAYER
	call FillBoxCGB

.pokemon_extra
	ld a, [wTempBattleMonSpecies]
	cp IVYSAUR
	jp z, .ivysaur_player
	cp VENUSAUR
	jp z, .venusaur_player
	cp TENTACOOL
	jp z, .tentacool_player
	cp TENTACRUEL
	jp z, .tentacruel_player
	cp FARFETCH_D
	jp z, .farfetch_d_player
	cp BELLOSSOM
	jp z, .bellossom_player
	cp BUTTERFREE
	jp z, .butterfree_player
	cp SLOWKING
	jp z, .slowking_player
	cp FLAAFFY
	jp z, .flaaffy_player
	cp AMPHAROS
	jp z, .ampharos_player
	cp BELLSPROUT
	jp z, .bellsprout_player
	cp NATU
	jp z, .natu_player
	cp XATU
	jp z, .xatu_player
	cp ARIADOS
	jp z, .ariados_player
	cp MR__MIME
	jp z, .mr__mime_player
	cp SUDOWOODO
	jp z, .sudowoodo_player
	cp KANGASKHAN
	jp z, .kangaskhan_player
	cp EKANS
	jp z, .ekans_player
	cp FERALIGATR
	jp z, .feraligatr_player
	cp FEAROW
	jp z, .fearow_player
	cp MAGNEMITE
	jp z, .magnemite_player
	cp MAGNETON
	jp z, .magneton_player
	cp VAPOREON
	jp z, .vaporeon_player
	cp NOCTOWL
	jp z, .noctowl_player
	cp PIDGEOTTO
	jp z, .pidgeotto_player
	cp PIDGEOT
	jp z, .pidgeot_player
	jp .skip_extra_player

.ivysaur_player
	hlcoord 2, 10, wAttrMap
	lb bc, 2, 6
	call FillPalette5
	hlcoord 7, 9, wAttrMap
	lb bc, 1, 1
	jp .end_extra_player
.venusaur_player
	hlcoord 2, 10, wAttrMap
	lb bc, 1, 1
	call FillPalette5
	hlcoord 7, 10, wAttrMap
	lb bc, 1, 1
	call FillPalette5
	hlcoord 2, 11, wAttrMap
	lb bc, 1, 6
	jp .end_extra_player
.tentacool_player
	hlcoord 2, 11, wAttrMap
	lb bc, 1, 6 ; h, w
	jp .end_extra_player
.tentacruel_player
	hlcoord 2, 10, wAttrMap
	lb bc, 2, 6 ; h, w
	jp .end_extra_player
.farfetch_d_player
	hlcoord 6, 10, wAttrMap
	lb bc, 2, 2 ; h, w
	jp .end_extra_player
.bellossom_player
	hlcoord 2, 11, wAttrMap
	lb bc, 1, 6 ; h, w
	jp .end_extra_player
.butterfree_player
	hlcoord 6, 9, wAttrMap
	lb bc, 3, 2 ; h, w
	jp .end_extra_player
.slowking_player
	hlcoord 2, 11, wAttrMap
	lb bc, 1, 6 ; h, w
	jp .end_extra_player
.flaaffy_player
	hlcoord 2, 9, wAttrMap
	lb bc, 3, 2 ; h, w
	jp .end_extra_player
.ampharos_player
	hlcoord 2, 10, wAttrMap
	lb bc, 2, 2 ; h, w
	call FillPalette5
	hlcoord 12, 3, wAttrMap
	lb bc, 2, 2 ; h, w
	jp .end_extra_player
.bellsprout_player
	hlcoord 3, 6, wAttrMap
	lb bc, 4, 4 ; h, w
	jp .end_extra_player
.natu_player
	hlcoord 6, 9, wAttrMap
	lb bc, 2, 1 ; h, w
	jp .end_extra_player
.xatu_player
	hlcoord 6, 7, wAttrMap
	lb bc, 1, 2 ; h, w
	jp .end_extra_player
.ariados_player
	hlcoord 3, 10, wAttrMap
	lb bc, 2, 4 ; h, w
	call FillPalette5
	hlcoord 17, 4, wAttrMap
	lb bc, 1, 1 ; h, w
	jp .end_extra_player
.mr__mime_player
	hlcoord 2, 8, wAttrMap
	lb bc, 2, 6 ; h, w
	jp .end_extra_player
.sudowoodo_player
	hlcoord 4, 10, wAttrMap
	lb bc, 2, 2 ; h, w
	jp .end_extra_player
.kangaskhan_player
	hlcoord 6, 10, wAttrMap
	lb bc, 1, 2 ; h, w
	jp .end_extra_player
.ekans_player
	hlcoord 2, 9, wAttrMap
	lb bc, 3, 2 ; h, w
	call FillPalette5
	hlcoord 3, 8, wAttrMap
	lb bc, 1, 3 ; h, w
	call FillPalette5
	hlcoord 4, 7, wAttrMap
	lb bc, 1, 1 ; h, w
.feraligatr_player
	hlcoord 5, 9, wAttrMap
	lb bc, 2, 3 ; h, w
	jp .end_extra_player
.fearow_player
	hlcoord 2, 11, wAttrMap
	lb bc, 1, 6 ; h, w
	jp .end_extra_player
.magnemite_player
	hlcoord 3, 7, wAttrMap
	lb bc, 1, 1 ; h, w
	call FillPalette5
	hlcoord 6, 10, wAttrMap
	lb bc, 1, 1 ; h, w
	jp .end_extra_player
.magneton_player
	hlcoord 6, 6, wAttrMap
	lb bc, 2, 2 ; h, w
	call FillPalette5
	hlcoord 3, 7, wAttrMap
	lb bc, 1, 1 ; h, w
	call FillPalette5
	hlcoord 7, 10, wAttrMap
	lb bc, 1, 1 ; h, w
	call FillPalette5
	hlcoord 2, 9, wAttrMap
	lb bc, 1, 1 ; h, w
	jp .end_extra_player
.vaporeon_player
	hlcoord 2, 8, wAttrMap
	lb bc, 4, 4 ; h, w
	call FillPalette5
	hlcoord 6, 9, wAttrMap
	lb bc, 3, 2 ; h, w
	jp .end_extra_player
.noctowl_player
	hlcoord 2, 6, wAttrMap
	lb bc, 3, 6 ; h, w
	jp .end_extra_player
.pidgeotto_player
	hlcoord 2, 10, wAttrMap
	lb bc, 2, 2 ; h, w
	jp .end_extra_player
.pidgeot_player
	hlcoord 2, 6, wAttrMap
	lb bc, 2, 6 ; h, w
	jp .end_extra_player

.end_extra_player
	call FillPalette5

.skip_extra_player
	hlcoord 10, 0, wAttrMap
	lb bc, 7, 10
	ld a, PAL_BATTLE_BG_ENEMY
	call FillBoxCGB

	ld a, [wTempEnemyMonSpecies]
	and a
	jp nz, .skip_extra_trainer
	ld a, [wTrainerClass]
	cp CAMPER
	jp z, .camper
	cp PICNICKER
	jp z, .picnicker
	cp HIKER
	jp z, .hiker
	cp YOUNGSTER
	jp z, .youngster
	cp BUG_CATCHER
	jp z, .bug_catcher
	jp .skip_extra_trainer
.camper
	hlcoord 13, 3, wAttrMap	
	call inc_hl_twice
	lb bc, 1, 1 ; h, w
	call FillPalette6
	hlcoord 14, 5, wAttrMap	
	call inc_hl_twice
	lb bc, 2, 4 ; h, w
	call FillPalette2
	hlcoord 16, 3, wAttrMap	
	call inc_hl_twice
	lb bc, 1, 1 ; h, w	
	jp .end_extra_trainer
.picnicker
	hlcoord 15, 3, wAttrMap	
	call inc_hl_twice
	lb bc, 1, 2 ; h, w
	call FillPalette2
	hlcoord 14, 5, wAttrMap	
	call inc_hl_twice
	lb bc, 2, 3 ; h, w	
	jp .end_extra_trainer
.hiker
	hlcoord 13, 5, wAttrMap	
	call inc_hl_twice
	lb bc, 2, 5 ; h, w	
	call FillPalette6
	hlcoord 12, 2, wAttrMap	
	call inc_hl_twice
	lb bc, 1, 2 ; h, w	
	call FillPalette6
	hlcoord 16, 2, wAttrMap	
	call inc_hl_twice
	lb bc, 1, 2 ; h, w
	jp .end_extra_trainer
.youngster
	hlcoord 15, 3, wAttrMap	
	call inc_hl_twice
	lb bc, 2, 3 ; h, w	
	call FillPalette2
	hlcoord 15, 6, wAttrMap	; shoes
	call inc_hl_twice
	lb bc, 1, 3 ; h, w
	call FillPalette6
	hlcoord 13, 2, wAttrMap	; pokeball
	call inc_hl_twice
	lb bc, 2, 2 ; h, w	
	jp .end_extra_trainer
.bug_catcher
	hlcoord 12, 1, wAttrMap	
	call inc_hl_twice
	lb bc, 2, 7 ; h, w	
	call FillPalette2
	hlcoord 17, 3, wAttrMap	
	call inc_hl_twice
	lb bc, 2, 2 ; h, w	
	call FillPalette2
	hlcoord 16, 5, wAttrMap	
	call inc_hl_twice
	lb bc, 2, 2 ; h, w	
	call FillPalette2
	hlcoord 13, 5, wAttrMap	; pants
	call inc_hl_twice
	lb bc, 1, 2 ; h, w	
	jp .end_extra_trainer

.end_extra_trainer
	call FillPalette6

.skip_extra_trainer
; palette ex for enemy mon in battle
	ld d, PALETTE_POS_BATTLE
	ld e, $6 ; palette 6
	ld a, [wTempEnemyMonSpecies]
	call SetExtraPalette

	hlcoord 0, 0, wAttrMap
	lb bc, 4, 10
	ld a, PAL_BATTLE_BG_ENEMY_HP
	call FillBoxCGB
	; Enemy stamina bar
	hlcoord 3, 3, wAttrMap
	lb bc, 1, 7
	ld a, PAL_BATTLE_BG_EXP
	call FillBoxCGB
	; ; Move cost bars
	; hlcoord 3, 3, wAttrMap
	; lb bc, 1, 7
	; ld a, PAL_BATTLE_BG_EXP
	; call FillBoxCGB
	hlcoord 10, 7, wAttrMap
	lb bc, 5, 10
	ld a, PAL_BATTLE_BG_PLAYER_HP
	call FillBoxCGB
	hlcoord 10, 11, wAttrMap
	lb bc, 1, 9
	ld a, PAL_BATTLE_BG_EXP
	call FillBoxCGB
	hlcoord 0, 12, wAttrMap
	ld bc, 6 * SCREEN_WIDTH
	ld a, PAL_BATTLE_BG_TEXT
	call ByteFill
	ld hl, BattleObjectPals
	ld de, wOBPals1 palette PAL_BATTLE_OB_GRAY
	ld bc, 6 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	call ApplyAttrMap
	ret

inc_hl_twice:
; moves bg position twice right for when trainer slides from the side
	ld a, [wTempWildMonSpecies]
	and a
	ret z
	inc hl
	inc hl
	ret

FillPalette2:
; second trainer palette (replaces enemy HP)
	ld a, $2
	call FillBoxCGB
	ret

FillPalette5:
	ld a, $5
	call FillBoxCGB
	ret

FillPalette6:
	ld a, $6
	call FillBoxCGB
	ret

InitPartyMenuBGPal7:
	farcall Function100dc0
Mobile_InitPartyMenuBGPal7:
	ld hl, PartyMenuBGPalette
	jr nc, .not_mobile
	ld hl, PartyMenuBGMobilePalette
.not_mobile
	ld de, wBGPals1 palette 7
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ret

InitPartyMenuBGPal0:
	farcall Function100dc0
	ld hl, PartyMenuBGPalette
	jr nc, .not_mobile
	ld hl, PartyMenuBGMobilePalette
.not_mobile
	ld de, wBGPals1 palette 0
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ret

_CGB_PokegearPals:
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .male
	ld hl, FemalePokegearPals
	jr .got_pals

.male
	ld hl, MalePokegearPals
.got_pals
	ld a, [wTimeOfDay]
	cp DAY_F
	jr z, .got_time
	ld bc, PALETTE_SIZE * 6
	add hl, bc
.got_time
	ld de, wBGPals1
	ld bc, 6 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call ApplyPals
	
	ld hl, .NestPokegearPals
	ld de, wOBPals1 palette 1 ; 
	ld bc, 2 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	call ApplyAttrMap
	call ApplyPals

	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.NestPokegearPals:
INCLUDE "gfx/pokegear/pokegear_ob.pal"

_CGB_StatsScreenHPPals:
	ld de, wBGPals1
	ld a, [wCurHPPal]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	call LoadPalette_White_Col1_Col2_Black ; hp palette
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black ; mon palette
	ld hl, ExpBarPalette
	call LoadPalette_White_Col1_Col2_Black ; exp palette
	ld hl, StatsScreenPagePals
	ld de, wBGPals1 palette 3
	ld bc, 3 palettes ; pink, green, and blue page palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM

	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetExtraFrontpicPalettePointer
	call LoadPalette_White_Col1_Col2_Black ; mon extra palette

	call WipeAttrMap

	hlcoord 0, 0, wAttrMap
	lb bc, 7, SCREEN_WIDTH ; where the coloring starts
	ld a, $1 ; mon palette
	call FillBoxCGB

	ld a, [wCurPartySpecies]
	cp BULBASAUR
	jp z, .bulbasaur
	cp IVYSAUR
	jp z, .ivysaur
	cp VENUSAUR
	jp z, .venusaur
	cp TENTACOOL
	jp z, .tentacool
	cp TENTACRUEL
	jp z, .tentacruel
	cp STARYU
	jp z, .staryu
	cp STARMIE
	jp z, .starmie
	cp FARFETCH_D
	jp z, .farfetch_d
	cp BELLOSSOM
	jp z, .bellossom
	cp BUTTERFREE
	jp z, .butterfree
	cp GYARADOS
	jp z, .gyarados
	cp SLOWKING
	jp z, .slowking
	cp PRIMEAPE
	jp z, .primeape
	cp MACHOP
	jp z, .machop
	cp FLAAFFY
	jp z, .flaaffy
	cp AMPHAROS
	jp z, .ampharos
	cp BELLSPROUT
	jp z, .bellsprout
	cp NATU
	jp z, .natu
	cp XATU
	jp z, .xatu
	cp SPINARAK
	jp z, .spinarak
	cp ARIADOS
	jp z, .ariados
	cp MR__MIME
	jp z, .mr__mime
	cp SUDOWOODO
	jp z, .sudowoodo
	cp KANGASKHAN
	jp z, .kangaskhan
	cp TANGELA
	jp z, .tangela
	cp EKANS
	jp z, .ekans
	cp FERALIGATR
	jp z, .feraligatr
	cp DODRIO
	jp z, .dodrio
	cp FEAROW
	jp z, .fearow
	cp MAGNEMITE
	jp z, .magnemite
	cp MAGNETON
	jp z, .magneton	
	cp VAPOREON
	jp z, .vaporeon
	cp HOOTHOOT
	jp z, .hoothoot
	cp NOCTOWL
	jp z, .noctowl
	cp PIDGEOTTO
	jp z, .pidgeotto
	cp PIDGEOT
	jp z, .pidgeot
	
	jp .skip_extra
.bulbasaur
	hlcoord 15, 4, wAttrMap
	lb bc, 2, 3 ; h , w
	jp .end_extra
.ivysaur
	hlcoord 12, 3, wAttrMap
	lb bc, 1, 2 ; h , w
	call FillStatsBoxExtraPalette
	hlcoord 16, 3, wAttrMap
	lb bc, 2, 2 ; h , w
	jp .end_extra
.venusaur
	hlcoord 12, 3, wAttrMap
	lb bc, 1, 7 ; h , w
	call FillStatsBoxExtraPalette
	hlcoord 12, 4, wAttrMap
	lb bc, 1, 2 ; h , w
	call FillStatsBoxExtraPalette
	hlcoord 16, 4, wAttrMap
	lb bc, 1, 2 ; h , w
	jp .end_extra
.tentacool
	hlcoord 13, 5, wAttrMap
	lb bc, 2, 5 ; h , w
	jp .end_extra
.tentacruel
	hlcoord 12, 4, wAttrMap
	lb bc, 3, 6 ; h , w
	jp .end_extra
.staryu
	hlcoord 15, 3, wAttrMap
	lb bc, 2, 1 ; h , w
	jp .end_extra
.starmie
	hlcoord 14, 3, wAttrMap
	lb bc, 2, 2 ; h , w
	jp .end_extra
.farfetch_d
	hlcoord 12, 3, wAttrMap
	lb bc, 1, 3 ; h , w
	call FillStatsBoxExtraPalette
	hlcoord 12, 4, wAttrMap
	lb bc, 1, 2 ; h , w
	call FillStatsBoxExtraPalette
	hlcoord 16, 5, wAttrMap
	lb bc, 2, 2 ; h , w
	call FillStatsBoxExtraPalette
	hlcoord 12, 6, wAttrMap
	lb bc, 1, 3 ; h , w
	jp .end_extra
.bellossom
	hlcoord 13, 4, wAttrMap
	lb bc, 3, 5 ; h , w
	jp .end_extra
.butterfree
	hlcoord 15, 4, wAttrMap
	lb bc, 2, 4 ; h, w
	jp .end_extra
.gyarados
	hlcoord 16, 4, wAttrMap
	lb bc, 2, 1 ; h, w
	jp .end_extra
.slowking
	hlcoord 12, 4, wAttrMap
	lb bc, 1, 6 ; h, w
	jp .end_extra
.primeape
	hlcoord 15, 2, wAttrMap
	lb bc, 2, 2 ; h, w
	jp .end_extra
.machop
	hlcoord 14, 2, wAttrMap
	lb bc, 1, 3 ; h, w
	jp .end_extra
.flaaffy
	hlcoord 12, 2, wAttrMap
	lb bc, 4, 2 ; h, w
	jp .end_extra
.ampharos
	hlcoord 14, 0, wAttrMap
	lb bc, 1, 1 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 17, 3, wAttrMap
	lb bc, 2, 2 ; h, w
	jp .end_extra
.bellsprout
	hlcoord 15, 2, wAttrMap
	lb bc, 3, 3 ; h, w
	jp .end_extra
.natu
	hlcoord 15, 4, wAttrMap
	lb bc, 2, 3 ; h, w
	jp .end_extra
.xatu
	hlcoord 15, 1, wAttrMap
	lb bc, 2, 2 ; h, w
	jp .end_extra
.spinarak
	hlcoord 15, 6, wAttrMap
	lb bc, 1, 2 ; h, w
	jp .end_extra
.ariados
	hlcoord 14, 3, wAttrMap
	lb bc, 3, 3 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 13, 4, wAttrMap
	lb bc, 1, 1 ; h, w
	jp .end_extra
.mr__mime
	hlcoord 12, 1, wAttrMap
	lb bc, 1, 6 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 12, 6, wAttrMap
	lb bc, 1, 6 ; h, w
	jp .end_extra
.sudowoodo
	hlcoord 14, 4, wAttrMap
	lb bc, 3, 3 ; h, w
	jp .end_extra
.kangaskhan
	hlcoord 15, 4, wAttrMap
	lb bc, 1, 2 ; h, w
	jp .end_extra
.tangela
	hlcoord 13, 3, wAttrMap
	lb bc, 2, 2 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 14, 5, wAttrMap
	lb bc, 2, 2 ; h, w
	jp .end_extra
.ekans
	hlcoord 13, 3, wAttrMap
	lb bc, 2, 3 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 13, 6, wAttrMap
	lb bc, 1, 5 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 17, 5, wAttrMap
	lb bc, 1, 1 ; h, w
	jp .end_extra
.feraligatr
	hlcoord 16, 2, wAttrMap
	lb bc, 3, 3 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 14, 4, wAttrMap
	lb bc, 2, 3 ; h, w
	jp .end_extra
.dodrio
	hlcoord 12, 2, wAttrMap
	lb bc, 2, 2 ; h, w
	jp .end_extra
.fearow
	hlcoord 12, 0, wAttrMap
	lb bc, 1, 6 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 12, 1, wAttrMap
	lb bc, 2, 5 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 17, 4, wAttrMap
	lb bc, 2, 1 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 12, 3, wAttrMap
	lb bc, 4, 2 ; h, w
	jp .end_extra
.magnemite
	hlcoord 13, 3, wAttrMap
	lb bc, 1, 2 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 16, 5, wAttrMap
	lb bc, 1, 1 ; h, w
	jp .end_extra
.magneton
	hlcoord 12, 1, wAttrMap
	lb bc, 1, 1 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 14, 2, wAttrMap
	lb bc, 1, 1 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 17, 1, wAttrMap
	lb bc, 1, 1 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 17, 5, wAttrMap
	lb bc, 1, 1 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 12, 5, wAttrMap
	lb bc, 2, 1 ; h, w
	jp .end_extra
.vaporeon
	hlcoord 12, 1, wAttrMap
	lb bc, 2, 6 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 14, 5, wAttrMap
	lb bc, 2, 3 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 12, 6, wAttrMap
	lb bc, 1, 6 ; h, w
	jp .end_extra
.hoothoot
	hlcoord 14, 3, wAttrMap
	lb bc, 2, 3 ; h, w
	jp .end_extra
.noctowl
	hlcoord 13, 0, wAttrMap
	lb bc, 3, 5 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 14, 6, wAttrMap
	lb bc, 1, 3 ; h, w
	jp .end_extra
.pidgeotto
	hlcoord 12, 1, wAttrMap
	lb bc, 2, 2 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 12, 3, wAttrMap
	lb bc, 1, 1 ; h, w
	jp .end_extra
.pidgeot
	hlcoord 13, 0, wAttrMap
	lb bc, 2, 5 ; h, w
	call FillStatsBoxExtraPalette
	hlcoord 13, 2, wAttrMap
	lb bc, 1, 2 ; h, w
	jp .end_extra

.end_extra
	call FillStatsBoxExtraPalette
.skip_extra

	hlcoord 1, 9, wAttrMap
	ld bc, 10
	ld a, $2 ; exp palette
	call ByteFill

	hlcoord 1, 10, wAttrMap
	lb bc, 7, 3
	ld a, $2 ; exp palette
	call FillBoxCGB

	hlcoord 2, 5, wAttrMap
	lb bc, 2, 2
	ld a, $3 ; pink page palette
	call FillBoxCGB

	hlcoord 4, 5, wAttrMap
	lb bc, 2, 2
	ld a, $4 ; green page palette
	call FillBoxCGB	

	hlcoord 6, 5, wAttrMap
	lb bc, 2, 2
	ld a, $5 ; blue page palette
	call FillBoxCGB

	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

StatsScreenPagePals:
INCLUDE "gfx/stats/pages.pal"

StatsScreenPals:
INCLUDE "gfx/stats/stats.pal"

FillStatsBoxExtraPalette:
	ld a, $6
	call FillBoxCGB	
	ret

_CGB_Pokedex:
	ld de, wBGPals1
	ld a, PREDEFPAL_POKEDEX
	call GetPredefPal
	call LoadHLPaletteIntoDE ; dex interface palette
	ld a, [wCurPartySpecies]
	cp $ff
	jr nz, .is_pokemon
	ld hl, .PokedexQuestionMarkPalette
	push hl
	call LoadHLPaletteIntoDE ; green question mark palette
	pop hl
	call LoadHLPaletteIntoDE ; green question mark palette into palette 2
	jr .got_palette

.is_pokemon
	call GetMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black ; mon palette
	call GetExtraMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black ; mon extra palette
.got_palette
	call WipeAttrMap
	hlcoord 1, 1, wAttrMap
	lb bc, 7, 7
	ld a, $1 ; green question mark palette
	call FillBoxCGB

	ld d, PALETTE_POS_DEX
	ld e, $2 ; palette 2
	ld a, [wCurPartySpecies]
	call SetExtraPalette

	call InitPartyMenuOBPals
	ld hl, .PokedexCursorPalette
	ld de, wOBPals1 palette 7 ; green cursor palette
	ld bc, 1 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.PokedexQuestionMarkPalette:
INCLUDE "gfx/pokedex/question_mark.pal"

.PokedexCursorPalette:
INCLUDE "gfx/pokedex/cursor.pal"

SetExtraPalette:
	cp BULBASAUR
	jp z, .bulbasaur
	cp IVYSAUR
	jp z, .ivysaur
	cp VENUSAUR
	jp z, .venusaur
	cp TENTACOOL
	jp z, .tentacool
	cp TENTACRUEL
	jp z, .tentacruel
	cp STARYU
	jp z, .staryu
	cp STARMIE
	jp z, .starmie
	cp FARFETCH_D
	jp z, .farfetch_d
	cp BELLOSSOM
	jp z, .bellossom
	cp BUTTERFREE
	jp z, .butterfree
	cp GYARADOS
	jp z, .gyarados
	cp SLOWKING
	jp z, .slowking
	cp PRIMEAPE
	jp z, .primeape
	cp MACHOP
	jp z, .machop
	cp FLAAFFY
	jp z, .flaaffy
	cp AMPHAROS
	jp z, .ampharos
	cp BELLSPROUT
	jp z, .bellsprout
	cp NATU
	jp z, .natu
	cp XATU
	jp z, .xatu
	cp SPINARAK
	jp z, .spinarak
	cp ARIADOS
	jp z, .ariados
	cp MR__MIME
	jp z, .mr__mime
	cp SUDOWOODO
	jp z, .sudowoodo
	cp KANGASKHAN
	jp z, .kangaskhan
	cp TANGELA
	jp z, .tangela
	cp EKANS
	jp z, .ekans
	cp FERALIGATR
	jp z, .feraligatr
	cp DODRIO
	jp z, .dodrio
	cp FEAROW
	jp z, .fearow
	cp MAGNEMITE
	jp z, .magnemite
	cp MAGNETON
	jp z, .magneton
	cp VAPOREON
	jp z, .vaporeon
	cp HOOTHOOT
	jp z, .hoothoot
	cp NOCTOWL
	jp z, .noctowl
	cp PIDGEOTTO
	jp z, .pidgeotto
	cp PIDGEOT
	jp z, .pidgeot
	ret
.bulbasaur
	hlcoord 2, 5, wAttrMap
	lb bc, 2, 3
	jp .end_extra
.ivysaur
	hlcoord 2, 4, wAttrMap
	lb bc, 2, 2
	call FillBoxExtraPalette
	hlcoord 6, 4, wAttrMap
	lb bc, 1, 2
	jp .end_extra
.venusaur
	hlcoord 1, 4, wAttrMap
	lb bc, 1, 7
	call FillBoxExtraPalette
	hlcoord 2, 5, wAttrMap
	lb bc, 1, 2
	call FillBoxExtraPalette
	hlcoord 6, 5, wAttrMap
	lb bc, 1, 2
	jp .end_extra
.tentacool
	hlcoord 2, 6, wAttrMap
	lb bc, 2, 5
	jp .end_extra
.tentacruel
	hlcoord 2, 5, wAttrMap
	lb bc, 3, 6 ; h , w
	jp .end_extra
.staryu
	hlcoord 4, 4, wAttrMap
	lb bc, 2, 1 ; h , w
	jp .end_extra
.starmie
	hlcoord 4, 4, wAttrMap
	lb bc, 2, 2 ; h , w
	jp .end_extra
.farfetch_d
	hlcoord 5, 4, wAttrMap
	lb bc, 1, 3 ; h , w
	call FillBoxExtraPalette
	hlcoord 6, 5, wAttrMap
	lb bc, 1, 2 ; h , w
	call FillBoxExtraPalette
	hlcoord 2, 6, wAttrMap
	lb bc, 2, 2 ; h , w
	call FillBoxExtraPalette
	hlcoord 5, 7, wAttrMap
	lb bc, 1, 3 ; h , w
	jp .end_extra
.bellossom
	hlcoord 2, 5, wAttrMap
	lb bc, 3, 5 ; h , w
	jp .end_extra
.butterfree
	hlcoord 1, 5, wAttrMap
	lb bc, 2, 4 ; h, w
	jp .end_extra
.gyarados
	hlcoord 3, 5, wAttrMap
	lb bc, 2, 1 ; h, w
	jp .end_extra
.slowking
	hlcoord 2, 5, wAttrMap
	lb bc, 1, 6 ; h, w
	jp .end_extra
.primeape
	hlcoord 3, 3, wAttrMap
	lb bc, 2, 2 ; h, w
	jp .end_extra
.machop
	hlcoord 3, 3, wAttrMap
	lb bc, 1, 3 ; h, w
	jp .end_extra
.flaaffy
	hlcoord 6, 3, wAttrMap
	lb bc, 4, 2 ; h, w
	jp .end_extra
.ampharos
	hlcoord 5, 1, wAttrMap
	lb bc, 1, 1 ; h, w
	call FillBoxExtraPalette
	hlcoord 1, 4, wAttrMap
	lb bc, 2, 2 ; h, w
	jp .end_extra
.bellsprout
	hlcoord 2, 3, wAttrMap
	lb bc, 3, 3 ; h, w
	jp .end_extra
.natu
	hlcoord 2, 5, wAttrMap
	lb bc, 2, 3 ; h, w
	jp .end_extra
.xatu
	hlcoord 3, 2, wAttrMap
	lb bc, 2, 2 ; h, w
	jp .end_extra
.spinarak
	hlcoord 3, 7, wAttrMap
	lb bc, 1, 2 ; h, w
	jp .end_extra
.ariados
	hlcoord 3, 4, wAttrMap
	lb bc, 3, 3 ; h, w
	call FillBoxExtraPalette
	hlcoord 6, 5, wAttrMap
	lb bc, 1, 1 ; h, w
	jp .end_extra
.mr__mime
	hlcoord 2, 2, wAttrMap
	lb bc, 1, 6 ; h, w
	call FillBoxExtraPalette
	hlcoord 2, 7, wAttrMap
	lb bc, 1, 6 ; h, w
	jp .end_extra
.sudowoodo
	hlcoord 3, 4, wAttrMap
	lb bc, 3, 3 ; h, w
	jp .end_extra
.kangaskhan
	hlcoord 3, 5, wAttrMap
	lb bc, 1, 2 ; h, w
	jp .end_extra
.tangela
	hlcoord 5, 4, wAttrMap
	lb bc, 2, 2 ; h, w
	call FillBoxExtraPalette
	hlcoord 4, 6, wAttrMap
	lb bc, 2, 2 ; h, w
	jp .end_extra
.ekans
	hlcoord 4, 4, wAttrMap
	lb bc, 2, 3 ; h, w
	call FillBoxExtraPalette
	hlcoord 2, 6, wAttrMap
	lb bc, 1, 1 ; h, w
	call FillBoxExtraPalette
	hlcoord 2, 7, wAttrMap
	lb bc, 1, 5 ; h, w
	jp .end_extra
.feraligatr
	hlcoord 1, 3, wAttrMap
	lb bc, 3, 3 ; h, w
	call FillBoxExtraPalette
	hlcoord 3, 5, wAttrMap
	lb bc, 2, 3 ; h, w
	jp .end_extra
.dodrio
	hlcoord 6, 3, wAttrMap
	lb bc, 2, 2 ; h, w
	jp .end_extra
.fearow
	hlcoord 2, 1, wAttrMap
	lb bc, 1, 6 ; h, w
	call FillBoxExtraPalette
	hlcoord 3, 2, wAttrMap
	lb bc, 2, 5 ; h, w
	call FillBoxExtraPalette
	hlcoord 2, 5, wAttrMap
	lb bc, 2, 1 ; h, w
	call FillBoxExtraPalette
	hlcoord 6, 4, wAttrMap
	lb bc, 4, 2 ; h, w
	jp .end_extra
.magnemite
	hlcoord 3, 6, wAttrMap
	lb bc, 1, 1 ; h, w
	call FillBoxExtraPalette
	hlcoord 5, 4, wAttrMap
	lb bc, 1, 2 ; h, w
	jp .end_extra
.magneton
	hlcoord 2, 2, wAttrMap
	lb bc, 1, 1 ; h, w
	call FillBoxExtraPalette
	hlcoord 7, 2, wAttrMap
	lb bc, 1, 1 ; h, w
	call FillBoxExtraPalette
	hlcoord 5, 3, wAttrMap
	lb bc, 1, 1 ; h, w
	call FillBoxExtraPalette
	hlcoord 2, 6, wAttrMap
	lb bc, 1, 1 ; h, w
	call FillBoxExtraPalette
	hlcoord 7, 6, wAttrMap
	lb bc, 2, 1 ; h, w
	jp .end_extra
.vaporeon
	hlcoord 2, 2, wAttrMap
	lb bc, 2, 6 ; h, w
	call FillBoxExtraPalette
	hlcoord 2, 6, wAttrMap
	lb bc, 2, 4 ; h, w
	call FillBoxExtraPalette
	hlcoord 2, 7, wAttrMap
	lb bc, 1, 6 ; h, w
	jp .end_extra
.hoothoot
	hlcoord 3, 4, wAttrMap
	lb bc, 2, 3 ; h, w
	jp .end_extra
.noctowl
	hlcoord 2, 1, wAttrMap
	lb bc, 3, 5 ; h, w
	call FillBoxExtraPalette
	hlcoord 3, 7, wAttrMap
	lb bc, 1, 3 ; h, w
	jp .end_extra
.pidgeotto
	hlcoord 6, 2, wAttrMap
	lb bc, 2, 2 ; h, w
	call FillBoxExtraPalette
	hlcoord 7, 4, wAttrMap
	lb bc, 1, 1 ; h, w
	jp .end_extra
.pidgeot
	hlcoord 2, 1, wAttrMap
	lb bc, 2, 5 ; h, w
	jp .end_extra
.end_extra
	call FillBoxExtraPalette
	ret

FillBoxExtraPalette:
	call IncreasePosition
	ld a, e
	call FillBoxCGB	
	ret

IncreasePosition:
	ld a, d
	cp PALETTE_POS_DEX
	jr z, .end
	cp PALETTE_POS_BATTLE
	jr z, .battle
;stats
	ret
.battle
	push bc
	ld b, $ff
	ld c, $f7
	add hl, bc
	pop bc
.end
	ret

_CGB_BillsPC:
	ld de, wBGPals1
	ld a, PREDEFPAL_POKEDEX
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, [wCurPartySpecies]
	cp $ff
	jr nz, .GetMonPalette
	ld hl, .BillsPCOrangePalette
	call LoadHLPaletteIntoDE
	jr .Resume

.GetMonPalette:
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
.Resume:
	call WipeAttrMap
	hlcoord 1, 4, wAttrMap
	lb bc, 7, 7
	ld a, $1
	call FillBoxCGB
	call InitPartyMenuOBPals
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

; .Function9009:
; 	ld hl, .BillsPCOrangePalette
; 	call LoadHLPaletteIntoDE
; 	jr .asm_901a

; .unused
; 	ld bc, wTempMonDVs
; 	call GetPlayerOrMonPalettePointer
; 	call LoadPalette_White_Col1_Col2_Black
; .asm_901a
; 	call WipeAttrMap
; 	hlcoord 1, 1, wAttrMap
; 	lb bc, 7, 7
; 	ld a, $1
; 	call FillBoxCGB
; 	call InitPartyMenuOBPals
; 	call ApplyAttrMap
; 	call ApplyPals
; 	ld a, $1
; 	ldh [hCGBPalUpdate], a
; 	ret

.BillsPCOrangePalette:
INCLUDE "gfx/pc/orange.pal"

_CGB_PokedexUnownMode:
	ld de, wBGPals1
	ld a, PREDEFPAL_POKEDEX
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, [wCurPartySpecies]
	call GetMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrMap
	hlcoord 7, 5, wAttrMap
	lb bc, 7, 7
	ld a, $1
	call FillBoxCGB
	call InitPartyMenuOBPals
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_SlotMachine:
	ld hl, SlotMachinePals
	ld de, wBGPals1
	ld bc, 16 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call WipeAttrMap
	hlcoord 0, 2, wAttrMap
	lb bc, 10, 3
	ld a, $2
	call FillBoxCGB
	hlcoord 17, 2, wAttrMap
	lb bc, 10, 3
	ld a, $2
	call FillBoxCGB
	hlcoord 0, 4, wAttrMap
	lb bc, 6, 3
	ld a, $3
	call FillBoxCGB
	hlcoord 17, 4, wAttrMap
	lb bc, 6, 3
	ld a, $3
	call FillBoxCGB
	hlcoord 0, 6, wAttrMap
	lb bc, 2, 3
	ld a, $4
	call FillBoxCGB
	hlcoord 17, 6, wAttrMap
	lb bc, 2, 3
	ld a, $4
	call FillBoxCGB
	hlcoord 4, 2, wAttrMap
	lb bc, 2, 12
	ld a, $1
	call FillBoxCGB
	hlcoord 3, 2, wAttrMap
	lb bc, 10, 1
	ld a, $1
	call FillBoxCGB
	hlcoord 16, 2, wAttrMap
	lb bc, 10, 1
	ld a, $1
	call FillBoxCGB
	hlcoord 0, 12, wAttrMap
	ld bc, $78
	ld a, $7
	call ByteFill
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_BetaTitleScreen:
	ld hl, PalPacket_BetaTitleScreen + 1
	call CopyFourPalettes
	call WipeAttrMap
	ld de, wOBPals1
	ld a, PREDEFPAL_PACK
	call GetPredefPal
	call LoadHLPaletteIntoDE
	hlcoord 0, 6, wAttrMap
	lb bc, 12, SCREEN_WIDTH
	ld a, $1
	call FillBoxCGB
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_GSIntro:
	ld b, 0
	ld hl, .Jumptable
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw .ShellderLaprasScene
	dw .JigglypuffPikachuScene
	dw .StartersCharizardScene

.ShellderLaprasScene:
	ld hl, .ShellderLaprasBGPalette
	ld de, wBGPals1
	call LoadHLPaletteIntoDE
	ld hl, .ShellderLaprasOBPals
	ld de, wOBPals1
	ld bc, 2 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	call WipeAttrMap
	ret

.ShellderLaprasBGPalette:
	RGB 19, 31, 19
	RGB 18, 23, 31
	RGB 11, 21, 28
	RGB 04, 16, 24

.ShellderLaprasOBPals:
	RGB 29, 29, 29
	RGB 20, 19, 20
	RGB 19, 06, 04
	RGB 03, 04, 06

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 00, 00
	RGB 03, 04, 06

.JigglypuffPikachuScene:
	ld de, wBGPals1
	ld a, PREDEFPAL_GS_INTRO_JIGGLYPUFF_PIKACHU_BG
	call GetPredefPal
	call LoadHLPaletteIntoDE

	ld de, wOBPals1
	ld a, PREDEFPAL_GS_INTRO_JIGGLYPUFF_PIKACHU_OB
	call GetPredefPal
	call LoadHLPaletteIntoDE
	call WipeAttrMap
	ret

.StartersCharizardScene:
	ld hl, PalPacket_Pack + 1
	call CopyFourPalettes
	ld de, wOBPals1
	ld a, PREDEFPAL_GS_INTRO_STARTERS_TRANSITION
	call GetPredefPal
	call LoadHLPaletteIntoDE
	call WipeAttrMap
	ret

_CGB_BetaPoker:
	ld hl, BetaPokerPals
	ld de, wBGPals1
	ld bc, 5 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call ApplyPals
	call WipeAttrMap
	call ApplyAttrMap
	ret

_CGB_Diploma:
	ld hl, DiplomaPalettes
	ld de, wBGPals1
	ld bc, 16 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM

	ld hl, PalPacket_Diploma + 1
	call CopyFourPalettes
	call WipeAttrMap
	call ApplyAttrMap
	ret

_CGB_MapPals:
	call LoadMapPals
	ld a, SCGB_MAPPALS
	ld [wSGBPredef], a
	ret

_CGB_PartyMenu:
	ld hl, PalPacket_PartyMenu + 1
	call CopyFourPalettes
	call InitPartyMenuBGPal0
	call InitPartyMenuBGPal7
	call InitPartyMenuOBPals
	call ApplyAttrMap
	ret

_CGB_Evolution:
	ld de, wBGPals1
	ld a, c
	and a
	jr z, .pokemon
	ld a, PREDEFPAL_BLACKOUT
	call GetPredefPal
	call LoadHLPaletteIntoDE
	jr .got_palette

.pokemon
	ld hl, wPartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld c, l
	ld b, h
	ld a, [wPlayerHPPal]
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld hl, BattleObjectPals
	ld de, wOBPals1 palette PAL_BATTLE_OB_GRAY
	ld bc, 6 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM

.got_palette
	call WipeAttrMap
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_GSTitleScreen:
	; ld hl, UnusedGSTitleBGPals
	ld de, wBGPals1
	ld bc, 5 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	; ld hl, UnusedGSTitleOBPals
	ld de, wOBPals1
	ld bc, 2 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	ld a, SCGB_DIPLOMA
	ld [wSGBPredef], a
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB0d:
	ld hl, PalPacket_Diploma + 1
	call CopyFourPalettes
	call WipeAttrMap
	call ApplyAttrMap
	ret

_CGB_UnownPuzzle:
	ld hl, PalPacket_UnownPuzzle + 1
	call CopyFourPalettes
	ld de, wOBPals1
	ld a, PREDEFPAL_UNOWN_PUZZLE
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rSVBK], a
	ld hl, wOBPals1
	ld a, LOW(palred 31 + palgreen 0 + palblue 0)
	ld [hli], a
	ld a, HIGH(palred 31 + palgreen 0 + palblue 0)
	ld [hl], a
	pop af
	ldh [rSVBK], a
	call WipeAttrMap
	call ApplyAttrMap
	ret

_CGB_TrainerCard:
	ld de, wBGPals1
	xor a ; CHRIS
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, FALKNER ; KRIS
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld hl, .TrainerCardPalettes
	ld bc, 2 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	ld a, $0
	; call GetTrainerPalettePointer
	; call LoadPalette_White_Col1_Col2_Black
	call GetPredefPal
	call LoadHLPaletteIntoDE

	ld de, wOBPals1
	ld hl, .BadgePalettes
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM

	; fill screen with opposite-gender palette for the card border
	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, [wPlayerGender]
	and a
	ld a, $2
	; ld a, $1 ; kris
	; jr z, .got_gender
	; ld a, $0 ; chris
.got_gender
	call ByteFill
	; fill trainer sprite area with same-gender palette
	hlcoord 14, 1, wAttrMap
	lb bc, 7, 5
	ld a, [wPlayerGender]
	and a
	ld a, $0 ; chris
	jr z, .got_gender2
	ld a, $1 ; kris
.got_gender2
	call FillBoxCGB
	; top-right corner still uses the border's palette
	hlcoord 18, 1, wAttrMap
	ld [hl], $1
	hlcoord 2, 10, wAttrMap
	lb bc, 7, 17
	ld a, $3
	call FillBoxCGB
	; hlcoord 2, 11, wAttrMap
	; lb bc, 2, 4
	; ld a, $1 ; falkner
	; call FillBoxCGB
	; hlcoord 6, 11, wAttrMap
	; lb bc, 2, 4
	; ld a, $2 ; bugsy
	; call FillBoxCGB
	; hlcoord 10, 11, wAttrMap
	; lb bc, 2, 4
	; ld a, $3 ; whitney
	; call FillBoxCGB
	; hlcoord 14, 11, wAttrMap
	; lb bc, 2, 4
	; ld a, $4 ; morty
	; call FillBoxCGB
	; hlcoord 2, 14, wAttrMap
	; lb bc, 2, 4
	; ld a, $5 ; chuck
	; call FillBoxCGB
	; hlcoord 6, 14, wAttrMap
	; lb bc, 2, 4
	; ld a, $6 ; jasmine
	; call FillBoxCGB
	; hlcoord 10, 14, wAttrMap
	; lb bc, 2, 4
	; ld a, $7 ; pryce
	; call FillBoxCGB
	; ; clair uses kris's palette
	; ld a, [wPlayerGender]
	; and a
	; push af
	; jr z, .got_gender3
	; hlcoord 14, 14, wAttrMap
	; lb bc, 2, 4
	; ld a, $1
	; call FillBoxCGB
.got_gender3
	pop af
	ld c, $0
	jr nz, .got_gender4
	inc c
.got_gender4
	ld a, c
	hlcoord 18, 1, wAttrMap
	ld [hl], a
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.TrainerCardPalettes:
	INCLUDE "gfx/trainer_card/trainerCardPal.pal"

.BadgePalettes:
	INCLUDE "gfx/trainer_card/badges.pal"
	
_CGB_MoveList:
	ld de, wBGPals1
	ld a, PREDEFPAL_GOLDENROD
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, [wPlayerHPPal]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrMap
	hlcoord 11, 1, wAttrMap
	lb bc, 2, 9
	ld a, $1
	call FillBoxCGB
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_BetaPikachuMinigame:
	ld hl, PalPacket_BetaPikachuMinigame + 1
	call CopyFourPalettes
	call WipeAttrMap
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_PokedexSearchOption:
	ld de, wBGPals1
	ld a, PREDEFPAL_POKEDEX
	call GetPredefPal
	call LoadHLPaletteIntoDE
	call WipeAttrMap
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_PackPals:
; pack pals
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .tutorial_male

	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .tutorial_male

	ld hl, .KrisPackPals
	jr .got_gender

.tutorial_male
	ld hl, .ChrisPackPals

.got_gender
	ld de, wBGPals1
	ld bc, 8 palettes ; 6 palettes?
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call WipeAttrMap
	hlcoord 0, 0, wAttrMap
	lb bc, 1, 10
	ld a, $1
	call FillBoxCGB
	hlcoord 10, 0, wAttrMap
	lb bc, 1, 10
	ld a, $2
	call FillBoxCGB
	hlcoord 7, 2, wAttrMap
	lb bc, 9, 1
	ld a, $3
	call FillBoxCGB
	hlcoord 0, 7, wAttrMap
	lb bc, 3, 5
	ld a, $4
	call FillBoxCGB
	hlcoord 0, 3, wAttrMap
	lb bc, 3, 5
	ld a, $5
	call FillBoxCGB
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.ChrisPackPals:
INCLUDE "gfx/pack/pack.pal"

.KrisPackPals:
INCLUDE "gfx/pack/pack_f.pal"

_CGB_Pokepic:
	call _CGB_MapPals
	ld de, SCREEN_WIDTH
	hlcoord 0, 0, wAttrMap
	ld a, [wMenuBorderTopCoord]
.loop
	and a
	jr z, .found_top
	dec a
	add hl, de
	jr .loop

.found_top
	ld a, [wMenuBorderLeftCoord]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [wMenuBorderTopCoord]
	ld b, a
	ld a, [wMenuBorderBottomCoord]
	inc a
	sub b
	ld b, a
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	ld a, [wMenuBorderRightCoord]
	sub c
	inc a
	ld c, a
	ld a, $0
	call FillBoxCGB
	call ApplyAttrMap
	ret

_CGB_MagnetTrain:
	ld hl, PalPacket_MagnetTrain + 1
	call CopyFourPalettes
	call WipeAttrMap
	hlcoord 0, 4, wAttrMap
	lb bc, 10, SCREEN_WIDTH
	ld a, $2
	call FillBoxCGB
	hlcoord 0, 6, wAttrMap
	lb bc, 6, SCREEN_WIDTH
	ld a, $1
	call FillBoxCGB
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_GamefreakLogo:
	ld de, wBGPals1
	ld a, PREDEFPAL_GAMEFREAK_LOGO_BG
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld hl, .Palette
	ld de, wOBPals1
	call LoadHLPaletteIntoDE
	ld hl, .Palette
	ld de, wOBPals1 palette 1
	call LoadHLPaletteIntoDE
	call WipeAttrMap
	call ApplyAttrMap
	call ApplyPals
	ret

.Palette:
INCLUDE "gfx/splash/logo.pal"

_CGB_PlayerOrMonFrontpicPals:
	ld de, wBGPals1
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrMap
	call ApplyAttrMap
	call ApplyPals
	ret

_CGB1e:
	ld de, wBGPals1
	ld a, [wCurPartySpecies]
	call GetMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrMap
	call ApplyAttrMap
	ret

_CGB_TradeTube:
	ld hl, PalPacket_TradeTube + 1
	call CopyFourPalettes
	ld hl, PartyMenuOBPals
	ld de, wOBPals1
	ld bc, 1 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	ld de, wOBPals1 palette 7
	ld a, PREDEFPAL_TRADE_TUBE
	call GetPredefPal
	call LoadHLPaletteIntoDE
	call WipeAttrMap
	ret

_CGB_TrainerOrMonFrontpicPals:
	ld de, wBGPals1
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetFrontpicPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrMap
	call ApplyAttrMap
	call ApplyPals
	ret

_CGB_MysteryGift:
	ld hl, .Palettes
	ld de, wBGPals1
	ld bc, 2 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call ApplyPals
	call WipeAttrMap
	hlcoord 3, 7, wAttrMap
	lb bc, 8, 14
	ld a, $1
	call FillBoxCGB
	hlcoord 1, 5, wAttrMap
	lb bc, 1, 18
	ld a, $1
	call FillBoxCGB
	hlcoord 1, 16, wAttrMap
	lb bc, 1, 18
	ld a, $1
	call FillBoxCGB
	hlcoord 0, 0, wAttrMap
	lb bc, 17, 2
	ld a, $1
	call FillBoxCGB
	hlcoord 18, 5, wAttrMap
	lb bc, 12, 1
	ld a, $1
	call FillBoxCGB
	call ApplyAttrMap
	ret

.Palettes:
INCLUDE "gfx/mystery_gift/mystery_gift.pal"
