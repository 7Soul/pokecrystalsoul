BattleCommand_WeightDamage:
; weightdamage

	; Get the opponent's species
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr nz, .go
	ld a, [wEnemyMonSpecies]
.go

	; Get the dex entry
	ld b, a
	farcall GetDexEntryPointer  ; b:de
	ld l, e
	ld h, d

	; Find and retrieve the weight
.skip_name
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .skip_name
	inc hl
	inc hl
	ld a, b
	call GetFarHalfword
	ld c, l
	ld b, h

	; Get the resulting power from the table
	ld hl, .table
.table_loop
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

	; if (de >= bc) jr .table_loop_end;
	ld a, b
	cp d
	jr c, .table_loop_next
	jr nz, .table_loop_end
	ld a, c
	cp e
	jr nc, .table_loop_end
.table_loop_next
	inc hl
	jr .table_loop
.table_loop_end

	; Overwrite the current move power
	ld b, [hl]
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVarAddr
	ld [hl], b

	; Do the rest
	jp BattleCommand_DamageStats

; The output with these specific values is correct,
;  but it might be inaccurate for other values, especially bigger ones.
kg EQUS "* 10000000 / 453592"
.table
	dwb 200 kg, 120
	dwb 100 kg, 100
	dwb 50 kg, 80
	dwb 25 kg, 60
	dwb 10 kg, 40
	dwb 0 kg, 20
	