QueueBattleAnimation:
	ld hl, wActiveAnimObjects
	ld e, NUM_ANIM_OBJECTS
.loop
	ld a, [hl]
	and a
	jr z, .done
	ld bc, BATTLEANIMSTRUCT_LENGTH
	add hl, bc
	dec e
	jr nz, .loop
	scf
	ret

.done
	ld c, l
	ld b, h
	ld hl, wLastAnimObjectIndex
	inc [hl]
	call InitBattleAnimation
	ret

DeinitBattleAnimation:
	ld hl, BATTLEANIMSTRUCT_INDEX
	add hl, bc
	ld [hl], $0
	ret

InitBattleAnimation:
	ld a, [wBattleAnimTemp0]
	ld e, a
	ld d, 0
	ld hl, BattleAnimObjects
rept 6
	add hl, de
endr
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_INDEX
	add hl, bc
	ld a, [wLastAnimObjectIndex]
	ld [hli], a ; BATTLEANIMSTRUCT_INDEX
	ld a, [de]
	inc de
	ld [hli], a ; BATTLEANIMSTRUCT_OAMFLAGS
	ld a, [de]
	inc de
	ld [hli], a ; BATTLEANIMSTRUCT_YFIX
	ld a, [de]
	inc de
	ld [hli], a ; BATTLEANIMSTRUCT_FRAMESET_ID
	ld a, [de]
	inc de
	ld [hli], a ; BATTLEANIMSTRUCT_FUNCTION
	ld a, [de]
	inc de
	ld [hli], a ; BATTLEANIMSTRUCT_PALETTE
	ld a, [de]
	call GetBattleAnimTileOffset
	ld [hli], a ; BATTLEANIMSTRUCT_TILEID
	ld a, [wBattleObjectTempXCoord]
	ld [hli], a ; BATTLEANIMSTRUCT_XCOORD
	ld a, [wBattleObjectTempYCoord]
	ld [hli], a ; BATTLEANIMSTRUCT_YCOORD
	xor a
	ld [hli], a ; BATTLEANIMSTRUCT_XOFFSET
	ld [hli], a ; BATTLEANIMSTRUCT_YOFFSET
	ld a, [wBattleObjectTempParam]
	ld [hli], a ; BATTLEANIMSTRUCT_PARAM
	xor a
	ld [hli], a ; BATTLEANIMSTRUCT_DURATION
	dec a
	ld [hli], a ; BATTLEANIMSTRUCT_FRAME
	xor a
	ld [hli], a ; BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	ld [hli], a ; BATTLEANIMSTRUCT_VAR1
	ld [hl], a  ; BATTLEANIMSTRUCT_VAR2
	ret

BattleAnimOAMUpdate:
	call InitBattleAnimBuffer
	call GetBattleAnimFrame
	cp -3
	jp z, .done
	cp -4
	jp z, .delete
	push af
	ld hl, wBattleAnimTempOAMFlags
	ld a, [wBattleAnimTempAddSubFlags]
	xor [hl]
	and $e0
	ld [hl], a
	pop af
	push bc
	call GetBattleAnimOAMPointer
	ld a, [wBattleAnimTempTileID]
	add [hl]
	ld [wBattleAnimTempTileID], a
	inc hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wBattleAnimOAMPointerLo]
	ld e, a
	ld d, HIGH(wVirtualOAM)
.loop
	ld a, [wBattleAnimTempYCoord]
	ld b, a
	ld a, [wBattleAnimTempYOffset]
	add b
	ld b, a
	push hl
	ld a, [hl]
	ld hl, wBattleAnimTempOAMFlags
	bit 6, [hl]
	jr z, .no_yflip
	add $8
	xor $ff
	inc a

.no_yflip
	pop hl
	add b
	ld [de], a
	inc hl
	inc de
	ld a, [wBattleAnimTempXCoord]
	ld b, a
	ld a, [wBattleAnimTempXOffset]
	add b
	ld b, a
	push hl
	ld a, [hl]
	ld hl, wBattleAnimTempOAMFlags
	bit 5, [hl]
	jr z, .no_xflip
	add $8
	xor $ff
	inc a

.no_xflip
	pop hl
	add b
	ld [de], a
	inc hl
	inc de
	ld a, [wBattleAnimTempTileID]
	add $31
	add [hl]
	ld [de], a
	inc hl
	inc de
	ld a, [wBattleAnimTempOAMFlags]
	ld b, a
	ld a, [hl]
	xor b
	and $e0
	ld b, a
	ld a, [hl]
	and $10
	or b
	ld b, a
	ld a, [wBattleAnimTempPalette]
	and $f
	or b
	ld [de], a
	inc hl
	inc de
	ld a, e
	ld [wBattleAnimOAMPointerLo], a
	cp $a0
	jr nc, .exit_set_carry
	dec c
	jr nz, .loop
	pop bc
	jr .done

.delete
	call DeinitBattleAnimation

.done
	and a
	ret

.exit_set_carry
	pop bc
	scf
	ret

InitBattleAnimBuffer:
	ld hl, BATTLEANIMSTRUCT_OAMFLAGS
	add hl, bc
	ld a, [hl]
	and %10000000
	ld [wBattleAnimTempOAMFlags], a
	xor a
	ld [wBattleAnimTempAddSubFlags], a
	ld hl, BATTLEANIMSTRUCT_PALETTE
	add hl, bc
	ld a, [hl]
	ld [wBattleAnimTempPalette], a
	ld hl, BATTLEANIMSTRUCT_YFIX
	add hl, bc
	ld a, [hl]
	ld [wBattleAnimTempField02], a
	ld hl, BATTLEANIMSTRUCT_TILEID
	add hl, bc
	ld a, [hli]
	ld [wBattleAnimTempTileID], a
	ld a, [hli]
	ld [wBattleAnimTempXCoord], a
	ld a, [hli]
	ld [wBattleAnimTempYCoord], a
	ld a, [hli]
	ld [wBattleAnimTempXOffset], a
	ld a, [hli]
	ld [wBattleAnimTempYOffset], a
	ldh a, [hBattleTurn]
	and a
	ret z
	ld hl, BATTLEANIMSTRUCT_OAMFLAGS
	add hl, bc
	ld a, [hl]
	ld [wBattleAnimTempOAMFlags], a
	bit 0, [hl]
	ret z
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hli]
	ld d, a
	ld a, (-10 * 8) + 4
	sub d
	ld [wBattleAnimTempXCoord], a
	ld a, [hli]
	ld d, a
	ld a, [wBattleAnimTempField02]
	cp $ff
	jr nz, .check_kinesis_softboiled_milkdrink
	ld a, 5 * 8
	add d
	jr .done

.check_kinesis_softboiled_milkdrink
	sub d
	push af
	ld a, [wFXAnimID + 1]
	or a
	jr nz, .no_sub
	ld a, [wFXAnimID]
	cp KINESIS
	;jr z, .kinesis
	;cp SOFTBOILED
	;jr z, .softboiled
	;cp MILK_DRINK
	jr nz, .no_sub
.kinesis
;.softboiled
;.milk_drink
	pop af
	sub 1 * 8
	jr .done

.no_sub
	pop af
.done
	ld [wBattleAnimTempYCoord], a
	ld a, [hli]
	xor $ff
	inc a
	ld [wBattleAnimTempXOffset], a
	ret

GetBattleAnimTileOffset:
	push hl
	push bc
	ld hl, wBattleAnimTileDict
	ld b, a
	ld c, 10 / 2
.loop
	ld a, [hli]
	cp b
	jr z, .load
	inc hl
	dec c
	jr nz, .loop
	xor a
	jr .done

.load
	ld a, [hl]
.done
	pop bc
	pop hl
	ret

_ExecuteBGEffects:
	callfar ExecuteBGEffects
	ret

_QueueBGEffect:
	callfar QueueBGEffect
	ret
