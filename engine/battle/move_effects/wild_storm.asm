BattleCommand_GetWildStorm:
; getmagnitude

	push bc
	call BattleRandom
	ld b, a
	ld hl, WildStormPower
.loop
	ld a, [hli]
	cp b
	jr nc, .ok
	inc hl
	inc hl
	jr .loop

.ok
	ld d, [hl]
	push hl
	ld hl, wBattleMonType1 ; USER type
	ldh a, [hBattleTurn]
	and a
	jr z, .player_type
	ld hl, wEnemyMonType1
.player_type
	ld a, [hli]
	cp FLYING
	jr z, .flying
	ld a, [hl]
	cp FLYING
	jr nz, .not_flying
.flying ; USER is flying
	ld a, d
	srl a
	add a
	add a ; inc power by 50%
	ld d, a
.not_flying
	pop hl
	push de
	inc hl
	ld a, [hl]
	ld [wDeciramBuffer], a
	call BattleCommand_MoveDelay
	ld hl, WildStormText
	call StdBattleTextBox
	pop de
	pop bc
	ret

INCLUDE "data/moves/wild_storm_power.asm"
