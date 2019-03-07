BattleCommand_FireFlick:
; fireflick
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	bit BRN, a
	jr z, .noburn
	call GetBattleVarAddr
	res BRN, [hl]
	ld hl, FireFlickText1
	call StdBattleTextBox
	jp DoubleDamage
.noburn
	farcall CheckIfTargetIsFireType
	ret nz
	ld hl, FireFlickText2
	call StdBattleTextBox
	jp DoubleDamage
	ret
	