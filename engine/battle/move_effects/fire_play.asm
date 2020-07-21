BattleCommand_FirePlay:
; fireplay
; Get the opponent's stat level
	ldh a, [hBattleTurn]
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
	jr c, .next ; the stat is lowered
; fallthrough
	jr nz, .boosted ; found a boosted stat
.next ; the stat is lower or normal
	inc bc
	dec d
	jr nz, .loop ; loop
	ret

.boosted
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp FLYING
	jp nz, BattleCommand_Recoil

.flying
	call BattleCommand_SpeedUp
	jp BattleCommand_StatUpMessage

.evaded
	ld c, 20
	call DelayFrames
	jp BattleCommand_FailureText
	