CheckIfTargetIsElectricType:
	ld de, wEnemyMonType1
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wBattleMonType1
.ok
	ld a, [de]
	inc de
	cp ELECTRIC
	ret z
	ld a, [de]
	cp ELECTRIC
	ret
	
CheckMoveTypeMatchesTarget:
; Compare move type to opponent type.
; Return z if matching the opponent type,
; unless the move is Normal (Tri Attack).
	push hl
	ld hl, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wBattleMonType1
	
.ok
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp NORMAL
	jr z, .normal
	cp [hl]
	jr z, .return
	inc hl
	cp [hl]

.return
	pop hl
	ret

.normal
	ld a, 1
	and a
	pop hl
	ret
	
CheckIfTargetIsFireType:
	ld de, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wBattleMonType1
.ok
	ld a, [de]
	inc de
	cp FIRE
	ret z
	ld a, [de]
	cp FIRE
	ret	
	
CheckIfTargetIsWaterType:
	ld de, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wBattleMonType1
.ok
	ld a, [de]
	inc de
	cp WATER
	ret z
	ld a, [de]
	cp WATER
	ret

HeldItems:
	ld hl, AllItems
	ret

INCLUDE "data/held_items.asm"
	
CheckOppositeGender:
	ld a, MON_SPECIES
	call BattlePartyAttr
	ld a, [hl]
	ld [wCurPartySpecies], a

	ld a, [wCurBattleMon]
	ld [wCurPartyMon], a
	xor a
	ld [wMonType], a

	farcall GetGender
	jr c, .genderless_samegender

	ld b, 1
	jr nz, .got_gender
	dec b

.got_gender
	push bc
	ld a, [wTempEnemyMonSpecies]
	ld [wCurPartySpecies], a
	ld hl, wEnemyMonDVs
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jr z, .not_transformed
	ld hl, wEnemyBackupDVs
.not_transformed
	ld a, [hli]
	ld [wTempMonDVs], a
	ld a, [hl]
	ld [wTempMonDVs + 1], a
	ld a, 3
	ld [wMonType], a
	farcall GetGender
	pop bc
	jr c, .genderless_samegender

	ld a, 1
	jr nz, .got_enemy_gender
	dec a

.got_enemy_gender
	xor b
	jr z, .genderless_samegender

	and a
	ret

.genderless_samegender
	scf
	ret

CheckAnyOtherAlivePartyMons:
	ld hl, wPartyMon1HP
	ld a, [wPartyCount]
	ld d, a
	ld a, [wCurBattleMon]
	ld e, a
	jr CheckAnyOtherAliveMons

CheckAnyOtherAliveEnemyMons:
	ld hl, wOTPartyMon1HP
	ld a, [wOTPartyCount]
	ld d, a
	ld a, [wCurOTMon]
	ld e, a

	; fallthrough

CheckAnyOtherAliveMons:
; Check for nonzero HP starting from partymon
; HP at hl for d partymons, besides current mon e.

; Return nz if any are alive.

	xor a
	ld b, a
	ld c, a
.loop
	ld a, c
	cp d
	jr z, .done
	cp e
	jr z, .next

	ld a, [hli]
	or b
	ld b, a
	ld a, [hld]
	or b
	ld b, a

.next
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	inc c
	jr .loop

.done
	ld a, b
	and a
	ret

IgnoreSleepOnly:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar

	; Snore and Sleep Talk bypass sleep.
	cp SNORE
	jr z, .CheckSleep
	cp SLEEP_TALK
	jr z, .CheckSleep
	and a
	ret

.CheckSleep:
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	ret z

; 'ignored orders…sleeping!'
	ld hl, IgnoredSleepingText
	call StdBattleTextBox

	call EndMoveEffect

	scf
	ret
	
CheckMimicUsed:
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurMoveNum]
	jr z, .player
	ld a, [wCurEnemyMoveNum]

.player
	ld c, a
	ld a, MON_MOVES
	call UserPartyAttr

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	cp MIMIC
	jr z, .mimic
;
	ld b, 0
	add hl, bc
	ld a, [hl]
	cp MIMIC
	jr nz, .mimic

	scf
	ret

.mimic
	and a
	ret
	