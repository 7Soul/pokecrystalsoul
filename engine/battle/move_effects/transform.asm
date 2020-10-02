
BattleCommand_Transform:
; transform

	call ClearLastMove
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_TRANSFORMED, [hl]
	jp nz, BattleEffect_ButItFailed
	call CheckHiddenOpponent
	jp nz, BattleEffect_ButItFailed
	xor a
	ld [wNumHits], a
	ld [wFXAnimID + 1], a
	ld a, $1
	ld [wKickCounter], a
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_SUBSTITUTE, [hl]
	push af
	jr z, .mimic_substitute
	call CheckUserIsCharging
	jr nz, .mimic_substitute
	ld a, SUBSTITUTE
	call LoadAnim
.mimic_substitute
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	set SUBSTATUS_TRANSFORMED, [hl]
	call ResetActorDisable
	; hl points to opponent's data
	; de points to self data
	ld hl, wBattleMonSpecies
	ld de, wEnemyMonSpecies
	ldh a, [hBattleTurn]
	and a
	jr nz, .got_mon_species
	ld hl, wEnemyMonSpecies
	ld de, wBattleMonSpecies
	xor a
	ld [wCurMoveNum], a
.got_mon_species
	push hl
	ld a, [hli]
	ld [de], a
	inc hl
	inc hl
	inc de
	inc de
	inc de
	ld bc, NUM_MOVES
	call CopyBytes
	ldh a, [hBattleTurn]
	and a
	jr z, .mimic_enemy_backup
	ld a, [de]
	ld [wEnemyBackupDVs], a
.mimic_enemy_backup
; copy DVs
	ld a, [hli]
	ld [de], a
	inc hl
	inc de
	inc de
	; HL DE point to PP start
; move pointer to stats
	ld bc, wBattleMonStats - wBattleMonPP
	add hl, bc
	push hl ; HL points to foe's Stats
	ld h, d
	ld l, e
	add hl, bc
	ld d, h
	ld e, l ; DE points to self Stats
	pop hl 
	ld bc, wBattleMonStructEnd - wBattleMonStats
	call CopyBytes
; init the power points
	ld bc, wBattleMonPP - wBattleMonStructEnd
	add hl, bc ; HL points to foe's PP
	; swap HL and DE
	push de
	ld d, h
	ld e, l
	pop hl
	; DE points to foe's PP
	ld bc, wBattleMonPP - wBattleMonStructEnd
	add hl, bc
	; HL points to user's PP
	ld b, NUM_MOVES
.pp_loop
	ld a, [de]
	inc de
.done_move
	ld [hli], a
	dec b
	jr nz, .pp_loop
	pop hl
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wEnemyStats
	ld de, wPlayerStats
	ld bc, 2 * 5
	call BattleSideCopy
	ld hl, wEnemyStatLevels
	ld de, wPlayerStatLevels
	ld bc, 8
	call BattleSideCopy
	call _CheckBattleScene
	jr c, .mimic_anims
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerMinimized]
	jr z, .got_byte
	ld a, [wEnemyMinimized]
.got_byte
	and a
	jr nz, .mimic_anims
	call LoadMoveAnim
	jr .after_anim

.mimic_anims
	call BattleCommand_MoveDelay
	call BattleCommand_RaiseSubNoAnim
.after_anim
	xor a
	ld [wNumHits], a
	ld [wFXAnimID + 1], a
	ld a, $2
	ld [wKickCounter], a
	pop af
	ld a, SUBSTITUTE
	call nz, LoadAnim

	farcall TraitTransform

	ret
	; ld hl, TransformedText
	; jp StdBattleTextBox
