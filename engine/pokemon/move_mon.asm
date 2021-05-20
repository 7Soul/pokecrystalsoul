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

	ld a, [wMonType]
	and $f
	jr z, .generate_trait

	push hl
	farcall GetTrainerDVs
	pop hl
	ld a, b
	push hl
.mod_3
	cp 3
	jr c, .ok_mod
	sub 3
	jr .mod_3
.ok_mod
	ld hl, wBaseTraits
	ld b, 0
	ld c, a
	add hl, bc
	jr .got_trait

.generate_trait
	push hl
	; Generate a trait
	ld hl, wBaseTraits
	call Random
	cp 30 percent ; 30%
	jr c, .got_trait
	inc hl
	cp 60 percent ; 30%
	jr c, .got_trait
	inc hl
	cp 85 percent ; 25%
	jr c, .got_trait
	inc hl ; 15%
.got_trait
	ld a, [hl]
.set_trait
	ld [de], a
	inc de
	pop hl
.copy_moves
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
	ld a, b
	push hl
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
	jp nz, .copywildmonDVs

.generateDVs: ; for given pokémon
; Generate Unown letter
	push hl
	ld a, $1A ; 0 to 25
	call RandomRange
	inc a
	ld h, d
	ld l, e
	ld [hl], a

.TryShiny
	call Random
	cp 5 percent ; 4.7%
	jr nc, .TryGender
	call Random
	cp 5 percent ; 4.7%
	jr nc, .TryGender
; 0.11%
	call Random
	cp 50 percent
	jr nc, .TryGender

.set_shiny
	ld h, d
	ld l, e
	set DV_SHINY_BIT, [hl] ; set shiny bit

.TryGender
	call Random
	ld b, a
	push bc
	ld a, [wCurSpecies]
	dec a
	ld hl, BaseData + BASE_GENDER
	ld bc, BASE_DATA_SIZE
	call AddNTimes
	pop bc
	ld a, BANK(BaseData)
	call GetFarByte

	ld h, d
	ld l, e

	cp GENDER_UNKNOWN
	jr z, .end_gender

	and a ; GENDER_F0?
	jr z, .Male

	cp GENDER_F100
	jr z, .Female

; Values below the ratio are male, and vice versa.
	cp b
	jr c, .Male

.Female
	set 6, [hl] ; set gender bit
	jr .end_gender

.Male
	res 6, [hl] ; unset gender bit
	jr .end_gender

.end_gender
	ld a, [hl]

.initializeDVs
	ld [de], a
	inc de

	; Stamina
	ld a, STA_MAX
	ld [de], a
	inc de
.end_dvs
	; Initialize PP.
	pop hl
	push hl
	push de
	inc hl
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

	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a

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
	ld a, [wEnemyMonStamina]
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

.generatestats ; GeneratePartyMonStats.generatestats
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
	push hl
	push de
	push bc
	ld [wCurSpecies], a
	ld e, a
	farcall IsVariableMove
	jr nc, .not_variable
	farcall GetVariableMoveType
	jr nc, .not_variable
	ld a, e
	ld hl, VarMoves
	jr .got_move_pointer
.not_variable
	ld a, e
	dec a
	ld hl, Moves
.got_move_pointer
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
	ld bc, 1 + 1 + 1 + NUM_MOVES ; species + item + trait + moves
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
	ld a, c
	ld [wBuffer1], a
	ld a, b
	ld d, a
	push hl
	ld hl, wBaseStats
	dec hl ; has to be decreased, because 'c' begins with 1
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld e, a ; base stat

	push hl
	ld a, [wCurSpecies]
	cp TYROGUE
	jr nz, .not_tyrogue
	ld a, MON_DVS
	call GetPartyParamLocation
	ld a, c
	cp STAT_ATK
	jr z, .tyr_atk
	cp STAT_DEF
	jr z, .tyr_def
	jr .not_tyrogue
.tyr_atk
	ld a, [hl]
	and %11111
	cp 8
	jr nc, .not_tyrogue
	inc e ; raise ATK by 1
	jr .not_tyrogue
.tyr_def
	ld a, [hl]
	and %11111
	cp 16
	jr c, .not_tyrogue
	inc e ; raise DEF by 1
.not_tyrogue

; Start unevolved bonus
	ld hl, .UnevolvedBonus
.load_species
	ld a, [wCurSpecies]
	ld c, a

.find_mon
	ld a, [hli]
	cp c
	jr z, .found_mon
	cp -1
	jp z, .get_normal_stats
	inc hl
	inc hl
	jr .find_mon

.found_mon ; CalcMonStatC.found_mon
	ld a, [hli] ; get level from table
	ld c, a
	ld a, [wCurPartyLevel]
	cp c
	jp c, .get_normal_stats
	sub c
	ld b, a ; b has level difference

; get first or second form
	ld a, [hl]
	and %11
	and a ; cp UNEVOLVED_STAGE1OF2
	ld a, 20 ; first for of 2-line
	jr z, .got_form
	ld a, [hl]
    and %11
	cp UNEVOLVED_STAGE1OF3 ; baby or first of 3-line
	jr z, .baby_form
	ld a, 30 ; second form or 3-line
	jr .got_form
.baby_form
	ld a, 16 ; first form of a 3-line
.got_form
	push de
	ld d, a
	ld a, e
	ldh [hMultiplicand + 2], a ; for multiplication later

; Get mon level difference / 5
	ld a, b
	cp 50
	jr c, .under50
	ld a, 50
.under50
	ld c, 5
	call SimpleDivide
	inc b

	ld a, [hl]
	and %111100
	rra
	rra
	ld c, a
	ld a, [wBuffer1]
	cp c
	jr nz, .not_highest_stat
    ; reduces the division done later by 4
	dec d
	dec d
	dec d
	dec d
    cp STAT_HP
    jr nz, .not_highest_stat
    ld a, b
	ld c, a
	ld a, 3
	call SimpleMultiply
    ld b, a
.not_highest_stat
	ld a, [wBuffer1]
	cp STAT_HP
	jr z, .bonus_hp

; Multiply base stat by difference tiers
	xor a
	ldh [hMultiplicand + 1], a
	ldh [hMultiplicand + 0], a
	ld a, b
	ldh [hMultiplier], a
	call Multiply
; Divide by 20 or 30 (to get to 0.05 per 5 levels or 0.033 for second forms)
	ld a, d
	pop de
	ldh [hDivisor], a
	ld b, 4
	call Divide
; Add base stat and stat bonus
	ldh a, [hQuotient + 3]
	add e
.end_bonus
	ld e, a
	pop hl
	jr .try_stat_exp

.bonus_hp
	pop de
	ld a, b
	ld c, a
	ld a, 2
	call SimpleMultiply
	add e
	jr .end_bonus

.get_normal_stats
	pop hl
	ld a, [hl]
	ld e, a

.try_stat_exp
	pop hl ; STAT_EXP
	push hl
	ld a, [wBuffer1]
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

	ld a, 0
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

	ld a, [wBuffer1]
	cp STAT_HP
	ld a, STAT_MIN_NORMAL
	jr nz, .not_hp
	; ld a, $78 ; ~0.86
	; call ApplyDamageMod

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
	; ld a, c
	; ld [wBattleMonStat], a ; save current stat for later

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

.UnevolvedBonus:
	; species, level it evolves at, number to define bonus amount
	;
	db BULBASAUR,  16, UNEVOLVED_STAGE1OF3 | STAT_SDEF << 2
	db IVYSAUR,    32, UNEVOLVED_STAGE2OF3 | STAT_SDEF << 2
	db CHARMANDER, 16, UNEVOLVED_STAGE1OF3 | STAT_SPD  << 2
	db CHARMELEON, 36, UNEVOLVED_STAGE2OF3 | STAT_SPD  << 2
	db SQUIRTLE,   16, UNEVOLVED_STAGE1OF3 | STAT_DEF  << 2
	db WARTORTLE,  36, UNEVOLVED_STAGE2OF3 | STAT_DEF  << 2
	db CATERPIE,    7, UNEVOLVED_STAGE1OF3 | STAT_HP   << 2
	db METAPOD,    10, UNEVOLVED_STAGE2OF3 | STAT_HP   << 2
	db WEEDLE,      7, UNEVOLVED_STAGE1OF3 | STAT_SPD  << 2
	db KAKUNA,     10, UNEVOLVED_STAGE2OF3 | STAT_SPD  << 2
	db PIDGEY,     18, UNEVOLVED_STAGE1OF3 | STAT_SPD  << 2
	db PIDGEOTTO,  36, UNEVOLVED_STAGE2OF3 | STAT_SPD  << 2
	db RATTATA,    20, UNEVOLVED_STAGE1OF2 | STAT_SPD  << 2
	db SPEAROW,    20, UNEVOLVED_STAGE1OF2 | STAT_SPD  << 2
	db EKANS,      22, UNEVOLVED_STAGE1OF2 | STAT_ATK  << 2
	db PIKACHU,    20, UNEVOLVED_STAGE1OF2 | STAT_SPD  << 2
	db SANDSHREW,  22, UNEVOLVED_STAGE1OF2 | STAT_DEF  << 2
	db NIDORAN_F,  16, UNEVOLVED_STAGE1OF3 | STAT_DEF  << 2
	db NIDORINA,   32, UNEVOLVED_STAGE2OF3 | STAT_DEF  << 2
	db NIDORAN_M,  16, UNEVOLVED_STAGE1OF3 | STAT_ATK  << 2
	db NIDORINO,   32, UNEVOLVED_STAGE2OF3 | STAT_ATK  << 2
	db CLEFAIRY,   20, UNEVOLVED_STAGE2OF3 | STAT_SDEF << 2
	db VULPIX,     20, UNEVOLVED_STAGE1OF2 | STAT_SDEF << 2
	db JIGGLYPUFF, 20, UNEVOLVED_STAGE2OF3 | STAT_HP   << 2
	db ZUBAT,      22, UNEVOLVED_STAGE1OF3 | STAT_SPD  << 2
	db GOLBAT,     42, UNEVOLVED_STAGE2OF3 | STAT_SDEF << 2
	db ODDISH,     21, UNEVOLVED_STAGE1OF2 | STAT_SATK << 2
	db GLOOM,      41, UNEVOLVED_STAGE2OF3 | STAT_SATK << 2
	db PARAS,      24, UNEVOLVED_STAGE1OF2 | STAT_ATK  << 2
	db VENONAT,    27, UNEVOLVED_STAGE1OF2 | STAT_SPD  << 2
	db DIGLETT,    26, UNEVOLVED_STAGE1OF2 | STAT_SPD  << 2
	db MEOWTH,     28, UNEVOLVED_STAGE1OF2 | STAT_SPD  << 2
	db PSYDUCK,    33, UNEVOLVED_STAGE1OF2 | STAT_SATK << 2
	db MANKEY,     28, UNEVOLVED_STAGE1OF2 | STAT_ATK  << 2
	db GROWLITHE,  20, UNEVOLVED_STAGE1OF2 | STAT_ATK  << 2
	db POLIWAG,    25, UNEVOLVED_STAGE1OF3 | STAT_ATK  << 2
	db POLIWHIRL,  45, UNEVOLVED_STAGE2OF3 | STAT_ATK  << 2
	db ABRA,       16, UNEVOLVED_STAGE1OF3 | STAT_SATK << 2
	db KADABRA,    32, UNEVOLVED_STAGE2OF3 | STAT_SATK << 2
	db MACHOP,     28, UNEVOLVED_STAGE1OF3 | STAT_ATK  << 2
	db MACHOKE,    42, UNEVOLVED_STAGE2OF3 | STAT_ATK  << 2
	db BELLSPROUT, 21, UNEVOLVED_STAGE1OF3 | STAT_ATK  << 2
	db WEEPINBELL, 41, UNEVOLVED_STAGE2OF3 | STAT_ATK  << 2
	db TENTACOOL,  30, UNEVOLVED_STAGE1OF2 | STAT_SDEF << 2
	db GEODUDE,    25, UNEVOLVED_STAGE1OF3 | STAT_DEF  << 2
	db GRAVELER,   37, UNEVOLVED_STAGE2OF3 | STAT_DEF  << 2
	db PONYTA,     40, UNEVOLVED_STAGE1OF2 | STAT_SPD  << 2
	db SLOWPOKE,   30, UNEVOLVED_STAGE1OF2 | STAT_DEF  << 2
	db MAGNEMITE,  30, UNEVOLVED_STAGE1OF2 | STAT_SATK << 2
	db DODUO,      31, UNEVOLVED_STAGE1OF2 | STAT_ATK  << 2
	db SEEL,       34, UNEVOLVED_STAGE1OF2 | STAT_SDEF << 2
	db GRIMER,     38, UNEVOLVED_STAGE1OF2 | STAT_SDEF << 2
	db SHELLDER,   20, UNEVOLVED_STAGE1OF2 | STAT_DEF  << 2
	db GASTLY,     25, UNEVOLVED_STAGE1OF3 | STAT_SATK << 2
	db HAUNTER,    37, UNEVOLVED_STAGE2OF3 | STAT_SATK << 2
	db ONIX,       26, UNEVOLVED_STAGE1OF2 | STAT_DEF  << 2
	db DROWZEE,    26, UNEVOLVED_STAGE1OF2 | STAT_SDEF << 2
	db KRABBY,     22, UNEVOLVED_STAGE1OF2 | STAT_ATK  << 2
	db VOLTORB,    30, UNEVOLVED_STAGE1OF2 | STAT_SPD  << 2
	db EXEGGCUTE,  20, UNEVOLVED_STAGE1OF2 | STAT_SATK << 2
	db CUBONE,     28, UNEVOLVED_STAGE1OF2 | STAT_DEF  << 2
	db KOFFING,    35, UNEVOLVED_STAGE1OF2 | STAT_DEF  << 2
	db RHYHORN,    42, UNEVOLVED_STAGE1OF2 | STAT_ATK  << 2
	db CHANSEY,    40, UNEVOLVED_STAGE1OF2 | STAT_SATK << 2
	db HORSEA,     20, UNEVOLVED_STAGE1OF3 | STAT_SATK << 2
	db SEADRA,     40, UNEVOLVED_STAGE2OF3 | STAT_SDEF << 2
	db GOLDEEN,    33, UNEVOLVED_STAGE1OF2 | STAT_ATK  << 2
	db STARYU,     20, UNEVOLVED_STAGE1OF2 | STAT_SPD  << 2
	db SCYTHER,    36, UNEVOLVED_STAGE1OF2 | STAT_ATK  << 2
	db MAGIKARP,   20, UNEVOLVED_STAGE1OF2 | STAT_ATK  << 2
	db EEVEE,      20, UNEVOLVED_STAGE1OF2 | STAT_SPD  << 2
	db PORYGON,    20, UNEVOLVED_STAGE1OF2 | STAT_SATK << 2
	db OMANYTE,    35, UNEVOLVED_STAGE1OF2 | STAT_DEF  << 2
	db KABUTO,     35, UNEVOLVED_STAGE1OF2 | STAT_ATK  << 2
	db DRATINI,    25, UNEVOLVED_STAGE1OF3 | STAT_ATK  << 2
	db CHIKORITA,  16, UNEVOLVED_STAGE1OF3 | STAT_SDEF << 2
	db BAYLEEF,    34, UNEVOLVED_STAGE2OF3 | STAT_SDEF << 2
	db CYNDAQUIL,  15, UNEVOLVED_STAGE1OF3 | STAT_SATK << 2
	db QUILAVA,    36, UNEVOLVED_STAGE2OF3 | STAT_SATK << 2
	db TOTODILE,   17, UNEVOLVED_STAGE1OF3 | STAT_ATK  << 2
	db CROCONAW,   32, UNEVOLVED_STAGE2OF3 | STAT_ATK  << 2
	db SENTRET,    15, UNEVOLVED_STAGE1OF2 | STAT_HP   << 2
	db HOOTHOOT,   20, UNEVOLVED_STAGE1OF2 | STAT_HP   << 2
	db LEDYBA,     20, UNEVOLVED_STAGE1OF2 | STAT_ATK  << 2
	db SPINARAK,   22, UNEVOLVED_STAGE1OF2 | STAT_ATK  << 2
	db CHINCHOU,   27, UNEVOLVED_STAGE1OF2 | STAT_HP   << 2
	db PICHU,      15, UNEVOLVED_STAGE1OF3 | STAT_SPD  << 2
	db CLEFFA,     15, UNEVOLVED_STAGE1OF3 | STAT_SDEF << 2
	db IGGLYBUFF,  15, UNEVOLVED_STAGE1OF3 | STAT_SDEF << 2
	db TOGEPI,     15, UNEVOLVED_STAGE1OF3 | STAT_SDEF << 2
	db NATU,       25, UNEVOLVED_STAGE1OF2 | STAT_SATK << 2
	db MAREEP,     15, UNEVOLVED_STAGE1OF3 | STAT_SATK << 2
	db FLAAFFY,    30, UNEVOLVED_STAGE2OF3 | STAT_SATK << 2
	db MARILL,     18, UNEVOLVED_STAGE1OF2 | STAT_HP   << 2
	db HOPPIP,     18, UNEVOLVED_STAGE1OF3 | STAT_SPD  << 2
	db SKIPLOOM,   27, UNEVOLVED_STAGE2OF3 | STAT_SPD  << 2
	db SUNKERN,    20, UNEVOLVED_STAGE1OF2 | STAT_HP   << 2
	db WOOPER,     20, UNEVOLVED_STAGE1OF2 | STAT_HP   << 2
	db PINECO,     31, UNEVOLVED_STAGE1OF2 | STAT_DEF  << 2
	db SNUBBULL,   23, UNEVOLVED_STAGE1OF2 | STAT_ATK  << 2
	db TEDDIURSA,  30, UNEVOLVED_STAGE1OF2 | STAT_ATK  << 2
	db SLUGMA,     26, UNEVOLVED_STAGE1OF2 | STAT_DEF  << 2
	db SWINUB,     26, UNEVOLVED_STAGE1OF2 | STAT_ATK  << 2
	db REMORAID,   25, UNEVOLVED_STAGE1OF2 | STAT_SATK << 2
	db HOUNDOUR,   24, UNEVOLVED_STAGE1OF2 | STAT_SATK << 2
	db PHANPY,     25, UNEVOLVED_STAGE1OF2 | STAT_ATK  << 2
	db TYROGUE,    16, UNEVOLVED_STAGE1OF3 | STAT_ATK  << 2
	db SMOOCHUM,   22, UNEVOLVED_STAGE1OF3 | STAT_SATK << 2
	db ELEKID,     22, UNEVOLVED_STAGE1OF3 | STAT_SPD  << 2
	db MAGBY,      22, UNEVOLVED_STAGE1OF3 | STAT_SATK << 2
	db LARVITAR,   30, UNEVOLVED_STAGE1OF3 | STAT_ATK  << 2
	db PUPITAR,    50, UNEVOLVED_STAGE2OF3 | STAT_DEF  << 2
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
