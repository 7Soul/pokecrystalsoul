BattleCommand_Conversion:
; conversion

	ld hl, wBattleMonMoves
	ld de, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_moves
	ld hl, wEnemyMonMoves
	ld de, wEnemyMonType1
.got_moves
	push de
	ld c, 0
	ld de, wStringBuffer1
.loop
	push hl
	ld b, 0
	add hl, bc
	ld a, [hl]
	pop hl
	and a
	jr z, .okay
	push hl
	push bc
	push de
	ld e, a
	farcall IsVariableMove
	jr nc, .not_variable
	farcall GetVariableMoveType
	jr nc, .not_variable
	ld a, e
	ld hl, VarMoves + MOVE_TYPE
	jr .got_move_pointer
.not_variable
	ld a, e
	dec a
	ld hl, Moves + MOVE_TYPE
.got_move_pointer
	call GetMoveAttr
	and TYPE_MASK
	pop de
	ld [de], a
	inc de
	pop bc
	pop hl
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .loop
.okay
	ld a, $ff
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	pop de
	ld hl, wStringBuffer1
.loop2
	ld a, [hl]
	cp -1
	jr z, .fail
	ld a, [de]
	cp [hl]
	jr z, .next
	inc de
	ld a, [de]
	dec de
	cp [hl]
	jr nz, .done
.next
	inc hl
	jr .loop2

.fail
	call AnimateFailedMove
	jp PrintButItFailed

.done
.loop3
	call BattleRandom
	maskbits NUM_MOVES
	ld c, a
	ld b, 0
	ld hl, wStringBuffer1
	add hl, bc
	ld a, [hl]
	cp -1
	jr z, .loop3
	ld a, [de]
	cp [hl]
	jr z, .loop3
	inc de
	ld a, [de]
	dec de
	cp [hl]
	jr z, .loop3
	ld a, [hl]
	ld [de], a
	inc de
	ld [de], a
	ld [wNamedObjectIndexBuffer], a
	farcall GetTypeName
	call AnimateCurrentMove
	ld hl, TransformedTypeText
	jp StdBattleTextBox
