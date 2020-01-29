IncreaseBadgeEvent:
	ld hl, wBadges
	ld b, 2
	call CountSetBits
	ld a, [wNumSetBits]	
	; ld hl, EVENT_HAS_ONE_BADGE
	; ld a, [hl]
	; inc hl
	; ld a, [hl]
	; ld b, a
	; ld c, 0
	; add hl, bc
	; ld d, h
	; ld e, l
	; add b

; 	ld a, EVENT_HAS_ONE_BADGE
; 	call GetScriptByte
; 	ld e, a
; 	ld a, EVENT_HAS_ONE_BADGE
; 	call GetScriptByte
; 	ld d, a

; 	ld b, CHECK_FLAG
; 	call EventFlagAction
; 	jr z, .result2

; 	ld a, 1
; 	jr .end
; .result2
; 	ld a, 2
; 	jr .end
	
	; ld e, [hl]
	; inc hl
	; ld d, [hl]
	; call GetScriptByte
	; ld b, a
	; ld a, [wNumSetBits]
	; add b
	; call EventFlagAction
	; ld a, c

.end
	ld [wScriptVar], a
	