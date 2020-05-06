BattleCommand_Curse:
; curse

	ld de, wBattleMon
	ld bc, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld de, wEnemyMon
	ld bc, wEnemyStatLevels

.go

; Curse is different for Ghost-types.

	ld a, [de]
	cp GASTLY
	jr z, .ghost
	cp GENGAR
	jr c, .ghost
	cp MISDREAVUS
	jr z, .ghost

; If no stats can be increased, don't.

; Attack
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Defense
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr nc, .cantraise

.raise

; Raise Attack and Defense, and lower Speed.

	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	ld a, SPEED
	call LowerStat
	call BattleCommand_SwitchTurn
	call BattleCommand_StatDownMessage
	call ResetMiss
	call BattleCommand_SwitchTurn
	call BattleCommand_AttackUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_DefenseUp
	jp BattleCommand_StatUpMessage

.ghost

; Cut HP in half and put a curse on the opponent.

	call CheckHiddenOpponent
	jr nz, .failed

	call CheckSubstituteOpp
	jr nz, .failed

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_CURSE, [hl]
	jr nz, .failed

	set SUBSTATUS_CURSE, [hl]

	ld a, [wBuffer3]
	cp 3
	jr z, .trait

	call AnimateCurrentMove
	ld hl, GetHalfMaxHP
	call CallBattleCore
	ld hl, SubtractHPFromUser
	call CallBattleCore
	call UpdateUserInParty
	ld hl, PutACurseText
	jp StdBattleTextBox

.trait
	ld hl, PutACurseTraitText
	jp StdBattleTextBox

.failed
	call AnimateFailedMove
	jp PrintButItFailed

.cantraise

; Can't raise either stat.

	ld b, ABILITY + 1
	call GetStatName
	call AnimateFailedMove
	ld hl, WontRiseAnymoreText
	jp StdBattleTextBox
