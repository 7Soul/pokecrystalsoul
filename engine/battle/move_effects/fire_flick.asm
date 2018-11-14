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
	call CheckIfTargetIsFireType
	ret nz
	ld hl, FireFlickText2
	call StdBattleTextBox
	jp DoubleDamage
	ret
	
	
CheckIfTargetIsFireType:
	ld de, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wBattleMonType1
.ok
	ld a, [de]
	inc de
	cp FIRE
	ret z
	ld a, [de]
	cp FIRE
	ret