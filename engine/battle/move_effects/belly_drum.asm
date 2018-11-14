BattleCommand_BellyDrum:
; bellydrum
	callfar GetHalfMaxHP
	callfar CheckUserHasEnoughHP
	jr nc, .failed
	
	call BattleCommand_AttackUp2
	ld a, [wAttackMissed]
	and a
	jr nz, .failed

	push bc
	call AnimateCurrentMove
	pop bc
	callfar SubtractHPFromUser
	call UpdateUserInParty
	ld a, 5

.max_attack_loop
	push af
	call BattleCommand_AttackUp2
	pop af
	dec a
	jr nz, .max_attack_loop

	ld hl, BellyDrumText
	jp StdBattleTextBox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
