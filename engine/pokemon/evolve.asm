EvolvePokemon:
	ld hl, wEvolvableFlags
	xor a
	ld [hl], a
	ld a, [wCurPartyMon]
	ld c, a
	ld b, SET_FLAG
	call EvoFlagAction
EvolveAfterBattle:
	xor a
	ld [wMonTriedToEvolve], a
	dec a
	ld [wCurPartyMon], a
	push hl
	push bc
	push de
	ld hl, wPartyCount

	push hl

EvolveAfterBattle_MasterLoop:
	ld hl, wCurPartyMon
	inc [hl]

	pop hl

	inc hl
	ld a, [hl]
	cp $ff
	jp z, .ReturnToMap

	ld [wEvolutionOldSpecies], a

	push hl
	ld a, [wCurPartyMon]
	ld c, a
	ld hl, wEvolvableFlags
	ld b, CHECK_FLAG
	call EvoFlagAction
	ld a, c
	and a
	jp z, EvolveAfterBattle_MasterLoop

	ld a, [wEvolutionOldSpecies]
	dec a
	ld b, 0
	ld c, a
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarHalfword

	push hl
	xor a
	ld [wMonType], a
	predef CopyMonToTempMon
	pop hl

.loop
	ld a, [hli]
	and a
	jr z, EvolveAfterBattle_MasterLoop

	ld b, a

	cp EVOLVE_TRADE
	jr z, .trade

	ld a, [wLinkMode]
	and a
	jp nz, .dont_evolve_2

	ld a, b
	cp EVOLVE_ITEM
	jp z, .item

	ld a, [wForceEvolution]
	and a
	jp nz, .dont_evolve_2

	ld a, b
	cp EVOLVE_LEVEL
	jp z, .level

	cp EVOLVE_HAPPINESS
	jr z, .happiness

; EVOLVE_STAT
	ld a, [wTempMonLevel]
	cp [hl]
	jp c, .dont_evolve_1

	call IsMonHoldingEverstone
	jp z, .dont_evolve_1

	push hl
	ld de, wTempMonAttack
	ld hl, wTempMonDefense
	ld c, 2
	call CompareBytes
	ld a, ATK_EQ_DEF
	jr z, .got_tyrogue_evo
	ld a, ATK_LT_DEF
	jr c, .got_tyrogue_evo
	ld a, ATK_GT_DEF
.got_tyrogue_evo
	pop hl

	inc hl
	cp [hl]
	jp nz, .dont_evolve_2

	inc hl
	jr .proceed

.happiness
	ld a, [wTempMonHappiness]
	cp HAPPINESS_TO_EVOLVE
	jp c, .dont_evolve_2

	call IsMonHoldingEverstone
	jp z, .dont_evolve_2

	ld a, [hli]
	cp TR_ANYTIME
	jr z, .proceed
	cp TR_MORNDAY
	jr z, .happiness_daylight

; TR_NITE
	ld a, [wTimeOfDay]
	cp NITE_F
	jp nz, .dont_evolve_3
	jr .proceed

.happiness_daylight
	ld a, [wTimeOfDay]
	cp NITE_F
	jp z, .dont_evolve_3
	jr .proceed

.trade
	ld a, [wLinkMode]
	and a
	jp z, .dont_evolve_2

	call IsMonHoldingEverstone
	jp z, .dont_evolve_2

	ld a, [hli]
	ld b, a
	inc a
	jr z, .proceed

	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jp z, .dont_evolve_3

	ld a, [wTempMonItem]
	cp b
	jp nz, .dont_evolve_3

	xor a
	ld [wTempMonItem], a
	jr .proceed

.item
	ld a, [hli]
	ld b, a
	ld a, [wCurItem]
	cp b
	jp nz, .dont_evolve_3

	ld a, [wForceEvolution]
	and a
	jp z, .dont_evolve_3
	ld a, [wLinkMode]
	and a
	jp nz, .dont_evolve_3
	jr .proceed

.level
	ld a, [hli]
	ld b, a ; b = evolution level
	ld a, [wTempMonLevel]
	cp b
	jp c, .dont_evolve_3
	call IsMonHoldingEverstone
	jp z, .dont_evolve_3
	
.proceed
	ld a, [wTempMonLevel]
	ld [wCurPartyLevel], a
	ld a, $1
	ld [wMonTriedToEvolve], a

	push hl

	ld a, [hl]
	ld [wEvolutionNewSpecies], a
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNick
	call CopyName1
	ld hl, Text_WhatEvolving
	call PrintText

	ld c, 50
	call DelayFrames

	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	lb bc, 12, 20
	call ClearBox

	ld a, $1
	ldh [hBGMapMode], a
	call ClearSprites

	farcall EvolutionAnimation

	push af
	call ClearSprites
	pop af
	jp c, CancelEvolution

	ld hl, Text_CongratulationsYourPokemon
	call PrintText

	pop hl

	ld a, [hl]
	ld [wCurSpecies], a
	ld [wTempMonSpecies], a
	ld [wEvolutionNewSpecies], a
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName

	push hl
	ld hl, Text_EvolvedIntoPKMN
	call PrintTextBoxText
	farcall StubbedTrainerRankings_MonsEvolved

	ld de, MUSIC_NONE
	call PlayMusic
	ld de, SFX_CAUGHT_MON
	call PlaySFX
	call WaitSFX

	ld c, 40
	call DelayFrames

	call ClearTileMap
	call UpdateSpeciesNameIfNotNicknamed
	call GetBaseData

	ld hl, wTempMonExp + 2
	ld de, wTempMonMaxHP
	ld b, TRUE
	ld a, 1
	ld [$8010], a
	predef CalcMonStats

	ld a, [wCurPartyMon]
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld e, l
	ld d, h
	ld bc, MON_MAXHP
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wTempMonMaxHP + 1
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a
	ld hl, wTempMonHP + 1
	ld a, [hl]
	add c
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hl], a

	ld hl, wTempMonSpecies
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes

	ld a, [wCurSpecies]
	ld [wTempSpecies], a
	xor a
	ld [wMonType], a
	farcall LearnEvolutionMove
	call LearnLevelMoves
	ld a, [wTempSpecies]
	dec a
	call SetSeenAndCaughtMon

	ld a, [wTempSpecies]
	cp UNOWN
	jr nz, .skip_unown

	ld hl, wTempMonDVs
	predef GetUnownLetter
	callfar UpdateUnownDex

.skip_unown
	pop de
	pop hl
	ld a, [wTempMonSpecies]
	ld [hl], a
	push hl
	ld l, e
	ld h, d
	jp EvolveAfterBattle_MasterLoop

.dont_evolve_1
	inc hl
.dont_evolve_2
	inc hl
.dont_evolve_3
	inc hl
	jp .loop

.ReturnToMap:
	pop de
	pop bc
	pop hl
	ld a, [wLinkMode]
	and a
	ret nz
	ld a, [wBattleMode]
	and a
	ret nz
	ld a, [wMonTriedToEvolve]
	and a
	call nz, RestartMapMusic
	ret

UpdateSpeciesNameIfNotNicknamed:
	ld a, [wCurSpecies]
	push af
	ld a, [wBaseDexNo]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	pop af
	ld [wCurSpecies], a
	ld hl, wStringBuffer1
	ld de, wStringBuffer2
.loop
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	ret nz
	cp "@"
	jr nz, .loop

	ld a, [wCurPartyMon]
	ld bc, MON_NAME_LENGTH
	ld hl, wPartyMonNicknames
	call AddNTimes
	push hl
	ld a, [wCurSpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wStringBuffer1
	pop de
	ld bc, MON_NAME_LENGTH
	jp CopyBytes

CancelEvolution:
	ld hl, Text_StoppedEvolving
	call PrintText
	call ClearTileMap
	pop hl
	jp EvolveAfterBattle_MasterLoop

IsMonHoldingEverstone:
	push hl
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	cp EVERSTONE
	pop hl
	ret

Text_CongratulationsYourPokemon:
	; Congratulations! Your @ @
	text_jump _CongratulationsYourPokemonText
	db "@"

Text_EvolvedIntoPKMN:
	; evolved into @ !
	text_jump _EvolvedIntoText
	db "@"

Text_StoppedEvolving:
	; Huh? @ stopped evolving!
	text_jump _StoppedEvolvingText
	db "@"

Text_WhatEvolving:
	; What? @ is evolving!
	text_jump _EvolvingText
	db "@"

LearnLevelMoves:
	ld a, [wTempSpecies]
	ld [wCurPartySpecies], a
	dec a
	ld b, 0
	ld c, a
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarHalfword

.skip_evos
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	and a
	jr nz, .skip_evos

.find_move
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	and a
	jr z, .done

	ld b, a
	ld a, [wCurPartyLevel]
	cp b
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	jr nz, .find_move

	push hl
	ld d, a
	ld hl, wPartyMon1Moves
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes

	ld b, NUM_MOVES
.check_move
	ld a, [hli]
	cp d
	jr z, .has_move
	dec b
	jr nz, .check_move
	jr .learn
.has_move

	pop hl
	jr .find_move

.learn
	ld a, d
	ld [wPutativeTMHMMove], a
	ld [wNamedObjectIndexBuffer], a
	ld e, a
	predef IsVariableMove
	jr nc, .not_variable
	farcall GetVariableMoveType
.not_variable
	call GetMoveName
	call CopyName1
	predef LearnMove
	pop hl
	jr .find_move

.done
	ld a, [wCurPartySpecies]
	ld [wTempSpecies], a
	ret
	
FillEggMove:
	push hl
	push de
	push bc
	call GetPreEvolution
	call GetPreEvolution
; Random common egg move based on mon type
	call Random
	cp 25 percent
	jr nc, .not_common_egg

	ld a, [wCurPartySpecies]
	; dec a
	ld hl, BaseData + BASE_TYPES
	ld bc, BASE_DATA_SIZE
	call AddNTimes
; get either type 1 or type 2
	call Random
	cp 50 percent
	jr nc, .got_type
	inc hl
.got_type
	ld a, BANK(BaseData)
	call GetFarByte
	ld c, a ; type in c
	ld hl, CommonEggMovesByType
.loop_egg_by_types
	ld a, BANK("Egg Moves")
	call GetFarByte
	inc hl
	cp -2
	jr z, .not_common_egg
	cp c
	jr z, .got_moves_pointer
.next_type
	ld a, BANK("Egg Moves")
	call GetFarByte
	inc hl
	cp -1
	jr nz, .next_type
	jr .loop_egg_by_types

.not_common_egg ; get egg move of specific pokemon
	ld hl, EggMovePointers
	ld a, [wCurPartySpecies]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, BANK(EggMovePointers)
	call GetFarHalfword
	
	; FillEggMove.count_moves_loop
.got_moves_pointer
	push hl
	dec hl
	ld c, 0
.count_moves_loop
	inc c
	inc hl
; limit move index by mon level
; can learn the next index every 5 levels
	ld a, [wCurPartyLevel]
	call SimpleDivide
	cp 5
	jr nc, .reached_end

	ld a, BANK("Egg Moves")
	call GetFarByte
	cp -1	
	jr nz, .count_moves_loop

.reached_end
	pop hl
; higher chance of giving moves from 1st and 2nd slot in the egg moves list
; 50% chance of being the first half moves (rounded down)
; 50% chance of any move
	call Random
	cp 50 percent
	jr c, .high_moves
	srl c ; halves current list count 
; get move between 1 and max
.high_moves
	ld a, c
	call RandomRange

; go to hl according to move number
.get_position
	ld c, a
	ld b, 0
	add hl, bc

; get move from hl
	ld a, BANK("Egg Moves")
	call GetFarByte
.got_move_id
	ld b, a ; this is our move
	ld c, NUM_MOVES
.loop ; finds first slot that isn't empty (or last slot)
	ld a, [de]
	and a
	jr z, .LearnMove
	inc de
	dec c
	jr nz, .loop
; if all moves are filled, go back to move 1
	dec de
	dec de
	dec de
	dec de
.LearnMove
	ld a, b
	cp $FF
	jp z, .no_moves
	ld [de], a
; set pp (gets set after FillMoves)
; 	ld a, [wCurVariableMove]
; 	cp -1
; 	jr z, .not_variable
; 	ld hl, VarMoves + MOVE_PP
; 	jr .got_move_data

; .not_variable
; 	ld a, b
; 	dec a
; 	ld hl, Moves + MOVE_PP
; .got_move_data
; 	ld bc, MOVE_LENGTH
; 	call AddNTimes
; 	ld a, BANK(Moves)
; 	call GetFarByte
	; mon's moves is in [de], we move 21 bytes forward to the PP bytes
	; ld h, 0
	; ld l, 21
	; add hl, de
	; ld [hl], a
.no_moves
	pop bc
	pop de
	pop hl
	ld a, [wTempSpecies]
	ld [wCurPartySpecies], a
	ret

FillMoves:
; Fill in moves at de for wCurPartySpecies at wCurPartyLevel
	push hl
	push de
	push bc

	ld hl, EvosAttacksPointers
	ld b, 0
	ld a, [wCurPartySpecies]
	dec a
	add a
	rl b
	ld c, a
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarHalfword
.GoToAttacks:
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	and a
	jr nz, .GoToAttacks
	jr .GetLevel

.NextMove:
	pop de
.GetMove:
	inc hl
.GetLevel:
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	and a
	jp z, .done
	ld b, a
	ld a, [wCurPartyLevel]
	cp b
	jp c, .done
	ld a, [wEvolutionOldSpecies]
	and a
	jr z, .CheckMove
	ld a, [wd002]
	cp b
	jr nc, .GetMove

.CheckMove:
	push de
	ld c, NUM_MOVES
.CheckRepeat:
	ld a, [de]
	ld b, a
	inc de
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	cp b
	jr z, .NextMove
	dec c
	jr nz, .CheckRepeat
	pop de
	push de
	ld c, NUM_MOVES
.CheckSlot:
	ld a, [de]
	and a
	jr z, .LearnMove
	inc de
	dec c
	jr nz, .CheckSlot
	pop de
	push de
	push hl
	ld h, d
	ld l, e
	; call ShiftMoves
	ld c, NUM_MOVES - 1
.loop_1
	inc de
	ld a, [de]
	ld [hli], a
	dec c
	jr nz, .loop_1

	ld a, [wEvolutionOldSpecies]
	and a
	jr z, .ShiftedMove
	push de
	ld bc, wPartyMon1PP - (wPartyMon1Moves + NUM_MOVES - 1)
	add hl, bc
	ld d, h
	ld e, l
	; call ShiftMoves

	ld c, NUM_MOVES - 1
.loop_2
	inc de
	ld a, [de]
	ld [hli], a
	dec c
	jr nz, .loop_2

	pop de

.ShiftedMove:
	pop hl

.LearnMove: ; FillMoves.LearnMove
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	ld [de], a
	ld a, [wEvolutionOldSpecies]
	and a
	jr z, .NextMove
	
	push hl	
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	ld hl, MON_PP - MON_MOVES
	add hl, de
	push hl
	ld e, a
	farcall IsVariableMove
	jr nc, .not_variable
	farcall GetVariableMoveType
	jr nc, .not_variable
	ld a, e
	ld hl, VarMoves + MOVE_PP
	jr .got_move_pointer
.not_variable
	ld a, e
	dec a
	ld hl, Moves + MOVE_PP
.got_move_pointer
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop hl
	ld [hl], a
	pop hl
	jp .NextMove

.done ; FillMoves.done
	pop bc
	pop de
	pop hl
; if first mon is the same as the wild one, adds 10% egg move chance
	ld a, [wCurPartySpecies]
	ld b, a
	ld a, [wPartyMon1Species]
	cp b
	ld b, 10 percent
	jr z, .equal_mons
	ld b, 0
.equal_mons
; 7% chance to have egg move in a lucky battle
	ld a, [wLuckyWild]
	and a
	jr z, .notLucky
	ld a, 7 percent
	add b
	ld b, a
	call Random
	cp b
	ret nc
	jp FillEggMove

.notLucky
; 3% chance to have egg move in a normal battle
	ld a, 3 percent 
	add b
	ld b, a
	call Random
	cp b
	ret nc
	jp FillEggMove

ShiftMoves:
	ld c, NUM_MOVES - 1
.loop
	inc de
	ld a, [de]
	ld [hli], a
	dec c
	jr nz, .loop
	ret

EvoFlagAction:
	push de
	ld d, $0
	predef SmallFarFlagAction
	pop de
	ret
	
GetPreEvolution:
; Find the first mon to evolve into wCurPartySpecies.

; Return carry and the new species in wCurPartySpecies
; if a pre-evolution is found.

	ld c, 0
.loop ; For each Pokemon...
	ld hl, EvosAttacksPointers
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarHalfword
.loop2 ; For each evolution...
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	and a
	jr z, .no_evolve ; If we jump, this Pokemon does not evolve into wCurPartySpecies.
	cp EVOLVE_STAT ; This evolution type has the extra parameter of stat comparison.
	jr nz, .not_tyrogue
	inc hl

.not_tyrogue
	inc hl ; skip level
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	ld b, a
	ld a, [wCurPartySpecies]
	cp b
	jr z, .found_preevo
	inc hl
	ld a, [hl]
	and a
	jr nz, .loop2

.no_evolve
	inc c
	ld a, c
	cp NUM_POKEMON
	jr c, .loop
	and a
	ret

.found_preevo
	inc c
	ld a, c
	ld [wCurPartySpecies], a
	scf
	ret
