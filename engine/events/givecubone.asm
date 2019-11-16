IncreaseBadgeEvent:
	ld hl, wBadges
	ld b, 2
	call CountSetBits
	ld a, [wNumSetBits]	
	; ld hl, EVENT_HAS_ONE_BADGE
	; ld a, [hl]
	; ld [$c000], a
	; inc hl
	; ld a, [hl]
	; ld [$c001], a
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
; 	ld [$c000], a
; 	jr .end
; .result2
; 	ld a, 2
; 	ld [$c000], a
; 	jr .end
	
	; ld e, [hl]
	; inc hl
	; ld d, [hl]
	; call GetScriptByte
	; ld [$c000], a
	; ld b, a
	; ld a, [wNumSetBits]
	; add b
	; call EventFlagAction
	; ld a, c

.end
	ld [wScriptVar], a
	