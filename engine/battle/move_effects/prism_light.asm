BattleCommand_PrismLight:
; prism light
	push hl
	ld a, [wAttackMissed]
	and a
	jr nz, .failed
	
; fail if target isn't NORMAL type	
	ld hl, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_type
	ld hl, wBattleMonType1
	
.got_type
	ld a, [hli]
	cp NORMAL
	jr z, .skip_type_check
	ld a, [hl]
	cp NORMAL
	jr nz, .failed
.skip_type_check
; fail if target is hidden
	call CheckHiddenOpponent
	jr nz, .failed
	
; fail if reused
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_IDENTIFIED, [hl]
	jr nz, .failed
	
; success
	pop hl
	set SUBSTATUS_IDENTIFIED, [hl]
	call AnimateCurrentMove
	ld hl, IdentifiedText
	jp StdBattleTextBox

.failed
	pop hl
	jp FailMove
