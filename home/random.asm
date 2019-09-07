Random::
; A simple hardware-based random number generator (RNG).

; Two random numbers are generated by adding and subtracting
; the divider to the respective values every time it's called.

; The divider is a register that increments at a rate of 16384Hz.
; For comparison, the Game Boy operates at a clock speed of 4.2MHz.

; Additionally, an equivalent function is executed in VBlank.

; This leaves a with the value in hRandomSub.

	push bc

	ldh a, [rDIV]
	ld b, a
	ldh a, [hRandomAdd]
	adc b
	ldh [hRandomAdd], a

	ldh a, [rDIV]
	ld b, a
	ldh a, [hRandomSub]
	sbc b
	ldh [hRandomSub], a

	pop bc
	ret

BattleRandom::
; _BattleRandom lives in another bank.

; It handles all RNG calls in the battle engine, allowing
; link battles to remain in sync using a shared PRNG.

	ldh a, [hROMBank]
	push af
	ld a, BANK(_BattleRandom)
	rst Bankswitch

	call _BattleRandom

	ld [wPredefTemp + 1], a
	pop af
	rst Bankswitch
	ld a, [wPredefTemp + 1]
	ret

RandomRange::
; Return a random number between 0 and a (non-inclusive).

	push bc
	ld c, a

	; b = $100 % c
	xor a
	sub c
.mod
	sub c
	jr nc, .mod
	add c
	ld b, a

	; Get a random number
	; from 0 to $ff - b.
	push bc
.loop
	call Random
	ldh a, [hRandomAdd]
	ld c, a
	add b
	jr c, .loop
	ld a, c
	pop bc

	call SimpleDivide

	pop bc
	ret

RandomDVs::
	push bc
	ld a, $c
	call RandomRange ; 0 to 11
	and $a
	sla a
	sla a
	sla a
	sla a	
	ld b, a
	
	ld a, $c
	call RandomRange ; 0 to 11
	and $a
	add b
	pop bc
	ret