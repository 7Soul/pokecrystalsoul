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
.reset
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
	ld a, [wNumSetBits]
	ld b, a
	ld a, [hl] ; get the encounter rate of the selected mon
	cp 5
	jr nz, .highBadge ; randomized encounter is not 5 (not the 2 rarest encounters)
	ld a, b
	cp 2
	jr nc, .highBadge ; 2 or higher (2 badges or more)
	ld a, [hl]
	ld [$c003], a
	jp .reset

.highBadge
	inc hl
	ld a, [hli]
	cp -1
	jr z, NoMon	
	
	ld [wTempWildMonSpecies], a	
	ld a, $4
	call RandomRange ; 0 to 3
	ld b, a
	ld a, [wNumSetBits]
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
	db 11, AIPOM
	db 11, LEDYBA
	db 11, PINECO
	db 11, HOPPIP
	db 11, DELIBIRD
	db 6, POLITOED
	db 6, TOGEPI
	db -1
	
BerryMonsNiteJ:
	db 11, SMEARGLE
	db 11, TEDDIURSA
	db 11, SPINARAK
	db 11, MURKROW
	db 11, MISDREAVUS
	db 6, LARVITAR
	db 6, CROBAT
	db -1
	
BerryMonsDayK:
	db 11, CATERPIE
	db 11, WEEDLE
	db 11, MEOWTH
	db 11, MAGNEMITE
	db 11, IGGLYBUFF
	db 6, ABRA
	db 6, DITTO
	db -1
	
BerryMonsNiteK:
	db 11, PARAS
	db 11, VENONAT
	db 11, MANKEY
	db 11, GASTLY
	db 11, CLEFFA
	db 6, SLUGMA
	db 6, KABUTO
	db -1

	
TreeBadgeLevels:
	ld hl, .levels
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	add b
	cp $1
	ld b, a
	jr nz, .not_level_one
	inc a
	ld b, a
.not_level_one
	cp $7
	jr nc, .finish
	ld a, $5 ; add 0 to 4 if badge count is 7 or higher
	call RandomRange
	add b
.finish
	ld [wCurPartyLevel], a
	ret
	
.levels:
	db $1  ; 0
	db $4  ; 4
	db $9  ; 9
	db $c  ; 12
	db $10 ; 16 ; 4 badges
	db $12 ; 18
	db $14 ; 20
	db $17 ; 23
	db $19 ; 25 ; 8 badges
	db $1b ; 27
	db $1d ; 29
	db $1f ; 31
	db $21 ; 33 ; 12 badges
	db $23 ; 35
	db $25 ; 37
	db $28 ; 40
	db $2b ; 43 ; 16 badges
	
SetLucky:
	ld a, 5
	ld [wLuckyWild], a
	ret
	
GetAShinyDV1:
	push bc
	call Random 
	cp b
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
	cp b
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
	cp 15 percent ; 0 <= diff < 5
	jp c, .finish_evolve
	jp .done
	
.diff_greaterthan5
	ld a, d
	cp 10
	jp nc, .diff_greaterthan10
	call Random 
	cp 25 percent ; 5 <= diff < 10
	jp c, .finish_evolve
	jp .done
	
.diff_greaterthan10
	ld a, d
	cp 15
	jp nc, .diff_greaterthan15
	call Random 
	cp 40 percent ; 10 <= diff < 15
	jp c, .finish_evolve
	jp .done
	
.diff_greaterthan15
	ld a, d
	cp 20
	jp nc, .diff_greaterthan20
	call Random 
	cp 50 percent ; 15 <= diff < 20
	jp c, .finish_evolve
	jp .done
	
.diff_greaterthan20
	ld a, d
	cp 25
	jp nc, .diff_greaterthan25
	call Random 
	cp 60 percent ; 20 <= diff < 25
	jp c, .finish_evolve
	jp .done
	
.diff_greaterthan25
	ld a, d
	cp 30
	jp nc, .finish_evolve
	call Random 
	cp 70 percent ; 25 <= diff < 35
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
