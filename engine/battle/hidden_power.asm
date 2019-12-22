HiddenPowerDamage:
; Override Hidden Power's type and power based on the user's DVs.

	ld hl, wBattleMonDVs
	ldh a, [hBattleTurn]
	and a
	jr z, .got_dvs
	ld hl, wEnemyMonDVs
.got_dvs
; Power:
; Get first 5 bytes
	ld a, [hl]
	and %11111

; Divide by 2 and add 51
	srl a
	add 45
	ld d, a ; 45 to 58 damage

; Type:
; Get first 5 bytes
	ld a, [hl]
	and %11111
; Bit shift left
	rl a
	bit 6, [hl]
	jr nz, .mod
; Add 1 if the 5th bit was 1
	inc a
.mod
	sub 12
	jr nc, .mod
	add 12

; Skip Normal
	inc a

; Skip unused types
	cp UNUSED_TYPES
	jr c, .done
	add SPECIAL - UNUSED_TYPES

.done
; Overwrite the current move type.
	push af
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	pop af
	or SPECIAL
	ld [hl], a
	

; Get the rest of the damage formula variables
; based on the new type, but keep base power.
	ld a, d
	push af
	farcall BattleCommand_DamageStats ; damagestats
	pop af
	ld d, a
	ret
