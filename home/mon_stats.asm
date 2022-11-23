IsAPokemon::
; Return carry if species a is not a Pokemon.
	and a
	jr z, .NotAPokemon
	cp EGG
	jr z, .Pokemon
	cp NUM_POKEMON + 1
	jr c, .Pokemon

.NotAPokemon:
	scf
	ret

.Pokemon:
	and a
	ret

DrawBattleHPBar::
; Draw an HP bar d tiles long at hl
; Fill it up to e pixels

	push hl
	push de
	push bc

; Place 'HP:'
	ld a, $60
	ld [hli], a
	ld a, $61
	ld [hli], a

; Draw a template
	push hl
	ld a, $62 ; empty bar
.template
	ld [hli], a
	dec d
	jr nz, .template
	; ld a, $6b ; bar end
	; add b
	; ld [hl], a
	pop hl

; Safety check # pixels
	ld a, e
	and a
	jr nz, .fill
	ld a, c
	and a
	jr z, .done
	ld e, 1

.fill
; Keep drawing tiles until pixel length is reached
	ld a, e
	sub TILE_WIDTH
	jr c, .lastbar

	ld e, a
	ld a, $6a ; full bar
	ld [hli], a
	ld a, e
	and a
	jr z, .done
	jr .fill

.lastbar
	ld a, $62  ; empty bar
	add e      ; + e
	ld [hl], a

.done
	pop bc
	pop de
	pop hl
	ret

PrepMonFrontpic::
	ld a, $1
	ld [wBoxAlignment], a

_PrepMonFrontpic::
	ld a, [wCurPartySpecies]
	call IsAPokemon
	jr c, .not_pokemon

	push hl
	ld de, vTiles2
	predef GetMonFrontpic
	pop hl
	xor a
	ldh [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	xor a
	ld [wBoxAlignment], a
	ret

.not_pokemon
	xor a
	ld [wBoxAlignment], a
	inc a
	ld [wCurPartySpecies], a
	ret

GetTraitFromBaseStats1::
	push hl
	push bc
	and FIRST_TRAIT_MASK
	ld hl, wBaseTraits
	ld b, 0
	ld c, a
	add hl, bc
	; store the fact we're dealing with trait 1
	xor a
	ld [wCurTraitIndex], a
	; store trait id
	ld a, [hl]
	ld [wCurTraitID], a
	pop bc
	pop hl
	ret

GetTraitFromBaseStats2::
	push hl
	push bc
	and SECOND_TRAIT_MASK
	rra
	rra
	add 4
	ld hl, wBaseTraits
	ld b, 0
	ld c, a
	add hl, bc
	; store the fact we're dealing with trait 2
	ld a, 1
	ld [wCurTraitIndex], a
	; store trait id
	ld a, [hl]
	ld [wCurTraitID], a
	pop bc
	pop hl
	ret

SetTraitsFromBaseData::
	; used for player and enemy mon when a battle starts
	; hl has partymon location
	ld bc, MON_TRAIT
	add hl, bc ; wPartymon1Trait
SetTraitsFromBaseDataGotTrait::
	; wild mon starts here
	push hl
	; grab trait 1 index
	ld a, [hl]
	and FIRST_TRAIT_MASK
	ld hl, wBaseTraits
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	pop hl
	ld [de], a ; wBattleMonTrait/wEnemyMonTrait

	push hl
	; grab trait 2 index
	ld a, [hl]
	and SECOND_TRAIT_MASK
	rra
	rra
	add 4
	ld hl, wBaseTraits
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	pop hl
	inc de
	ld [de], a ; wBattleMonTrait2/wEnemyMonTrait2

	; get trait from pair
	ld a, [hl]
	and PAIR_ID_MASK
	swap a
	and a
	ret z

	ld [wCurPartyMon], a
	ld a, MON_SPECIES
	call GetPartyParamLocation

	ld [wCurSpecies], a
	call GetBaseData
	ld bc, MON_TRAIT
	add hl, bc ; wPartymon1Trait

	ld a, [hl]
	and FIRST_TRAIT_MASK
	ld hl, wBaseTraits
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]

	inc de
	ld [de], a ; wBattleMonTrait3/wEnemyMonTrait3

	ld a, [wCurPartyMon]
	inc de
	ld [de], a ; wBattleMonPairIndex/wEnemyMonPairIndex
	ret

	