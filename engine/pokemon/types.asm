PrintMonTypes:
; Print one or both types of [wCurSpecies]
; on the stats screen at hl.

	push hl
	call GetBaseData
	pop hl

	push hl
	ld a, [wBaseType1]
	call .Print

	; Single-typed monsters really
	; have two of the same type.
	ld a, [wBaseType1]
	ld b, a
	ld a, [wBaseType2]
	cp b
	pop hl
	jr z, .hide_type_2

	ld bc, SCREEN_WIDTH
	add hl, bc

.Print:
	ld b, a
	jr PrintType

.hide_type_2
	; Erase any type name that was here before.
	ld a, " "
	ld bc, SCREEN_WIDTH - 3
	add hl, bc
	; ld [hl], a
	; inc bc
	; add hl, bc
	ld bc, NAME_LENGTH_JAPANESE - 1
	jp ByteFill

PrintMoveType:
; Print the type of move b at hl.

	push hl
	push de
	ld a, [wCurVariableMove]
	cp -1
	jr z, .not_variable
	ld hl, VarMoves
	jr .got_move_data

.not_variable
	ld a, b
	dec a
	ld hl, Moves
.got_move_data
	pop de
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, wStringBuffer1
	ld a, BANK(Moves)
	call FarCopyBytes
	ld a, [wStringBuffer1 + MOVE_TYPE]
	and TYPE_MASK
	pop hl
	ld b, a
.end

PrintType:
; Print type b at hl.

	ld a, b

	push hl
	add a
	ld hl, TypeNames
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl

	jp PlaceString

GetTypeName:
; Copy the name of type [wNamedObjectIndexBuffer] to wStringBuffer1.

	ld a, [wNamedObjectIndexBuffer]
	ld hl, TypeNames
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wStringBuffer1
	ld bc, MOVE_NAME_LENGTH
	jp CopyBytes

INCLUDE "data/types/names.asm"
