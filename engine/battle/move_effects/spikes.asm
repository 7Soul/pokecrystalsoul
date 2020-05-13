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
	jr nz, .common_spikes
	set SCREENS_COALS, [hl]
	ld hl, CoalsText
	jr .end
.common_spikes
	set SCREENS_SPIKES, [hl]
	ld hl, SpikesText
.end
	push hl
	call AnimateCurrentMove
	pop hl
	jp StdBattleTextBox

.failed
	jp FailMove
