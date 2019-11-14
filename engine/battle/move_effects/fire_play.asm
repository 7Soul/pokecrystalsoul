BattleCommand_FirePlay:
; fireplay
; Get the opponent's stat level
	ld a, [hBattleTurn]
	and a	
	; enemy turn
	ld hl, wEnemyMonType1
	ld bc, wPlayerStatLevels
	ld d, wPlayerStatLevelsEnd - wPlayerStatLevels
	jr nz, .loop
	; my turn
	ld hl, wBattleMonType1
	ld bc, wEnemyStatLevels
	ld d, wEnemyStatLevelsEnd - wEnemyStatLevels

	ld a, [wAttackMissed]
	and a
	jr nz, .evaded

	ld a, [hl]
	cp WATER
	jr z, .anim_water
	cp FIRE
	jr z, .anim_fire
	inc hl
	ld a, [hl]
	cp WATER
	jr z, .anim_water
	cp FLYING
	jr z, .anim_flying
.anim_fire
	ld a, $0
	ld [wKickCounter], a
	call AnimateCurrentMove
	jr .loop
.anim_water
	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	jr .loop
.anim_flying
	ld a, $2
	ld [wKickCounter], a
	call AnimateCurrentMove
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

.evaded
	ld c, 20
	call DelayFrames
	ret