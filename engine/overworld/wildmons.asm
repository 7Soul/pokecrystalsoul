LoadWildMonData:
	call _GrassWildmonLookup
	jr c, .copy
	ld hl, wMornEncounterRate
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	jr .done_copy

.copy
	inc hl
	inc hl
	ld de, wMornEncounterRate
	ld bc, 3
	call CopyBytes
.done_copy
	call _WaterWildmonLookup
	ld a, 0
	jr nc, .no_copy
	inc hl
	inc hl
	ld a, [hl]
.no_copy
	ld [wWaterEncounterRate], a
	ret

FindNest:
; Parameters:
; e: 0 = Johto, 1 Johto Water, 2 = Kanto, 3 Kanto Water
; wNamedObjectIndexBuffer: species
	
	ld a, e
	cp 2
	jr nc, .kanto
	ld a, e
	and 1
	jr nz, .check_water
	decoord 0, 0
	ld hl, JohtoGrassWildMons
	call .FindGrass	
	jr .end
.check_water
	decoord 0, 0
	ld hl, JohtoShallowWildMons
	call .FindShallow
	ld hl, JohtoWaterWildMons
	call .FindWater
.end
	call .RoamMon1
	call .RoamMon2
	jp .RoamMon3

.kanto
	ld a, e
	and 1
	jr nz, .check_water_kanto
	decoord 0, 0
	ld hl, KantoGrassWildMons
	call .FindGrass
	jr .end_kanto
.check_water_kanto
	decoord 0, 0
	ld hl, KantoWaterWildMons
	call .FindWater
.end_kanto
	call .RoamMon4
	call .RoamMon5
	jp .RoamMon6

.FindGrass:
	ld a, 1
	ld [wBuffer2], a
	ld a, [hl]
	cp -1
	ret z
	push hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	inc hl ;
	inc hl ; skip encounter chance
	ld a, NUM_GRASSMON * 2
	call .SearchMapForMon
	jr nc, .next_grass
	ld b, a
	ld a, [wBuffer1]
	add b
	ld [de], a
	inc de

.next_grass
	pop hl
	ld bc, GRASS_WILDDATA_LENGTH
	add hl, bc
	jr .FindGrass
	
.FindShallow:
	ld a, 2
	ld [wBuffer2], a
	ld a, [hl]
	cp -1
	ret z
	push hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	inc hl
	inc hl
	ld a, NUM_SHALLOWMON * 2
	call .SearchMapForMon
	jr nc, .next_shallow
	ld b, a
	ld a, [wBuffer1]
	add b
	ld [de], a
	inc de

.next_shallow
	pop hl
	ld bc, SHALLOW_WILDDATA_LENGTH
	add hl, bc
	jr .FindShallow

.FindWater:
	ld a, 3
	ld [wBuffer2], a
	ld a, [hl]
	cp -1
	ret z
	push hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	inc hl
	ld a, NUM_WATERMON
	call .SearchMapForMon
	jr nc, .next_water
	ld b, a
	ld a, [wBuffer1]
	add b
	ld [de], a
	inc de

.next_water
	pop hl
	ld bc, WATER_WILDDATA_LENGTH
	add hl, bc
	jr .FindWater

.SearchMapForMon:
	inc hl ; skip level data
.ScanMapLoop:
	push af
	ld a, [wNamedObjectIndexBuffer]
	cp CYNDAQUIL
	jr nz, .n_cyndaquil
	ld a, CHARMANDER
.n_cyndaquil
	cp TOTODILE
	jr nz, .n_totodile
	ld a, SQUIRTLE
.n_totodile
	cp CHIKORITA
	jr nz, .n_bulba
	ld a, BULBASAUR
.n_bulba
	cp WEEDLE
	jr nz, .n_caterpie
	ld a, CATERPIE
.n_caterpie
	cp NIDORAN_M
	jr nz, .n_nidoran
	ld a, NIDORAN_F
.n_nidoran
	cp KABUTO
	jr nz, .n_omanyte
	ld a, OMANYTE	
.n_omanyte
	ld [wTempSpecies], a
	cp [hl]
	jr z, .found
	inc hl
	inc hl
	pop af
	dec a
	jr nz, .ScanMapLoop
	and a
	ret

.found
	pop af
	push af
	push bc
	ld b, a
	ld a, [wBuffer2]
	dec a
	jr z, .grass_size_check
	dec a
	jr z, .shallow_size_check
; fallthrough
	ld a, b
	cp 3
	jr c, .smallnest ; 
	jr .bignest

.shallow_size_check
	ld a, b
	cp 4
	jr c, .smallnest ; 
	cp 7
	jr c, .bignest ; end of day data
	cp $A
	jr c, .smallnest
	jr .bignest
	
.grass_size_check
	ld a, b
	cp 5
	jr c, .smallnest ; 
	cp 8
	jr c, .bignest ; end of day data
	cp $C
	jr c, .smallnest
; fallthrough
.bignest
	ld a, NEST_SIZE_MASK
	jr .got_size
.smallnest
	xor a
.got_size
	ld [wBuffer1], a
	pop bc
	pop af
	jp .AppendNest

.AppendNest:
	push de
	call GetWorldMapLocation
	ld c, a
	hlcoord 0, 0
	ld de, SCREEN_WIDTH * SCREEN_HEIGHT
.AppendNestLoop:
	ld a, [hli]
	cp c
	jr z, .found_nest
	dec de
	ld a, e
	or d
	jr nz, .AppendNestLoop
	ld a, c
	pop de
	scf
	ret

.found_nest
	pop de
	and a
	ret

.RoamMon1:
	ld a, [wRoamMon1Species]
	ld b, a
	ld a, [wNamedObjectIndexBuffer]
	cp b
	ret nz
	ld a, [wRoamMon1MapGroup]
	ld b, a
	ld a, [wRoamMon1MapNumber]
	ld c, a
	call .AppendNest
	ret nc
	ld [de], a
	inc de
	ret

.RoamMon2:
	ld a, [wRoamMon2Species]
	ld b, a
	ld a, [wNamedObjectIndexBuffer]
	cp b
	ret nz
	ld a, [wRoamMon2MapGroup]
	ld b, a
	ld a, [wRoamMon2MapNumber]
	ld c, a
	call .AppendNest
	ret nc
	ld [de], a
	inc de
	ret

.RoamMon3:
	ld a, [wRoamMon3Species]
	ld b, a
	ld a, [wNamedObjectIndexBuffer]
	cp b
	ret nz
	ld a, [wRoamMon3MapGroup]
	ld b, a
	ld a, [wRoamMon3MapNumber]
	ld c, a
	call .AppendNest
	ret nc
	ld [de], a
	inc de
	ret

.RoamMon4:
	ld a, [wRoamMon4Species]
	ld b, a
	ld a, [wNamedObjectIndexBuffer]
	cp b
	ret nz
	ld a, [wRoamMon4MapGroup]
	ld b, a
	ld a, [wRoamMon4MapNumber]
	ld c, a
	call .AppendNest
	ret nc
	ld [de], a
	inc de
	ret

.RoamMon5:
	ld a, [wRoamMon5Species]
	ld b, a
	ld a, [wNamedObjectIndexBuffer]
	cp b
	ret nz
	ld a, [wRoamMon5MapGroup]
	ld b, a
	ld a, [wRoamMon5MapNumber]
	ld c, a
	call .AppendNest
	ret nc
	ld [de], a
	inc de
	ret

.RoamMon6:
	ld a, [wRoamMon6Species]
	ld b, a
	ld a, [wNamedObjectIndexBuffer]
	cp b
	ret nz
	ld a, [wRoamMon6MapGroup]
	ld b, a
	ld a, [wRoamMon6MapNumber]
	ld c, a
	call .AppendNest
	ret nc
	ld [de], a
	inc de
	ret

; FindNest2:
; ; Parameters:
; ; e: 0 = Johto, 1 = Kanto
; ; wNamedObjectIndexBuffer: species
; 	hlcoord 0, 0
; 	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
; 	xor a
; 	call ByteFill
; 	ld a, e
; 	and a
; 	jr nz, .kanto
; 	decoord 0, 0
; 	ld hl, JohtoGrassRareWildMons
; 	call .FindSwarm
; 	ret

; .kanto
; 	decoord 0, 0
; 	ld hl, KantoGrassRareWildMons
; 	call .FindSwarm

; .FindSwarm:
; 	ld a, [hl]
; 	cp -1
; 	ret z
; 	push hl
; 	ld a, [hli]
; 	ld c, a ; c has swarm map landmark

; 	inc hl ; go to pokemon species
; 	call .CheckSwarmMonMatch
; 	jr nc, .next_swarm
; 	ld [de], a
; 	inc de

; .next_swarm
; 	pop hl
; 	ld bc, $3
; 	add hl, bc
; 	jr .FindSwarm
	
; .CheckSwarmMonMatch:
; 	push af
; 	ld a, [wNamedObjectIndexBuffer]
; 	cp CYNDAQUIL
; 	jr nz, .n_cyndaquil
; 	ld a, CHARMANDER
; .n_cyndaquil
; 	cp TOTODILE
; 	jr nz, .n_totodile
; 	ld a, SQUIRTLE
; .n_totodile
; 	cp CHIKORITA
; 	jr nz, .n_bulba
; 	ld a, BULBASAUR
; .n_bulba
; 	cp WEEDLE
; 	jr nz, .n_caterpie
; 	ld a, CATERPIE
; .n_caterpie
; 	cp NIDORAN_M
; 	jr nz, .n_nidoran
; 	ld a, NIDORAN_F
; .n_nidoran
; 	cp KABUTO
; 	jr nz, .n_omanyte
; 	ld a, OMANYTE	
; .n_omanyte
; 	ld [wTempSpecies], a
; 	cp [hl]
; 	jr z, .foundSwarm
; 	pop af	
; 	and a
; 	ret

; .foundSwarm
; 	pop af
; 	dec hl
; 	dec hl
; 	jp .AppendNestSwarm

; .AppendNestSwarm
; 	push de
; 	hlcoord 0, 0
; 	ld de, SCREEN_WIDTH * SCREEN_HEIGHT
; .AppendNestSwarmLoop:
; 	ld a, [hl]
; 	cp c
; 	jr z, .end_nest_swarm
; 	dec de
; 	ld a, e
; 	or d
; 	jr nz, .AppendNestSwarmLoop
; 	ld a, c
; 	ld [wMonOrItemNameBuffer], a
; 	pop de

; 	ld hl, wSwarmLandmarkFlags
; 	ld b, CHECK_FLAG
; 	predef SmallFarFlagAction
; 	ld a, c
; 	and a
; 	jr nz, .knows_swarm ;have swarm knowledge
; 	and a
; 	ret

; .knows_swarm
; 	ld a, [wMonOrItemNameBuffer]
; 	ld c, a
; 	scf
; 	ret

; .end_nest_swarm
; 	pop de
; 	and a
; 	ret

TryWildEncounter::
; Try to trigger a wild encounter.
	call .EncounterRate
	jr nc, .no_battle
	call ChooseWildEncounter
	jr nz, .no_battle
	call CheckRepelEffect
	jr nc, .no_battle
	xor a
	ld [wScriptVar], a
	ret

.no_battle
	xor a ; BATTLETYPE_NORMAL
	ld [wTempWildMonSpecies], a
	ld [wBattleType], a
	ld a, 1
	ld [wScriptVar], a
	and a
	ret

.EncounterRate:
	call GetMapEncounterRate
	call ApplyMusicEffectOnEncounterRate
	call ApplyCleanseTagEffectOnEncounterRate
	call Random
	cp b
	ret

GetMapEncounterRate:
	ld hl, wMornEncounterRate
	call CheckOnWater
	ld a, wWaterEncounterRate - wMornEncounterRate
	jr z, .ok
	ld a, [wTimeOfDay]
	cp 0
	jr z, .continue_with_timeofday
	dec a
.continue_with_timeofday
.ok
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	ret

ApplyMusicEffectOnEncounterRate::
; Pokemon March and Ruins of Alph signal double encounter rate.
; Pokemon Lullaby halves encounter rate.
	ld a, [wMapMusic]
	cp MUSIC_POKEMON_MARCH
	jr z, .double
	cp MUSIC_RUINS_OF_ALPH_RADIO
	jr z, .double
	cp MUSIC_POKEMON_LULLABY
	ret nz
	srl b
	ret

.double
	sla b
	ret

ApplyCleanseTagEffectOnEncounterRate::
; Cleanse Tag halves encounter rate.
	ld hl, wPartyMon1Item
	ld de, PARTYMON_STRUCT_LENGTH
	ld a, [wPartyCount]
	ld c, a
.loop
	ld a, [hl]
	cp CLEANSE_TAG
	jr z, .cleansetag
	add hl, de
	dec c
	jr nz, .loop
	ret

.cleansetag
	srl b
	ret

ChooseWildEncounter:
	call LoadWildMonDataPointer
	jp nc, .nowildbattle
	call CheckEncounterRoamMon
	jp c, .startwildbattle

	inc hl
	inc hl
	inc hl
	call CheckOnWater
	ld de, WaterMonProbTable
	jr z, .watermon
	call CheckShallowWaterTile
	ld de, ShallowMonProbTable
	jr z, .shallowmon

	inc hl
	ld a, [wTimeOfDay]
	cp 0
	jr z, .continue_with_timeofday
	dec a	
.continue_with_timeofday
	ld bc, NUM_GRASSMON * 2
	call AddNTimes
	ld de, GrassMonProbTable
	jr .watermon

.shallowmon
	inc hl
	ld a, [wTimeOfDay]
	cp 0
	jr z, .continue_with_timeofday2
	dec a
.continue_with_timeofday2
	ld bc, NUM_SHALLOWMON * 2
	call AddNTimes

.watermon
; hl contains the pointer to the wild mon data, let's save that to the stack
	push hl
.randomloop
	call Random
	cp 100
	jr nc, .randomloop
	inc a ; 1 <= a <= 100
	ld b, a
	ld h, d
	ld l, e
; This next loop chooses which mon to load up.
.prob_bracket_loop
	ld a, [hli]
	cp b
	jr nc, .got_it
	inc hl
	jr .prob_bracket_loop

.got_it
	ld c, [hl]
	ld b, 0
	pop hl
	add hl, bc ; this selects our mon
	ld a, [hli]
	ld b, a
	ld d, b
	push hl
	push de
	ld hl, wBadges
	ld b, 2
	call CountSetBits	
	ld a, [wNumSetBits]	
	pop de
	pop hl
	ld b, d
	;inc a
	jp .switch_start
	
.case0; 0 badges
 ; Add 1
	inc b
 ; adds 0 to 2 levels
	ld a, 3
	call RandomRange
	add b
	ld b, a

	ld a, [wPartyCount]
	cp 2
	jp c, .switch_end
	call Random
	cp 95 percent ; 5% chance of 1 extra level
	jp c, .try3
	inc b
.try3
	ld a, [wPartyCount]
	cp 3
	jp c, .switch_end
	call Random
	cp 90 percent ; 10% chance of 1 extra level
	jp c, .try4
	inc b
.try4
	ld a, [wPartyCount]
	cp 4
	jp c, .switch_end
	call Random
	cp 70 percent ; 30% chance of 1 extra level
	jp c, .try5
	inc b
.try5
	ld a, [wPartyCount]
	cp 5
	jp c, .switch_end
	call Random
	cp 50 percent ; 50% chance of 1 extra level
	jp c, .try6
	inc b
.try6
	ld a, [wPartyCount]
	cp 6
	jp c, .switch_end
	call Random
	cp 20 percent ; 80% chance of 1 extra level
	jp c, .switch_end
	inc b

	push hl
	ld hl, wPartyMon1Level
	ld a, [hl]
	ld c, a
	cp b
	jr nc, .firstMonHigher
	pop hl
	jp .switch_end

.firstMonHigher
	call Random
	cp 25 percent
	jp c, .skipFirstMonCompare

	ld a, [hl]
	inc b
	dec c
	ld a, c
	cp b
	jr nc, .firstMonHigher

.skipFirstMonCompare
	pop hl
	jp .switch_end
	
.case1 ; 1 badge
	push hl
	ld hl, .badgeAddValue
	push bc
	ld b, 0
	ld c, a
	add hl, bc
	add hl, bc
	pop bc
 ; doubles number of badges
	add a ; add a(badges) to itself (doubles a)
	add b ; add b(level) and a(badges) ; a holds level
	ld b, a
 ; add X more levels
	ld a, [hli]
	add b
	ld b, a ; b holds level
; adds Y to level
	ld a, [hl]
	add b
	ld b, a ; b holds level
 ; adds 0 to Y levels
	ld a, [hl]
	pop hl
	call RandomRange
	add b
	ld b, a

	cp 6
	jp c, .switch_end ; continue when level is greater than 6

	call Random 
	cp 95 percent ; 5% chance of 1 extra level between level 6 and 9
	jp c, .switch_end
	inc b

	ld a, b
	cp 10
	jp c, .switch_end

	call Random 
	cp 94 percent ; 6% chance of 1 extra level between level 10 and 14
	jp c, .switch_end
	inc b

	ld a, b
	cp 15
	jp c, .switch_end

	call Random 
	cp 90 percent ; 10% chance of 1 extra level between level 15 and 24
	jp c, .switch_end
	inc b

	ld a, b
	cp 25
	jp c, .switch_end

	call Random 
	cp 85 percent ; 15% chance of 1 extra level between level 25 and 33 (and around 1% chance of 2 levels)
	jp c, .switch_end
	inc b

	ld a, b
	cp 34
	jp c, .switch_end

	call Random 
	cp 80 percent ; 20% chance of 1 extra level between level 34 and 39 (and around 3% chance of 2 levels)
	jp c, .switch_end
	inc b

	ld a, b
	cp 40
	jp c, .switch_end

	call Random 
	cp 65 percent ; 35% chance of 1 extra level between level 40 and 43 (and around 7% chance of 2 levels)
	jp c, .switch_end
	inc b

	ld a, b
	cp 44
	jp c, .switch_end

	call Random 
	cp 50 percent ; 50% chance of 1 extra level above level 44 (and around 17% chance of 2 levels, or 3.5% of 3 levels)
	jp c, .switch_end
	inc b

	jp .switch_end
	
.switch_start
	cp 0
	jp z, .case0 ; 0
	jp .case1 ; over 0

.badgeAddValue
	db 0 ; 0 add
	db 2 ; 0 random
	db 0 ; 1 add
	db 3 ; 1 random
	db 0 ; 2 add
	db 4 ; 2 random
	db 0 ; 3 add
	db 4 ; 3 random
	db 1 ; 4 add
	db 4 ; 4 random
	db 1 ; 5 add
	db 4 ; 5 random
	db 2 ; 6 add
	db 5 ; 6 random
	db 2 ; 7 add
	db 5 ; 7 random
	db 3 ; 8 add
	db 5 ; 8 random
	db 4 ; 9 add
	db 5 ; 9 random
	db 5 ; 10 add
	db 6 ; 10 random
	db 6 ; 11 add
	db 6 ; 11 random
	db 7 ; 12 add
	db 6 ; 12 random
	db 8 ; 13 add
	db 6 ; 13 random
	db 9 ; 14 add
	db 7 ; 14 random
	db 9 ; 15 add
	db 7 ; 15 random
	db 9 ; 16 add
	db 7 ; 16 random
	
.switch_end
	ld a, b
	ld [wCurPartyLevel], a
	ld b, [hl]
	ld a, b
	call ValidateTempWildMonSpecies
	jp c, .nowildbattle
	
	push hl
	push de
	push bc
	ld hl, wBadges
	ld b, 2
	call CountSetBits	
	ld a, [wNumSetBits]
	pop bc
	pop de
	pop hl
	; If the mon is Legendary, 92% chance to reroll into any other mon
	push hl
	push bc
	push de

	call Random
	cp 2
	jr nc, .not_legendary ; 0 or 1 out of 255 (0.7% chance)

	ld a, [wNumSetBits]
	ld c, 6
	call SimpleMultiply
	ld b, a
	ld a, 106
	sub b
	ld b, a ; b contains 10 to 106, lower with more badges
	ld a, 101
	call RandomRange ; 0 to 100
	cp b
	jp c, .not_legendary ; 4~100% chance to cancel and return to choosing a pokemon based on badges
	call TryWildEncounter

	ld hl, LegendaryMon ; pick legendary
	ld a, 7
	call RandomRange
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wTempWildMonSpecies], a

	; legendary pokemon gain 5 levels
	ld a, [wCurPartyLevel]
	ld b, a
	ld a, 5
	add b
	ld [wCurPartyLevel], a

	pop hl
	pop bc
	pop de
	jr .continue_with_legendary

.randomize
	; call Random
	; cp 92 percent
	; ld a, 1
	; ld [wSpecialWildBattle], a
	; jp nc, .continue_with_legendary ; 8% chance to keep the legendary
	
	; pop hl
	; pop bc
	; pop de
	; ld a, 251
	; call RandomRange
	; inc a
	; ld b, a
	; jp .done	
	
.not_legendary
	pop hl
	pop bc
	pop de

	ld a, b ; save mon species for later
	ld [wTempWildMonSpecies], a
.continue_with_legendary
	; 2% chance to lucky shiny chance between midnight and 0:59 AM and between noon and 12:59 PM
	ld a, [hHours]
	cp 0
	jr z, .oneam
	cp 12
	jr nz, .lucky_isset

.oneam
	call Random 
	cp 2 percent 
	jp nc, .lucky_isset

	; Add 2 lucky encounters
	ld a, [wLuckyWild]
	inc a
	inc a
	ld [wLuckyWild], a

.lucky_isset	
	; 11% (11*255/100 -> 1c hex) chance of special map encounter that replaces current encounter if conditions are met
	;ld a, $1c
	ld a, $ff
	ld b, a
	; Doubles chance if playing pokemon march
	ld a, [wMapMusic]
	cp MUSIC_POKEMON_MARCH
	jr nz, .no_double
	sla b

.no_double
	call Random 
	cp b
	jp nc, .notmap
	call CheckOnWater
	jr z, .water
	call CheckShallowWaterTile
	jr z, .shallow_water

	ld hl, JohtoGrassRareWildMons
	jr .landmark
.water
	ld hl, JohtoWaterRareWildMons
	xor a
	jr .landmark
.shallow_water
	ld hl, JohtoShallowRareWildMons
	xor a

.landmark
	; Get current landmark
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	ld c, a

.loop_landmark
	ld a, [hli] ; get raremon landmark
	cp c
	jr z, .got_landmark
	cp $ff
 	jr z, .notmap
	inc hl
	inc hl
	jr .loop_landmark

.got_landmark
	ld a, [hl] ; get week day
	ld b, a
	call GetWeekday
	cp b
	jr z, .right_day
	
	ld a, [hl] ; get week day + 1
	inc a
.mod
	sub 7
	jr nc, .mod
	add 7	
	ld b, a
	call GetWeekday
	cp b
	jr z, .right_day
	
	ld a, [hl] ; get week day + 2
	inc a
	inc a
.mod2
	sub 7
	jr nc, .mod2
	add 7
	ld b, a
	call GetWeekday
	cp b
	jr z, .right_day

.wrong_day
	inc hl
	inc hl
	jr .loop_landmark

.right_day
	inc hl
	ld a, [hl] ; get species
.mod_species
	sub 24
	jr nc, .mod_species
	add 24
	ld b, a ; species number turned to time

	ld a, [hHours]
	cp b
	jr nc, .lower_than ; min time >= cur time
	add 24 ; cur time is lower than min time, add 24

.lower_than
	sub b ; a is now the difference between cur time and min time
	cp 8
	jr nc, .notmap
; Swarm area and time is right
	push hl

	ld hl, wSwarmSet
	ld a, [hl]
	cp c
	jr nz, .keep_swarm ; if the current saved swarm encounter is the same id

	pop hl
	jr .notmap

.keep_swarm 
	ld hl, wSwarmSet ; save last swarm (c) encounter
	ld a, c
	ld [hl], a

	ld hl, wSwarmLandmarkFlags ; set swarm as learned
	ld b, SET_FLAG
	predef SmallFarFlagAction  

	pop hl
	ld a, [hl] ; get mon species
	ld [wTempWildMonSpecies], a

; rare pokemon gain 1-4 levels
	ld a, [wCurPartyLevel]
	ld b, a
	ld a, 4
	call RandomRange
	add b
	inc a
	ld [wCurPartyLevel], a

.notmap
	ld a, [wTempWildMonSpecies]
	ld b, a
	; Check if it's Nidoran F and randomizes to Nidoran M
	ld a, b
	cp NIDORAN_F
	jp nz, .not_nidoran_f
	call Random 
	cp 50 percent
	jp nc, .not_nidoran_f	
	ld a, NIDORAN_M
	ld b, a
.not_nidoran_f
	; Check if it's Omanyte and randomizes to Kabuto
	ld a, b
	cp OMANYTE
	jp nz, .not_omanyte
	call Random 
	cp 50 percent
	jp nc, .not_omanyte	
	ld a, KABUTO
	ld b, a
.not_omanyte
	; Check if it's Bulbasaur and randomizes to Chikorita
	ld a, b
	cp BULBASAUR
	jp nz, .not_bulba
	call Random 
	cp 50 percent
	jp nc, .not_bulba	
	ld a, CHIKORITA
	ld b, a
.not_bulba
	; Check if it's Charmander and randomizes to Cyndaquil
	ld a, b
	cp CHARMANDER
	jp nz, .not_char
	call Random 
	cp 50 percent
	jp nc, .not_char	
	ld a, CYNDAQUIL
	ld b, a
.not_char
	; Check if it's Squirtle and randomizes to Totodile
	ld a, b
	cp SQUIRTLE
	jp nz, .not_squirtle
	call Random 
	cp 50 percent
	jp nc, .not_squirtle	
	ld a, TOTODILE
	ld b, a
.not_squirtle
	; Check if it's Caterpie and randomizes to Weedle
	ld a, b
	cp CATERPIE
	jp nz, .not_caterpie
	call Random 
	cp 50 percent
	jp nc, .not_caterpie
	ld a, WEEDLE
	ld b, a
	
.not_caterpie	
	call Random 
	cp 50 percent
	ld a, b
	jp nc, .dont_check_evolve1
	call EvolveWildMon
	; jp .dont_check_evolve2
	
.dont_check_evolve1
	call Random 
	cp 50 percent
	ld a, b
	jp nc, .dont_check_evolve2
	call EvolveWildMon
	
.dont_check_evolve2
	cp UNOWN
	jp nz, .done

	ld a, [wUnlockedUnowns]
	and a
	jp z, .nowildbattle

.done
	jr .loadwildmon

.nowildbattle
	ld a, 1
	and a
	ret

.loadwildmon
	ld a, b
	ld [wTempWildMonSpecies], a

.startwildbattle
	xor a
	ret

INCLUDE "data/wild/probabilities.asm"

LegendaryMon:
	db MEW
	db MEWTWO
	db LUGIA
	db HO_OH
	db CELEBI
	db -1

EvolveWildMon:
; check if the defender has any evolutions
; hl = EvosAttacksPointers  (species - 1) * 2
	dec a
	push hl
	push bc
	ld c, a
	ld b, 0
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
; hl = the species' entry from EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call GetFarHalfword
; a = the first byte of the species' EvosAttacks data
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
; if a == 0, there are no evolutions, so don't boost stats
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	and a
	cp 0
	jp nz, .has_evolution
	jp .done
.has_evolution
	inc hl
	cp EVOLVE_ITEM
	jp z, .evolve_item
	cp EVOLVE_HAPPINESS
	jp z, .evolve_happy
	cp EVOLVE_STAT
	jp z, .evolve_stat
	ld a, [wCurPartyLevel]
	ld d, a ; d = wild mon level
	
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte ; a = evolve level
	cp d
	jp nc, .lower
	
	ld c, a
	ld a, d ; a = wild level
	ld d, c ; d = evolve level data
	sub d
	ld d, a
	cp 5
	jp nc, .diff_greaterthan5
	call Random 
	cp 30 percent ; 0 <= diff < 5
	jp c, .finish_evolve
	jp .done
	
.diff_greaterthan5
	ld a, d
	cp 10
	jp nc, .diff_greaterthan10
	call Random 
	cp 60 percent ; 5 <= diff < 10
	jp c, .finish_evolve
	jp .done
	
.diff_greaterthan10
	ld a, d
	cp 15
	jp nc, .diff_greaterthan15
	call Random 
	cp 80 percent ; 10 <= diff < 15
	jp c, .finish_evolve
	jp .done
	
.diff_greaterthan15
	ld a, d
	cp 20
	jp nc, .diff_greaterthan20
	call Random 
	cp 95 percent ; 15 <= diff < 20
	jp c, .finish_evolve
	jp .done
	
.diff_greaterthan20
	ld a, d
	cp 25
	jp nc, .diff_greaterthan25
	call Random 
	cp 95 percent ; 20 <= diff < 25
	jp c, .finish_evolve
	jp .done
	
.diff_greaterthan25
	ld a, d
	cp 30
	jp nc, .finish_evolve
	call Random 
	cp 98 percent ; 25 <= diff < 35
	jp c, .finish_evolve
	jp .done
	
.finish_evolve ; diff greater than 30
	pop bc
	pop hl
	inc b
	ret
.evolve_happy2
	pop bc
	ld a, b
	cp PICHU
	jp z, .evolve_pichu
	cp CLEFFA
	jp z, .evolve_cleffa
	cp IGGLYBUFF
	jp z, .evolve_igglybuff
	cp GOLBAT
	jp z, .evolve_golbat
	cp CHANSEY
	jp z, .evolve_chansey
	cp EEVEE
	jp z, .done
	jp .done
.evolve_pichu
	pop hl
	ld a, PIKACHU
	jp .load_and_end
.evolve_cleffa
	pop hl
	ld a, CLEFAIRY
	jp .load_and_end
.evolve_igglybuff
	pop hl
	ld a, JIGGLYPUFF
	jp .load_and_end
.evolve_golbat
	pop hl
	ld a, CROBAT
	jp .load_and_end
.evolve_chansey
	pop hl
	ld a, BLISSEY
	jp .load_and_end
.evolve_tyrogue
	pop hl
	jp .load_and_end
.evolve_item
	jp .done
.evolve_happy
	call Random 
	cp 4 percent
	jp c, .evolve_happy2
	jp .done
.evolve_stat
	call Random 
	cp 4 percent
	ld d, a
	ld a, HITMONCHAN
	jp c, .evolve_tyrogue
	ld a, d
	cp 8 percent
	ld a, HITMONLEE
	jp c, .evolve_tyrogue
	ld a, d
	cp 12 percent
	ld a, HITMONTOP
	jp c, .evolve_tyrogue
.lower
.done
	pop bc
	pop hl
	ret
.load_and_end
	ld b, a
	ret

CheckRepelEffect::
; If there is no active Repel, there's no need to be here.
	ld a, [wRepelEffect]
	and a
	jr z, .encounter
; Get the first Pokemon in your party that isn't fainted.
	ld hl, wPartyMon1HP
	ld bc, PARTYMON_STRUCT_LENGTH - 1
.loop
	ld a, [hli]
	or [hl]
	jr nz, .ok
	add hl, bc
	jr .loop

.ok
; to PartyMonLevel
rept 4
	dec hl
endr

	ld a, [wCurPartyLevel]
	cp [hl]
	jr nc, .encounter
	and a
	ret

.encounter
	scf
	ret

LoadWildMonDataPointer:
	call CheckOnWater
	jr z, _WaterWildmonLookup
	call CheckShallowWaterTile
	jr z, _ShallowWildmonLookup

_GrassWildmonLookup:
	ld hl, JohtoGrassWildMons
	ld de, KantoGrassWildMons
	call _JohtoWildmonCheck
	ld bc, GRASS_WILDDATA_LENGTH
	jr _NormalWildmonOK

_WaterWildmonLookup:
	ld hl, JohtoWaterWildMons
	ld de, KantoWaterWildMons
	call _JohtoWildmonCheck
	ld bc, WATER_WILDDATA_LENGTH
	jr _NormalWildmonOK
	
_ShallowWildmonLookup:
	ld hl, JohtoShallowWildMons
	ld de, KantoShallowWildMons
	call _JohtoWildmonCheck
	ld bc, SHALLOW_WILDDATA_LENGTH
	jr _NormalWildmonOK

_JohtoWildmonCheck:
	call IsInJohto
	and a
	ret z
	ld h, d
	ld l, e
	ret

_NormalWildmonOK:
	call CopyCurrMapDE
	jr LookUpWildmonsForMapDE

CopyCurrMapDE:
	ld a, [wMapGroup]
	ld d, a
	ld a, [wMapNumber]
	ld e, a
	ret

LookUpWildmonsForMapDE:
.loop
	push hl
	ld a, [hl]
	inc a
	jr z, .nope
	ld a, d
	cp [hl]
	jr nz, .next
	inc hl
	ld a, e
	cp [hl]
	jr z, .yup

.next
	pop hl
	add hl, bc
	jr .loop

.nope
	pop hl
	and a
	ret

.yup
	pop hl
	scf
	ret

InitRoamMons:
; initialize wRoamMon structs

; species
	ld a, RAIKOU
	ld [wRoamMon1Species], a
	ld a, ENTEI
	ld [wRoamMon2Species], a
	ld a, SUICUNE
	ld [wRoamMon3Species], a

; level
	ld a, 5
	ld [wRoamMon1Level], a
	ld [wRoamMon2Level], a
	ld [wRoamMon3Level], a

; raikou starting map
	ld a, GROUP_ROUTE_42
	ld [wRoamMon1MapGroup], a
	ld a, MAP_ROUTE_42
	ld [wRoamMon1MapNumber], a

; entei starting map
	ld a, GROUP_ROUTE_37
	ld [wRoamMon2MapGroup], a
	ld a, MAP_ROUTE_37
	ld [wRoamMon2MapNumber], a

; suicune starting map
	ld a, GROUP_ROUTE_38
	ld [wRoamMon3MapGroup], a
	ld a, MAP_ROUTE_38
	ld [wRoamMon3MapNumber], a

; hp
	xor a ; generate new stats
	ld [wRoamMon1HP], a
	ld [wRoamMon2HP], a
	ld [wRoamMon3HP], a

	ret

InitKantoRoamMons:
; initialize wRoamMon structs

; species
	ld a, ARTICUNO
	ld [wRoamMon4Species], a
	ld a, ZAPDOS
	ld [wRoamMon5Species], a
	ld a, MOLTRES
	ld [wRoamMon6Species], a

; level
	ld a, 5
	ld [wRoamMon4Level], a
	ld [wRoamMon5Level], a
	ld [wRoamMon6Level], a

; articuno starting map
	ld a, GROUP_ROUTE_19
	ld [wRoamMon4MapGroup], a
	ld a, MAP_ROUTE_19
	ld [wRoamMon4MapNumber], a

; zapdos starting map
	ld a, GROUP_ROUTE_9
	ld [wRoamMon5MapGroup], a
	ld a, MAP_ROUTE_9
	ld [wRoamMon5MapNumber], a

; moltres starting map
	ld a, GROUP_ROUTE_3
	ld [wRoamMon6MapGroup], a
	ld a, MAP_ROUTE_3
	ld [wRoamMon6MapNumber], a

; hp
	xor a ; generate new stats
	ld [wRoamMon1HP], a
	ld [wRoamMon2HP], a
	ld [wRoamMon3HP], a

	ret

CheckEncounterRoamMon:
	push hl
; Don't trigger an encounter if we're on water.
	call CheckOnWater
	jr z, .DontEncounterRoamMon
; Load the current map group and number to de
	call CopyCurrMapDE
; Randomly select a beast.
	call Random
	cp 100 ; 25/64 chance
	jr nc, .DontEncounterRoamMon
	and %00000011 ; Of that, a 3/4 chance.  Running total: 75/256, or around 29.3%.
	jr z, .DontEncounterRoamMon
	dec a ; 1/3 chance that it's Entei, 1/3 chance that it's Raikou
; Compare its current location with yours
	ld hl, wRoamMon1MapGroup
	ld c, a
	ld b, 0
	ld a, wRoamMon1End - wRoamMon1 ; length of the RoamMon struct
	call AddNTimes
	ld a, d
	cp [hl]
	jr nz, .DontEncounterRoamMon
	inc hl
	ld a, e
	cp [hl]
	jr nz, .DontEncounterRoamMon
; We've decided to take on a beast, so stage its information for battle.
	dec hl
	dec hl
	dec hl
	ld a, [hli]
	ld [wTempWildMonSpecies], a
	ld a, [hl]
	ld [wCurPartyLevel], a
	ld a, BATTLETYPE_ROAMING
	ld [wBattleType], a

	pop hl
	scf
	ret

.DontEncounterRoamMon:
	pop hl
	and a
	ret

UpdateRoamMons:
	ld a, [wRoamMon1MapGroup]
	cp GROUP_N_A
	jr z, .SkipRaikou
	ld b, a
	ld a, [wRoamMon1MapNumber]
	ld c, a
	call .Update
	ld a, b
	ld [wRoamMon1MapGroup], a
	ld a, c
	ld [wRoamMon1MapNumber], a

.SkipRaikou:
	ld a, [wRoamMon2MapGroup]
	cp GROUP_N_A
	jr z, .SkipEntei
	ld b, a
	ld a, [wRoamMon2MapNumber]
	ld c, a
	call .Update
	ld a, b
	ld [wRoamMon2MapGroup], a
	ld a, c
	ld [wRoamMon2MapNumber], a

.SkipEntei:
	ld a, [wRoamMon3MapGroup]
	cp GROUP_N_A
	jr z, .Finished
	ld b, a
	ld a, [wRoamMon3MapNumber]
	ld c, a
	call .Update
	ld a, b
	ld [wRoamMon3MapGroup], a
	ld a, c
	ld [wRoamMon3MapNumber], a

.Finished:
	jp _BackUpMapIndices

.Update:
	ld hl, RoamMaps
.loop
; Are we at the end of the table?
	ld a, [hl]
	cp -1
	ret z
; Is this the correct entry?
	ld a, b
	cp [hl]
	jr nz, .next
	inc hl
	ld a, c
	cp [hl]
	jr z, .yes
; We don't have the correct entry yet, so let's continue.  A 0 terminates each entry.
.next
	ld a, [hli]
	and a
	jr nz, .next
	jr .loop

; We have the correct entry now, so let's choose a random map from it.
.yes
	inc hl
	ld d, h
	ld e, l
.update_loop
	ld h, d
	ld l, e
; Choose which map to warp to.
	call Random
	and %00011111 ; 1/8n chance it moves to a completely random map, where n is the number of roaming connections from the current map.
	jp z, JumpRoamMon
	and %11
	cp [hl]
	jr nc, .update_loop ; invalid index, try again
	inc hl
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [wRoamMons_LastMapGroup]
	cp [hl]
	jr nz, .done
	inc hl
	ld a, [wRoamMons_LastMapNumber]
	cp [hl]
	jr z, .update_loop
	dec hl

.done
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ret

JumpRoamMons:
	ld a, [wRoamMon1MapGroup]
	cp GROUP_N_A
	jr z, .SkipRaikou
	call JumpRoamMon
	ld a, b
	ld [wRoamMon1MapGroup], a
	ld a, c
	ld [wRoamMon1MapNumber], a

.SkipRaikou:
	ld a, [wRoamMon2MapGroup]
	cp GROUP_N_A
	jr z, .SkipEntei
	call JumpRoamMon
	ld a, b
	ld [wRoamMon2MapGroup], a
	ld a, c
	ld [wRoamMon2MapNumber], a

.SkipEntei:
	ld a, [wRoamMon3MapGroup]
	cp GROUP_N_A
	jr z, .Finished
	call JumpRoamMon
	ld a, b
	ld [wRoamMon3MapGroup], a
	ld a, c
	ld [wRoamMon3MapNumber], a

.Finished:
	jp _BackUpMapIndices

JumpRoamMon:
.loop
	ld hl, RoamMaps
.innerloop1                   ; This loop happens to be unnecessary.
	call Random               ; Choose a random number.
	maskbits NUM_ROAMMON_MAPS ; Mask the number to limit it between 0 and 15.
	cp NUM_ROAMMON_MAPS       ; If the number is not less than 16, try again.
	jr nc, .innerloop1        ; I'm sure you can guess why this check is bogus.
	inc a
	ld b, a
.innerloop2 ; Loop to get hl to the address of the chosen roam map.
	dec b
	jr z, .ok
.innerloop3 ; Loop to skip the current roam map, which is terminated by a 0.
	ld a, [hli]
	and a
	jr nz, .innerloop3
	jr .innerloop2
; Check to see if the selected map is the one the player is currently in.  If so, try again.
.ok
	ld a, [wMapGroup]
	cp [hl]
	jr nz, .done
	inc hl
	ld a, [wMapNumber]
	cp [hl]
	jr z, .loop
	dec hl
; Return the map group and number in bc.
.done
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ret

UpdateRoamMonsKanto:
	ld a, [wRoamMon4MapGroup]
	cp GROUP_N_A
	jr z, .SkipArticuno
	ld b, a
	ld a, [wRoamMon4MapNumber]
	ld c, a
	call .Update
	ld a, b
	ld [wRoamMon4MapGroup], a
	ld a, c
	ld [wRoamMon4MapNumber], a

.SkipArticuno:
	ld a, [wRoamMon5MapGroup]
	cp GROUP_N_A
	jr z, .SkipZapdos
	ld b, a
	ld a, [wRoamMon5MapNumber]
	ld c, a
	call .Update
	ld a, b
	ld [wRoamMon5MapGroup], a
	ld a, c
	ld [wRoamMon5MapNumber], a

.SkipZapdos:
	ld a, [wRoamMon6MapGroup]
	cp GROUP_N_A
	jr z, .Finished
	ld b, a
	ld a, [wRoamMon6MapNumber]
	ld c, a
	call .Update
	ld a, b
	ld [wRoamMon6MapGroup], a
	ld a, c
	ld [wRoamMon6MapNumber], a

.Finished:
	jp _BackUpMapIndices

.Update:
	ld hl, RoamMapsKanto
.loop
; Are we at the end of the table?
	ld a, [hl]
	cp -1
	ret z
; Is this the correct entry?
	ld a, b
	cp [hl]
	jr nz, .next
	inc hl
	ld a, c
	cp [hl]
	jr z, .yes
; We don't have the correct entry yet, so let's continue.  A 0 terminates each entry.
.next
	ld a, [hli]
	and a
	jr nz, .next
	jr .loop

; We have the correct entry now, so let's choose a random map from it.
.yes
	inc hl
	ld d, h
	ld e, l
.update_loop
	ld h, d
	ld l, e
; Choose which map to warp to.
	call Random
	and %00011111 ; 1/8n chance it moves to a completely random map, where n is the number of roaming connections from the current map.
	jp z, JumpRoamMonKanto
	and %11
	cp [hl]
	jr nc, .update_loop ; invalid index, try again
	inc hl
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [wRoamMons_LastMapGroup]
	cp [hl]
	jr nz, .done
	inc hl
	ld a, [wRoamMons_LastMapNumber]
	cp [hl]
	jr z, .update_loop
	dec hl

.done
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ret

JumpRoamMonsKanto:
	ld a, [wRoamMon4MapGroup]
	cp GROUP_N_A
	jr z, .SkipArticuno
	call JumpRoamMonKanto
	ld a, b
	ld [wRoamMon4MapGroup], a
	ld a, c
	ld [wRoamMon4MapNumber], a

.SkipArticuno:
	ld a, [wRoamMon5MapGroup]
	cp GROUP_N_A
	jr z, .SkipZapdos
	call JumpRoamMonKanto
	ld a, b
	ld [wRoamMon5MapGroup], a
	ld a, c
	ld [wRoamMon5MapNumber], a

.SkipZapdos:
	ld a, [wRoamMon6MapGroup]
	cp GROUP_N_A
	jr z, .Finished
	call JumpRoamMonKanto
	ld a, b
	ld [wRoamMon6MapGroup], a
	ld a, c
	ld [wRoamMon6MapNumber], a

.Finished:
	jp _BackUpMapIndices

JumpRoamMonKanto:
.loop
	ld hl, RoamMapsKanto
.innerloop1								; This loop happens to be unnecessary.
	call Random         		    	; Choose a random number.
	maskbits NUM_ROAMMON_MAPS_KANTO		; Mask the number to limit it between 0 and 20.
	cp NUM_ROAMMON_MAPS_KANTO    	   	; If the number is not less than 21, try again.
	jr nc, .innerloop1      		  	; I'm sure you can guess why this check is bogus.
	inc a
	ld b, a
.innerloop2 ; Loop to get hl to the address of the chosen roam map.
	dec b
	jr z, .ok
.innerloop3 ; Loop to skip the current roam map, which is terminated by a 0.
	ld a, [hli]
	and a
	jr nz, .innerloop3
	jr .innerloop2
; Check to see if the selected map is the one the player is currently in.  If so, try again.
.ok
	ld a, [wMapGroup]
	cp [hl]
	jr nz, .done
	inc hl
	ld a, [wMapNumber]
	cp [hl]
	jr z, .loop
	dec hl
; Return the map group and number in bc.
.done
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ret

_BackUpMapIndices:
	ld a, [wRoamMons_CurMapNumber]
	ld [wRoamMons_LastMapNumber], a
	ld a, [wRoamMons_CurMapGroup]
	ld [wRoamMons_LastMapGroup], a
	ld a, [wMapNumber]
	ld [wRoamMons_CurMapNumber], a
	ld a, [wMapGroup]
	ld [wRoamMons_CurMapGroup], a
	ret

INCLUDE "data/wild/roammon_maps.asm"

GetRoamMonMapGroup:
	call GetRoamMonIndex

	ld hl, wRoamMon1MapGroup ; get starting point
	ld c, a
	ld b, 0
	jr z, .index_zero
	ld a, wRoamMon1End - wRoamMon1 ; length of the RoamMon struct
	call AddNTimes ; move hl to wanted mon
.index_zero
	ret

GetRoamMonMapNumber:
	call GetRoamMonIndex

	ld hl, wRoamMon1MapNumber ; get starting point
	ld c, a
	ld b, 0
	jr z, .index_zero
	ld a, wRoamMon1End - wRoamMon1 ; length of the RoamMon struct
	call AddNTimes ; move hl to wanted mon
.index_zero
	ret

GetRoamMonHP:
; output: hl = wRoamMonHP
	call GetRoamMonIndex

	ld hl, wRoamMon1HP ; get starting point
	ld c, a
	ld b, 0
	jr z, .index_zero
	ld a, wRoamMon1End - wRoamMon1 ; length of the RoamMon struct
	call AddNTimes ; move hl to wanted mon
.index_zero
	ret

GetRoamMonDVs:
; output: hl = wRoamMonDVs
	call GetRoamMonIndex

	ld hl, wRoamMon1DVs ; get starting point
	ld c, a
	ld b, 0
	jr z, .index_zero
	ld a, wRoamMon1End - wRoamMon1 ; length of the RoamMon struct
	call AddNTimes ; move hl to wanted mon
.index_zero
	ret

GetRoamMonSpecies:
; output: hl = wRoamMonSpecies
	call GetRoamMonIndex

	ld hl, wRoamMon1Species ; get starting point
	ld c, a
	ld b, 0
	jr z, .index_zero
	ld a, wRoamMon1End - wRoamMon1 ; length of the RoamMon struct
	call AddNTimes ; move hl to wanted mon
.index_zero
	ret

GetRoamMonIndex:
	ld a, [wTempEnemyMonSpecies]
	ld hl, .index
	ld c, 0
.loop
	ld a, [hli]
	cp -1
	ret z
	ld b, a
	ld a, [wTempEnemyMonSpecies]
	cp b
	jr z, .ok
	inc c
	jr .loop
.ok
	ld a, c ; id of encounter into a (0 to 5)
	ret

.index:
	db RAIKOU
	db ENTEI
	db SUICUNE
	db ARTICUNO
	db ZAPDOS
	db MOLTRES
	db -1


ValidateTempWildMonSpecies:
	and a
	jr z, .nowildmon ; = 0
	cp NUM_POKEMON + 1 ; 252
	jr nc, .nowildmon ; >= 252
	and a ; 1 <= Species <= 251
	ret

.nowildmon
	scf
	ret

; Finds a rare wild Pokemon in the route of the trainer calling, then checks if it's been Seen already.
; The trainer will then tell you about the Pokemon if you haven't seen it.
RandomUnseenWildMon:
	farcall GetCallerLocation
	ld d, b
	ld e, c
	ld hl, JohtoGrassWildMons
	ld bc, GRASS_WILDDATA_LENGTH
	call LookUpWildmonsForMapDE
	jr c, .GetGrassmon
	ld hl, KantoGrassWildMons
	call LookUpWildmonsForMapDE
	jr nc, .done

.GetGrassmon:
	push hl
	ld bc, 5 + 4 * 2 ; Location of the level of the 5th wild Pokemon in that map
	add hl, bc
	ld a, [wTimeOfDay]
	ld bc, NUM_GRASSMON * 2
	call AddNTimes
.randloop1
	call Random
	and %11
	jr z, .randloop1
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
; We now have the pointer to one of the last (rarest) three wild Pokemon found in that area.
	inc hl
	ld c, [hl] ; Contains the species index of this rare Pokemon
	pop hl
	ld de, 5 + 0 * 2
	add hl, de
	inc hl ; Species index of the most common Pokemon on that route
	ld b, 4
.loop2
	ld a, [hli]
	cp c ; Compare this most common Pokemon with the rare one stored in c.
	jr z, .done
	inc hl
	dec b
	jr nz, .loop2
; This Pokemon truly is rare.
	push bc
	dec c
	ld a, c
	call CheckSeenMon
	pop bc
	jr nz, .done
; Since we haven't seen it, have the caller tell us about it.
	ld de, wStringBuffer1
	call CopyName1
	ld a, c
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, .SawRareMonText
	call PrintText
	xor a
	ld [wScriptVar], a
	ret

.done
	ld a, $1
	ld [wScriptVar], a
	ret

.SawRareMonText:
	; I just saw some rare @  in @ . I'll call you if I see another rare #MON, OK?
	text_jump UnknownText_0x1bd34b
	db "@"

RandomPhoneWildMon:
	farcall GetCallerLocation
	ld d, b
	ld e, c
	ld hl, JohtoGrassWildMons
	ld bc, GRASS_WILDDATA_LENGTH
	call LookUpWildmonsForMapDE
	jr c, .ok
	ld hl, KantoGrassWildMons
	call LookUpWildmonsForMapDE

.ok
	ld bc, 5 + 0 * 2
	add hl, bc
	ld a, [wTimeOfDay]
	inc a
	ld bc, NUM_GRASSMON * 2
.loop
	dec a
	jr z, .done
	add hl, bc
	jr .loop

.done
	call Random
	and %11
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	inc hl
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wStringBuffer4
	ld bc, MON_NAME_LENGTH
	jp CopyBytes

RandomPhoneMon:
; Get a random monster owned by the trainer who's calling.
	farcall GetCallerLocation
	ld hl, TrainerGroups
	ld a, d
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, BANK(TrainerGroups)
	call GetFarByte
	ld [wTrainerGroupBank], a
	inc hl
	ld a, BANK(TrainerGroups)
	call GetFarHalfword

.skip_trainer
	dec e
	jr z, .skipped
.skip
	ld a, [wTrainerGroupBank]
	call GetFarByte
	inc hl
	cp -1
	jr nz, .skip
	jr .skip_trainer
.skipped

.skip_name
	ld a, [wTrainerGroupBank]
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .skip_name

	ld a, [wTrainerGroupBank]
	call GetFarByte
	inc hl
; b = trainer type
	ld b, a
; TRAINERTYPE_NICKNAME has uneven length, so always use the first mon
	bit TRAINERTYPE_NICKNAME_F, b
	jr nz, .got_mon
; c = mon length
; All trainers use 2 bytes for level and species
	ld c, 2
; TRAINERTYPE_DVS uses 2 more bytes
	bit TRAINERTYPE_DVS_F, b
	jr z, .no_dvs
	inc c
	inc c
.no_dvs
; TRAINERTYPE_ITEM uses 1 more byte
	bit TRAINERTYPE_ITEM_F, b
	jr z, .no_item
	inc c
.no_item
; TRAINERTYPE_MOVES uses NUM_MOVES (4) more bytes
	bit TRAINERTYPE_MOVES_F, b
	jr z, .no_moves
	ld a, NUM_MOVES
	add c
	ld c, a
.no_moves
; bc = mon length
	xor a
	ld b, a

	ld e, 0
	push hl
.count_mon
	inc e
	add hl, bc
	ld a, [wTrainerGroupBank]
	call GetFarByte
	cp -1
	jr nz, .count_mon
	pop hl

.rand
	call Random
	maskbits PARTY_LENGTH
	cp e
	jr nc, .rand

	inc a
.get_mon
	dec a
	jr z, .got_mon
	add hl, bc
	jr .get_mon
.got_mon

	inc hl ; species
	ld a, [wTrainerGroupBank]
	call GetFarByte
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wStringBuffer4
	ld bc, MON_NAME_LENGTH
	jp CopyBytes

RespawnOneOffs:
	ld hl, .RoamMons
	ld c, 0
.loop
	ld a, [hli]
	ld [wTempEnemyMonSpecies], a
	cp -1
	ret z
	dec a
	call CheckCaughtMon ; caught it?
	jr z, .caught
	push hl
	ld hl, wRoamMon1Species ; get starting point
	jr .IncreseHLIndex
	ld a, [hl]
	and a ; killed it?
	pop hl
	jr nz, .caught
	inc c
	jr .loop

.caught
	ld hl, wRoamMon1Species
	jr .IncreseHLIndex
	ld a, [wTempEnemyMonSpecies]
	ld [hl], a
	
	ld hl, wRoamMon1Level
	jr .IncreseHLIndex
	ld a, 5
	ld [hl], a

	ld hl, .RoamMonsGroup
	jr .IncreseHLIndex
	ld e, [hl]
	ld hl, wRoamMon1MapGroup
	jr .IncreseHLIndex
	ld [hl], e

	ld hl, .RoamMonsMap
	jr .IncreseHLIndex
	ld e, [hl]
	ld hl, wRoamMon1MapNumber
	jr .IncreseHLIndex
	ld [hl], e

	; generate new stats
	ld hl, wRoamMon1HP
	jr .IncreseHLIndex
	xor a
	ld [wRoamMon1HP], a
	ret

.IncreseHLIndex ; needs index in c
	ld b, 0
	jr z, .index_zero
	ld a, wRoamMon1End - wRoamMon1 ; length of the RoamMon struct
	call AddNTimes ; move hl to wanted mon
.index_zero
	ret

.RoamMons:
	db RAIKOU
	db ENTEI
	db SUICUNE
	db ARTICUNO
	db ZAPDOS
	db MOLTRES
	db -1

.RoamMonsGroup:
	db GROUP_ROUTE_42
	db GROUP_ROUTE_37
	db GROUP_ROUTE_38
	db GROUP_ROUTE_19
	db GROUP_ROUTE_9
	db GROUP_ROUTE_3
	db -1

.RoamMonsMap:
	db MAP_ROUTE_42
	db MAP_ROUTE_37
	db MAP_ROUTE_38
	db MAP_ROUTE_19
	db MAP_ROUTE_9
	db MAP_ROUTE_3
	db -1

INCLUDE "data/wild/johto_grass.asm"
INCLUDE "data/wild/johto_grass_rare.asm"
INCLUDE "data/wild/johto_water.asm"
INCLUDE "data/wild/johto_shallow.asm"
INCLUDE "data/wild/kanto_grass.asm"
INCLUDE "data/wild/kanto_grass_rare.asm"
INCLUDE "data/wild/kanto_water.asm"
INCLUDE "data/wild/kanto_shallow.asm"

