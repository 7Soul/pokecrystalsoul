INCLUDE "gfx/font.asm"

_LoadStandardFont::
	ld de, Font
	ld hl, vTiles1
	lb bc, BANK(Font), 32 ; "A" to "]"
	call Get1bpp_2
	ld de, Font + 32 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $20
	lb bc, BANK(Font), 26 ; "a" to "z" (skip "┌" to "┘")
	call Get1bpp_2
	ld de, Font + 64 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $40
	lb bc, BANK(Font), 32 ; $c0 to "←"
	call Get1bpp_2
	ld de, Font + 96 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $60
	lb bc, BANK(Font), 32 ; "'" to "9"
	call Get1bpp_2
	ret

_LoadFontsExtra1::
	jr LoadFrame

_LoadFontsExtra2::
	ret

_LoadFontsBattleExtra::
	ld de, FontBattleExtra
	ld hl, vTiles2 tile $60
	lb bc, BANK(FontBattleExtra), 25
	call Get2bpp_2
	; ld hl, vTiles2 tile $76
	; ld de, FontBattleExtra + 22 tiles
	; lb bc, BANK(FontBattleExtra), 2
	; call Get2bpp_2
	jr LoadFrame

LoadFrame:
	ld a, [wTextBoxFrame]
	maskbits NUM_FRAMES
	ld bc, 10 * LEN_1BPP_TILE
	ld hl, Frames
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles0 tile "┌" ; $ba
	lb bc, BANK(Frames), 10 ; "┌" to "┘"
	call Get1bpp_2
	ld hl, vTiles2 tile " " ; $7f
	ld de, TextBoxSpaceGFX
	lb bc, BANK(TextBoxSpaceGFX), 1
	call Get1bpp_2
	ret

LoadBattleFontsHPBar:
	ld de, FontBattleExtra
	ld hl, vTiles2 tile $60
	lb bc, BANK(FontBattleExtra), 28
	call Get2bpp_2
	; ld hl, vTiles2 tile $76
	; ld de, FontBattleExtra + 22 tiles
	; lb bc, BANK(FontBattleExtra), 2
	; call Get2bpp_2
	call LoadFrame

LoadHPBar:
	; ld de, EnemyHPBarBorderGFX
	; ld hl, vTiles2 tile $6c
	; lb bc, BANK(EnemyHPBarBorderGFX), 4
	; call Get1bpp_2
	; ld de, HPExpBarBorderGFX
	; ld hl, vTiles2 tile $73
	; lb bc, BANK(HPExpBarBorderGFX), 6
	; call Get1bpp_2
	ld de, ExpBarGFX
	ld hl, vTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 11
	call Get2bpp_2
	; ld de, MobilePhoneTilesGFX + 7 tiles ; mobile phone icon
	; ld hl, vTiles2 tile $5f
	; lb bc, BANK(MobilePhoneTilesGFX), 1
	; call Get2bpp_2
	ret

StatsScreen_LoadFont:
	call _LoadFontsBattleExtra
	ld de, EnemyHPBarBorderGFX
	ld hl, vTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bpp_2
	; ld de, HPExpBarBorderGFX
	; ld hl, vTiles2 tile $78
	; lb bc, BANK(HPExpBarBorderGFX), 1
	; call Get1bpp_2
	; ld de, HPExpBarBorderGFX + 3 * LEN_1BPP_TILE
	; ld hl, vTiles2 tile $76
	; lb bc, BANK(HPExpBarBorderGFX), 2
	; call Get1bpp_2
	ld de, ExpBarGFX
	ld hl, vTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 8
	call Get2bpp_2
LoadStatsScreenPageTilesGFX:
	ld de, StatsScreenPageTilesGFX
	ld hl, vTiles2 tile $31
	lb bc, BANK(StatsScreenPageTilesGFX), 11
	call Get2bpp_2
	ret
