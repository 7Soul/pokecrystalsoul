FruitTreeScript::
	opentext
	writetext CheckingForBerries
	waitbutton
	callasm GetCurTreeFruit
	copybytetovar wCurFruit
	itemtotext USE_SCRIPT_VAR, MEM_BUFFER_0
	callasm TryResetFruitTrees
	callasm CheckFruitTree
	iffalse .fruit
	writetext NothingHereText
	waitbutton
	jump .end

.fruit	
	callasm SetBattle
	iffalse .nobattle
	writetext APokemonAttacks
	waitbutton
	closetext
	randomwildmon
	startbattle
	reloadmapafterbattle
	callasm SetLucky
.nobattle
	copybytetovar wCurFruit
	giveitem ITEM_FROM_MEM
	iffalse .packisfull
	opentext
	
	writetext ObtainedFruitText
	callasm PickedFruitTree
	specialsound
	itemnotify
	jump .end

.packisfull
	buttonsound 
	writetext FruitPackIsFullText
	waitbutton

.end	
	closetext
	end
	
SetBattle:
	push hl
	ld hl, wBadges
	ld b, 2
	call CountSetBits	
	ld a, [wNumSetBits]
	pop hl
	
	call Random 
	cp 45 percent
	jp nc, NoMon
	
	farcall RegionCheck
	ld a, e
	and a
	jr nz, .kantowild
	
	ld hl, BerryMonsDayJ
	ld a, [wTimeOfDay]
	cp DAY_F
	jr z, .next
	cp MORN_F
	jr z, .next
	ld hl, BerryMonsNiteJ
	jr .next
.kantowild
	ld hl, BerryMonsDayK
	ld a, [wTimeOfDay]
	cp DAY_F
	jr z, .next
	cp MORN_F
	jr z, .next
	ld hl, BerryMonsNiteK
	
	
.next
	ld a, 100
	call RandomRange
.loop
	sub [hl]
	jr c, .ok
	inc hl
	inc hl
	jr .loop
	
.ok
	inc hl
	ld a, [hli]
	cp -1
	jr z, NoMon	
	
	ld [wTempWildMonSpecies], a	
	ld a, [wNumSetBits]
	ld b, 3 ; b is level
	call TreeBadgeLevels
	
	
	ld a, [wTempWildMonSpecies]
	ld b, a
	call EvolveWildMon2
	ld a, b
	ld [wTempWildMonSpecies], a

	ld a, BATTLETYPE_BERRY_TREE
	ld [wBattleType], a	

	ld c, 1
	ld a, c
	ld [wScriptVar], a
	ret
	
NoMon:
	xor a
	ld [wTempWildMonSpecies], a
	ld [wCurPartyLevel], a
	ld [wLuckyWild], a
	ld c, 0
	ld a, c
	ld [wScriptVar], a
	ret

BerryMonsDayJ:
	db 20, AIPOM
	db 20, LEDYBA
	db 20, PINECO
	db 20, HOPPIP
	db 10, DELIBIRD
	db 5, POLITOED
	db 5, TOGEPI
	db -1
	
BerryMonsNiteJ:
	db 20, SMEARGLE
	db 20, TEDDIURSA
	db 20, SPINARAK
	db 20, MURKROW
	db 10, MISDREAVUS
	db 5, LARVITAR
	db 5, CROBAT
	db -1
	
BerryMonsDayK:
	db 20, CATERPIE
	db 20, WEEDLE
	db 20, MEOWTH
	db 20, MAGNEMITE
	db 10, SPEAROW
	db 5, ABRA
	db 5, JIGGLYPUFF
	db -1
	
BerryMonsNiteK:
	db 20, PARAS
	db 20, VENONAT
	db 20, MANKEY
	db 20, CLEFAIRY
	db 10, GASTLY
	db 5, SLUGMA
	db 5, KABUTO
	db -1

	
TreeBadgeLevels:
	ld hl, .levels
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	add b
	ld [wCurPartyLevel], a
	ret
	
.levels:
	db $2  ; 2
	db $a  ; 10
	db $f  ; 15
	db $18 ; 24
	db $1c ; 28
	db $1e ; 30
	db $21 ; 33
	db $24 ; 36
	db $28 ; 39
	
SetLucky:
	ld a, 5
	ld [wLuckyWild], a
	ret
	
GetAShinyDV1:
	push bc
	call Random 
	cp 10 percent
	jr nc, .NoLuck
	
	; sets b to a shiny dv
.loop_atk
	ld a, $c
	call RandomRange ; 0 to 11
	cp $b
	jr c, .ok1 ; 2 chances of getting a 10
	sub 1

.ok1
	ld b, a
	; get defense
.loop_def
	ld a, $c
	call RandomRange ; 0 to 11
	cp $b
	jr c, .ok2 ; 2 chances of getting a 10
	sub 1

.ok2
	ld c, a ; save def
	add b ; add atk to def
.mod_check
	cp 10
	jr c, .ok
	sub 10
	jr .mod_check
.ok
	cp 0 ; check if def + atk % 10 = 0
	jr nz, .loop_def

	ld a, b
	sla a
	sla a
	sla a
	sla a
	add c ; found a valid Def
	ld d, a
	pop bc
	ret
.NoLuck
	pop bc
	call RandomDVs
	ret

GetAShinyDV2:
	push bc
	call Random 
	cp 10 percent
	jr nc, .NoLuck
	
	; sets b to a shiny dv
.loop_speed
	ld a, $c
	call RandomRange ; 0 to 11
	cp $b
	jr c, .ok1 ; 2 chances of getting a 10
	sub 1

.ok1
	ld b, a
	; get spcl
.loop_spcl
	ld a, $c
	call RandomRange ; 0 to 11
	cp $b
	jr c, .ok2 ; 2 chances of getting a 10
	sub 1

.ok2
	ld c, a ; save spcl
	add b ; add spd to spcl
.mod_check
	cp 10
	jr c, .ok
	sub 10
	jr .mod_check
.ok
	cp 0 ; check if spd + spcl % 10 = 0
	jr nz, .loop_spcl

	ld a, b
	sla a
	sla a
	sla a
	sla a
	add c
	ld e, a
	pop bc
	ret
.NoLuck
	pop bc
	call RandomDVs
	ret

EvolveWildMon2:
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
	ld b, a
	ret
.evolve_cleffa
	pop hl
	ld a, CLEFAIRY
	ld b, a
	ret
.evolve_igglybuff
	pop hl
	ld a, JIGGLYPUFF
	ld b, a
	ret
.evolve_golbat
	pop hl
	ld a, CROBAT
	ld b, a
	ret
.evolve_chansey
	pop hl
	ld a, BLISSEY
	ld b, a
	ret
.evolve_item
	jp .done
.evolve_happy
	call Random 
	cp 4 percent
	jp c, .evolve_happy2
	jp .done
.lower
.done
	pop bc
	pop hl
	ret
	
GetCurTreeFruit:
	ld a, [wCurFruitTree]
	dec a
	call GetFruitTreeItem
	ld [wCurFruit], a
	ret

TryResetFruitTrees:
	ld hl, wDailyFlags1
	bit DAILYFLAGS1_ALL_FRUIT_TREES_F, [hl]
	ret nz
	jp ResetFruitTrees

CheckFruitTree:
	ld b, 2
	call GetFruitTreeFlag
	ld a, c
	ld [wScriptVar], a
	ret

PickedFruitTree:
	farcall StubbedTrainerRankings_FruitPicked
	ld b, 1
	jp GetFruitTreeFlag

ResetFruitTrees:
	xor a
	ld hl, wFruitTreeFlags
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wDailyFlags1
	set DAILYFLAGS1_ALL_FRUIT_TREES_F, [hl]
	ret

GetFruitTreeFlag:
	push hl
	push de
	ld a, [wCurFruitTree]
	dec a
	ld e, a
	ld d, 0
	ld hl, wFruitTreeFlags
	call FlagAction
	pop de
	pop hl
	ret

GetFruitTreeItem:
	push hl
	push de
	ld e, a
	ld d, 0
	ld hl, FruitTreeItems
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret

INCLUDE "data/items/fruit_trees.asm"

FruitBearingTreeText:
	text_jump _FruitBearingTreeText
	db "@"

HeyItsFruitText:
	text_jump _HeyItsFruitText
	db "@"

ObtainedFruitText:
	text_jump _ObtainedFruitText
	db "@"

FruitPackIsFullText:
	text_jump _FruitPackIsFullText
	db "@"

NothingHereText:
	text_jump _NothingHereText
	db "@"
	
CheckingForBerries:
	text_jump _CheckingForBerries
	db "@"

APokemonAttacks:
	text_jump _APokemonAttacks
	db "@"
