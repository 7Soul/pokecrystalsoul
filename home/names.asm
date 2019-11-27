NamesPointers::
; entries correspond to GetName constants (see constants/text_constants.asm)
	dba PokemonNames        ; MON_NAME (not used; jumps to GetPokemonName)
	dba MoveNames           ; MOVE_NAME
	dba NULL                ; DUMMY_NAME
	dba ItemNames           ; ITEM_NAME
	dbw 0, wPartyMonOT      ; PARTY_OT_NAME
	dbw 0, wOTPartyMonOT    ; ENEMY_OT_NAME
	dba TrainerClassNames   ; TRAINER_NAME
	dbw 4, MoveDescriptions ; MOVE_DESC_NAME_BROKEN (wrong bank)

GetName::
; Return name wCurSpecies from name list wNamedObjectTypeBuffer in wStringBuffer1.

	ldh a, [hROMBank]
	push af
	push hl
	push bc
	push de

	ld a, [wNamedObjectTypeBuffer]
	cp MON_NAME
	jr nz, .NotPokeName

	ld a, [wCurSpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, MON_NAME_LENGTH
	add hl, de
	ld e, l
	ld d, h
	jr .done

.NotPokeName:
	ld a, [wNamedObjectTypeBuffer]
	dec a
	ld e, a
	ld d, 0
	ld hl, NamesPointers
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	rst Bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wCurSpecies]
	dec a
	call GetNthString

	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes

.done
	ld a, e
	ld [wUnusedD102], a
	ld a, d
	ld [wUnusedD102 + 1], a

	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret

GetNthString::
; Return the address of the
; ath string starting from hl.

	and a
	ret z

	push bc
	ld b, a
	ld c, "@"
.readChar
	ld a, [hli]
	cp c
	jr nz, .readChar
	dec b
	jr nz, .readChar
	pop bc
	ret

GetBasePokemonName::
; Discards gender (Nidoran).

	push hl
	call GetPokemonName

	ld hl, wStringBuffer1
.loop
	ld a, [hl]
	cp "@"
	jr z, .quit
	cp "♂"
	jr z, .end
	cp "♀"
	jr z, .end
	inc hl
	jr .loop
.end
	ld [hl], "@"
.quit
	pop hl
	ret

GetPokemonName::
; Get Pokemon name for wNamedObjectIndexBuffer.

	ldh a, [hROMBank]
	push af
	push hl
	ld a, BANK(PokemonNames)
	rst Bankswitch

; Each name is ten characters
	ld a, [wNamedObjectIndexBuffer]
	dec a
	ld d, 0
	ld e, a
	ld h, 0
	ld l, a
	add hl, hl ; hl = hl * 4
	add hl, hl ; hl = hl * 4
	add hl, de ; hl = (hl*4) + de
	add hl, hl ; hl = (5*hl) + (5*hl)
	ld de, PokemonNames
	add hl, de

; Terminator
	ld de, wStringBuffer1
	push de
	ld bc, MON_NAME_LENGTH - 1
	call CopyBytes
	ld hl, wStringBuffer1 + MON_NAME_LENGTH - 1
	ld [hl], "@"
	pop de

	pop hl
	pop af
	rst Bankswitch
	ret

GetItemName::
; Get item name for wNamedObjectIndexBuffer.

	push hl
	push bc
	ld a, [wNamedObjectIndexBuffer]

	cp TM01
	jr nc, .TM

	ld [wCurSpecies], a
	ld a, ITEM_NAME
	ld [wNamedObjectTypeBuffer], a
	call GetName
	jr .Copied
.TM:
	call GetTMHMName
.Copied:
	ld de, wStringBuffer1
	pop bc
	pop hl
	ret

GetTMHMName::
; Get TM/HM name for item wNamedObjectIndexBuffer.

	push hl
	push de
	push bc
	ld a, [wNamedObjectIndexBuffer]
	push af

; TM/HM prefix
	cp HM01
	push af
	jr c, .TM
	jr .asm_34a1

.TM:
	ld hl, .TMText
	ld bc, .TMTextEnd - .TMText

.asm_34a1
	ld de, wStringBuffer1
	call CopyBytes

; TM/HM number
	push de
	ld a, [wNamedObjectIndexBuffer]
	ld c, a
	callfar GetTMHMNumber
	pop de

; HM numbers start from 51, not 1
	pop af
	ld a, c
	jr c, .asm_34b9
	sub NUM_TMS
.asm_34b9

; Divide and mod by 10 to get the top and bottom digits respectively
	ld b, "0"
.mod10
	sub 10
	jr c, .asm_34c2
	inc b
	jr .mod10
.asm_34c2
	add 10

	push af
	ld a, b
	ld [de], a
	inc de
	pop af

	ld b, "0"
	add b
	ld [de], a

; End the string
	inc de
	ld a, "@"
	ld [de], a

	pop af
	ld [wNamedObjectIndexBuffer], a
	pop bc
	pop de
	pop hl
	ret

.TMText:
	db "TM"
.TMTextEnd:
	db "@"

INCLUDE "home/hm_moves.asm"

GetMoveName::
	push hl

	ld a, MOVE_NAME
	ld [wNamedObjectTypeBuffer], a

	ld a, [wNamedObjectIndexBuffer] ; move id
	ld [wCurSpecies], a

	call GetName
	ld de, wStringBuffer1
	pop hl

	ret

GetVariableMoveName::
; takes type in wCurType, move id in 'e' and puts string in wStringBuffer1
	ld a, [wCurType]
	ld b, a
	ld a, e
	cp FIRE_PLAY
	jr nz, .not_fire_play 
	ld a, b
	cp WATER
	jp z, .water_play
	cp FIRE
	jp z, .fire_play
	ld de, .FlyingPlayName
	jp .end
.water_play
	ld de, .WaterPlayName
	jp .end
.fire_play
	ld de, .FirePlayName
	jp .end

.not_fire_play
	ld a, e
	cp CROSS_CHOP
	jr nz, .not_cross_chop
	ld a, b
	cp ROCK
	jp z, .stone_edge
	ld de, .CrossChop
	jp .end
.stone_edge
	ld de, .StoneEdge
	jp .end

.not_cross_chop
	ld a, e
	cp DOUBLE_EDGE
	jr nz, .not_double_edge
	ld a, b
	cp FLYING
	jp z, .brave_bird
	cp GRASS
	jp z, .wood_hammer
	ld de, .DoubleEdge
	jp .end
.brave_bird
	ld de, .BraveBird
	jp .end
.wood_hammer
	ld de, .WoodHammer
	jp .end

.not_double_edge
	ld a, e
	cp QUICK_ATTACK
	jr nz, .not_quick_attack
	ld a, b
	cp ICE
	jp z, .ice_shard
	ld de, .QuickAttack
	jp .end
.ice_shard
	ld de, .IceShard
	jp .end
.not_quick_attack

	ld a, e
	cp SLASH
	jr nz, .not_slash
	ld a, b
	cp DARK
	jp z, .night_slash
	cp GRASS
	jp z, .leaf_blade
	ld de, .Slash
	jp .end
.night_slash
	ld de, .NightSlash
	jp .end
.leaf_blade
	ld de, .LeafBlade
	jp .end
.not_slash
.end
	push de
	ld hl, wStringBuffer1
	call CopyName2
	pop de
	ret

INCLUDE "data/moves/variable_moves_names.asm"
