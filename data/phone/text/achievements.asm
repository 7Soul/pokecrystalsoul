AchievNewText::
    text "New Achievement!"
    line ""
    done

AchiementTextsTable:
	dw AchievCaughtFirstMonText		; ACHIEV_HAS_ONE_BADGE
	dw AchievCaughtFirstMonText		; ACHIEV_HAS_FOUR_BADGES
	dw AchievCaughtFirstMonText		; ACHIEV_HAS_EIGHT_BADGES
	dw AchievCaughtFirstMonText		; ACHIEV_HAS_TWELVE_BADGES
	dw AchievCaughtFirstMonText		; ACHIEV_HAS_SIXTEEN_BADGES
	dw AchievCaughtFirstMonText		; ACHIEV_CAUGHT_MON
	dw AchievCaughtRareTraitText	; ACHIEV_CAUGHT_MON_RARE_TRAIT
	dw AchievCaughtFirstMonText		; ACHIEV_CAUGHT_MON_EGG_MOVE

AchievCaughtFirstMonText::
	text "Caught your very"
	line "first #MON!"
	para "This puts you"
	line "at a total of"
	cont "@"
	text_from_ram wStringBuffer3
	text " points, and"
	cont "@"
	text_from_ram wStringBuffer4
	text " points from the"
	cont "next breakpoint."
	done

AchievCaughtRareTraitText::
	text "Caught a #MON"
	line "that has a rare"
	cont "trait."
	done

AchievNumberOfPoints::
	text ""
	line ""
	done

_CheckNextAchievementCall:
	ld de, NUM_ACHIEV_START
	ld b, 0
.loop
	push de
	push bc
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	pop bc
	pop de
	jr nz, .true ; found a set achievement event
	; check if we reached the last achievement constant
	ld a, d
	cp HIGH(NUM_ACHIEV_START + NUM_ACHIEVEMENTS)
	jr nz, .false
	ld a, e
	cp LOW(NUM_ACHIEV_START + NUM_ACHIEVEMENTS)
	jr z, .false
	
	inc de
	inc b
	jr .loop

.true
	push de
	push bc
	inc de ; goes to ACHIEV_XXX_WARNED event flag and sets it
	ld b, SET_FLAG
	call EventFlagAction
	ld a, TRUE
	ld [wScriptVar], a

	ld a, [wProgressPoints]
	ld c, a
	ld hl, .Breakpoints
.breakpoint_loop
	ld a, [hli]
	cp c
	jr c, .breakpoint_loop

	sub c
	ld [wBuffer1], a
	ld hl, wStringBuffer4
	ld bc, NAME_LENGTH
	ld a, "@"
	call ByteFill
	
	ld de, wBuffer1
	ld hl, wStringBuffer1
	lb bc, PRINTNUM_RIGHTALIGN | 1, 3
	call PrintNum
	ld de, wStringBuffer1
	ld hl, wStringBuffer4
	ld bc, wStringBuffer5 - wStringBuffer4
	call CopyName2

	pop bc
	pop de
	
	ld hl, AchiementTextsTable
	ld a, b
	rra
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, BANK(AchievNewText)
	call GetFarHalfword
	ld b, BANK(AchievNewText)
	call MapTextbox

	; ld hl, AchiementTextsTable
	; ld b, BANK(AchievNewText)
	; call MapTextbox
	ret

.false
	and a
	ld [wScriptVar], a
	ret

.Breakpoints:
	db 0
	db 1
	db 3
	db 9
	db 11
	db 15
	db 20
	db 24
	db 29
	db 33
	db 38
	db 44
	db 49
	db 54
	db 60
	db 67
	db 74 

PRINTT "\n"
PRINTV NUM_EVENTS
PRINTT "\n"