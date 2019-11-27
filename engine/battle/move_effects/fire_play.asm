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
	push hl
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld e, a	
	call IsVariableMove
	pop hl
	push hl
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	call GetVariableMoveType	
	pop hl
	
	ld a, [wCurSpecies]
	cp FIRE
	jr z, .anim_fire
	cp WATER
	jr z, .anim_water	
	ld a, $2
	ld [wKickCounter], a
	call AnimateCurrentMove
	jr .after_animation
.anim_water
	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	jr .after_animation
.anim_fire
	ld a, $0
	ld [wKickCounter], a
	call AnimateCurrentMove
.after_animation
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
	call BattleCommand_FailureText
	ret