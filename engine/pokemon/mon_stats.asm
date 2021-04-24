DrawPlayerHP:
	ld a, $1
	jr DrawHP

DrawEnemyHP:
	ld a, $2

DrawHP:
	ld [wWhichHPBar], a
	push hl
	push bc
	; box mons have full HP
	ld a, [wMonType]
	cp BOXMON
	jr z, .at_least_1_hp

	ld a, [wTempMonHP]
	ld b, a
	ld a, [wTempMonHP + 1]
	ld c, a

; Any HP?
	or b
	jr nz, .at_least_1_hp

	xor a
	ld c, a
	ld e, a
	ld a, 6
	ld d, a
	jp .fainted

.at_least_1_hp
	ld a, [wTempMonMaxHP]
	ld d, a
	ld a, [wTempMonMaxHP + 1]
	ld e, a
	ld a, [wMonType]
	cp BOXMON
	jr nz, .not_boxmon

	ld b, d
	ld c, e

.not_boxmon
	predef ComputeHPBarPixels
	ld a, 6
	ld d, a
	ld c, a

.fainted
	ld a, c
	pop bc
	ld c, a
	pop hl
	push de
	push hl
	push hl
	call DrawBattleHPBar
	pop hl

; Print HP
	bccoord 1, 1, 0
	add hl, bc
	ld de, wTempMonHP
	ld a, [wMonType]
	cp BOXMON
	jr nz, .not_boxmon_2
	ld de, wTempMonMaxHP
.not_boxmon_2
	lb bc, 2, 3
	call PrintNum

	ld a, "/"
	ld [hli], a

; Print max HP
	ld de, wTempMonMaxHP
	lb bc, 2, 3
	call PrintNum
	pop hl
	pop de
	ret

PrintTempMonStats:
; Print wTempMon's stats at hl, with spacing bc.
	push bc
	push hl
	ld de, .StatNames
	call PlaceString
	pop hl
	pop bc
	add hl, bc
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld de, wTempMonAttack
	lb bc, 2, 3
	call .PrintStat
	ld de, wTempMonDefense
	call .PrintStat
	ld de, wTempMonSpclAtk
	call .PrintStat
	ld de, wTempMonSpclDef
	call .PrintStat
	ld de, wTempMonSpeed
	jp PrintNum

.PrintStat:
	push hl
	call PrintNum
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ret

.StatNames:
	db   "ATTACK"
	next "DEFENSE"
	next "SPCL.ATK"
	next "SPCL.DEF"
	next "SPEED"
	next "@"

PrintTempMonStatsShort:
; Print wTempMon's stats at hl, with spacing bc.
    hlcoord 1, 8
    ld de, .StatName0 ; HP
    call PlaceString
	ld de, wTempMonMaxHP
	call PrintStat

    hlcoord 1, 9
    ld de, .StatName1 ; ATK
    call PlaceString
	ld de, wTempMonAttack
	call PrintStat
	
	hlcoord 1, 10
    ld de, .StatName2 ; DEF
    call PlaceString
	ld de, wTempMonDefense
    call PrintStat
	
	hlcoord 11, 8
    ld de, .StatName3 ; S.ATK
    call PlaceString
	ld de, wTempMonSpclAtk
    call PrintStat
	
	hlcoord 11, 9
    ld de, .StatName4 ; S.DEF
    call PlaceString
	ld de, wTempMonSpclDef
    call PrintStat
	
	hlcoord 11, 10
    ld de, .StatName5 ; SPD
    call PlaceString
	ld de, wTempMonSpeed
    call PrintStat
	ret

.StatName0:
	db	"HP@"
.StatName1:
	db	"ATK@"
.StatName2:
	db	"DEF@"
.StatName3:
	db	"S.ATK@"
.StatName4:
	db	"S.DEF@"
.StatName5:
	db	"SPD@"

PrintStat:
	ld bc, 5
	add hl, bc
	lb bc, 2, 3
	call PrintNum
	ret

GetGender:
; Return the gender of a given monster (wCurPartyMon/wCurOTMon/wCurWildMon).
; When calling this function, a should be set to an appropriate wMonType value.

; return values:
; a = 1: f = nc|nz; male
; a = 0: f = nc|z;  female
;        f = c:  genderless

; Figure out what type of monster struct we're looking at.

; 0: PartyMon
	ld hl, wPartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wMonType]
	and a
	jr z, .PartyMon

; 1: OTPartyMon
	ld hl, wOTPartyMon1DVs
	dec a
	jr z, .PartyMon

; 2: sBoxMon
	ld hl, sBoxMon1DVs
	ld bc, BOXMON_STRUCT_LENGTH
	dec a
	jr z, .sBoxMon

; 3: Unknown
	ld hl, wTempMonDVs
	dec a
	jr z, .DVs

; else: WildMon
	ld hl, wEnemyMonDVs
	jr .DVs

; Get our place in the party/box.

.PartyMon:
.sBoxMon
	ld a, [wCurPartyMon]
	call AddNTimes

.DVs:
; sBoxMon data is read directly from SRAM.
	ld a, [wMonType]
	cp BOXMON
	ld a, BANK(sBox)
	call z, GetSRAMBank

; Close SRAM if we were dealing with a sBoxMon.
	ld a, [wMonType]
	cp BOXMON
	call z, CloseSRAM

	push hl
	ld a, [wCurSpecies]
	dec a
	ld hl, BaseData + BASE_GENDER
	ld bc, BASE_DATA_SIZE
	call AddNTimes
	ld a, BANK(BaseData)
	call GetFarByte
	pop hl
	cp GENDER_UNKNOWN
	jr z, .Genderless

	ld a, [hl]
; Bit 6 of DVs sets if it's male (0) or female (1)
	bit 6, a
	jr nz, .Female
	jr z, .Male

.Female:
	xor a
	ret

.Male:
	ld a, 1
	and a
	ret

.Genderless:
	scf
	ret

ListMovePP:
	ld a, [wNumMoves]
	inc a
	ld c, a
	ld a, NUM_MOVES
	sub c
	ld b, a
	push hl
	ld a, [wBuffer1]
	ld e, a
	ld d, $0
	;ld a, $3e ; P
	;call .load_loop
	; ld a, b
	; and a
	; jr z, .skip
	; ld c, a
	; ld a, "-"
	; call .load_loop

.skip
	pop hl
	;inc hl
	;inc hl
	;inc hl
	ld d, h
	ld e, l
	ld hl, wTempMonMoves
	ld b, 0
.loop
	ld a, [hli]
	and a
	jr z, .done
	push bc
	push hl
	push de
	ld hl, wMenuCursorY
	ld a, [hl]
	push af
	ld [hl], b
	push hl
	callfar GetMaxPPOfMove
	pop hl
	pop af
	ld [hl], a
	pop de

	; ld a, b
	; call FillInCostBar

	pop hl
	push hl
	ld bc, wTempMonPP - (wTempMonMoves + 1)
	add hl, bc
	ld a, [hl]
	and $3f
	ld [wStringBuffer1 + 4], a
	ld h, d
	ld l, e
	call FillInCostBar
	; push hl
	; ld de, wStringBuffer1 + 4
	; lb bc, 1, 2
	; call PrintNum
	; ld a, "/"
	; ld [hli], a
	; inc hl
	; inc hl
	; inc hl
	; ld de, wTempPP
	; lb bc, 1, 2
	; call PrintNum
	; pop hl
	ld a, [wBuffer1]
	ld e, a
	ld d, 0
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop bc
	inc b
	ld a, b
	cp NUM_MOVES
	jr nz, .loop

.done
	ret

.load_loop
	ld [hli], a
	ld [hld], a
	add hl, de
	dec c
	jr nz, .load_loop
	ret

FillInCostBar:
	push hl
	call CalcCostBar
	call PlaceCostBar
	pop hl
	ret

PlaceCostBar:
.loop
	ld a, b
	and a
	jr z, .finish
	sub 2
	jr c, .half
	ld b, a

	ld a, $77 ; full bar
	ld [hli], a

	ld a, b
	and a
	jr z, .finish
	jr .loop
	
.half
	ld a, $76 ; half bar
	ld [hli], a

.finish
	ret

CalcCostBar:
	ld b, 0
	and a
	jr z, .finish
.loop
	sub STA_BAR
	jr c, .half
	inc b
	inc b
	and a
	jr z, .finish
	
	jr .loop
.half
	inc b
.finish
	ret

; Unreferenced_Function50cd0:
; .loop
; 	ld [hl], $32
; 	inc hl
; 	ld [hl], $3e
; 	dec hl
; 	add hl, de
; 	dec c
; 	jr nz, .loop
; 	ret

; Unused_PlaceEnemyHPLevel:
; 	push hl
; 	push hl
; 	ld hl, wPartyMonNicknames
; 	ld a, [wCurPartyMon]
; 	call GetNick
; 	pop hl
; 	call PlaceString
; 	call CopyMonToTempMon
; 	pop hl
; 	ld a, [wCurPartySpecies]
; 	cp EGG
; 	jr z, .egg
; 	push hl
; 	ld bc, -12
; 	add hl, bc
; 	ld b, $0
; 	call DrawEnemyHP
; 	pop hl
; 	ld bc, 5
; 	add hl, bc
; 	push de
; 	call PrintLevel
; 	pop de

; .egg
; 	ret

PlaceStatusString:
	push de
	inc de
	inc de
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	or b
	pop de
	jr nz, PlaceNonFaintStatus
	push de
	ld de, FntString
	call CopyStatusString
	pop de
	ld a, $1
	and a
	ret

FntString:
	db "FNT@"

CopyStatusString:
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ret

PlaceNonFaintStatus:
	push de
	ld a, [de]
	ld de, PsnString
	bit PSN, a
	jr nz, .place
	ld de, BrnString
	bit BRN, a
	jr nz, .place
	ld de, FrzString
	bit FRZ, a
	jr nz, .place
	ld de, ParString
	bit PAR, a
	jr nz, .place
	ld de, SlpString
	and SLP
	jr z, .no_status

.place
	call CopyStatusString
	ld a, $1
	and a

.no_status
	pop de
	ret

SlpString: db "SLP@"
PsnString: db "PSN@"
BrnString: db "BRN@"
FrzString: db "FRZ@"
ParString: db "PAR@"

ListMovesAsdf:
; List moves at hl, spaced every [wBuffer1] tiles.
	ld de, wListMoves_MoveIndicesBuffer
	ld b, $0
.moves_loop
	ld a, [de]
	inc de
	and a
	jr z, .no_more_moves

	push hl
	push bc
	ld b, a
	ld a, [wBuffer6]
	cp $AA
	jr nz, .not_enemy_mon
	call ListHasKnownMove
	jr c, .known_list_has_move

	pop bc
	pop hl
	
	push de	
	push hl
	push bc
	ld de, .UnknownMove
	call PlaceString
	pop bc
	ld a, b
	ld [wNumMoves], a
	inc b
	pop hl
	push bc
	ld a, [wBuffer1]
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	pop de
	ld a, b
	cp NUM_MOVES
	jp z, .done
	jp .moves_loop

.not_enemy_mon
	ld a, b
.known_list_has_move
	ld a, b
	pop bc
	pop hl
	
	push de
	push hl
	push hl
	ld [wCurSpecies], a
	ld a, MOVE_NAME
	ld [wNamedObjectTypeBuffer], a
	call GetName
	ld de, wStringBuffer1
.write_name
	pop hl
	push bc
	call PlaceString
	pop bc
	ld a, b
	ld [wNumMoves], a
	inc b
	pop hl
	push bc
	ld a, [wBuffer1]
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	pop de
	ld a, b
	cp NUM_MOVES
	jr z, .done
	jr .moves_loop

.no_more_moves
	ld a, b
.nonmove_loop
	push af
	ld [hl], "-"
	ld a, [wBuffer1]
	ld c, a
	ld b, 0
	add hl, bc
	pop af
	inc a
	cp NUM_MOVES
	jr nz, .nonmove_loop

.done
	ret

.UnknownMove:
	db "???@"

ListHasKnownMove:
	push bc
	push de
	push hl
	ld hl, wEnemyUsedMoves
	ld c, 3
.loop_used
	ld a, [hli]
	cp b
	jr z, .known_list_has_move
	dec c
	jr nz, .loop_used
	pop hl
	pop de
	pop bc
	and a
	ret

.known_list_has_move
	pop hl
	pop de
	pop bc
	scf
	ret

ListMoves:
; List moves at hl, spaced every [wBuffer1] tiles.
	ld de, wListMoves_MoveIndicesBuffer
	ld b, $0
.moves_loop
	ld a, [de]
	inc de
	and a
	jp z, .no_more_moves
	push hl
	push hl
	push bc
	push af
	ld a, [wBuffer6]
	cp $AA
	jr nz, .not_enemy_mon
	
	pop af
	ld b, a ; has move id
	ld hl, wEnemyUsedMoves
	ld c, 3

.loop_used
	ld a, [hli]
	cp b
	jr z, .known_list_has_move
	dec c
	jr nz, .loop_used

	pop hl
	push de
	ld de, .UnknownMove
	call PlaceString
	pop de
	pop bc
	ld a, b
	ld [wNumMoves], a
	inc b
	push bc
	pop hl
	ld a, [wBuffer1]
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	
	ld a, b
	cp NUM_MOVES
	jp z, .done
	jp .moves_loop

.not_enemy_mon
	pop af
.known_list_has_move
	pop bc
	pop hl
	pop hl

	push de
	push hl
	push hl
	ld [wCurSpecies], a

	push hl
	push de
	push bc
	push af
	ld a, [wCurSpecies]
	ld e, a
	farcall IsVariableMove
	jr nc, .not_variable
	farcall GetVariableMoveType
	jr nc, .not_variable
	call GetMoveName
	pop af
	pop bc
	pop de
	pop hl
	jr .ok

.not_variable
	pop af
	ld [wCurType], a
	pop bc
	pop de
	pop hl
	ld a, MOVE_NAME
	ld [wNamedObjectTypeBuffer], a
	call GetName
.ok
	ld de, wStringBuffer1
	pop hl
	push bc
	call PlaceString
	pop bc
	ld a, b
	ld [wNumMoves], a
	inc b
	pop hl
	push bc
	ld a, [wBuffer1]
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	pop de
	ld a, b
	cp NUM_MOVES
	jr z, .done
	jp .moves_loop

.no_more_moves
	ld a, b
.nonmove_loop
	push af
	; ld [hl], "-"
	ld a, [wBuffer1]
	ld c, a
	ld b, 0
	add hl, bc
	pop af
	inc a
	cp NUM_MOVES
	jr nz, .nonmove_loop

.done
	ret

.UnknownMove:
	db "???@"
