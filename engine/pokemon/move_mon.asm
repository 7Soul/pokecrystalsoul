TryAddMonToParty:
; Check if to copy wild mon or generate a new one
	; Whose is it?
	ld de, wPartyCount
	ld a, [wMonType]
	and $f
	jr z, .getpartylocation ; PARTYMON
	ld de, wOTPartyCount

.getpartylocation
	; Do we have room for it?
	ld a, [de]
	inc a
	cp PARTY_LENGTH + 1
	ret nc
	; Increase the party count
	ld [de], a
	ld a, [de] ; Why are we doing this?
	ldh [hMoveMon], a ; HRAM backup
	add e
	ld e, a
	jr nc, .loadspecies
	inc d

.loadspecies
	; Load the species of the Pokemon into the party list.
	; The terminator is usually here, but it'll be back.
	ld a, [wCurPartySpecies]
	ld [de], a
	; Load the terminator into the next slot.
	inc de
	ld a, -1
	ld [de], a
	; Now let's load the OT name.
	ld hl, wPartyMonOT
	ld a, [wMonType]
	and $f
	jr z, .loadOTname
	ld hl, wOTPartyMonOT

.loadOTname
	ldh a, [hMoveMon] ; Restore index from backup
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	; Only initialize the nickname for party mon
	ld a, [wMonType]
	and a
	jr nz, .skipnickname
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wPartyMonNicknames
	ldh a, [hMoveMon]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wStringBuffer1
	ld bc, MON_NAME_LENGTH
	call CopyBytes

.skipnickname
	ld hl, wPartyMon1Species
	ld a, [wMonType]
	and $f
	jr z, .initializeStats
	ld hl, wOTPartyMon1Species

.initializeStats
	ldh a, [hMoveMon]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
GeneratePartyMonStats:
; wBattleMode specifies whether it's a wild mon or not.
; wMonType specifies whether it's an opposing mon or not.
; wCurPartySpecies/wCurPartyLevel specify the species and level.
; hl points to the wPartyMon struct to fill.

	ld e, l
	ld d, h
	push hl

	; Initialize the species
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wBaseDexNo]
	ld [de], a
	inc de

	; Copy the item if it's a wild mon
	ld a, [wBattleMode]
	and a
	ld a, $0
	jr z, .skipitem
	ld a, [wEnemyMonItem]
.skipitem
	ld [de], a
	inc de

	; Copy the moves if it's a wild mon
	push de
	ld h, d
	ld l, e
	ld a, [wBattleMode]
	and a
	jr z, .randomlygeneratemoves
	ld a, [wMonType]
	and a
	jr nz, .randomlygeneratemoves
	ld de, wEnemyMonMoves
rept NUM_MOVES + -1
	ld a, [de]
	inc de
	ld [hli], a
endr
	ld a, [de]
	ld [hl], a
	jr .next

.randomlygeneratemoves
	xor a
rept NUM_MOVES + -1
	ld [hli], a
endr
	ld [hl], a
	ld [wBuffer1], a
	predef FillMoves

.next
	pop de
rept NUM_MOVES
	inc de
endr

	; Initialize ID.
	ld a, [wPlayerID]
	ld [de], a
	inc de
	ld a, [wPlayerID + 1]
	ld [de], a
	inc de

	; Initialize Exp.
	push de
	ld a, [wCurPartyLevel]
	ld d, a
	callfar CalcExpAtLevel
	pop de
	ldh a, [hProduct + 1]
	ld [de], a
	inc de
	ldh a, [hProduct + 2]
	ld [de], a
	inc de
	ldh a, [hProduct + 3]
	ld [de], a
	inc de

	; Initialize stat experience.
	xor a
	ld b, MON_DVS - MON_STAT_EXP
.loop
	ld [de], a
	inc de
	dec b
	jr nz, .loop

	pop hl
	push hl
	ld a, [wMonType]
	and $f
	jr z, .registerpokedex

	push hl
	farcall GetTrainerDVs
	pop hl
	jr .initializeDVs

.registerpokedex
	ld a, [wCurPartySpecies]
	ld [wTempSpecies], a
	dec a
	push de
	call CheckCaughtMon
	ld a, [wTempSpecies]
	dec a
	call SetSeenAndCaughtMon
	pop de

	pop hl
	push hl
	ld a, [wBattleMode]
	and a
	jr nz, .copywildmonDVs

	call Random
	ld b, a
	call Random
	ld c, a
.initializeDVs
	ld a, b
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de

	; Initialize PP.
	push hl
	push de
	inc hl
	inc hl
	call FillPP
	pop de
	pop hl
rept NUM_MOVES
	inc de
endr

	; Initialize happiness.
	ld a, BASE_HAPPINESS
	ld [de], a
	inc de

	xor a
	; PokerusStatus
	ld [de], a
	inc de
	; CaughtData/CaughtTime/CaughtLevel
	ld [de], a
	inc de
	; CaughtGender/CaughtLocation
	ld [de], a
	inc de

	; Initialize level.
	ld a, [wCurPartyLevel]
	ld [de], a
	inc de

	xor a
	; Status
	ld [de], a
	inc de
	; Unused
	ld [de], a
	inc de

	; Initialize HP.
	ld bc, MON_STAT_EXP - 1
	add hl, bc
	ld a, 1
	ld c, a
	ld b, FALSE
	call CalcMonStatC
	ldh a, [hProduct + 2]
	ld [de], a
	inc de
	ldh a, [hProduct + 3]
	ld [de], a
	inc de
	jr .initstats

.copywildmonDVs
	ld a, [wEnemyMonDVs]
	ld [de], a
	inc de
	ld a, [wEnemyMonDVs + 1]
	ld [de], a
	inc de

	push hl
	ld hl, wEnemyMonPP
	ld b, NUM_MOVES
.wildmonpploop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .wildmonpploop
	pop hl

	; Initialize happiness.
	ld a, BASE_HAPPINESS
	ld [de], a
	inc de

	xor a
	; PokerusStatus
	ld [de], a
	inc de
	; CaughtData/CaughtTime/CaughtLevel
	ld [de], a
	inc de
	; CaughtGender/CaughtLocation
	ld [de], a
	inc de

	; Initialize level.
	ld a, [wCurPartyLevel]
	ld [de], a
	inc de

	ld hl, wEnemyMonStatus
	; Copy wEnemyMonStatus
	ld a, [hli]
	ld [de], a
	inc de
	; Copy EnemyMonUnused
	ld a, [hli]
	ld [de], a
	inc de
	; Copy wEnemyMonHP
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de

.initstats
	ld a, [wBattleMode]
	dec a
	jr nz, .generatestats
	ld hl, wEnemyMonMaxHP
	ld bc, PARTYMON_STRUCT_LENGTH - MON_MAXHP
	call CopyBytes
	pop hl
	jr .registerunowndex

.generatestats
	pop hl
	ld bc, MON_STAT_EXP - 1
	add hl, bc
	ld b, FALSE
	ld a, 0
	ld [$8010], a
	call CalcMonStats

.registerunowndex
	ld a, [wMonType]
	and $f
	jr nz, .done
	ld a, [wCurPartySpecies]
	cp UNOWN
	jr nz, .done
	ld hl, wPartyMon1DVs
	ld a, [wPartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	predef GetUnownLetter
	callfar UpdateUnownDex

.done
	scf ; When this function returns, the carry flag indicates success vs failure.
	ret

FillPP:
	push bc
	ld b, NUM_MOVES
.loop
	ld a, [hli]
	and a
	jr z, .next
	dec a
	push hl
	push de
	push bc
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, wStringBuffer1
	ld a, BANK(Moves)
	call FarCopyBytes
	pop bc
	pop de
	pop hl
	ld a, [wStringBuffer1 + MOVE_PP]

.next
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	pop bc
	ret

AddTempmonToParty:
	ld hl, wPartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	scf
	ret z

	inc a
	ld [hl], a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wCurPartySpecies]
	ld [hli], a
	ld [hl], $ff

	ld hl, wPartyMon1Species
	ld a, [wPartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wTempMonSpecies
	call CopyBytes

	ld hl, wPartyMonOT
	ld a, [wPartyCount]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wOTPartyMonOT
	ld a, [wCurPartyMon]
	call SkipNames
	ld bc, NAME_LENGTH
	call CopyBytes

	ld hl, wPartyMonNicknames
	ld a, [wPartyCount]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wOTPartyMonNicknames
	ld a, [wCurPartyMon]
	call SkipNames
	ld bc, MON_NAME_LENGTH
	call CopyBytes

	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndexBuffer], a
	cp EGG
	jr z, .egg
	dec a
	call SetSeenAndCaughtMon
	ld hl, wPartyMon1Happiness
	ld a, [wPartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld [hl], BASE_HAPPINESS
.egg

	ld a, [wCurPartySpecies]
	cp UNOWN
	jr nz, .done
	ld hl, wPartyMon1DVs
	ld a, [wPartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	predef GetUnownLetter
	callfar UpdateUnownDex
	ld a, [wFirstUnownSeen]
	and a
	jr nz, .done
	ld a, [wUnownLetter]
	ld [wFirstUnownSeen], a
.done

	and a
	ret

SendGetMonIntoFromBox:
; Sents/Gets mon into/from Box depending on Parameter
; wPokemonWithdrawDepositParameter == 0: get mon into Party
; wPokemonWithdrawDepositParameter == 1: sent mon into Box
; wPokemonWithdrawDepositParameter == 2: get mon from DayCare
; wPokemonWithdrawDepositParameter == 3: put mon into DayCare

	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .check_IfPartyIsFull
	cp DAY_CARE_WITHDRAW
	jr z, .check_IfPartyIsFull
	cp DAY_CARE_DEPOSIT
	ld hl, wBreedMon1Species
	jr z, .breedmon

	; we want to sent a mon into the Box
	; so check if there's enough space
	ld hl, sBoxCount
	ld a, [hl]
	cp MONS_PER_BOX
	jr nz, .there_is_room
	jp CloseSRAM_And_SetCarryFlag

.check_IfPartyIsFull
	ld hl, wPartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	jp z, CloseSRAM_And_SetCarryFlag

.there_is_room
	inc a
	ld [hl], a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wPokemonWithdrawDepositParameter]
	cp DAY_CARE_WITHDRAW
	ld a, [wBreedMon1Species]
	jr z, .okay1
	ld a, [wCurPartySpecies]

.okay1
	ld [hli], a
	ld [hl], $ff
	ld a, [wPokemonWithdrawDepositParameter]
	dec a
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wPartyCount]
	jr nz, .okay2
	ld hl, sBoxMon1Species
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, [sBoxCount]

.okay2
	dec a ; wPartyCount - 1
	call AddNTimes

.breedmon
	push hl
	ld e, l
	ld d, h
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	ld hl, sBoxMon1Species
	ld bc, BOXMON_STRUCT_LENGTH
	jr z, .okay3
	cp DAY_CARE_WITHDRAW
	ld hl, wBreedMon1Species
	jr z, .okay4
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH

.okay3
	ld a, [wCurPartyMon]
	call AddNTimes

.okay4
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [wPokemonWithdrawDepositParameter]
	cp DAY_CARE_DEPOSIT
	ld de, wBreedMon1OT
	jr z, .okay5
	dec a
	ld hl, wPartyMonOT
	ld a, [wPartyCount]
	jr nz, .okay6
	ld hl, sBoxMonOT
	ld a, [sBoxCount]

.okay6
	dec a
	call SkipNames
	ld d, h
	ld e, l

.okay5
	ld hl, sBoxMonOT
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .okay7
	ld hl, wBreedMon1OT
	cp DAY_CARE_WITHDRAW
	jr z, .okay8
	ld hl, wPartyMonOT

.okay7
	ld a, [wCurPartyMon]
	call SkipNames

.okay8
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wPokemonWithdrawDepositParameter]
	cp DAY_CARE_DEPOSIT
	ld de, wBreedMon1Nick
	jr z, .okay9
	dec a
	ld hl, wPartyMonNicknames
	ld a, [wPartyCount]
	jr nz, .okay10
	ld hl, sBoxMonNicknames
	ld a, [sBoxCount]

.okay10
	dec a
	call SkipNames
	ld d, h
	ld e, l

.okay9
	ld hl, sBoxMonNicknames
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .okay11
	ld hl, wBreedMon1Nick
	cp DAY_CARE_WITHDRAW
	jr z, .okay12
	ld hl, wPartyMonNicknames

.okay11
	ld a, [wCurPartyMon]
	call SkipNames

.okay12
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	pop hl

	ld a, [wPokemonWithdrawDepositParameter]
	cp PC_DEPOSIT
	jr z, .took_out_of_box
	cp DAY_CARE_DEPOSIT
	jp z, .CloseSRAM_And_ClearCarryFlag

	push hl
	srl a
	add $2
	ld [wMonType], a
	predef CopyMonToTempMon
	callfar CalcLevel
	ld a, d
	ld [wCurPartyLevel], a
	pop hl

	ld b, h
	ld c, l
	ld hl, MON_LEVEL
	add hl, bc
	ld [hl], a
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, MON_STAT_EXP - 1
	add hl, bc

	push bc
	ld b, TRUE
	ld a, 0
	ld [$8010], a
	call CalcMonStats
	pop bc

	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr nz, .CloseSRAM_And_ClearCarryFlag
	ld hl, MON_STATUS
	add hl, bc
	xor a
	ld [hl], a
	ld hl, MON_HP
	add hl, bc
	ld d, h
	ld e, l
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	inc hl
	inc hl
	ld a, [hli]
	ld [de], a
	ld a, [hl]
	inc de
	ld [de], a
	jr .CloseSRAM_And_ClearCarryFlag

.egg
	xor a
	ld [de], a
	inc de
	ld [de], a
	jr .CloseSRAM_And_ClearCarryFlag

.took_out_of_box
	ld a, [sBoxCount]
	dec a
	ld b, a
	call RestorePPOfDepositedPokemon
.CloseSRAM_And_ClearCarryFlag:
	call CloseSRAM
	and a
	ret

CloseSRAM_And_SetCarryFlag:
	call CloseSRAM
	scf
	ret

RestorePPOfDepositedPokemon:
	ld a, b
	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
	call AddNTimes
	ld b, h
	ld c, l
	ld hl, MON_PP
	add hl, bc
	push hl
	push bc
	ld de, wTempMonPP
	ld bc, NUM_MOVES
	call CopyBytes
	pop bc
	ld hl, MON_MOVES
	add hl, bc
	push hl
	ld de, wTempMonMoves
	ld bc, NUM_MOVES
	call CopyBytes
	pop hl
	pop de

	ld a, [wMenuCursorY]
	push af
	ld a, [wMonType]
	push af
	ld b, 0
.loop
	ld a, [hli]
	and a
	jr z, .done
	ld [wTempMonMoves], a
	ld a, BOXMON
	ld [wMonType], a
	ld a, b
	ld [wMenuCursorY], a
	push bc
	push hl
	push de
	farcall GetMaxPPOfMove
	pop de
	pop hl
	ld a, [wTempPP]
	ld b, a
	ld a, [de]
	and %11000000
	add b
	ld [de], a
	pop bc
	inc de
	inc b
	ld a, b
	cp NUM_MOVES
	jr c, .loop

.done
	pop af
	ld [wMonType], a
	pop af
	ld [wMenuCursorY], a
	ret

RetrieveMonFromDayCareMan:
	ld a, [wBreedMon1Species]
	ld [wCurPartySpecies], a
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	call GetBreedMon1LevelGrowth
	ld a, b
	ld [wd002], a
	ld a, e
	ld [wCurPartyLevel], a
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	jp RetrieveBreedmon

RetrieveMonFromDayCareLady:
	ld a, [wBreedMon2Species]
	ld [wCurPartySpecies], a
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	call GetBreedMon2LevelGrowth
	ld a, b
	ld [wd002], a
	ld a, e
	ld [wCurPartyLevel], a
	ld a, PC_DEPOSIT
	ld [wPokemonWithdrawDepositParameter], a
	jp RetrieveBreedmon

RetrieveBreedmon:
	ld hl, wPartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	jr nz, .room_in_party
	scf
	ret

.room_in_party
	inc a
	ld [hl], a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	ld a, [wBreedMon1Species]
	ld de, wBreedMon1Nick
	jr z, .okay
	ld a, [wBreedMon2Species]
	ld de, wBreedMon2Nick

.okay
	ld [hli], a
	ld [wCurSpecies], a
	ld a, $ff
	ld [hl], a
	ld hl, wPartyMonNicknames
	ld a, [wPartyCount]
	dec a
	call SkipNames
	push hl
	ld h, d
	ld l, e
	pop de
	call CopyBytes
	push hl
	ld hl, wPartyMonOT
	ld a, [wPartyCount]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	pop hl
	call CopyBytes
	push hl
	call GetLastPartyMon
	pop hl
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	call GetBaseData
	call GetLastPartyMon
	ld b, d
	ld c, e
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [wCurPartyLevel]
	ld [hl], a
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, $a
	add hl, bc
	push bc
	ld b, TRUE
	ld a, 0
	ld [$8010], a
	call CalcMonStats
	ld hl, wPartyMon1Moves
	ld a, [wPartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld a, $1
	ld [wBuffer1], a
	predef FillMoves
	ld a, [wPartyCount]
	dec a
	ld [wCurPartyMon], a
	farcall HealPartyMon
	ld a, [wCurPartyLevel]
	ld d, a
	callfar CalcExpAtLevel
	pop bc
	ld hl, $8
	add hl, bc
	ldh a, [hMultiplicand]
	ld [hli], a
	ldh a, [hMultiplicand + 1]
	ld [hli], a
	ldh a, [hMultiplicand + 2]
	ld [hl], a
	and a
	ret

GetLastPartyMon:
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ret

DepositMonWithDayCareMan:
	ld de, wBreedMon1Nick
	call DepositBreedmon
	xor a ; REMOVE_PARTY
	ld [wPokemonWithdrawDepositParameter], a
	jp RemoveMonFromPartyOrBox

DepositMonWithDayCareLady:
	ld de, wBreedMon2Nick
	call DepositBreedmon
	xor a ; REMOVE_PARTY
	ld [wPokemonWithdrawDepositParameter], a
	jp RemoveMonFromPartyOrBox

DepositBreedmon:
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call SkipNames
	call CopyBytes
	ld a, [wCurPartyMon]
	ld hl, wPartyMonOT
	call SkipNames
	call CopyBytes
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld bc, BOXMON_STRUCT_LENGTH
	jp CopyBytes

SendMonIntoBox:
; Sends the mon into one of Bills Boxes
; the data comes mainly from 'wEnemyMon:'
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld de, sBoxCount
	ld a, [de]
	cp MONS_PER_BOX
	jp nc, .full
	inc a
	ld [de], a

	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	ld c, a
.loop
	inc de
	ld a, [de]
	ld b, a
	ld a, c
	ld c, b
	ld [de], a
	inc a
	jr nz, .loop

	call GetBaseData
	call ShiftBoxMon

	ld hl, wPlayerName
	ld de, sBoxMonOT
	ld bc, NAME_LENGTH
	call CopyBytes

	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName

	ld de, sBoxMonNicknames
	ld hl, wStringBuffer1
	ld bc, MON_NAME_LENGTH
	call CopyBytes

	ld hl, wEnemyMon
	ld de, sBoxMon1
	ld bc, 1 + 1 + NUM_MOVES ; species + item + moves
	call CopyBytes

	ld hl, wPlayerID
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	push de
	ld a, [wCurPartyLevel]
	ld d, a
	callfar CalcExpAtLevel
	pop de
	ldh a, [hProduct + 1]
	ld [de], a
	inc de
	ldh a, [hProduct + 2]
	ld [de], a
	inc de
	ldh a, [hProduct + 3]
	ld [de], a
	inc de

	; Set all 5 Experience Values to 0
	xor a
	ld b, 2 * 5
.loop2
	ld [de], a
	inc de
	dec b
	jr nz, .loop2

	ld hl, wEnemyMonDVs
	ld b, 2 + NUM_MOVES ; DVs and PP ; wEnemyMonHappiness - wEnemyMonDVs
.loop3
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop3

	ld a, BASE_HAPPINESS
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld a, [wCurPartyLevel]
	ld [de], a
	ld a, [wCurPartySpecies]
	dec a
	call SetSeenAndCaughtMon
	ld a, [wCurPartySpecies]
	cp UNOWN
	jr nz, .not_unown
	ld hl, sBoxMon1DVs
	predef GetUnownLetter
	callfar UpdateUnownDex

.not_unown
	ld hl, sBoxMon1Moves
	ld de, wTempMonMoves
	ld bc, NUM_MOVES
	call CopyBytes

	ld hl, sBoxMon1PP
	ld de, wTempMonPP
	ld bc, NUM_MOVES
	call CopyBytes

	ld b, 0
	call RestorePPOfDepositedPokemon

	call CloseSRAM
	scf
	ret

.full
	call CloseSRAM
	and a
	ret

ShiftBoxMon:
	ld hl, sBoxMonOT
	ld bc, NAME_LENGTH
	call .shift

	ld hl, sBoxMonNicknames
	ld bc, MON_NAME_LENGTH
	call .shift

	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH

.shift
	ld a, [sBoxCount]
	cp 2
	ret c

	push hl
	call AddNTimes
	dec hl
	ld e, l
	ld d, h
	pop hl

	ld a, [sBoxCount]
	dec a
	call AddNTimes
	dec hl

	push hl
	ld a, [sBoxCount]
	dec a
	ld hl, 0
	call AddNTimes
	ld c, l
	ld b, h
	pop hl
.loop
	ld a, [hld]
	ld [de], a
	dec de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

GiveEgg::
	ld a, [wCurPartySpecies]
	push af
	callfar GetPreEvolution
	callfar GetPreEvolution
	ld a, [wCurPartySpecies]
	dec a

; TryAddMonToParty sets Seen and Caught flags
; when it is successful.  This routine will make
; sure that we aren't newly setting flags.
	push af
	call CheckCaughtMon
	pop af
	push bc
	call CheckSeenMon
	push bc

	call TryAddMonToParty

; If we haven't caught this Pokemon before receiving
; the Egg, reset the flag that was just set by
; TryAddMonToParty.
	pop bc
	ld a, c
	and a
	jr nz, .skip_caught_flag
	ld a, [wCurPartySpecies]
	dec a
	ld c, a
	ld d, $0
	ld hl, wPokedexCaught
	ld b, RESET_FLAG
	predef SmallFarFlagAction

.skip_caught_flag
; If we haven't seen this Pokemon before receiving
; the Egg, reset the flag that was just set by
; TryAddMonToParty.
	pop bc
	ld a, c
	and a
	jr nz, .skip_seen_flag
	ld a, [wCurPartySpecies]
	dec a
	ld c, a
	ld d, $0
	ld hl, wPokedexSeen
	ld b, RESET_FLAG
	predef SmallFarFlagAction

.skip_seen_flag
	pop af
	ld [wCurPartySpecies], a
	ld a, [wPartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Species
	call AddNTimes
	ld a, [wCurPartySpecies]
	ld [hl], a
	ld hl, wPartyCount
	ld a, [hl]
	ld b, 0
	ld c, a
	add hl, bc
	ld a, EGG
	ld [hl], a
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonNicknames
	call SkipNames
	ld de, String_Egg
	call CopyName2
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [wDebugFlags]
	bit DEBUG_FIELD_F, a
	ld a, 1
	jr nz, .got_init_happiness
	ld a, [wBaseEggSteps]

.got_init_happiness
	ld [hl], a
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1HP
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	xor a
	ld [hli], a
	ld [hl], a
	and a
	ret

String_Egg:
	db "EGG@"

RemoveMonFromPartyOrBox:
	ld hl, wPartyCount

	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .okay

	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount

.okay
	ld a, [hl]
	dec a
	ld [hli], a
	ld a, [wCurPartyMon]
	ld c, a
	ld b, 0
	add hl, bc
	ld e, l
	ld d, h
	inc de
.loop
	ld a, [de]
	inc de
	ld [hli], a
	inc a
	jr nz, .loop
	ld hl, wPartyMonOT
	ld d, PARTY_LENGTH - 1
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .party
	ld hl, sBoxMonOT
	ld d, MONS_PER_BOX - 1

.party
	; If this is the last mon in our party (box),
	; shift all the other mons up to close the gap.
	ld a, [wCurPartyMon]
	call SkipNames
	ld a, [wCurPartyMon]
	cp d
	jr nz, .delete_inside
	ld [hl], -1
	jp .finish

.delete_inside
	; Shift the OT names
	ld d, h
	ld e, l
	ld bc, MON_NAME_LENGTH
	add hl, bc
	ld bc, wPartyMonNicknames
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .party2
	ld bc, sBoxMonNicknames
.party2
	call CopyDataUntil
	; Shift the struct
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .party4
	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
.party4
	ld a, [wCurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .party5
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	ld bc, sBoxMonOT
	jr .copy

.party5
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	ld bc, wPartyMonOT
.copy
	call CopyDataUntil
	; Shift the nicknames
	ld hl, wPartyMonNicknames
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .party6
	ld hl, sBoxMonNicknames
.party6
	ld bc, MON_NAME_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	ld bc, MON_NAME_LENGTH
	add hl, bc
	ld bc, wPartyMonNicknamesEnd
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .party7
	ld bc, sBoxMonNicknamesEnd
.party7
	call CopyDataUntil
	; Mail time!
.finish
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jp nz, CloseSRAM
	ld a, [wLinkMode]
	and a
	ret nz
	; Shift mail
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	; If this is the last mon in our party, no need to shift mail.
	ld hl, wPartyCount
	ld a, [wCurPartyMon]
	cp [hl]
	jr z, .close_sram
	; Shift our mail messages up.
	ld hl, sPartyMail
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	push hl
	add hl, bc
	pop de
	ld a, [wCurPartyMon]
	ld b, a
.loop2
	push bc
	push hl
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	pop hl
	push hl
	ld bc, MAIL_STRUCT_LENGTH
	add hl, bc
	pop de
	pop bc
	inc b
	ld a, [wPartyCount]
	cp b
	jr nz, .loop2
.close_sram
	jp CloseSRAM

ComputeNPCTrademonStats:
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	ld [MON_LEVEL], a ; wow
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld d, h
	ld e, l
	push de
	ld a, MON_STAT_EXP - 1
	call GetPartyParamLocation
	ld b, TRUE
	ld a, 0
	ld [$8010], a
	call CalcMonStats
	pop de
	ld a, MON_HP
	call GetPartyParamLocation
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ret

CalcMonStats:
; Calculates all 6 Stats of a mon
; b: Take into account stat EXP if TRUE
; 'c' counts from 1-6 and points with 'wBaseStats' to the base value
; hl is the path to the Stat EXP
; de points to where the final stats will be saved

	ld c, STAT_HP - 1 ; first stat
.loop
	inc c
	call CalcMonStatC
	ldh a, [hMultiplicand + 1]
	ld [de], a
	inc de
	ldh a, [hMultiplicand + 2]
	ld [de], a
	inc de
	ld a, c
	cp STAT_SDEF ; last stat
	jr nz, .loop
	ret

CalcMonStatC:
; 'c' is 1-6 and points to the BaseStat
; 1: HP
; 2: Attack
; 3: Defense
; 4: Speed
; 5: SpAtk
; 6: SpDef
	push hl
	push de
	push bc
	ld a, b
	ld d, a
	push hl
	ld hl, wBaseStats
	dec hl ; has to be decreased, because 'c' begins with 1
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld e, a
	pop hl
	push hl
	ld a, c
	cp STAT_SDEF ; last stat
	jr nz, .not_spdef
	dec hl
	dec hl

.not_spdef
	sla c
	ld a, d
	and a
	jr z, .no_stat_exp
	add hl, bc
	push de
	ld a, [hld]
	ld e, a
	ld d, [hl]
	farcall GetSquareRoot
	pop de

.no_stat_exp
	srl c
	pop hl
	push bc
	ld bc, MON_DVS - MON_HP_EXP + 1
	add hl, bc
	pop bc
	ld a, c
	cp STAT_ATK
	jr z, .Attack
	cp STAT_DEF
	jr z, .Defense
	cp STAT_SPD
	jr z, .Speed
	cp STAT_SATK
	jr z, .Special
	cp STAT_SDEF
	jr z, .Special
; DV_HP = (DV_ATK & 1) << 3 | (DV_DEF & 1) << 2 | (DV_SPD & 1) << 1 | (DV_SPC & 1)
	push bc
	ld a, [hl]
	swap a
	and 1
	add a
	add a
	add a
	ld b, a
	ld a, [hli]
	and 1
	add a
	add a
	add b
	ld b, a
	ld a, [hl]
	swap a
	and 1
	add a
	add b
	ld b, a
	ld a, [hl]
	and 1
	add b
	pop bc

	cp $d ; 15,14,13 turns to 10
	jr c, .dvMin1
	ld a, $a
	jr .dvMin2
.dvMin1
	cp $9 ; 11,10,9 turns to 9
	jr c, .dvMin2
	ld a, $9
.dvMin2
	cp $0 ; limit min DV to 1
	jr nz, .dvMax
	ld a, $1
.dvMax
	jr .GotDV

.Attack:
	ld a, [hl]
	swap a
	and $f
	jr .GotDV

.Defense:
	ld a, [hl]
	and $f
	jr .GotDV

.Speed:
	inc hl
	ld a, [hl]
	swap a
	and $f
	jr .GotDV

.Special:
	inc hl
	ld a, [hl]
	and $f

.GotDV:
	ld d, 0
	rl a
	add e
	ld e, a
	jr nc, .no_overflow_1
	inc d

.no_overflow_1
	sla e
	rl d
	srl b
	srl b
	ld a, b
	add e
	jr nc, .no_overflow_2
	inc d

.no_overflow_2
	ldh [hMultiplicand + 2], a
	ld a, d
	ldh [hMultiplicand + 1], a
	xor a
	ldh [hMultiplicand + 0], a
	ld a, [wCurPartyLevel]
	ldh [hMultiplier], a
	call Multiply
	ldh a, [hProduct + 1]
	ldh [hDividend + 0], a
	ldh a, [hProduct + 2]
	ldh [hDividend + 1], a
	ldh a, [hProduct + 3]
	ldh [hDividend + 2], a
	ld a, 150
	ldh [hDivisor], a
	ld a, 3
	ld b, a
	call Divide

	ld a, c	
	cp STAT_HP
	ld a, STAT_MIN_NORMAL
	jr nz, .not_hp
	; add level
	ld a, [wCurPartyLevel]
	ld b, a
	ldh a, [hQuotient + 3]
	add b
	ldh [hMultiplicand + 2], a
	; ---
	jr nc, .no_overflow_3
	ldh a, [hQuotient + 2]
	inc a
	ldh [hMultiplicand + 1], a

.no_overflow_3
	ld a, STAT_MIN_HP

.not_hp
	ld b, a
	ldh a, [hQuotient + 3]
	add b
	ldh [hMultiplicand + 2], a
	jr nc, .no_overflow_4
	ldh a, [hQuotient + 2]
	inc a
	ldh [hMultiplicand + 1], a
.no_overflow_4

 ; double stats if using held item
	ld a, c	
	ld [$C001], a
	ld hl, SimpleList3
	
.load_species
	ld a, [wCurSpecies]
	ld d, a
	
.find_mon
	ld a, [hli]
	cp d
	jr z, .found_mon
	cp -1
	jp z, .return_to_calc
	inc hl
	jr .find_mon

.found_mon
	ld a, [hli]
	ld d, a
	ld a, [wTempMonItem]
	ld e, a ; held item
	ld a, d ; item from table
	cp e
	jp z, .found_item
	jp .load_species

.found_item
	ld a, [$C001]
	cp STAT_ATK
	jr z, .loadAtkItems
	cp STAT_DEF
	jr z, .loadDefItems
	cp STAT_SPD
	jr z, .loadSpdItems
	cp STAT_SATK
	jr z, .loadSpAtkItems
	cp STAT_SDEF
	jr z, .loadSpDefItems
	cp STAT_HP
	jr z, .return_to_calc
	jp .return_to_calc
	
.loadAtkItems
	ld a, [hl]
	ld e, a
	jr .addStat
.loadSpAtkItems	
	inc hl
	ld a, [hl]
	ld e, a
	jr .addStat
.loadSpdItems
	inc hl
	inc hl
	ld a, [hl]
	ld e, a
	jr .addStat
.loadDefItems
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld e, a
	jr .addStat
.loadSpDefItems	
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld e, a
.addStat
	ld a, e
	cp 0 ; if 'e' is 0, double stat
	jp z, .double
	cp 1 ; if 'e' is 1, increase by 75%
	jp z, .inc_75p
	cp 2 ; if 'e' is 2, increase by 50%
	jp z, .inc_50p
	cp 5
	jp nc, .inc_50p
	jp .return_to_calc
	
.double
	ldh a, [hQuotient + 3]
	ld b, a
	add b ; add value back to itself (aka, double it)
	ldh [hMultiplicand + 2], a
	jp .return_to_calc
	
.inc_75p
	ldh a, [hQuotient + 3]
	srl a
	ld b, a
	ldh a, [hQuotient + 3]
	add b
	ld e, a
	ldh a, [hQuotient + 3]
	srl a
	srl a
	ld b, a
	ld a, e
	add b
	ldh [hMultiplicand + 2], a
	jp .return_to_calc
	
.inc_50p
	ldh a, [hQuotient + 3]
	srl a
	ld b, a
	ldh a, [hQuotient + 3]
	add b
	ldh [hMultiplicand + 2], a
	jp .return_to_calc
	
.inc_static; Increase stat by fixed number in 'e'
	ldh a, [hQuotient + 3]
	add e
	ldh [hMultiplicand + 2], a
	
.return_to_calc	
	ldh a, [hQuotient + 2]
	cp HIGH(MAX_STAT_VALUE + 1) + 1
	jr nc, .max_stat
	cp HIGH(MAX_STAT_VALUE + 1)
	jr c, .stat_value_okay
	ldh a, [hQuotient + 3]
	cp LOW(MAX_STAT_VALUE + 1)
	jr c, .stat_value_okay

.max_stat
	ld a, HIGH(MAX_STAT_VALUE)
	ldh [hMultiplicand + 1], a
	ld a, LOW(MAX_STAT_VALUE)
	ldh [hMultiplicand + 2], a

.stat_value_okay	
	pop bc
	pop de
	pop hl
	ret
	
SimpleList3:
	db CATERPIE,	TOUGH_HORN
	db CATERPIE,	CARAPACE
	db WEEDLE,		TOUGH_HORN
	db WEEDLE,		CARAPACE
	db SPINARAK,	TOUGH_HORN
	db SPINARAK,	CARAPACE
	db LEDYBA,		TOUGH_HORN
	db LEDYBA,		CARAPACE
	db PARAS,		TOUGH_HORN
	db PARAS,		CARAPACE
	db VENONAT,		TOUGH_HORN
	db VENONAT,		CARAPACE
	db PINECO,		TOUGH_HORN
	db PINECO,		CARAPACE
	db PIDGEY,		STEEL_WING
	db SPEAROW,		STEEL_WING
	db ZUBAT,		STEEL_WING
	db DODUO,		STEEL_WING
	db HOOTHOOT,	STEEL_WING
	db LEDYBA,		STEEL_WING
	db NATU,		STEEL_WING
	db HOPPIP,		STEEL_WING
	db PIKACHU,		BATTERY
	db VOLTORB,		BATTERY
	db PICHU,		BATTERY
	db MAREEP,		BATTERY
	db ELEKID,		BATTERY
	db MAGNEMITE,	BATTERY
	db CHINCHOU,	BATTERY
	db CHARMANDER,	CINDERS
	db VULPIX,		CINDERS
	db GROWLITHE,	CINDERS
	db PONYTA,		CINDERS
	db CYNDAQUIL,	CINDERS
	db SLUGMA,		CINDERS
	db MAGBY,		CINDERS
	db HOUNDOUR,	CINDERS
	db HOUNDOUR,	DARK_MIRROR
	db EKANS,		DARK_MIRROR
	db GRIMER,		DARK_MIRROR
	db KOFFING,		DARK_MIRROR
	db ZUBAT,		DARK_MIRROR
	db GASTLY,		DARK_MIRROR
	db MANKEY,		DUMBELL
	db MACHOP,		DUMBELL
	db TYROGUE,		DUMBELL
	db BULBASAUR,	GRASSWHISTLE
	db CHIKORITA,	GRASSWHISTLE
	db SUNKERN,		GRASSWHISTLE
	db ODDISH,		GRASSWHISTLE
	db BELLSPROUT,	GRASSWHISTLE
	db EXEGGCUTE,	GRASSWHISTLE
	db HOPPIP,		GRASSWHISTLE
	db PARAS,		GRASSWHISTLE
	db GEODUDE,		ACCELEROCK
	db ONIX,		ACCELEROCK
	db OMANYTE,		ACCELEROCK
	db KABUTO,		ACCELEROCK
	db RHYHORN,		ACCELEROCK
	db SANDSHREW,	HARDENEDSAND
	db DIGLETT,		HARDENEDSAND
	db CUBONE,		HARDENEDSAND
	db PHANPY,		HARDENEDSAND
	db RHYHORN,		HARDENEDSAND
	db NIDORAN_F,	HARDENEDSAND
	db NIDORAN_M,	HARDENEDSAND
	db SQUIRTLE,	SHINY_CORAL
	db PSYDUCK,		SHINY_CORAL
	db POLIWAG,		SHINY_CORAL
	db SEEL,		SHINY_CORAL
	db SHELLDER,	SHINY_CORAL
	db KRABBY,		SHINY_CORAL
	db HORSEA,		SHINY_CORAL
	db GOLDEEN,		SHINY_CORAL
	db STARYU,		SHINY_CORAL
	db MAGIKARP,	SHINY_CORAL
	db TOTODILE,	SHINY_CORAL
	db REMORAID,	SHINY_CORAL
	db TENTACOOL,	SHINY_CORAL
	db SLOWPOKE,	SHINY_CORAL
	db CHINCHOU,	SHINY_CORAL
	db MARILL,		SHINY_CORAL
	db WOOPER,		SHINY_CORAL
	db OMANYTE,		SHINY_CORAL
	db KABUTO,		SHINY_CORAL
	db RATTATA,		CUTE_RIBBON
	db MEOWTH,		CUTE_RIBBON
	db EEVEE,		CUTE_RIBBON
	db PORYGON,		CUTE_RIBBON
	db SENTRET,		CUTE_RIBBON
	db TEDDIURSA,	CUTE_RIBBON
	db JIGGLYPUFF,	CUTE_RIBBON
	db IGGLYBUFF,	CUTE_RIBBON
	db CLEFAIRY,	CUTE_RIBBON
	db CLEFFA,		CUTE_RIBBON
	db PIDGEY,		CUTE_RIBBON
	db SPEAROW,		CUTE_RIBBON
	db DODUO,		CUTE_RIBBON
	db SWINUB,		FROZEN_DEW
	db SEEL,		FROZEN_DEW
	db SHELLDER,	FROZEN_DEW
	db SMOOCHUM,	FROZEN_DEW
	db ABRA,		EYE_GLYPH
	db DROWZEE,		EYE_GLYPH
	db NATU,		EYE_GLYPH
	db SLOWPOKE,	EYE_GLYPH
	db EXEGGCUTE,	EYE_GLYPH
	db SMOOCHUM,	EYE_GLYPH
	db -1

GivePoke::
	push de
	push bc
	xor a ; PARTYMON
	ld [wMonType], a
	call TryAddMonToParty
	jr nc, .failed
	ld hl, wPartyMonNicknames
	ld a, [wPartyCount]
	dec a
	ld [wCurPartyMon], a
	call SkipNames
	ld d, h
	ld e, l
	pop bc
	ld a, b
	ld b, 0
	push bc
	push de
	push af
	ld a, [wCurItem]
	and a
	jr z, .done
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [wCurItem]
	ld [hl], a
	jr .done

.failed
	ld a, [wCurPartySpecies]
	ld [wTempEnemyMonSpecies], a
	callfar LoadEnemyMon
	call SendMonIntoBox
	jp nc, .FailedToGiveMon
	ld a, BOXMON
	ld [wMonType], a
	xor a
	ld [wCurPartyMon], a
	ld de, wMonOrItemNameBuffer
	pop bc
	ld a, b
	ld b, 1
	push bc
	push de
	push af
	ld a, [wCurItem]
	and a
	jr z, .done
	ld a, [wCurItem]
	ld [sBoxMon1Item], a

.done
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndexBuffer], a
	ld [wTempEnemyMonSpecies], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	pop af
	and a
	jp z, .wildmon
	pop de
	pop bc
	pop hl
	push bc
	push hl
	ld a, [wScriptBank]
	call GetFarHalfword
	ld bc, MON_NAME_LENGTH
	ld a, [wScriptBank]
	call FarCopyBytes
	pop hl
	inc hl
	inc hl
	ld a, [wScriptBank]
	call GetFarHalfword
	pop bc
	ld a, b
	and a
	push de
	push bc
	jr nz, .send_to_box

	push hl
	ld a, [wCurPartyMon]
	ld hl, wPartyMonOT
	call SkipNames
	ld d, h
	ld e, l
	pop hl
.otnameloop
	ld a, [wScriptBank]
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	cp "@"
	jr nz, .otnameloop
	ld a, [wScriptBank]
	call GetFarByte
	ld b, a
	push bc
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, HIGH(01001)
	ld [hli], a
	ld [hl], LOW(01001)
	pop bc
	farcall SetGiftPartyMonCaughtData
	jr .skip_nickname

.send_to_box
	ld a, BANK(sBoxMonOT)
	call GetSRAMBank
	ld de, sBoxMonOT
.loop
	ld a, [wScriptBank]
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	cp "@"
	jr nz, .loop
	ld a, [wScriptBank]
	call GetFarByte
	ld b, a
	ld hl, sBoxMon1ID
	call Random
	ld [hli], a
	call Random
	ld [hl], a
	call CloseSRAM
	farcall SetGiftBoxMonCaughtData
	jr .skip_nickname

.wildmon
	pop de
	pop bc
	push bc
	push de
	ld a, b
	and a
	jr z, .party
	farcall SetBoxMonCaughtData
	jr .set_caught_data

.party
	farcall SetCaughtData
.set_caught_data
	farcall GiveANickname_YesNo
	pop de
	jr c, .skip_nickname
	call InitNickname

.skip_nickname
	pop bc
	pop de
	ld a, b
	and a
	ret z
	ld hl, TextJump_WasSentToBillsPC
	call PrintText
	ld a, BANK(sBoxMonNicknames)
	call GetSRAMBank
	ld hl, wMonOrItemNameBuffer
	ld de, sBoxMonNicknames
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	call CloseSRAM
	ld b, $1
	ret

.FailedToGiveMon:
	pop bc
	pop de
	ld b, $2
	ret

TextJump_WasSentToBillsPC:
	; was sent to BILL's PC.
	text_jump Text_WasSentToBillsPC
	db "@"

InitNickname:
	push de
	call LoadStandardMenuHeader
	call DisableSpriteUpdates
	pop de
	push de
	ld b, NAME_MON
	farcall NamingScreen
	pop hl
	ld de, wStringBuffer1
	call InitName
	ld a, $4 ; ExitAllMenus is in bank 0, XXX could this be in bank 4 in pokered?
	ld hl, ExitAllMenus
	rst FarCall
	ret
