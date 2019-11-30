BattleCommand_FirePlay:
; fireplay
; Get the opponent's stat level
	ld a, [hBattleTurn]
	and a	
	; enemy turn
	ld hl, wEnemyMonType1
	ld bc, wPlayerStatLevels
	jr nz, .got_stats
	; my turn
	ld hl, wBattleMonType1
	ld bc, wEnemyStatLevels
.got_stats
	ld a, [wAttackMissed]
	and a
	jr nz, .evaded
	push bc
	call BattleCommand_FailureText
	call BattleCommand_ApplyDamage
	call BattleCommand_CriticalText
	call BattleCommand_SuperEffectiveText
	pop bc
	ld d, NUM_LEVEL_STATS
.loop
	ld a, [bc]
	cp BASE_STAT_LEVEL
	jr nc, .boosted_or_zero ; found something?
	jr .next ; the stat is lowered
.boosted_or_zero
	jr nz, .boosted ; found a boosted stat
.next ; the stat is lower or normal
	inc bc
	dec d
	jr nz, .loop ; loop
	ret

.boosted
	ld a, [wMoveType] ; test later
	cp FLYING
	jr z, .flying

	call BattleCommand_Recoil
	ret

.flying
	call BattleCommand_SpeedUp
	call BattleCommand_StatUpMessage
	ret

.evaded
	ld c, 20
	call DelayFrames
	call BattleCommand_FailureText
	ret