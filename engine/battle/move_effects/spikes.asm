BattleCommand_Spikes:
; spikes

	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_turn
	ld hl, wPlayerScreens
.got_turn

; Fails if spikes are already down!

	bit SCREENS_COALS, [hl]
	jr nz, .failed
	bit SCREENS_SPIKES, [hl]
	jr nz, .failed

; Nothing else stops it from working.
	ld a, BATTLE_VARS_TRAIT
	call GetBattleVar
	cp TRAIT_HOT_COALS
	jr z, .hot_coals
	cp TRAIT_BARBS
	jr z, .barbs
.common_spikes
	set SCREENS_SPIKES, [hl]
	ld hl, SpikesText
	jr .end
.hot_coals
	set SCREENS_COALS, [hl]
	ld hl, CoalsText
	jr .end
.barbs
	set SCREENS_BARBS, [hl]
	ld hl, BarbsText
.end
	push hl
	call AnimateCurrentMove
	pop hl
	jp StdBattleTextBox

.failed
	jp FailMove
