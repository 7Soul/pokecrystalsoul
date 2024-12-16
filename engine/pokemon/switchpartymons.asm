_SwitchPartyMons:
	ld a, [wSwitchMon]
	dec a
	ld [wBuffer3], a
	ld b, a
	ld a, [wMenuCursorY]
	dec a
	ld [wBuffer2], a
	cp b
	jr z, .skip
	call .SwapMonAndMail
	ld a, [wBuffer3]
	call .ClearSprite
	ld a, [wBuffer2]
	call .ClearSprite
.skip
	ret

.ClearSprite:
	push af
	hlcoord 0, 1
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld bc, 2 * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	pop af
	ld hl, wVirtualOAMSprite00
	ld bc, 4 * SPRITEOAMSTRUCT_LENGTH
	call AddNTimes
	ld de, SPRITEOAMSTRUCT_LENGTH
	ld c, 4
.gfx_loop
	ld [hl], SCREEN_WIDTH_PX ; y (off-screen)
	add hl, de
	dec c
	jr nz, .gfx_loop
	ld de, SFX_SWITCH_POKEMON
	call WaitPlaySFX
	ret

.SwapMonAndMail: ; _SwitchPartyMons.SwapMonAndMail
	; First mon selected is in wBuffer3
	; Second mon is in wBuffer2
	push hl
	push de
	push bc
	; Swaps wPartySpecies id
	ld bc, wPartySpecies
	ld a, [wBuffer2]
	ld l, a
	ld h, $0
	add hl, bc
	ld d, h
	ld e, l
	ld a, [wBuffer3]
	ld l, a
	ld h, $0
	add hl, bc
	ld a, [hl]
	push af
	ld a, [de]
	ld [hl], a
	pop af
	ld [de], a
	; Swaps wPartyMon structs
	; Get to wPartyMon for mon 2
	ld a, [wBuffer2]
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	push hl
	ld de, wSwitchMonBuffer
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	; Get to wPartyMon for mon 1
	ld a, [wBuffer3]
	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop de
	push hl
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	pop de
	ld hl, wSwitchMonBuffer
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	; Swap OT name
	; Get OT for mon 2
	ld a, [wBuffer2]
	ld hl, wPartyMonOT
	call SkipNames
	push hl
	call .CopyNameToSwitchMonBuffer
	; Get OT for mon 1
	ld a, [wBuffer3]
	ld hl, wPartyMonOT
	call SkipNames
	pop de
	push hl
	call .CopyName
	pop de
	ld hl, wSwitchMonBuffer
	call .CopyName
	; Swap mon names
	; Get nickname for mon 2
	ld hl, wPartyMonNicknames
	ld a, [wBuffer2]
	call SkipNames
	push hl
	call .CopyNameToSwitchMonBuffer
	; Get nickname for mon 1
	ld hl, wPartyMonNicknames
	ld a, [wBuffer3]
	call SkipNames
	pop de
	push hl
	call .CopyName
	pop de
	ld hl, wSwitchMonBuffer
	call .CopyName
	; Swap mail
	; Ger mail for mon 2
	ld hl, sPartyMail
	ld a, [wBuffer2]
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	push hl
	ld de, wSwitchMonBuffer
	ld bc, MAIL_STRUCT_LENGTH
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	call CopyBytes
	; Get mail for mon 1
	ld hl, sPartyMail
	ld a, [wBuffer3]
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	pop de
	push hl
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	pop de
	ld hl, wSwitchMonBuffer
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	call CloseSRAM
	; Remake pairs
	; Get mon 2's pair. If it is mon 2's old id, switch it to the new id
	; At this point the mons have already been switched
	ld a, [wBuffer2] ; 1 = pidgey, vaporeon is in index 0 now
	call GetPairIDMask ; vaporeon's pair (1)
	cp $7
	jr z, .not_pair1
	call GetPairIDMask
	ld b, a ; muk's pair id (vaporeon's original id of 0)
	ld a, [wBuffer2] ; vaporeon's new index (0)
	cp b ; is vaporeon muk's pair?
	call z, SwapPairs
	jr z, .not_pair1
	; Give pikachu pidgey's new index of 0
	ld a, [wBuffer2]
	call GivePairIDMask
.not_pair1
	ld a, [wBuffer3]
	call GetPairIDMask ; vaporeon's pair
	cp $7
	jr z, .not_pair2
	call GetPairIDMask
	ld b, a ; muk's pair id (vaporeon's original id of 0)
	ld a, [wBuffer3] ; vaporeon's old index (0)
	cp b ; is vaporeon muk's pair?
	jr z, .not_pair2
	; Give muk vaporeon's new index of 1
	ld a, [wBuffer3]
	call GivePairIDMask
.not_pair2
	pop bc
	pop de
	pop hl
	ret

.CopyNameToSwitchMonBuffer:
	ld de, wSwitchMonBuffer

.CopyName:
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

GetPairIDMask:
	ld hl, wPartyMon1Trait
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	and PAIR_ID_MASK
	swap a
	ret

GivePairIDMask:
	; moves pair id number to upper nybble
	swap a
	ld b, a ; save it
	push bc
	ld a, c
	ld hl, wPartyMon1Trait
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	and PAIR_ID_MASK ^ $FF
	pop bc
	or b
	ld [hl], a
	ret

SwapPairs: ; for when swaping around two pokémon who are paired with each other
	ld b, [hl] ; second mon's id
	push hl
	push bc
	ld a, [wBuffer3]
	call GetPairIDMask
	ld d, a ; first mon's id
	pop bc
	ld [hl], b
	pop hl
	ld [hl], d
	ret

_PairMons:
	ld a, [wSwitchMon]
	dec a
	ld [wBuffer3], a
	ld b, a
	ld a, [wMenuCursorY]
	dec a
	ld [wBuffer2], a
	cp b
	jr z, .skip

	ld a, [wBuffer2] ; pid
	call GetPairIDMask
	; it target is already our pair, stop
	ld b, a
	ld a, [wBuffer3] ; bulb
	cp b
	jr z, .skip
	; if target already has pair, go to its pair and reset it
	ld a, b
	cp $7 ; 7 indicates no pair
	call nz, .TargetHasPair
	call .CheckCompatibility
	jr z, .skip
	; puts bulb index into pid trait
	ld a, [wBuffer2] ; pid
	ld c, a
	ld a, [wBuffer3] ; bulb
	call GivePairIDMask

	call GetPairIDMask
	; it target is already our pair, stop
	ld b, a
	ld a, [wBuffer2] ; pid
	cp b
	jr z, .skip
	; if target already has pair, go to its pair and reset it
	ld a, b
	cp $7 ; 7 indicates no pair
	call nz, .TargetHasPair
	; puts pid index into bulb trait
	ld a, [wBuffer3] ; bulb
	ld c, a
	ld a, [wBuffer2] ; pid
	call GivePairIDMask
.skip
	ret

.TargetHasPair:
	push hl
	call GetPairIDMask
	ld a, $7
	call GivePairIDMask
	pop hl
	ret

.CheckCompatibility: ; _PairMons.CheckCompatibility
	; get trait 1
	ld a, [wBuffer2]
	call .GetTrait
	call .GetGroup
	ld d, a ; save group 1 in d

	ld a, [wBuffer3]
	call .GetTrait
	call .GetGroup
	cp d
	ret nz ; compatible
	and a ; group 0 is always compatible
	jr z, .compatible

	ld hl, TraitText_PairIncompatible
	call PrintText
.compatible
	xor a
	ret

.GetGroup:
	ld hl, TraitCompatibility
	ld b, 0
	ld c, a
	add hl, bc
	inc hl
	ld a, BANK(TraitCompatibility)
	call GetFarByte
	ret

.GetTrait:
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	ld [wCurSpecies], a
	call GetBaseData
	call GetTraitFromBaseStats1 ; todo
	add a ; double a
	ret

TraitText_PairIncompatible:
	text "Pair's traits are"
	line "not compatible."
	prompt
