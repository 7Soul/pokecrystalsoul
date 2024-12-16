ResetMapBufferEventFlags::
	xor a
	ld hl, wEventFlags
	ld [hli], a
	ret

ResetBikeFlags::
	xor a
	ld hl, wBikeFlags
	ld [hli], a
	ld [hl], a
	ret

ResetFlashIfOutOfCave::
	ld a, [wEnvironment]
	cp ROUTE
	jr z, .outdoors
	cp TOWN
	jr z, .outdoors
	ret

.outdoors
	ld hl, wStatusFlags
	res STATUSFLAGS_FLASH_F, [hl]
	ret

EventFlagAction::
	ld hl, wEventFlags
	call FlagAction
	ret

FlagAction::
; Perform action b on bit de in flag array hl.

; inputs:
; b: function
;    0  RESET_FLAG  clear bit
;    1  SET_FLAG    set bit
;    2  CHECK_FLAG  check bit
; de: bit number
; hl: pointer to the flag array

	; get index within the byte
	ld a, e
	and 7

	; shift de right by three bits (get the index within memory)
	srl d
	rr e
	srl d
	rr e
	srl d
	rr e
	add hl, de

	; implement a decoder
	ld c, 1
	rrca
	jr nc, .one
	rlc c
.one
	rrca
	jr nc, .two
	rlc c
	rlc c
.two
	rrca
	jr nc, .three
	swap c
.three

	; check b's value: 0, 1, 2
	ld a, b
	cp SET_FLAG
	jr c, .clearbit ; RESET_FLAG
	jr z, .setbit ; SET_FLAG

	; check bit
	ld a, [hl]
	and c
	ld c, a
	ret

.setbit
	; set bit
	ld a, [hl]
	or c
	ld [hl], a
	ret

.clearbit
	; clear bit
	ld a, c
	cpl
	and [hl]
	ld [hl], a
	ret

CheckReceivedDex::
	ld de, ENGINE_POKEDEX
	ld b, CHECK_FLAG
	farcall EngineFlagAction
	ld a, c
	and a
	ret

SetAchievement:: ; takes event flag in `de`
	push de
	inc de
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr nz, .already_got_achievement

	pop de
	ld b, d
	ld c, e
	push de

	; Get the point value from table
	ld hl, .Points
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
	jr z, .table_loop_end
.table_loop_next
	inc hl
	jr .table_loop
.table_loop_end

	ld b, [hl]
	ld a, [wProgressPoints]
	add b
	ld [wProgressPoints], a

	pop de
	ld b, SET_FLAG
	call EventFlagAction
	ld de, ACHIEV_HAS_NEW_ACHIVEMENT
	ld b, SET_FLAG
	call EventFlagAction
	ld a, SPECIALCALL_ACHIEVEMENT
	ld [wSpecialPhoneCallID], a
	ret
.already_got_achievement
	pop de
	ret
	
.Points
	dwb ACHIEV_CAUGHT_MON,						0
	dwb ACHIEV_CAUGHT_MON_RARE_TRAIT,			0
	dwb ACHIEV_CAUGHT_MON_HOLDING_ITEM,			0
	dwb ACHIEV_CAUGHT_MON_EGG_MOVE,				0
	dwb ACHIEV_MAX_POKEDEX_DATA,				1
	dwb ACHIEV_POKEMON_SEEN,					1
	dwb ACHIEV_POKEMON_CAUGHT,					1

	dwb ACHIEV_POKEMON_LEVEL_15,				2
	dwb ACHIEV_POKEMON_LEVEL_30,				3
	dwb ACHIEV_POKEMON_LEVEL_50,				4
	dwb ACHIEV_POKEMON_LEVEL_70,				5

	dwb ACHIEV_CAUGHT_LEGENDARY_BIRD,			1
	dwb ACHIEV_CAUGHT_LEGENDARY_BEAST,			1
	dwb ACHIEV_CAUGHT_LEGENDARY_HO_OH,			2
	dwb ACHIEV_CAUGHT_LEGENDARY_LUGIA,			2
	dwb ACHIEV_CAUGHT_LEGENDARY_MEW,			2
	dwb ACHIEV_CAUGHT_LEGENDARY_CELEBI,			2
	dwb ACHIEV_CAUGHT_FOUR_LEGENDARY,			2
	dwb ACHIEV_DEFEATED_RED,					4

	dwb ACHIEV_HAS_ONE_BADGE,					1
	dwb ACHIEV_HAS_FOUR_BADGES,					4
	dwb ACHIEV_HAS_EIGHT_BADGES,				4
	dwb ACHIEV_HAS_TWELVE_BADGES,				4
	dwb ACHIEV_HAS_SIXTEEN_BADGES,				4
	dwb ACHIEV_BEAT_ELITE_FOUR_1,				4
	dwb ACHIEV_BEAT_ELITE_FOUR_2,				4

	dwb ACHIEV_DEFEAT_ROCKET_PROTON,			2
	dwb ACHIEV_DEFEAT_ROCKET_ARIANA,			2
	dwb ACHIEV_DEFEAT_ROCKET_PRETEL,			2
	dwb ACHIEV_DEFEAT_ROCKET_ARCHER,			2
	dwb ACHIEV_DEFEAT_ROCKET_KODIAK,			2
	dwb ACHIEV_DEFEAT_ROCKET_SABER,				2
	dwb ACHIEV_DEFEAT_ROCKET_GIOVANNI,			4