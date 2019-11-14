BattleCommand_FirePlay:
; fireplay
; Get the opponent's stat level
	ld a, [hBattleTurn]
	and a	
	; enemy turn
	ld hl, wEnemyMonType2 ; to check for FLYING type, only type2 is needed
	ld bc, wPlayerStatLevels
	ld d, wPlayerStatLevelsEnd - wPlayerStatLevels
	jr nz, .loop
	; my turn
	ld hl, wBattleMonType2
	ld bc, wEnemyStatLevels
	ld d, wEnemyStatLevelsEnd - wEnemyStatLevels

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
	ld a, [hl]
	cp FLYING
	jr z, .flying

	call BattleCommand_Recoil
	ret

.flying
	call BattleCommand_SpeedUp
	call BattleCommand_StatUpMessage
	ret
