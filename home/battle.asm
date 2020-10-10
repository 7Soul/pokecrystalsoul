UserPartyAttr::
	push af
	ldh a, [hBattleTurn]
	and a
	jr nz, .ot
	pop af
	jr BattlePartyAttr
.ot
	pop af
	jr OTPartyAttr

OpponentPartyAttr::
	push af
	ldh a, [hBattleTurn]
	and a
	jr z, .ot
	pop af
	jr BattlePartyAttr
.ot
	pop af
	jr OTPartyAttr

BattlePartyAttr::
; Get attribute a from the party struct of the active battle mon. 
	push bc
	ld c, a
	ld b, 0
	ld hl, wPartyMons
	add hl, bc
	ld a, [wCurBattleMon]
	call GetPartyLocation
	pop bc
	ret

OTPartyAttr::
; Get attribute a from the party struct of the active enemy mon.
	push bc
	ld c, a
	ld b, 0
	ld hl, wOTPartyMon1Species
	add hl, bc
	ld a, [wCurOTMon]
	call GetPartyLocation
	pop bc
	ret

ResetDamage::
	xor a
	ld [wCurDamage], a
	ld [wCurDamage + 1], a
	ret

SetPlayerTurn::
	xor a
	ldh [hBattleTurn], a
	ret

SetEnemyTurn::
	ld a, 1
	ldh [hBattleTurn], a
	ret

UpdateOpponentInParty::
	ldh a, [hBattleTurn]
	and a
	jr z, UpdateEnemyMonInParty
	jr UpdateBattleMonInParty

UpdateUserInParty::
	ldh a, [hBattleTurn]
	and a
	jr z, UpdateBattleMonInParty
	jr UpdateEnemyMonInParty

UpdateBattleMonInParty::
; Update level, status, current HP

	ld a, [wCurBattleMon]

UpdateBattleMon::
	ld hl, wPartyMon1Level
	call GetPartyLocation

	ld d, h
	ld e, l
	ld hl, wBattleMonLevel
	ld bc, wBattleMonMaxHP - wBattleMonLevel
	jp CopyBytes

UpdateEnemyMonInParty::
; Update level, status, current HP

; No wildmons.
	ld a, [wBattleMode]
	dec a
	ret z

	ld a, [wCurOTMon]
	ld hl, wOTPartyMon1Level
	call GetPartyLocation

	ld d, h
	ld e, l
	ld hl, wEnemyMonLevel
	ld bc, wEnemyMonMaxHP - wEnemyMonLevel
	jp CopyBytes

RefreshBattleHuds::
	call UpdateBattleHuds
	ld c, 3
	call DelayFrames
	jp WaitBGMap

UpdateBattleHuds::
	farcall UpdatePlayerHUD
	farcall UpdateEnemyHUD
	ret

INCLUDE "home/battle_vars.asm"

FarCopyRadioText::
	inc hl
	ldh a, [hROMBank]
	push af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ldh [hROMBank], a
	ld [MBC3RomBank], a
	ld a, e
	ld l, a
	ld a, d
	ld h, a
	ld de, wRadioText
	ld bc, 2 * SCREEN_WIDTH
	call CopyBytes
	pop af
	ldh [hROMBank], a
	ld [MBC3RomBank], a
	ret

MobileTextBorder::
	; For mobile link battles only.
	ld a, [wLinkMode]
	cp LINK_MOBILE
	ret c

	; Draw a cell phone icon at the
	; top right corner of the border.
	hlcoord 19, 12
	ld [hl], $5e ; top
	hlcoord 19, 13
	ld [hl], $5f ; bottom
	ret

BattleTextBox::
; Open a textbox and print text at hl.
	push hl
	call SpeechTextBox
	call MobileTextBorder
	call UpdateSprites
	call ApplyTilemap
	pop hl
	call PrintTextBoxText
	ret

StdBattleTextBox::
; Open a textbox and print battle text at 20:hl.

	ldh a, [hROMBank]
	push af

	ld a, BANK(BattleText)
	rst Bankswitch

	call BattleTextBox

	pop af
	rst Bankswitch
	ret

GetBattleAnimPointer::
	ld a, BANK(BattleAnimations)
	rst Bankswitch

	ld a, [hli]
	ld [wBattleAnimBank], a
	ld a, [hli]
	ld [wBattleAnimAddress], a
	ld a, [hl]
	ld [wBattleAnimAddress + 1], a

	ld a, BANK(BattleAnimCommands)
	rst Bankswitch

	ret

GetBattleAnimByte::
	push hl
	push de

	ld a, [wBattleAnimBank]
	rst Bankswitch

	ld hl, wBattleAnimAddress
	ld e, [hl]
	inc hl
	ld d, [hl]

	ld a, [de]
	ld [wBattleAnimByte], a
	inc de

	ld a, BANK(BattleAnimCommands)
	rst Bankswitch

	ld [hl], d
	dec hl
	ld [hl], e

	pop de
	pop hl

	ld a, [wBattleAnimByte]
	ret

HalveBC::
	srl b
	rr c
FloorBC::
	ld a, c
	or b
	ret nz
	inc c
	ret

ApplyDamageMod::
; a = $xy: multiply multiplicands by x, then divide by y
; Used by things other than damage
	push bc
	push hl
	ld b, a
	swap a
	and $f
	ld hl, hMultiplier
	ld [hl], a
	push bc
	call Multiply
	pop bc
	ld a, b
	and $f
	ld [hl], a
	ld b, 4
	call Divide
	pop hl
	pop bc
	ret

TruncateHL_BC::
.loop
; Truncate 16-bit values hl and bc to 8-bit values b and c respectively.
; b = hl, c = bc
	ld a, h
	or b
	jr z, .finish

	call HalveBC
	
	srl h
	rr l

	ld a, l
	or h
	jr nz, .finish
	inc l

.finish
	ld a, h
	or b
	jr nz, .loop
	
	ld b, l
	ret

HasUserFainted::
	ldh a, [hBattleTurn]
	and a
	jr z, HasPlayerFainted
HasEnemyFainted::
	ld hl, wEnemyMonHP
	jr CheckIfHPIsZero

HasPlayerFainted::
	ld hl, wBattleMonHP

CheckIfHPIsZero::
	ld a, [hli]
	or [hl]
	ret

RegenPartyStamina::
	ld a, [wBuffer1]
	ld hl, wPartySpecies
	and a
	jr z, .got_party_species
	ld hl, wOTPartySpecies
.got_party_species
	xor a
	ld [wCurPartyMon], a
.loop
	ld b, a
	ld a, [hli]
	cp -1
	ret z
	cp EGG
	jr z, .next

	ld a, [wBuffer1]
	push bc
	push hl
	and a ; partymon?
	jr nz, .get_otmon
	ld a, MON_STAMINA
	call GetPartyParamLocation
	ld a, [wCurBattleMon]
	ld [wBuffer2], a
	ld de, wBattleMonStamina
	jr .got_stamina_location

.get_otmon
	push bc
	ld hl, wOTPartyMons
	ld c, MON_STAMINA
	ld b, 0
	add hl, bc
	ld a, [wCurPartyMon]
	call GetPartyLocation
	pop bc
	ld a, [wCurOTMon]
	ld [wBuffer2], a
	ld de, wEnemyMonStamina

.got_stamina_location
	ld c, STA_HALF
; 	ld a, [hl]
; 	and STA_MASK
; 	and a ; 0 stamina?
; 	jr nz, .got_stamina
; 	sla c
; .got_stamina
	ld a, [wTypeModifier]
	and $7f
	cp SUPER_EFFECTIVE
	jr nz, .not_super
	sla c
.not_super
	ld a, [wBuffer2]
	cp b
	jr z, .same_battlemon
	sla c
.same_battlemon
	call ItemStaminaRegen
	push bc
	ld a, [hl]
	and STA_MASK
	add c
	cp STA_MAX
	jr c, .max
	ld a, STA_MAX
.max
	ld b, a
	ld a, [hl]
	and STA_EX_MASK
	or b
	ld [hl], a
	pop bc
	ld c, a
	ld a, [wBuffer2]
	cp b
	jr nz, .not_battlemon
	ld h, d
	ld l, e
	ld a, c
	ld [hl], a
.not_battlemon
	pop hl
.next
	ld a, [wCurPartyMon]
	inc a
	ld [wCurPartyMon], a
	pop bc
	jp .loop

; Copies current battlemon stamina to partymon stamina. 	
; Takes current stamina (including exhaustion bits) in `hl` and PARTYMON or OTPARTYMON in `[wBuffer1]`
UpdatePartyStamina::
	push bc
	ld a, [wBuffer1] 
	and a ; PARTYMON?
	ld hl, wPartyMon1Stamina
	ld a, [wCurBattleMon]
	jr z, .got_party_stamina_pointer
	ld hl, wOTPartyMon1Stamina
	ld a, [wCurOTMon]
.got_party_stamina_pointer
	call GetPartyLocation
	ld a, [wBuffer2]
	ld [hl], a
	pop bc
	ret

ItemStaminaRegen::
	push hl
	ld a, [wBuffer2]
	cp b
	jr nz, .no_regen
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	ld a, [hl]
	and %11110001
	ld b, a
; count turns
	ld a, [hl]
	and SUBSTATUS_REGEN_STAMINA_TURNS
	rra
	and a
	jr z, .no_regen
	dec a
	jr nz, .min
; turns became 0
	xor a
	res SUBSTATUS_REGEN_STAMINA, [hl]
.min
	sla a
	or b
	ld [hl], a
; increases regen amount
	and SUBSTATUS_REGEN_STAMINA_MASK
	jr z, .regen_one
	inc c
.regen_one
	inc c
	inc c ; for loop
	ld a, [wBattleMonStamina]
.loop
	dec c
	and STA_MASK
	add c
	cp STA_MAX
	jr nc, .loop
.no_regen
	pop hl
	ret

GetMoveID::
	ld a, [wCurVariableMove]
	cp -1
	scf
	ret nz
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	and a
	ret
