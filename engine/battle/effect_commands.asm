DoPlayerTurn:
	call SetPlayerTurn

	ld a, [wBattlePlayerAction]
	and a ; BATTLEPLAYERACTION_USEMOVE?
	ret nz

	jr DoTurn

DoEnemyTurn:
	call SetEnemyTurn

	ld a, [wLinkMode]
	and a
	jr z, DoTurn

	ld a, [wBattleAction]
	cp BATTLEACTION_STRUGGLE
	jr z, DoTurn
	cp BATTLEACTION_SWITCH1
	ret nc

	; fallthrough

DoTurn:
; Read in and execute the user's move effects for this turn.

	xor a
	ld [wTurnEnded], a

	; Effect command checkturn is called for every move.
	call CheckTurn

	ld a, [wTurnEnded]
	and a
	ret nz

	call UpdateMoveData

DoMove:
; Get the user's move effect.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	ld c, a
	ld b, 0
	ld hl, MoveEffectsPointers
	add hl, bc
	add hl, bc
	ld a, BANK(MoveEffectsPointers)
	call GetFarHalfword

	ld de, wBattleScriptBuffer

.GetMoveEffect:
	ld a, BANK(MoveEffects)
	call GetFarByte
	inc hl
	ld [de], a
	inc de
	cp endmove_command
	jr nz, .GetMoveEffect

; Start at the first command.
	ld hl, wBattleScriptBuffer
	ld a, [wBuffer6]
	cp 1
	jr nz, .normal_move
	inc hl ; skip checkobedience
	inc hl ; skip usedmovetext
.normal_move
	ld a, l
	ld [wBattleScriptBufferAddress], a
	ld a, h
	ld [wBattleScriptBufferAddress + 1], a

.ReadMoveEffectCommand:
; ld a, [wBattleScriptBufferAddress++]
	ld a, [wBattleScriptBufferAddress]
	ld l, a
	ld a, [wBattleScriptBufferAddress + 1]
	ld h, a

	ld a, [hli]

	push af
	ld a, l
	ld [wBattleScriptBufferAddress], a
	ld a, h
	ld [wBattleScriptBufferAddress + 1], a
	pop af

; endturn_command (-2) is used to terminate branches without ending the read cycle.
	cp endturn_command
	ret nc

; The rest of the commands (01-af) are read from BattleCommandPointers.
	push bc
	dec a
	ld c, a
	ld b, 0
	ld hl, BattleCommandPointers
	add hl, bc
	add hl, bc
	pop bc

	ld a, BANK(BattleCommandPointers)
	call GetFarHalfword

	call .DoMoveEffectCommand

	jr .ReadMoveEffectCommand

.DoMoveEffectCommand:
	jp hl
	
	; push bc
	; dec a
	; ld c, a
	; ld b, 0
	; ld hl, BattleCommandPointers
	; add hl, bc
	; add hl, bc
	; add hl, bc

	; ld a, BANK(BattleCommandPointers)
	; call GetFarByteHalfword
	; pop bc
	; call .CallEffectCommand
	; jr .ReadMoveEffectCommand
	
; .CallEffectCommand
    ; cp BANK(.CallEffectCommand)
    ; jp nz, FarCall_hl
    ; jp hl
	
; .DoMoveEffectCommand:
	; jp hl

DoExactMoveSimple:
	ld a, 1
	ld [wBuffer6], a
DoExactMove:
	ld a, [wBuffer2]
	ld [wCurEnemyMove], a
	ld [wCurPlayerMove], a
	call UpdateMoveData
	xor a
	ld [wAttackMissed], a
	ld [wAlreadyDisobeyed], a
	ld a, EFFECTIVE
	ld [wTypeModifier], a
	jp DoMove

CheckTurn:
BattleCommand_CheckTurn:
; checkturn

; Repurposed as hardcoded turn handling. Useless as a command.

; Move $ff immediately ends the turn.
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	inc a
	jp z, EndTurn

	xor a
	ld [wAttackMissed], a
	ld [wEffectFailed], a
	ld [wKickCounter], a
	ld [wAlreadyDisobeyed], a
	ld [wAlreadyFailed], a
	ld [wSomeoneIsRampaging], a

	ld a, EFFECTIVE
	ld [wTypeModifier], a

	ldh a, [hBattleTurn]
	and a
	jp nz, CheckEnemyTurn

CheckPlayerTurn:
	ld hl, wPlayerSubStatus4
	bit SUBSTATUS_RECHARGE, [hl]
	jr z, .no_recharge

	res SUBSTATUS_RECHARGE, [hl]
	ld hl, MustRechargeText
	call StdBattleTextBox
	call CantMove
	jp EndTurn

.no_recharge
	farcall CountDownAllStatus

	ld hl, wBattleMonStatus
	ld a, [hl]
	and SLP
	jr z, .not_asleep

	dec a
	ld [wBattleMonStatus], a
	and SLP
	jr z, .woke_up

	xor a
	ld [wNumHits], a
	ld de, ANIM_SLP
	call FarPlayBattleAnimation
	jr .fast_asleep

.woke_up
	ld hl, WokeUpText
	call StdBattleTextBox
	call CantMove
	call UpdateBattleMonInParty
	ld hl, UpdatePlayerHUD
	call CallBattleCore
	ld a, $1
	ldh [hBGMapMode], a
	ld hl, wPlayerSubStatus1
	res SUBSTATUS_NIGHTMARE, [hl]
	jr .not_asleep

.fast_asleep
	ld hl, FastAsleepText
	call StdBattleTextBox

	; Snore and Sleep Talk bypass sleep.
	ld a, [wCurPlayerMove]
	cp SNORE
	jr z, .not_asleep
	cp SLEEP_TALK
	jr z, .not_asleep

	call CantMove
	jp EndTurn

.not_asleep

	ld hl, wBattleMonStatus
	bit FRZ, [hl]
	jr z, .not_frozen

	; Flame Wheel and Sacred Fire thaw the user.
	ld a, [wCurPlayerMove]
	cp FLAME_WHEEL
	jr z, .not_frozen
	cp SACRED_FIRE
	jr z, .not_frozen

	ld hl, FrozenSolidText
	call StdBattleTextBox

	call CantMove
	jp EndTurn

.not_frozen

	ld hl, wPlayerSubStatus3
	bit SUBSTATUS_FLINCHED, [hl]
	jr z, .not_flinched

	res SUBSTATUS_FLINCHED, [hl]
	ld hl, FlinchedText
	call StdBattleTextBox
	call CantMove

	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitRaiseStat
	
	jp EndTurn

.not_flinched

	ld hl, wPlayerDisableCount
	ld a, [hl]
	and a
	jr z, .not_disabled

	dec a
	ld [hl], a
	and $f
	jr nz, .not_disabled

	ld [hl], a
	ld [wDisabledMove], a
	ld hl, DisabledNoMoreText
	call StdBattleTextBox

.not_disabled

	ld a, [wPlayerSubStatus3]
	add a
	jr nc, .not_confused
	ld hl, wPlayerConfuseCount
	dec [hl]
	jr nz, .confused

	ld hl, wPlayerSubStatus3
	res SUBSTATUS_CONFUSED, [hl]
	ld hl, ConfusedNoMoreText
	call StdBattleTextBox
	jr .not_confused

.confused
	ld hl, IsConfusedText
	call StdBattleTextBox
	xor a
	ld [wNumHits], a
	ld de, ANIM_CONFUSED
	call FarPlayBattleAnimation

	; 50% chance of hitting itself
	call BattleRandom
	cp 50 percent + 1
	jr nc, .not_confused

	; clear confusion-dependent substatus
	ld hl, wPlayerSubStatus3
	ld a, [hl]
	and 1 << SUBSTATUS_CONFUSED
	ld [hl], a

	call HitConfusion
	call CantMove
	jp EndTurn

.not_confused

	ld a, [wPlayerSubStatus1]
	add a ; bit SUBSTATUS_ATTRACT
	jr nc, .not_infatuated

	ld hl, InLoveWithText
	call StdBattleTextBox
	xor a
	ld [wNumHits], a
	ld de, ANIM_IN_LOVE
	call FarPlayBattleAnimation

	; 50% chance of infatuation
	call BattleRandom
	cp 50 percent + 1
	jr c, .not_infatuated

	ld hl, InfatuationText
	call StdBattleTextBox
	call CantMove
	jp EndTurn

.not_infatuated

	; We can't disable a move that doesn't exist.
	ld a, [wDisabledMove]
	and a
	jr z, .no_disabled_move

	; Are we using the disabled move?
	ld hl, wCurPlayerMove
	cp [hl]
	jr nz, .no_disabled_move

	call MoveDisabled
	call CantMove
	jp EndTurn

.no_disabled_move

	ld hl, wBattleMonStatus
	bit PAR, [hl]
	ret z

	; 25% chance to be fully paralyzed
	call BattleRandom
	cp 25 percent
	ret nc

	ld hl, FullyParalyzedText
	call StdBattleTextBox
	call CantMove
	jp EndTurn

CantMove:
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_ROLLOUT, [hl]

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	ld a, [hl]
	and $ff ^ (1 << SUBSTATUS_RAMPAGE | 1 << SUBSTATUS_CHARGED)
	ld [hl], a

	call ResetFuryCutterCount

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp FLY
	jr z, .fly_dig

	cp DIG
	ret nz

.fly_dig
	res SUBSTATUS_UNDERGROUND, [hl]
	res SUBSTATUS_FLYING, [hl]
	jp AppearUserRaiseSub

OpponentCantMove:
	call BattleCommand_SwitchTurn
	call CantMove
	jp BattleCommand_SwitchTurn

CheckEnemyTurn:
	ld hl, wEnemySubStatus4
	bit SUBSTATUS_RECHARGE, [hl]
	jr z, .no_recharge

	res SUBSTATUS_RECHARGE, [hl]
	ld hl, MustRechargeText
	call StdBattleTextBox
	call CantMove
	jp EndTurn

.no_recharge
	farcall CountDownAllStatus

	ld hl, wEnemyMonStatus
	ld a, [hl]
	and SLP
	jr z, .not_asleep

	dec a
	ld [wEnemyMonStatus], a
	and a
	jr z, .woke_up

	ld hl, FastAsleepText
	call StdBattleTextBox
	xor a
	ld [wNumHits], a
	ld de, ANIM_SLP
	call FarPlayBattleAnimation
	jr .fast_asleep

.woke_up
	ld hl, WokeUpText
	call StdBattleTextBox
	call CantMove
	call UpdateEnemyMonInParty
	ld hl, UpdateEnemyHUD
	call CallBattleCore
	ld a, $1
	ldh [hBGMapMode], a
	ld hl, wEnemySubStatus1
	res SUBSTATUS_NIGHTMARE, [hl]
	jr .not_asleep

.fast_asleep
	; Snore and Sleep Talk bypass sleep.
	ld a, [wCurEnemyMove]
	cp SNORE
	jr z, .not_asleep
	cp SLEEP_TALK
	jr z, .not_asleep
	call CantMove
	jp EndTurn

.not_asleep

	ld hl, wEnemyMonStatus
	bit FRZ, [hl]
	jr z, .not_frozen

	; Flame Wheel and Sacred Fire thaw the user.
	ld a, [wCurEnemyMove]
	cp FLAME_WHEEL
	jr z, .not_frozen
	cp SACRED_FIRE
	jr z, .not_frozen

	ld hl, FrozenSolidText
	call StdBattleTextBox
	call CantMove
	jp EndTurn

.not_frozen

	ld hl, wEnemySubStatus3
	bit SUBSTATUS_FLINCHED, [hl]
	jr z, .not_flinched

	ld hl, FlinchedText
	call StdBattleTextBox
	call CantMove

	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitRaiseStat

	res SUBSTATUS_FLINCHED, [hl]

	jp EndTurn

.not_flinched

	ld hl, wEnemyDisableCount
	ld a, [hl]
	and a
	jr z, .not_disabled

	dec a
	ld [hl], a
	and $f
	jr nz, .not_disabled

	ld [hl], a
	ld [wEnemyDisabledMove], a

	ld hl, DisabledNoMoreText
	call StdBattleTextBox

.not_disabled

	ld a, [wEnemySubStatus3]
	add a ; bit SUBSTATUS_CONFUSED
	jr nc, .not_confused

	ld hl, wEnemyConfuseCount
	dec [hl]
	jr nz, .confused

	ld hl, wEnemySubStatus3
	res SUBSTATUS_CONFUSED, [hl]
	ld hl, ConfusedNoMoreText
	call StdBattleTextBox
	jr .not_confused

.confused
	ld hl, IsConfusedText
	call StdBattleTextBox

	xor a
	ld [wNumHits], a
	ld de, ANIM_CONFUSED
	call FarPlayBattleAnimation

	; 50% chance of hitting itself
	call BattleRandom
	cp 50 percent + 1
	jr nc, .not_confused

	; clear confusion-dependent substatus
	ld hl, wEnemySubStatus3
	ld a, [hl]
	and 1 << SUBSTATUS_CONFUSED
	ld [hl], a

	ld hl, HurtItselfText
	call StdBattleTextBox
	call HitSelfInConfusion
	call BattleCommand_DamageCalc
	call BattleCommand_LowerSub
	xor a
	ld [wNumHits], a

	; Flicker the monster pic unless flying or underground.
	ld de, ANIM_HIT_CONFUSION
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	call z, PlayFXAnimID

	ld c, TRUE
	call DoEnemyDamage
	call BattleCommand_RaiseSub
	call CantMove
	jp EndTurn

.not_confused

	ld a, [wEnemySubStatus1]
	add a ; bit SUBSTATUS_ATTRACT
	jr nc, .not_infatuated

	ld hl, InLoveWithText
	call StdBattleTextBox
	xor a
	ld [wNumHits], a
	ld de, ANIM_IN_LOVE
	call FarPlayBattleAnimation

	; 50% chance of infatuation
	call BattleRandom
	cp 50 percent + 1
	jr c, .not_infatuated

	ld hl, InfatuationText
	call StdBattleTextBox
	call CantMove
	jp EndTurn

.not_infatuated

	; We can't disable a move that doesn't exist.
	ld a, [wEnemyDisabledMove]
	and a
	jr z, .no_disabled_move

	; Are we using the disabled move?
	ld hl, wCurEnemyMove
	cp [hl]
	jr nz, .no_disabled_move

	call MoveDisabled

	call CantMove
	jp EndTurn

.no_disabled_move

	ld hl, wEnemyMonStatus
	bit PAR, [hl]
	ret z

	; 25% chance to be fully paralyzed
	call BattleRandom
	cp 25 percent
	ret nc

	ld hl, FullyParalyzedText
	call StdBattleTextBox
	call CantMove

	; fallthrough

EndTurn:
	ld a, $1
	ld [wTurnEnded], a
	jp ResetDamage

MoveDisabled:
	; Make sure any charged moves fail
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_CHARGED, [hl]

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld [wNamedObjectIndexBuffer], a
	call GetMoveName

	ld hl, DisabledMoveText
	jp StdBattleTextBox

HitConfusion:
	ld hl, HurtItselfText
	call StdBattleTextBox

	xor a
	ld [wCriticalHit], a

	call HitSelfInConfusion
	call BattleCommand_DamageCalc
	call BattleCommand_LowerSub

	xor a
	ld [wNumHits], a

	; Flicker the monster pic unless flying or underground.
	ld de, ANIM_HIT_CONFUSION
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	call z, PlayFXAnimID

	ld hl, UpdatePlayerHUD
	call CallBattleCore
	ld a, $1
	ldh [hBGMapMode], a
	ld c, TRUE
	call DoPlayerDamage
	jp BattleCommand_RaiseSub

BattleCommand_CheckObedience:
; checkobedience

	; Enemy can't disobey
	ldh a, [hBattleTurn]
	and a
	ret nz

	call CheckUserIsCharging
	ret nz

	; If we've already checked this turn
	ld a, [wAlreadyDisobeyed]
	and a
	ret nz

	xor a
	ld [wAlreadyDisobeyed], a

	; No obedience in link battles
	; (since no handling exists for enemy)
	ld a, [wLinkMode]
	and a
	ret nz

	ld a, [wInBattleTowerBattle]
	and a
	ret nz

	; ld a, [wBattleMonStamina]
	; and STA_EX_MASK
	; cp $30
	; ld b, $80
	; ld c, $40 ; half of b (means 25% chance down the line)
	; ld d, $c0 ; b + c
	; jp z, .rand1

	; If the monster's id doesn't match the player's,
	; some conditions need to be met.
	ld a, MON_ID
	call BattlePartyAttr

	ld a, [wPlayerID]
	cp [hl]
	jr nz, .obeylevel
	inc hl
	ld a, [wPlayerID + 1]
	cp [hl]
	ret z

.obeylevel
	; The maximum obedience level is constrained by owned badges:
	ld hl, wBadges
	ld b, 2
	call CountSetBits
	rrca
	inc a
	ld b, a
	dec b
; no badges
	ld a, 10
	jr z, .getlevel
	dec b
; 2 badges
	ld a, 30
	jr z, .getlevel
	dec b
; 4 badges
	ld a, 50
	jr z, .getlevel
	dec b
; 6 badges
	ld a, 70
	jr z, .getlevel
; 8 badges
	ld a, MAX_LEVEL + 1

.getlevel
; c = obedience level
; d = monster level
; b = c + d

	ld b, a
	ld c, a

	ld a, [wBattleMonLevel]
	ld d, a

	add b
	ld b, a

; checklevel
; If the monster's level is lower than the obedience level, it will obey.
	ld a, c
	cp d
	ret nc

; Random number from 0 to obedience level + monster level
.rand1
	call BattleRandom
	swap a
	cp b
	jr nc, .rand1

; The higher above the obedience level the monster is,
; the more likely it is to disobey.
	cp c
	ret c

; Sleep-only moves have separate handling, and a higher chance of
; being ignored. Lazy monsters like their sleep.
	farcall IgnoreSleepOnly
	ret c

; Another random number from 0 to obedience level + monster level
.rand2
	call BattleRandom
	cp b
	jr nc, .rand2

; A second chance.
	cp c
	jr c, .UseInstead

; No hope of using a move now.
; b = number of levels the monster is above the obedience level
	ld a, d
	sub c
	ld b, a

.force
; The chance of napping is the difference out of 256.
	call BattleRandom
	swap a
	sub b
	jr c, .Nap

; The chance of not hitting itself is the same.
	cp b
	jr nc, .DoNothing

	ld hl, WontObeyText
	call StdBattleTextBox
	call HitConfusion
	jp .EndDisobedience

.Nap:
	call BattleRandom
	add a
	swap a
	and SLP
	jr z, .Nap

	ld hl, wBattleMonStatus
	ldh a, [hBattleTurn]
	and a
	jr z, .player_status
	ld hl, wEnemyMonStatus
.player_status
	ld [hl], a

	ld hl, BeganToNapText
	jr .Print

.DoNothing:
	; 4 random choices
	call BattleRandom
	and %11

	ld hl, LoafingAroundText
	and a ; 0
	jr z, .Print

	ld hl, WontObeyText
	dec a ; 1
	jr z, .Print

	ld hl, TurnedAwayText
	dec a ; 2
	jr z, .Print

	ld hl, IgnoredOrdersText

.Print:
	call StdBattleTextBox
	jp .EndDisobedience

.UseInstead:
; Can't use another move if the monster only has one!
	ld a, [wBattleMonMoves + 1]
	and a
	jr z, .DoNothing

; Don't bother trying to handle Disable.
	ld a, [wDisabledMove]
	and a
	jr nz, .DoNothing

	ld hl, wBattleMonPP
	ld de, wBattleMonMoves
	ld b, 0
	ld c, NUM_MOVES

.GetTotalPP:
	ld a, [hli]
	and PP_MASK
	add b
	ld b, a

	dec c
	jr z, .CheckMovePP

; Stop at undefined moves.
	inc de
	ld a, [de]
	and a
	jr nz, .GetTotalPP

.CheckMovePP:
	; ld hl, wBattleMonPP
	; ld a, [wCurMoveNum]
	; ld e, a
	; ld d, 0
	; add hl, de

; Can't use another move if only one move has PP.
	; ld a, [hl]
	; and PP_MASK
	; cp b
	; jr z, .DoNothing

; Make sure we can actually use the move once we get there.
	ld a, 1
	ld [wAlreadyDisobeyed], a

	ld a, [w2DMenuNumRows]
	ld b, a

; Save the move we originally picked for afterward.
	ld a, [wCurMoveNum]
	ld c, a
	push af

.RandomMove:
	call BattleRandom
	maskbits NUM_MOVES

	cp b
	jr nc, .RandomMove

; Not the move we were trying to use.
	cp c
	jr z, .RandomMove

; Make sure it has PP.
	ld [wCurMoveNum], a
	; ld hl, wBattleMonPP
	; ld e, a
	; ld d, 0
	; add hl, de
	; ld a, [hl]
	; and PP_MASK
	; jr z, .RandomMove

; Use it.
	; ld a, [wCurMoveNum]
	ld c, a
	ld b, 0
	ld hl, wBattleMonMoves
	add hl, bc
	ld a, [hl]
	ld [wCurPlayerMove], a

	call SetPlayerTurn
	call UpdateMoveData
	call DoMove

; Restore original move choice.
	pop af
	ld [wCurMoveNum], a

.EndDisobedience:
	xor a
	ld [wLastPlayerMove], a
	ld [wLastPlayerCounterMove], a

	; Break Encore too.
	ld hl, wPlayerSubStatus5
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [wPlayerEncoreCount], a

	jp EndMoveEffect

BattleCommand_UsedMoveText:
; usedmovetext
	farcall DisplayUsedMoveText
	ret

CheckUserIsCharging:
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerCharging] ; player
	jr z, .end
	ld a, [wEnemyCharging] ; enemy
.end
	and a
	ret

BattleCommand_DoTurn:
	call CheckUserIsCharging
	ret nz
	; each turn of battle counts as 4 steps for egg hatching 50% of the time
	; ex: in a battle that lasts 5 tuns, the player gains 20 to 40 steps
	call BattleRandom
	cp 50 percent
	jr c, .no_step
	ld hl, wStepCount
	ld a, [hl]
	; stop adding if the player is within 1 step of checking for eggs cycles
	cp $7F - 4
	jr z, .no_step
	add 4
	ld [hl], a
.no_step
	ld hl, wBattleMonPP
	ld de, wPlayerSubStatus3
	ld bc, wPlayerTurnsTaken

	ldh a, [hBattleTurn]
	and a
	jr z, .proceed

	ld hl, wEnemyMonPP
	ld de, wEnemySubStatus3
	ld bc, wEnemyTurnsTaken

.proceed

; If we've gotten this far, this counts as a turn.
	ld a, [bc]
	inc a
	ld [bc], a

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	cp STRUGGLE
	ret z

	ld a, [de]
	and 1 << SUBSTATUS_IN_LOOP | 1 << SUBSTATUS_RAMPAGE
	ret nz

	push de
	push hl
	call .consume_stamina
	pop hl
	call .consume_pp
	pop de

	ld a, b
	and a
	jp nz, EndMoveEffect

	; SubStatus5
	inc de
	inc de

	ld a, [de]
	bit SUBSTATUS_TRANSFORMED, a
	ret nz

	ldh a, [hBattleTurn]
	and a

	ld hl, wPartyMon1PP
	ld de, wPartyMon1Stamina
	ld a, [wCurBattleMon]
	jr z, .player

; mimic this part entirely if wildbattle
	ld a, [wBattleMode]
	dec a
	jp z, .wild


	ld hl, wOTPartyMon1PP
	ld de, wOTPartyMon1Stamina
	ld a, [wCurOTMon]

.player
	call GetPartyLocation
	push hl
	push de
	call CheckMimicUsed
	pop de
	pop hl
	ret c

.consume_pp ; BattleCommand_DoTurn.consume_pp
	; this is called twice, once for battlemon/enemymon and once for partymon/otpartymon
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurMoveNum]
	jr z, .okay
	ld a, [wCurEnemyMoveNum]

.okay
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and PP_MASK
	jr z, .out_of_pp
	dec [hl]
	ld b, 0
	ret

.wild
	ld hl, wEnemyMonMoves
	ld a, [wCurEnemyMoveNum]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	cp MIMIC
	jr z, .mimic
	ld hl, wWildMonMoves
	add hl, bc
	ld a, [hl]
	cp MIMIC
	ret z

.mimic
	ld hl, wWildMonMoves
	ld de, wEnemyMonStamina
	call .consume_pp
	ret

.out_of_pp ; BattleCommand_DoTurn.out_of_pp
	call BattleCommand_MoveDelay
; get move effect
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
; continuous?
	ld hl, .continuousmoves
	ld de, 1
	call IsInArray

; 'has no pp left for [move]'
	ld hl, HasNoPPLeftText
	jr c, .print
; 'but no pp is left for the move'
	ld hl, NoPPLeftText
.print
	call StdBattleTextBox
	ld b, 1
	ret

.continuousmoves:
	db EFFECT_RAZOR_WIND
	db EFFECT_SKY_ATTACK
	db EFFECT_SKULL_BASH
	db EFFECT_SOLARBEAM
	db EFFECT_FLY
	db EFFECT_ROLLOUT
	db EFFECT_RAMPAGE
	db -1

.consume_stamina:
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurMoveNum]
	jr z, .okay2
	ld a, [wCurEnemyMoveNum]

.okay2  ; BattleCommand_DoTurn.okay2
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and PP_MASK
	ld b, a

	ldh a, [hBattleTurn]
	and a
	ld hl, wPartyMon1Stamina
	ld de, wBattleMonStamina
	ld a, [wCurBattleMon]
	jr z, .reduce_stamina ; player

	ld a, [wBattleMode]
	dec a
	ld hl, wEnemyMonStamina
	ld de, wEnemyMonStamina
	ld a, [wCurOTMon]
	jr z, .reduce_stamina_wild

	ld hl, wOTPartyMon1Stamina
	ld de, wEnemyMonStamina
	ld a, [wCurOTMon]

.reduce_stamina
	; mon's stamina pointer comes in de
	push bc
	call GetPartyLocation
	pop bc
	
.reduce_stamina_wild ; BattleCommand_DoTurn.reduce_stamina_wild
	push hl
	
	; get pp cost from move data
	push de
	push hl
	push bc
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	lb bc, 0, 5
	add hl, bc
	ld e, [hl]
	pop bc
	pop hl

	ld hl, StaminaCost
	; pp cost is in b, put stamina cost in b
.get_stamina_cost_loop
	ld a, [hli]
	cp -1
	jr z, .got_stamina_cost
	cp e
	jr z, .got_stamina_cost
	inc hl
	jr .get_stamina_cost_loop
.got_stamina_cost
	ld b, [hl]
	pop hl
	ld a, [hl]
	and STA_MASK
	sub b
	jr nc, .not_min
	xor a
.not_min
	ld c, a
	ld a, [hl]
	and STA_EX_MASK
	or c
	ld [hl], a
	pop de
	ld [de], a

; Update HUD
	ldh a, [hBattleTurn]
	and a
	jr z, .update_HUD
	ld hl, UpdateEnemyHUD
	call CallBattleCore
	ret
.update_HUD
	ld hl, UpdatePlayerHUD
	call CallBattleCore
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

BattleCommand_Critical:
	farcall BattleCommandExtra_Critical
	ret

INCLUDE "engine/battle/move_effects/triple_kick.asm"

BattleCommand_Stab:
; STAB = Same Type Attack Bonus
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	and TYPE_MASK
	cp STRUGGLE
	ret z
; player turn
	ld hl, wBattleMonType1
	ld a, [hli]
	ld b, a
	ld c, [hl] ; bc has player types
	ld hl, wEnemyMonType1
	ld a, [hli]
	ld d, a
	ld e, [hl] ; de has enemy types

	ldh a, [hBattleTurn]
	and a
	jr z, .go ; Who Attacks and who Defends
; enemy turn
	ld hl, wEnemyMonType1
	ld a, [hli]
	ld b, a
	ld c, [hl] ; bc has enemy types
	ld hl, wBattleMonType1
	ld a, [hli]
	ld d, a
	ld e, [hl] ; de has player types

.go
	ld a, [wPlayerTypeMod]
	cp 0
	jr nz, .has_mod
	
	; ld a, BATTLE_VARS_MOVE_ANIM
	; call GetBattleVar
	; ld e, a ; move id in e
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK ; move type in a
	ld [wCurType], a
	ld [wMoveType], a
	jr .no_mod
.has_mod
	ld a, b
	ld [wCurType], a
.no_mod

	push hl
	push de
	push bc
	farcall DoWeatherModifiers
	pop bc
	pop de
	pop hl

	ld a, [wCurType]
	cp b
	jr z, .stab
	cp c
	jr z, .stab

	jr .SkipStab

.stab
	ld hl, wCurDamage + 1
	ld a, [hld]
	ld h, [hl]
	ld l, a

	ld b, h
	ld c, l
	; 100%
	srl b
	rr c
	; 50%
	srl b
	rr c
	; 25%
	srl b
	rr c
	; 12.5%

	add hl, bc

	ld a, h
	ld [wCurDamage], a ; damage after stab
	ld a, l
	ld [wCurDamage + 1], a ; damage after stab

	ld hl, wTypeModifier
	set 7, [hl]

.SkipStab:
	; ld a, BATTLE_VARS_TRAIT
	; ld [wBuffer1], a
	; farcall TraitChangeDamageType

	ld a, [wMoveType]
	ld b, a
	ld hl, TypeMatchups

.TypesLoop:
	ld a, [hli]

	; prism light
	cp -2
	jr nz, .SkipPrismLightCheck
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_PRISM_LIGHT, a
	jp z, .end

	cp -1
	jp z, .end

	jr .TypesLoop

.SkipPrismLightCheck:
	cp b
	jr nz, .SkipType
	ld a, [hl]
	cp d
	jr z, .GotMatchup
	cp e
	jr z, .GotMatchup
	jr .SkipType

.GotMatchup:
	push hl
	push bc
	inc hl
	ld a, [wTypeModifier]
	and %10000000
	ld b, a
; If the target is immune to the move, treat it as a miss and calculate the damage as 0
	ld a, [hl]
	and a
	jr nz, .NotImmune
	inc a
	ld [wAttackMissed], a
	xor a
.NotImmune:
	ldh [hMultiplier], a
	add b
	ld [wTypeModifier], a	
	xor a
	ldh [hMultiplicand + 0], a
	ld hl, wCurDamage
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hld]
	ldh [hMultiplicand + 2], a
	call Multiply

	ldh a, [hProduct + 1]
	ld b, a
	ldh a, [hProduct + 2]
	or b
	ld b, a
	ldh a, [hProduct + 3]
	or b
	jr z, .ok ; This is a very convoluted way to get back that we've essentially dealt no damage.

; Take the product and divide it by 10.
	ld a, 10
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 2]
	ld b, a
	ldh a, [hQuotient + 3]
	or b
	jr nz, .ok

	ld a, 1
	ldh [hMultiplicand + 2], a

.ok
	ldh a, [hMultiplicand + 1] ; damage after type matchup
	ld [hli], a
	ldh a, [hMultiplicand + 2] ; damage after type matchup
	ld [hl], a
	pop bc
	pop hl

.SkipType:
	inc hl
	inc hl
	jp .TypesLoop

.end
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitBoostNonStab

	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitBoostNotEffective

	ld a, BATTLE_VARS_TRAIT_OPP
	ld [wBuffer1], a
	farcall TraitReduceNonStab

	ld a, BATTLE_VARS_TRAIT_OPP
	ld [wBuffer1], a
	farcall TraitReduceVeryEffective

	farcall ApplyExhaustionPenalty

	ld hl, wCurDamage
	ldh a, [hMultiplicand + 1] ; damage after stab trait
	ld [hli], a
	ldh a, [hMultiplicand + 2] ; damage after stab trait
	ld [hl], a

	call BattleCheckTypeMatchup
	ld a, [wTypeMatchup]
	ld b, a
	ld a, [wTypeModifier]
	and %10000000
	or b	
	ld [wTypeModifier], a
	ret

BattleCheckTypeMatchup:
	ld hl, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, CheckTypeMatchup
	ld hl, wBattleMonType1

CheckTypeMatchup:
	push hl
	push de
	push bc

	ld de, wBattleMonType1 ; player's turn, get your type for FIRE_PLAY
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	ldh a, [hBattleTurn]
	and a
	jr z, .get_mod
	ld de, wEnemyMonType1 ; enemy's turn, get their type for FIRE_PLAY
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld c, a

.get_mod
	ld a, [wPlayerTypeMod]
	cp 0
	jr nz, .has_mod
; bc contains own mon types
	push hl
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld e, a ; move id in e
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK ; move type in a
	ld d, a
	pop hl

.has_mod
	ld d, a ; move type
	ld [wCurType], a
	ld [wMoveType], a
	
.no_mod
	ld b, [hl] ; opp mon type 1
	inc hl
	ld c, [hl] ; opp mon type 2
	farcall CheckRoost
	ld a, 10 ; 1.0
	ld [wTypeMatchup], a
	ld hl, TypeMatchups
	
.TypesLoop:
	ld a, [hli]
	
	cp -2
	jr nz, .Next
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_PRISM_LIGHT, a
	jr z, .End
	
	cp -1
	jr z, .End
	
	jr .TypesLoop

.Next:
	cp d
	jr nz, .Nope
	ld a, [hli]
	cp b
	jr z, .Yup
	cp c
	jr z, .Yup
	jr .Nope2

.Nope:
	inc hl
.Nope2:
	inc hl
	jr .TypesLoop

.Yup:
	xor a
	ldh [hDividend + 0], a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, [hli]
	ldh [hMultiplicand + 2], a
	ld a, [wTypeMatchup]
	ldh [hMultiplier], a
	call Multiply
	ld a, 10
	ldh [hDivisor], a
	push bc
	ld b, 4
	call Divide
	pop bc
	ldh a, [hQuotient + 3]
	ld [wTypeMatchup], a
	cp 40
	jr nc, .max
	jr .got_multi
.max
	ld a, 30 ; max multiplier is 3x
	ld [wTypeMatchup], a
.got_multi
	jr .TypesLoop

.End:
	pop bc
	pop de
	pop hl
	ret

BattleCommand_ResetTypeMatchup:
; Reset the type matchup multiplier to 1.0, if the type matchup is not 0.
; If there is immunity in play, the move automatically misses.
	call BattleCheckTypeMatchup
	ld a, [wTypeMatchup]
	and a
	ld a, 10 ; 1.0
	jr nz, .reset
	call ResetDamage
	xor a
	ld [wTypeModifier], a
	inc a
	ld [wAttackMissed], a
	ret

.reset
	ld [wTypeMatchup], a
	ret

INCLUDE "engine/battle/ai/switch.asm"

INCLUDE "data/types/type_matchups.asm"

BattleCommand_DamageVariation:
; damagevariation

; Modify the damage spread between 85% and 100%.

; Because of the method of division the probability distribution
; is not consistent. This makes the highest damage multipliers
; rarer than normal.

; No point in reducing 1 or 0 damage.
	ld hl, wCurDamage
	ld a, [hli]
	and a
	jr nz, .go
	ld a, [hl]
	cp 2
	ret c

.go
; Start with the maximum damage.
	xor a
	ldh [hMultiplicand + 0], a
	dec hl
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a

; Multiply by 85-100%...
.loop
	call BattleRandom
	rrca
	cp 85 percent + 1
	jr c, .loop

	ldh [hMultiplier], a
	call Multiply

; ...divide by 100%...
	ld a, $ff ; 100%
	ldh [hDivisor], a
	ld b, $4
	call Divide

; ...to get .85-1.00x damage.
	ldh a, [hQuotient + 2]
	ld hl, wCurDamage
	ld [hli], a
	ldh a, [hQuotient + 3]
	ld [hl], a
	ret

BattleCommand_CheckHit:
; checkhit

	call .DreamEater
	jp z, .Miss

	call .Protect
	jp nz, .Miss

	call .DrainSub
	jp z, .Miss

	call .LockOn
	ret nz

	call .FlyDigMoves
	jp nz, .Miss

	call .ThunderRain
	ret z

	call .XAccuracy
	ret nz

	; Perfect-accuracy moves
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ALWAYS_HIT
	ret z

	call .StatModifiers

	ld a, [wPlayerMoveStruct + MOVE_ACC]
	ld b, a
	ldh a, [hBattleTurn]
	and a
	jr z, .BrightPowder
	ld a, [wEnemyMoveStruct + MOVE_ACC]
	ld b, a

.BrightPowder:
	push bc
	call GetOpponentItem
	ld a, b
	cp HELD_BRIGHTPOWDER
	ld a, c ; % miss
	pop bc
	jr nz, .skip_brightpowder

	ld c, a
	ld a, b
	sub c
	ld b, a
	jr nc, .skip_brightpowder
	ld b, 0

.skip_brightpowder
	ld a, b
	cp -1
	jr z, .Hit

	ld a, b
	ld [wBuffer2], a
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitBoostAccuracy

	ld a, BATTLE_VARS_TRAIT_OPP
	ld [wBuffer1], a
	farcall TraitReduceAccuracy
	ld a, [wBuffer2]
	ld b, a

	call BattleRandom
	cp b
	jr nc, .Miss

.Hit:
	ret

.Miss:
; Keep the damage value intact if we're using (Hi) Jump Kick.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_JUMP_KICK
	jr z, .Missed
	call ResetDamage

.Missed:
	ld a, 1
	ld [wAttackMissed], a
	ret

.DreamEater:
; Return z if we're trying to eat the dream of
; a monster that isn't sleeping.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_DREAM_EATER
	ret nz

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and SLP
	ret

.Protect:
; Return nz if the opponent is protected.
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_PROTECT, a
	ret z

	ld c, 40
	call DelayFrames

; 'protecting itself!'
	ld hl, ProtectingItselfText
	call StdBattleTextBox

	ld c, 40
	call DelayFrames

	ld a, 1
	and a
	ret

.LockOn:
; Return nz if we are locked-on and aren't trying to use Earthquake,
; Fissure or Magnitude on a monster that is flying.
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_LOCK_ON, [hl]
	res SUBSTATUS_LOCK_ON, [hl]
	ret z

	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_FLYING, a
	jr z, .LockedOn

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar

	cp EARTHQUAKE
	ret z
	cp MAGNITUDE
	ret z
	cp HORN_DRILL
	jr z, .check_fissure1
	jr .LockedOn

.check_fissure1
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp GROUND
	ret z

.LockedOn:
	ld a, 1
	and a
	ret

.DrainSub:
; Return z if using an HP drain move on a substitute.
	call CheckSubstituteOpp
	jr z, .not_draining_sub

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar

	cp EFFECT_LEECH_HIT
	ret z
	cp EFFECT_DREAM_EATER
	ret z

.not_draining_sub
	ld a, 1
	and a
	ret

.FlyDigMoves:
; Check for moves that can hit underground/flying opponents.
; Return z if the current move can hit the opponent.

	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret z

	bit SUBSTATUS_FLYING, a
	jr z, .DigMoves

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar

	cp GUST
	ret z
	cp WHIRLWIND
	ret z
	cp THUNDER
	ret z
	cp TWISTER
	ret

.DigMoves:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar

	cp EARTHQUAKE
	ret z
	cp MAGNITUDE
	ret z
	jr z, .check_fissure2
	jr .LockedOn

.check_fissure2
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp GROUND
	ret z

.ThunderRain:
; Return z if the current move always hits in rain, and it is raining.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_THUNDER
	ret nz

	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	ret

.XAccuracy:
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_X_ACCURACY, a
	ret

.StatModifiers:
	ldh a, [hBattleTurn]
	and a

	; load the user's accuracy into b and the opponent's evasion into c.
	ld hl, wPlayerMoveStruct + MOVE_ACC
	ld a, [wPlayerAccLevel]
	ld b, a
	ld a, [wEnemyEvaLevel]
	ld c, a

	jr z, .got_acc_eva

	ld hl, wEnemyMoveStruct + MOVE_ACC
	ld a, [wEnemyAccLevel]
	ld b, a
	ld a, [wPlayerEvaLevel]
	ld c, a

.got_acc_eva
	; subtract evasion from 14
	ld a, MAX_STAT_LEVEL + 1
	sub c
	ld c, a
	; store the base move accuracy for math ops
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a
	push hl
	ld d, 2 ; do this twice, once for the user's accuracy and once for the target's evasion

.accuracy_loop
	; look up the multiplier from the table
	push bc
	ld hl, AccuracyLevelMultipliers
	dec b
	sla b
	ld c, b
	ld b, 0
	add hl, bc
	pop bc
	; multiply by the first byte in that row...
	ld a, [hli]
	ldh [hMultiplier], a
	call Multiply
	; ... and divide by the second byte
	ld a, [hl]
	ldh [hDivisor], a
	ld b, 4
	call Divide
	; minimum accuracy is $0001
	ldh a, [hQuotient + 3]
	ld b, a
	ldh a, [hQuotient + 2]
	or b
	jr nz, .min_accuracy
	ldh [hQuotient + 2], a
	ld a, 1
	ldh [hQuotient + 3], a

.min_accuracy
	; do the same thing to the target's evasion
	ld b, c
	dec d
	jr nz, .accuracy_loop

	; if the result is more than 2 bytes, max out at 100%
	ldh a, [hQuotient + 2]
	and a
	ldh a, [hQuotient + 3]
	jr z, .finish_accuracy
	ld a, $ff

.finish_accuracy
	pop hl
	ld [hl], a
	ret

INCLUDE "data/battle/accuracy_multipliers.asm"

BattleCommand_EffectChance:
; effectchance

	xor a
	ld [wEffectFailed], a
	call CheckSubstituteOpp
	jr nz, .failed

	push hl
	ld hl, wPlayerMoveStruct + MOVE_CHANCE
	ldh a, [hBattleTurn]
	and a
	jr z, .got_move_chance
	ld hl, wEnemyMoveStruct + MOVE_CHANCE
.got_move_chance
	ld a, [hl]
	ld [wBuffer2], a

	push hl
	ld a, BATTLE_VARS_TRAIT_OPP
	ld [wBuffer1], a
	farcall TraitNegateEffectChance
	pop hl

	ld a, [wBuffer2]
	and a
	jr z, .negated

	push hl
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitBoostEffectChance

	ld a, BATTLE_VARS_TRAIT_OPP
	ld [wBuffer1], a
	farcall TraitReduceEffectChance
	pop hl

.negated
	ld a, [wBuffer2]
	ld [hl], a

	call BattleRandom
	cp [hl]
	pop hl
	ret c

.failed
	ld a, 1
	ld [wEffectFailed], a
	and a
	ret

BattleCommand_LowerSub:
; lowersub

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret z

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	bit SUBSTATUS_CHARGED, a
	jr nz, .already_charged

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_RAZOR_WIND
	jr z, .charge_turn
	cp EFFECT_SKY_ATTACK
	jr z, .charge_turn
	cp EFFECT_SKULL_BASH
	jr z, .charge_turn
	cp EFFECT_SOLARBEAM
	jr z, .charge_turn
	cp EFFECT_FLY
	jr z, .charge_turn

.already_charged
	call .Rampage
	jr z, .charge_turn

	call CheckUserIsCharging
	ret nz

.charge_turn
	call _CheckBattleScene
	jr c, .mimic_anims

	xor a
	ld [wNumHits], a
	ld [wFXAnimID + 1], a
	inc a
	ld [wKickCounter], a
	ld a, SUBSTITUTE
	jp LoadAnim

.mimic_anims
	call BattleCommand_LowerSubNoAnim
	jp BattleCommand_MoveDelay

.Rampage:
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ROLLOUT
	jr z, .rollout_rampage
	cp EFFECT_RAMPAGE
	jr z, .rollout_rampage

	ld a, 1
	and a
	ret

.rollout_rampage
	ld a, [wSomeoneIsRampaging]
	and a
	ld a, 0
	ld [wSomeoneIsRampaging], a
	ret

BattleCommand_MoveAnim:
; moveanim
	call BattleCommand_LowerSub
	call BattleCommand_MoveAnimNoSub
	jp BattleCommand_RaiseSub

BattleCommand_MoveAnimNoSub:
	ld a, [wAttackMissed]
	and a
	jp nz, BattleCommand_MoveDelay

	ldh a, [hBattleTurn]
	and a
	ld de, wPlayerRolloutCount
	push hl
	ld hl, wBattleMonType1
	ld b, [hl]
	inc hl
	ld c, [hl]
	pop hl
	ld a, BATTLEANIM_ENEMY_DAMAGE
	jr z, .got_rollout_count
	ld de, wEnemyRolloutCount
	push hl
	ld hl, wEnemyMonType1
	ld b, [hl]
	inc hl
	ld c, [hl]
	pop hl
	ld a, BATTLEANIM_PLAYER_DAMAGE

.got_rollout_count
	ld [wNumHits], a

	ld a, [wCurVariableMove]
	ld [wBattleAnimParam], a

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_MULTI_HIT
	jr z, .alternate_anim
	cp EFFECT_CONVERSION
	jr z, .alternate_anim
	cp EFFECT_TRIPLE_KICK
	jr z, .triplekick
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp DOUBLESLAP
	jr z, .alternate_anim
	cp COMET_PUNCH
	jr z, .alternate_anim
	cp DOUBLE_KICK
	jr z, .alternate_anim
	xor a
	ld [wKickCounter], a

.triplekick
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld e, a
	ld d, 0
	call PlayFXAnimID

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp FLY
	jr z, .clear_sprite
	cp DIG
	ret nz
.clear_sprite
	jp AppearUserLowerSub

.alternate_anim
	ld a, [wKickCounter]
	and 1
	xor 1
	ld [wKickCounter], a
	ld a, [de]
	cp 1
	push af
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld e, a
	ld d, 0
	pop af
	jp z, PlayFXAnimID
	xor a
	ld [wNumHits], a
	jp PlayFXAnimID

BattleCommand_StatUpAnim:
	ld a, [wAttackMissed]
	and a
	jp nz, BattleCommand_MoveDelay

	xor a
	jr BattleCommand_StatUpDownAnim

BattleCommand_StatDownAnim:
	ld a, [wAttackMissed]
	and a
	jp nz, BattleCommand_MoveDelay

	ldh a, [hBattleTurn]
	and a
	ld a, BATTLEANIM_ENEMY_STAT_DOWN
	jr z, BattleCommand_StatUpDownAnim
	ld a, BATTLEANIM_WOBBLE

	; fallthrough

BattleCommand_StatUpDownAnim:
	ld [wNumHits], a
	xor a
	ld [wKickCounter], a
	ld a, [wCurVariableMove]
	ld [wBattleAnimParam], a
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld e, a
	ld d, 0
	jp PlayFXAnimID

BattleCommand_SwitchTurn:
; switchturn

	ldh a, [hBattleTurn]
	xor 1
	ldh [hBattleTurn], a
	ret

BattleCommand_RaiseSub:
; raisesub

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret z

	call _CheckBattleScene
	jp c, BattleCommand_RaiseSubNoAnim

	xor a
	ld [wNumHits], a
	ld [wFXAnimID + 1], a
	ld a, $2
	ld [wKickCounter], a
	ld a, SUBSTITUTE
	jp LoadAnim

BattleCommand_FailureText:
; failuretext
; If the move missed or failed, load the appropriate
; text, and end the effects of multi-turn or multi-
; hit moves.
	ld a, [wAttackMissed]
	and a
	ret z

	call GetFailureResultText
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr

	cp FLY
	jr z, .fly_dig
	cp DIG
	jr z, .fly_dig

; Move effect:
	inc hl
	ld a, [hl]

	cp EFFECT_MULTI_HIT
	jr z, .multihit
	cp EFFECT_DOUBLE_HIT
	jr z, .multihit
	cp EFFECT_POISON_MULTI_HIT
	jr z, .multihit
	jp EndMoveEffect

.multihit
	call BattleCommand_RaiseSub
	jp EndMoveEffect

.fly_dig
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_UNDERGROUND, [hl]
	res SUBSTATUS_FLYING, [hl]
	call AppearUserRaiseSub
	jp EndMoveEffect

BattleCommand_ApplyDamage:
; applydamage
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_ENDURE, a
	jr z, .focus_band

	call BattleCommand_FalseSwipe
	ld b, 0
	jr nc, .damage
	ld b, 1
	jr .damage

.focus_band
	call GetOpponentItem
	ld a, b
	cp HELD_FOCUS_BAND
	ld b, 0
	jr nz, .damage

	call BattleRandom
	cp c
	jr nc, .damage
	call BattleCommand_FalseSwipe
	ld b, 0
	jr nc, .damage
	ld b, 2

.damage
	ld a, b
	ld [wBuffer2], a
	farcall TraitSturdyNormal
	ld a, [wBuffer2]
	ld b, a
	push bc
	call .update_damage_taken
	ld c, FALSE
	ldh a, [hBattleTurn]
	and a
	jr nz, .damage_player
	call DoEnemyDamage
	jr .done_damage

.damage_player
	call DoPlayerDamage

.done_damage
	pop bc
	ld a, b
	and a
	ret z

	dec a
	jr nz, .focus_band_text
	ld hl, EnduredText
	jp StdBattleTextBox

.focus_band_text
	call GetOpponentItem
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld hl, HungOnText
	jp StdBattleTextBox

.update_damage_taken
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz

	ld de, wPlayerDamageTaken + 1
	ldh a, [hBattleTurn]
	and a
	jr nz, .got_damage_taken
	ld de, wEnemyDamageTaken + 1

.got_damage_taken
	ld a, [wCurDamage + 1]
	ld b, a
	ld a, [de]
	add b
	ld [de], a
	dec de
	ld a, [wCurDamage]
	ld b, a
	ld a, [de]
	adc b
	ld [de], a	
	ret nc
	ld a, $ff
	ld [de], a
	inc de
	ld [de], a
	ret

GetFailureResultText:
	ld hl, DoesntAffectText
	ld de, DoesntAffectText
	ld a, [wTypeModifier]
	and $7f
	jr z, .got_text
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_FUTURE_SIGHT
	ld hl, ButItFailedText
	ld de, ItFailedText
	jr z, .got_text
	ld hl, AttackMissedText
	ld de, AttackMissed2Text
	ld a, [wCriticalHit]
	cp -1
	jr nz, .got_text
	ld hl, UnaffectedText
.got_text
	call FailText_CheckOpponentProtect
	xor a
	ld [wCriticalHit], a

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_JUMP_KICK
	ret nz

	ld a, [wTypeModifier]
	and $7f
	ret z

	ld hl, wCurDamage
	ld a, [hli]
	ld b, [hl]
;rept 3
	srl a
	rr b
;endr
	ld [hl], b
	dec hl
	ld [hli], a
	or b
	jr nz, .do_at_least_1_damage
	inc a
	ld [hl], a
.do_at_least_1_damage
	ld hl, CrashedText
	call StdBattleTextBox
	ld a, $1
	ld [wKickCounter], a
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK ; move type in a
	ld [wBattleAnimParam], a
	call LoadMoveAnim
	ld c, TRUE
	ldh a, [hBattleTurn]
	and a
	jp nz, DoEnemyDamage
	jp DoPlayerDamage

FailText_CheckOpponentProtect:
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_PROTECT, a
	jr z, .not_protected
	ld h, d
	ld l, e
.not_protected
	jp StdBattleTextBox

BattleCommand_CriticalText:
; criticaltext
; Prints the message for critical hits or one-hit KOs.

; If there is no message to be printed, wait 20 frames.
	ld a, [wCriticalHit]
	and a
	jr z, .wait

	dec a
	add a
	ld hl, .texts
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call StdBattleTextBox

	xor a
	ld [wCriticalHit], a

.wait
	ld c, 20
	jp DelayFrames

.texts
	dw CriticalHitText
	dw OneHitKOText

BattleCommand_StartLoop:
; startloop

	ld hl, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyRolloutCount
.ok
	xor a
	ld [hl], a
	ret

BattleCommand_SuperEffectiveLoopText:
; supereffectivelooptext

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_IN_LOOP, a
	ret nz

	; fallthrough

BattleCommand_SuperEffectiveText:
; supereffectivetext
	ld a, [wTypeModifier]
	and $7f
	cp 10 ; 1.0
	ret z
	ld hl, SuperEffectiveText
	jr nc, .print
	ld hl, NotVeryEffectiveText
.print
	jp StdBattleTextBox

BattleCommand_CheckFaint:
; checkfaint

; Faint the opponent if its HP reached zero
;  and faint the user along with it if it used Destiny Bond.
; Ends the move effect if the opponent faints.

	ld hl, wEnemyMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wBattleMonHP

.got_hp
	ld a, [hli]
	or [hl]
	ret nz

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_MULTI_HIT
	jr z, .multiple_hit_raise_sub
	cp EFFECT_DOUBLE_HIT
	jr z, .multiple_hit_raise_sub
	cp EFFECT_POISON_MULTI_HIT
	jr z, .multiple_hit_raise_sub
	cp EFFECT_TRIPLE_KICK
	jr nz, .finish

.multiple_hit_raise_sub
	call BattleCommand_RaiseSub

.finish
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_FELL_STINGER
	jr nz, .finish2
	
.fell_stinger
	call ResetMiss
	call BattleCommand_AttackUp2
	call BattleCommand_StatUpMessage
	
.finish2
	jp EndMoveEffect

BattleCommand_BuildOpponentRage:
; buildopponentrage

	ld a, [wAttackMissed]
	and a
	ret nz

	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_RAGE, a
	ret z

	ld de, wEnemyRageCounter
	ldh a, [hBattleTurn]
	and a
	jr z, .player
	ld de, wPlayerRageCounter
.player
	ld a, [de]
	inc a
	ret z
	ld [de], a

	call BattleCommand_SwitchTurn
	ld hl, RageBuildingText
	call StdBattleTextBox
	jp BattleCommand_SwitchTurn

BattleCommand_RageDamage:
; ragedamage
	farcall RageDamage
	ret

EndMoveEffect:
	ld a, [wBattleScriptBufferAddress]
	ld l, a
	ld a, [wBattleScriptBufferAddress + 1]
	ld h, a
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

; DittoMetalPowder:
; 	ld a, MON_SPECIES
; 	call BattlePartyAttr
; 	ldh a, [hBattleTurn]
; 	and a
; 	ld a, [hl]
; 	jr nz, .Ditto
; 	ld a, [wTempEnemyMonSpecies]

; .Ditto:
; 	cp DITTO
; 	ret nz

; 	push bc
; 	call GetOpponentItem
; 	ld a, [hl]
; 	cp METAL_POWDER
; 	pop bc
; 	ret nz

; 	ld a, c
; 	srl a
; 	add c
; 	ld c, a
; 	ret nc

; 	srl b
; 	ld a, b
; 	and a
; 	jr nz, .done
; 	inc b
; .done
; 	scf
; 	rr c
	
; 	ld a, HIGH(MAX_STAT_VALUE)
; 	cp b
; 	jr c, .cap
; 	ld a, LOW(MAX_STAT_VALUE)
; 	cp c
; 	ret nc

; .cap
; 	ld b, HIGH(MAX_STAT_VALUE)
; 	ld c, LOW(MAX_STAT_VALUE)
; 	ret

BattleCommand_DamageStats:
; damagestats

	ldh a, [hBattleTurn]
	and a
	jp nz, EnemyAttackDamage

	; fallthrough

PlayerAttackDamage:
; Return move power d, player level e, enemy defense c and player attack b.

	call ResetDamage

	ld hl, wPlayerMoveStructPower
	ld a, [hli]
	and a
	ld d, a
	ret z
	
	ld a, [wEnemyScreens]
	bit SCREENS_LEAF_SHIELD, a
	jr z, .no_leaf_shield
	
	ld de, wPlayerTypeMod
	ld a, [de]	
	cp 0
	jr nz, .has_mod
	
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
.has_mod
	ld d, a
	cp WATER
	jr nz, .no_leaf_shield
	
	ld hl, WaterResistantText
	call StdBattleTextBox
	rl d
	
.no_leaf_shield
	ld a, [hl]
	and STATUS
	cp SPECIAL
	jr nc, .special

.physical
	ld hl, wEnemyMonDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld a, [wEnemyScreens]
	bit SCREENS_REFLECT, a
	jr z, .physicalcrit
	sla c
	rl b

.physicalcrit
	ld hl, wBattleMonAttack
	call CheckDamageStatsCritical
	jr c, .done
	
	ld hl, wEnemyDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wPlayerAttack
	jr .done

.special
	ld hl, wEnemyMonSpclDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld a, [wEnemyScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .specialcrit
	sla c
	rl b

.specialcrit
	ld hl, wBattleMonSpclAtk
	call CheckDamageStatsCritical
	jr c, .done

	ld hl, wEnemySpDef
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wPlayerSpAtk

.done
	ld a, [hli]
	ld l, [hl]
	ld h, a
	
	call TruncateHL_BC

	ld a, [wBattleMonLevel]
	ld e, a
	; call DittoMetalPowder

	ld a, 1
	and a
	ret

CheckDamageStatsCritical:
; Return carry if boosted stats should be used in damage calculations.
; Unboosted stats should be used if the attack is a critical hit,
;  and the stage of the opponent's defense is higher than the user's attack.
	ld a, [wCriticalHit]
	and a
	scf
	ret z

	push hl
	push bc
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wPlayerMoveStructType]
	and STATUS
	cp SPECIAL
; special
	ld a, [wPlayerSAtkLevel]
	ld b, a
	ld a, [wEnemySDefLevel]
	jr nc, .end
; physical
	ld a, [wPlayerAtkLevel]
	ld b, a
	ld a, [wEnemyDefLevel]
	jr .end

.enemy
	ld a, [wEnemyMoveStructType]
	and STATUS
	cp SPECIAL
; special
	ld a, [wEnemySAtkLevel]
	ld b, a
	ld a, [wPlayerSDefLevel]
	jr nc, .end
; physical
	ld a, [wEnemyAtkLevel]
	ld b, a
	ld a, [wPlayerDefLevel]
.end
	cp b
	pop bc
	pop hl
	ret

EnemyAttackDamage:
	call ResetDamage

	ld hl, wEnemyMoveStructPower
	ld a, [hli]
	ld d, a
	and a
	ret z
	
	ld a, [wPlayerScreens]
	bit SCREENS_LEAF_SHIELD, a
	jr z, .no_leaf_shield
	
	ld de, wPlayerTypeMod
	ld a, [de]	
	cp 0
	jr nz, .has_mod
	
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
.has_mod
	ld d, a
	cp WATER
	jr nz, .no_leaf_shield
	
	ld hl, WaterResistantText
	call StdBattleTextBox
	rl d
	
.no_leaf_shield
	ld a, [hl]
	and STATUS
	cp SPECIAL
	jr nc, .Special

.physical
	ld hl, wBattleMonDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld a, [wPlayerScreens]
	bit SCREENS_REFLECT, a
	jr z, .physicalcrit
	sla c
	rl b

.physicalcrit
	ld hl, wEnemyMonAttack
	call CheckDamageStatsCritical
	jr c, .done

	ld hl, wPlayerDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wEnemyAttack
	jr .done

.Special:
	ld hl, wBattleMonSpclDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld a, [wPlayerScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .specialcrit
	sla c
	rl b

.specialcrit
	ld hl, wEnemyMonSpclAtk
	call CheckDamageStatsCritical
	jr c, .done
	ld hl, wPlayerSpDef
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wEnemySpAtk

.done
	ld a, [hli]
	ld l, [hl]
	ld h, a
	
	call TruncateHL_BC

	ld a, [wEnemyMonLevel]
	ld e, a
	; call DittoMetalPowder

	ld a, 1
	and a
	ret

BattleCommand_ClearMissDamage:
; clearmissdamage
	ld a, [wAttackMissed]
	and a
	ret z

	jp ResetDamage

HitSelfInConfusion:
	call ResetDamage
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonDefense
	ld de, wPlayerScreens
	ld a, [wBattleMonLevel]
	jr z, .got_it

	ld hl, wEnemyMonDefense
	ld de, wEnemyScreens
	ld a, [wEnemyMonLevel]
.got_it
	push af
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld a, [de]
	bit SCREENS_REFLECT, a
	jr z, .mimic_screen

	sla c
	rl b
.mimic_screen
	dec hl
	dec hl
	dec hl
	ld a, [hli]
	ld l, [hl]
	ld h, a
	call TruncateHL_BC
	ld d, 40
	pop af
	ld e, a
	ret

BattleCommand_DamageCalc:
; damagecalc

; Return a damage value for move power d, player level e, enemy defense c and player attack b.

; Return 1 if successful, else 0.

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	and TYPE_MASK

; Selfdestruct and Explosion halve defense.
	cp EFFECT_SELFDESTRUCT
	jr nz, .dont_selfdestruct

	srl c
	jr nz, .dont_selfdestruct
	inc c

.dont_selfdestruct

; Variable-hit moves and Conversion can have a power of 0.
	cp EFFECT_MULTI_HIT
	jr z, .skip_zero_damage_check

	cp EFFECT_CONVERSION
	jr z, .skip_zero_damage_check

; No damage if move power is 0.
	ld a, d
	and a
	ret z

.skip_zero_damage_check
; Minimum defense value is 1.
	ld a, c
	and a
	jr nz, .not_dividing_by_zero
	ld c, 1
.not_dividing_by_zero

	call GetMoveID
	jr c, .variable_id
	cp GNAW
	jp z, .gnaw
	cp ASSURANCE
	jp z, .assurance
	cp BUBBLE
	jp z, .bubble
	jp .got_power_changes
	
.variable_id
	cp BRINE
	jp z, .bubble
	cp AVALANCHE
	jp z, .avalanche_revenge
	cp REVENGE
	jp z, .avalanche_revenge
	jp .got_power_changes

.bubble
	push de
	ld hl, wEnemyMonHP
	ld de, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .battlemonhp
	ld hl, wBattleMonHP
	ld de, wEnemyMonHP
	
.battlemonhp
	ld a, [wCurVariableMove]
	cp GUARD_CLAW ; swaps target
	jr nz, .got_hp_pointers
	ld h, d
	ld l, e
.got_hp_pointers
	farcall GetHealthPercentageWithAddr
	ld a, d
	cp 50
	pop de
	jr nc, .got_power_changes ; not under 50% hp

	ld a, [wCurVariableMove]
	ld hl, .new_bubble_power
	add l
	ld l, a
	ld a, [hl]
	ld d, a
	jp .got_power_changes

.new_bubble_power:
	db 40
	db 90
	db 130
	
.assurance
.avalanche_revenge
	ld hl, wEnemyDamageTaken + 1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_damage_taken_pointer
	ld hl, wPlayerDamageTaken + 1
.got_damage_taken_pointer
	ld a, [hld]
	and a
	jr nz, .took_damage
	ld a, [hl]
	and a
	jr z, .got_power_changes

.took_damage
	sla d
	jp .got_power_changes

.gnaw
	ld hl, wBattleMonStamina
	ldh a, [hBattleTurn]
	and a
	jr z, .got_stamina
	ld hl, wEnemyMonStamina
.got_stamina
	ld a, [hl]
	and STA_EX_MASK
	swap a
	and a ; 0 exhaustion?
	jr z, .got_power_changes
	ld d, 60
	
.got_power_changes
	xor a
	ld hl, hDividend
	ld [hli], a
	ld [hli], a
	ld [hl], a

; Level * 2
	ld a, e
	add a
	jr nc, .level_not_overflowing
	ld [hl], 1
.level_not_overflowing
	inc hl
	ld [hli], a

; / 5
	ld a, 5
	ld [hld], a
	push bc
	ld b, 4
	call Divide
	pop bc

; + 2
	inc [hl]
	inc [hl]

; * bp
	inc hl
	ld [hl], d
	call Multiply

; * Attack
	ld [hl], b
	call Multiply

; / Defense
	ld [hl], c
	ld b, 4
	call Divide

; / 50
	ld [hl], 50
	ld b, $4
	call Divide

	farcall PowerBoostingTraits

	farcall SpeedBoostDamage

; Item boosts
	call GetUserItem

	ld a, b
	and a
	jr z, .DoneItem

	ld hl, TypeBoostItems

.NextItem:
	ld a, [hli]
	cp -1
	jr z, .DoneItem

; Item effect
	cp b
	ld a, [hli]
	jr nz, .NextItem

; Type
	ld b, a
	ld de, wPlayerTypeMod
	ld a, [de]
	cp 0
	jr nz, .has_mod
	; ld a, BATTLE_VARS_MOVE_TYPE
	; call GetBattleVar
	; and TYPE_MASK
	ld a, [wMoveType]
.has_mod
	cp b
	jr nz, .DoneItem

; * 100 + item effect amount
	ld a, c
	add 100
	ldh [hMultiplier], a
	call Multiply

; / 100
	ld a, 100
	ldh [hDivisor], a
	ld b, 4
	call Divide

.DoneItem:
; Critical hits
	call .CriticalMultiplier

; Update wCurDamage (capped at 997).
	ld hl, wCurDamage
	ld b, [hl]
	ldh a, [hProduct + 3]
	add b
	ldh [hProduct + 3], a
	jr nc, .dont_cap_1

	ldh a, [hProduct + 2]
	inc a
	ldh [hProduct + 2], a
	and a
	jr z, .Cap

.dont_cap_1
	ldh a, [hProduct]
	ld b, a
	ldh a, [hProduct + 1]
	or a
	jr nz, .Cap

	ldh a, [hProduct + 2]
	cp HIGH(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE + 1)
	jr c, .dont_cap_2

	cp HIGH(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE + 1) + 1
	jr nc, .Cap

	ldh a, [hProduct + 3]
	cp LOW(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE + 1)
	jr nc, .Cap

.dont_cap_2
	inc hl

	ldh a, [hProduct + 3]
	ld b, [hl]
	add b
	ld [hld], a

	ldh a, [hProduct + 2]
	ld b, [hl]
	adc b
	ld [hl], a
	jr c, .Cap

	ld a, [hl]
	cp HIGH(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE + 1)
	jr c, .dont_cap_3

	cp HIGH(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE + 1) + 1
	jr nc, .Cap

	inc hl
	ld a, [hld]
	cp LOW(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE + 1)
	jr c, .dont_cap_3

.Cap:
	ld a, HIGH(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE)
	ld [hli], a
	ld a, LOW(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE)
	ld [hld], a

.dont_cap_3
; Minimum neutral damage is 2 (bringing the cap to 999).
	inc hl
	ld a, [hl]
	add MIN_NEUTRAL_DAMAGE
	ld [hld], a
	jr nc, .dont_floor
	inc [hl]
.dont_floor

	ld a, 1
	and a
	ret

.CriticalMultiplier:
	ld a, [wCriticalHit]
	and a
	ret z

; x2
	ldh a, [hQuotient + 3]
	add a
	ldh [hProduct + 3], a

	ldh a, [hQuotient + 2]
	rl a
	ldh [hProduct + 2], a

; Cap at $ffff.
	ret nc

	ld a, $ff
	ldh [hProduct + 2], a
	ldh [hProduct + 3], a

	ret

INCLUDE "data/types/type_boost_items.asm"

BattleCommand_ConstantDamage:
; constantdamage

	ld hl, wBattleMonLevel
	ldh a, [hBattleTurn]
	and a
	jr z, .got_turn
	ld hl, wEnemyMonLevel

.got_turn
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_LEVEL_DAMAGE
	ld b, [hl]
	ld a, 0
	jr z, .got_power
; limit sonic boom at lower levels
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_STATIC_DAMAGE
	ld a, [hl] ; level
	cp $6
	ld a, $a ; 10 dmg
	jr c, .below
	cp $b
	ld a, $f ; 15 dmb
	jr c, .below
	ld a, $14 ; 20 dmg
.below
	ld b, a 
	ld a, $0
	jr z, .got_power

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_PSYWAVE
	jr z, .psywave

	cp EFFECT_SUPER_FANG
	jr z, .super_fang

	cp EFFECT_REVERSAL
	jr z, .reversal

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	ld b, a
	ld a, $0
	jr .got_power

.psywave
	ld a, b ; level
	ld c, a ; save level in c
	srl a
	add b
	ld b, a ; b holds level * 1.5
	sub c ; a holds difference between min and max damage
.psywave_loop
	call RandomRange ; from 0 to difference between min and max damage
	add c
	ld b, a
	ld a, 0
	jr .got_power

.super_fang
	ld hl, wEnemyMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wBattleMonHP
.got_hp
	ld a, [hli]
	srl a
	ld b, a
	ld a, [hl]
	rr a
	push af
	ld a, b
	pop bc
	and a
	jr nz, .got_power
	or b
	ld a, 0
	jr nz, .got_power
	ld b, 1

.got_power
	ld hl, wCurDamage
	ld [hli], a
	ld [hl], b
	ret

.reversal
	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .reversal_got_hp
	ld hl, wEnemyMonHP
.reversal_got_hp
	xor a
	ldh [hDividend], a
	ldh [hMultiplicand + 0], a
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hli]
	ldh [hMultiplicand + 2], a
	ld a, 48
	ldh [hMultiplier], a
	call Multiply
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ldh [hDivisor], a
	ld a, b
	and a
	jr z, .skip_to_divide

	ldh a, [hProduct + 4]
	srl b
	rra
	srl b
	rra
	ldh [hDivisor], a
	ldh a, [hProduct + 2]
	ld b, a
	srl b
	ldh a, [hProduct + 3]
	rra
	srl b
	rra
	ldh [hDividend + 3], a
	ld a, b
	ldh [hDividend + 2], a

.skip_to_divide
	ld b, 4
	call Divide
	ldh a, [hQuotient + 3]
	ld b, a
	ld hl, FlailReversalPower

.reversal_loop
	ld a, [hli]
	cp b
	jr nc, .break_loop
	inc hl
	jr .reversal_loop

.break_loop
	ldh a, [hBattleTurn]
	and a
	ld a, [hl]
	jr nz, .notPlayersTurn

	ld hl, wPlayerMoveStructPower
	ld [hl], a
	push hl
	call PlayerAttackDamage
	jr .notEnemysTurn

.notPlayersTurn
	ld hl, wEnemyMoveStructPower
	ld [hl], a
	push hl
	call EnemyAttackDamage

.notEnemysTurn
	call BattleCommand_DamageCalc
	pop hl
	ld [hl], 1
	ret

INCLUDE "data/moves/flail_reversal_power.asm"

INCLUDE "engine/battle/move_effects/counter.asm"

INCLUDE "engine/battle/move_effects/encore.asm"

INCLUDE "engine/battle/move_effects/pain_split.asm"

INCLUDE "engine/battle/move_effects/snore.asm"

INCLUDE "engine/battle/move_effects/conversion2.asm"

INCLUDE "engine/battle/move_effects/lock_on.asm"

INCLUDE "engine/battle/move_effects/sketch.asm"

BattleCommand_DefrostOpponent:
; defrostopponent
; Thaw the opponent if frozen, and
; raise the user's Attack one stage.

	call AnimateCurrentMove

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	call Defrost

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	ld a, [hl]
	push hl
	push af

	ld a, EFFECT_ATTACK_UP
	ld [hl], a
	call BattleCommand_StatUp

	pop af
	pop hl
	ld [hl], a
	ret

INCLUDE "engine/battle/move_effects/sleep_talk.asm"

;INCLUDE "engine/battle/move_effects/destiny_bond.asm"

INCLUDE "engine/battle/move_effects/spite.asm"

INCLUDE "engine/battle/move_effects/false_swipe.asm"

INCLUDE "engine/battle/move_effects/heal_bell.asm"

FarPlayBattleAnimation:
; play animation de

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret nz

	; fallthrough

PlayFXAnimID:
	ld a, e
	ld [wFXAnimID], a
	ld a, d
	ld [wFXAnimID + 1], a

	ld c, 3
	call DelayFrames
	callfar PlayBattleAnim
	ret

DoEnemyDamage:
	ld hl, wCurDamage
	ld a, [hli]
	ld b, a
	ld a, [hl]
	or b
	jr z, .did_no_damage

	ld a, c
	and a
	jr nz, .ignore_substitute
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jp nz, DoSubstituteDamage

.ignore_substitute
	; Substract wCurDamage from wEnemyMonHP.
	;  store original HP in little endian wBuffer3/4
	ld a, [hld]
	ld b, a
	ld a, [wEnemyMonHP + 1]
	ld [wBuffer3], a
	sub b
	ld [wEnemyMonHP + 1], a
	ld a, [hl]
	ld b, a
	ld a, [wEnemyMonHP]
	ld [wBuffer4], a
	sbc b
	ld [wEnemyMonHP], a
	jr nc, .no_underflow

	ld a, [wBuffer4]
	ld [hli], a
	ld a, [wBuffer3]
	ld [hl], a
	xor a
	ld hl, wEnemyMonHP
	ld [hli], a
	ld [hl], a

.no_underflow
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ld [wBuffer2], a
	ld a, [hl]
	ld [wBuffer1], a
	ld hl, wEnemyMonHP
	ld a, [hli]
	ld [wBuffer6], a
	ld a, [hl]
	ld [wBuffer5], a

	hlcoord 2, 2
	xor a
	ld [wWhichHPBar], a
	predef AnimateHPBar
.did_no_damage
	jp RefreshBattleHuds

DoPlayerDamage:
	ld hl, wCurDamage
	ld a, [hli]	
	ld b, a
	ld a, [hl]
	or b
	jr z, .did_no_damage

	ld a, c
	and a
	jr nz, .ignore_substitute
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jp nz, DoSubstituteDamage

.ignore_substitute
	; Substract wCurDamage from wBattleMonHP.
	;  store original HP in little endian wBuffer3/4
	;  store new HP in little endian wBuffer5/6
	ld a, [hld]
	ld b, a
	ld a, [wBattleMonHP + 1]
	ld [wBuffer3], a
	sub b
	ld [wBattleMonHP + 1], a
	ld [wBuffer5], a
	ld b, [hl]
	ld a, [wBattleMonHP]
	ld [wBuffer4], a
	sbc b
	ld [wBattleMonHP], a
	ld [wBuffer6], a
	jr nc, .no_underflow

	ld a, [wBuffer4]
	ld [hli], a
	ld a, [wBuffer3]
	ld [hl], a
	xor a
	ld hl, wBattleMonHP
	ld [hli], a
	ld [hl], a
	ld hl, wBuffer5
	ld [hli], a
	ld [hl], a

.no_underflow
	ld hl, wBattleMonMaxHP
	ld a, [hli]
	ld [wBuffer2], a
	ld a, [hl]
	ld [wBuffer1], a

	hlcoord 10, 9
	ld a, 1
	ld [wWhichHPBar], a
	predef AnimateHPBar
.did_no_damage
	jp RefreshBattleHuds

DoSubstituteDamage:
	ld hl, SubTookDamageText
	call StdBattleTextBox

	ld de, wEnemySubstituteHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld de, wPlayerSubstituteHP
.got_hp

	ld hl, wCurDamage
	ld a, [hli]
	and a
	jr nz, .broke

	ld a, [de]
	sub [hl]
	ld [de], a
	jr z, .broke
	jr nc, .done

.broke
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	res SUBSTATUS_SUBSTITUTE, [hl]

	ld hl, SubFadedText
	call StdBattleTextBox

	call BattleCommand_SwitchTurn
	call BattleCommand_LowerSubNoAnim
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	call z, AppearUserLowerSub
	call BattleCommand_SwitchTurn

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	cp EFFECT_MULTI_HIT
	jr z, .ok
	cp EFFECT_DOUBLE_HIT
	jr z, .ok
	cp EFFECT_POISON_MULTI_HIT
	jr z, .ok
	cp EFFECT_TRIPLE_KICK
	jr z, .ok
	xor a
	ld [hl], a
.ok
	call RefreshBattleHuds
.done
	jp ResetDamage

UpdateMoveData:
; Gets the name for when the move is used
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	ld d, h
	ld e, l

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld [wCurSpecies], a
	ld [wNamedObjectIndexBuffer], a
	dec a
	call GetMoveData
	ld a, [wCurSpecies]
	push af
	ld e, a
	farcall IsVariableMove
	jr nc, .not_variable
	farcall GetVariableMoveType
	jr c, .variable

.not_variable
	ld a, $ff
	ld [wCurVariableMove], a
	pop af
	ld [wCurSpecies], a
	ld [wNamedObjectIndexBuffer], a
	dec a
	jr .got_move_id
.variable
	pop af
.got_move_id
	call GetMoveName
	jp CopyName1

BattleCommand_ParalyseOrPoison:
	call BattleRandom
	and 1
	jr z, .prz
	jp BattleCommand_ParalyzeTarget
.prz
	jp BattleCommand_PoisonTarget

BattleCommand_ParalyseOrSleep:
	call BattleRandom
	and 1
	jr z, .sleep
	jp BattleCommand_ParalyzeTarget
.sleep

BattleCommand_SleepTarget:
; sleeptarget
	xor a
	ld [wBuffer3], a

BattleCommand_SleepSimple:
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_SLEEP
	jr nz, .not_protected_by_item

	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld hl, ProtectedByText
	jr .fail

.not_protected_by_item
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld d, h
	ld e, l
	ld a, [de]
	and SLP
	ld hl, AlreadyAsleepText
	jr nz, .fail

	ld a, [wAttackMissed]
	and a
	jp nz, PrintDidntAffect2

	ld hl, DidntAffect1Text
	call .CheckAIRandomFail
	jr c, .fail

	ld a, [de]
	and a
	jr nz, .fail

	call CheckSubstituteOpp
	jr nz, .fail

	ld a, [wBuffer3]
	and a
	jr z, .normal_sleep

	xor a
	ld [wNumHits], a
	push de
	ld de, ANIM_SLP
	call PlayOpponentBattleAnim
	pop de
	ld b, $7
	jr .random_loop
	
.normal_sleep
	call AnimateCurrentMove
	ld b, $7
	ld a, [wInBattleTowerBattle]
	and a
	jr z, .random_loop
	ld b, $3

.random_loop
	call BattleRandom
	and b
	jr z, .random_loop
	cp 7
	jr z, .random_loop
	inc a
	ld [de], a
	call UpdateOpponentInParty
	call RefreshBattleHuds

	ld hl, FellAsleepText
	call StdBattleTextBox

	farcall UseHeldStatusHealingItem

	jp z, OpponentCantMove
	ret

.fail
	push hl
	call AnimateFailedMove
	pop hl
	jp StdBattleTextBox

.CheckAIRandomFail:
	; Enemy turn
	ldh a, [hBattleTurn]
	and a
	jr z, .dont_fail

	; Not in link battle
	ld a, [wLinkMode]
	and a
	jr nz, .dont_fail

	ld a, [wInBattleTowerBattle]
	and a
	jr nz, .dont_fail

	; Not locked-on by the enemy
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .dont_fail

	; call BattleRandom
	; cp 25 percent + 1 ; 25% chance AI fails
	; ret c

.dont_fail
	xor a
	ret

BattleCommand_PoisonTarget:
; poisontarget
	ld b, POISON
	farcall CheckIfTargetIsNthType ; Don't poison a Poison-type
	ret z
	ld b, STEEL
	farcall CheckIfTargetIsNthType ; Don't poison a Steel-type
	ret z
; fallthrough
BattleCommand_PoisonTargetSimple: ; ignores target's type
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
	ld a, [wTypeModifier]
	and $7f
	ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_POISON
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz

	call PoisonOpponent
	ld de, ANIM_PSN
	call PlayOpponentBattleAnim
	call RefreshBattleHuds

	ld hl, WasPoisonedText
	call StdBattleTextBox

	farcall UseHeldStatusHealingItem
	ret

BattleCommand_Poison:
; poison

	ld hl, DoesntAffectText
	ld a, [wTypeModifier]
	and $7f
	jp z, .failed

	ld a, [wEffectFailed]
	and a
	ret nz

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	ld b, a
	ld hl, AlreadyPoisonedText
	and 1 << PSN
	jp nz, .failed

	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_POISON
	jr nz, .do_poison
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld hl, ProtectedByText
	jr .failed

.do_poison
	ld hl, DidntAffect1Text
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and a
	jr nz, .failed

	ldh a, [hBattleTurn]
	and a
	jr z, .dont_sample_failure

	ld a, [wLinkMode]
	and a
	jr nz, .dont_sample_failure

	ld a, [wInBattleTowerBattle]
	and a
	jr nz, .dont_sample_failure

	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .dont_sample_failure

	; call BattleRandom
	; cp 25 percent + 1 ; 25% chance AI fails
	; jr c, .failed

.dont_sample_failure
	call CheckSubstituteOpp
	jr nz, .failed
	ld a, [wAttackMissed]
	and a
	jr nz, .failed

	call .check_toxic
	jr z, .toxic

	call .apply_poison
	ld hl, WasPoisonedText
	call StdBattleTextBox
	jr .finished

.toxic
	set SUBSTATUS_TOXIC, [hl]
	xor a
	ld [de], a
	call .apply_poison

	ld hl, BadlyPoisonedText
	call StdBattleTextBox

.finished
	farcall UseHeldStatusHealingItem
	ret

.failed
	push hl
	call AnimateFailedMove
	pop hl
	jp StdBattleTextBox

.apply_poison
	call AnimateCurrentMove
	call PoisonOpponent
	jp RefreshBattleHuds

.check_toxic
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	ldh a, [hBattleTurn]
	and a
	ld de, wEnemyToxicCount
	jr z, .ok
	ld de, wPlayerToxicCount
.ok
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_TOXIC
	ret z
	ld a, [wCurVariableMove]
	cp POISON_FANG
	ld a, POISON_FANG + 1
	ld [wBattleAnimParam], a
	ret

BattleCommand_Venoshock:
; venoshock
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	bit PSN, a
	ret z
	jp DoubleDamage
	
INCLUDE "engine/battle/move_effects/fire_flick.asm"

INCLUDE "engine/battle/move_effects/gyro_ball.asm"

BattleCommand_JetStream:
; jetstream
	ld b, WATER
	farcall CheckIfTargetIsNthType
	ret nz
	jp DoubleDamage
	ret
	
BattleCommand_WakeupSlap:
; wakeupslap
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and SLP
	ret z
	
	jp DoubleDamage

BattleCommand_WakeupFoe:
; wakeupfoe
	ldh a, [hBattleTurn]
	and a
	jr z, .wake_up_enemy
	
	ld a, [wBattleMonStatus]
	cp 0
	ret z
	ld a, 0
	ld [wBattleMonStatus], a
	ld hl, WokeUpText
	call StdBattleTextBox
	call CantMove
	call UpdateEnemyMonInParty
	ld hl, UpdateEnemyHUD
	call CallBattleCore
	ld a, $1
	ldh [hBGMapMode], a
	ld hl, wEnemySubStatus1
	res SUBSTATUS_NIGHTMARE, [hl]
	ret	
.wake_up_enemy
	ld a, [wEnemyMonStatus]
	cp 0
	ret z
	call BattleCommand_SwitchTurn	
	ld a, 0
	ld [wEnemyMonStatus], a
	ld hl, WokeUpText
	call StdBattleTextBox
	call CantMove
	call UpdateBattleMonInParty
	ld hl, UpdatePlayerHUD
	call CallBattleCore
	ld a, $1
	ldh [hBGMapMode], a
	ld hl, wPlayerSubStatus1
	res SUBSTATUS_NIGHTMARE, [hl]
	call BattleCommand_SwitchTurn
	ret	

PoisonOpponent:
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set PSN, [hl]
	jp UpdateOpponentInParty

BattleCommand_DrainTarget:
; draintarget
	farcall SapHealth
	ld hl, SuckedHealthText
	jp StdBattleTextBox

BattleCommand_EatDream:
; eatdream
	farcall SapHealth
	ld hl, DreamEatenText
	jp StdBattleTextBox

BattleCommand_BurnTarget:
; burntarget
	ld b, FIRE
	farcall CheckIfTargetIsNthType ; Don't burn a Fire-type
	ret z
BattleCommand_BurnTargetSimple:
	xor a
	ld [wNumHits], a
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	jp nz, Defrost
	ld a, [wTypeModifier]
	and $7f
	ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_BURN
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set BRN, [hl]
	call UpdateOpponentInParty
	ld hl, ApplyBrnEffectOnAttack
	call CallEffectsExtraCore
	ld de, ANIM_BRN
	call PlayOpponentBattleAnim
	call RefreshBattleHuds

	ld hl, WasBurnedText
	call StdBattleTextBox
	
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitCausedBurn

	farcall UseHeldStatusHealingItem
	ret

Defrost:
	ld a, [hl]
	and 1 << FRZ
	ret z

	xor a
	ld [hl], a

	ldh a, [hBattleTurn]
	and a
	ld a, [wCurOTMon]
	ld hl, wOTPartyMon1Status
	jr z, .ok
	ld hl, wPartyMon1Status
	ld a, [wCurBattleMon]
.ok

	call GetPartyLocation
	xor a
	ld [hl], a
	call UpdateOpponentInParty

	ld hl, DefrostedOpponentText
	jp StdBattleTextBox

BattleCommand_FreezeOrSlowTarget:
	call BattleRandom
	and 11
	jr z, .freeze ; 1/4th
	call BattleCommand_SpeedDown
	call BattleCommand_StatDownMessage
	jp BattleCommand_StatDownFailText
.freeze
; fallthrough

BattleCommand_FreezeTarget:
; freezetarget
	ld b, ICE
	farcall CheckIfTargetIsNthType ; Don't freeze an Ice-type
	ret z
BattleCommand_FreezeTargetSimple:
	xor a
	ld [wNumHits], a
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
	ld a, [wTypeModifier]
	and $7f
	ret z
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret z
	
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_FREEZE
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set FRZ, [hl]
	call UpdateOpponentInParty
	ld de, ANIM_FRZ
	call PlayOpponentBattleAnim
	call RefreshBattleHuds

	ld hl, WasFrozenText
	call StdBattleTextBox

	farcall UseHeldStatusHealingItem
	ret nz

	call OpponentCantMove
	call EndRechargeOpp
	ld hl, wEnemyJustGotFrozen
	ldh a, [hBattleTurn]
	and a
	jr z, .finish
	ld hl, wPlayerJustGotFrozen
.finish
	ld [hl], $1
	ret

BattleCommand_ParalyzeOrPoisonTarget:
	call BattleRandom
	and 1
	jp z, BattleCommand_ParalyzeTarget
	jp BattleCommand_PoisonTarget

BattleCommand_ParalyzeTargetSimple:
	ld b, ELECTRIC
	farcall CheckIfTargetIsNthType ; Don't paralyze an Electric-type
	ret z

.paralyze
; fallthrough
BattleCommand_ParalyzeTarget:
; paralyzetarget
	xor a
	ld [wNumHits], a
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
	ld a, [wTypeModifier]
	and $7f
	ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_PARALYZE
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set PAR, [hl]
	call UpdateOpponentInParty
	ld hl, ApplyPrzEffectOnSpeed
	call CallEffectsExtraCore
	ld de, ANIM_PAR
	call PlayOpponentBattleAnim
	call RefreshBattleHuds
	call PrintParalyze
	ld hl, UseHeldStatusHealingItem
	jp CallBattleCore

BattleCommand_RandomStatUp:
; 
	ld a, 5
	call RandomRange
	ld b, a
	jr BattleCommand_StatUp

BattleCommand_Acupressure:
; 	
	ld a, 5
	call RandomRange
	ld c, a

	ld a, [wCurVariableMove]
	cp GATHER_SAND
	jr nz, .got_stat
	ld c, DEFENSE
	call Random
	and 1
	jr z, .got_stat
	ld c, SP_DEFENSE

.got_stat
	ld hl, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .got_stat_levels
	ld hl, wEnemyStatLevels
.got_stat_levels
	ld b, [hl]
	inc b
	ld a, $d
	cp b
	jp c, .cant_raise_stat
	ld a, c
	add 16
	ld b, a
	jr BattleCommand_StatUp

.cant_raise_stat
	call AnimateFailedMove
	jp PrintButItFailed

BattleCommand_AttackUp:
; attackup
	ld b, ATTACK
	jr BattleCommand_StatUp

BattleCommand_DefenseUp:
; defenseup
	ld b, DEFENSE
	jr BattleCommand_StatUp

BattleCommand_SpeedUp:
; speedup
	ld b, SPEED
	jr BattleCommand_StatUp

BattleCommand_SpecialAttackUp:
; specialattackup
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld b, SP_ATTACK
	jr BattleCommand_StatUp

BattleCommand_SpecialDefenseUp:
; specialdefenseup
	ld b, SP_DEFENSE
	jr BattleCommand_StatUp

BattleCommand_AccuracyUp:
; accuracyup
	ld b, ACCURACY
	jr BattleCommand_StatUp

BattleCommand_EvasionUp:
; evasionup
	ld b, EVASION
	jr BattleCommand_StatUp

BattleCommand_AttackUp2:
; attackup2
	ld b, $10 | ATTACK
	jr BattleCommand_StatUp

BattleCommand_DefenseUp2:
; defenseup2
	ld b, $10 | DEFENSE
	jr BattleCommand_StatUp

BattleCommand_SpeedUp2:
; speedup2
	ld b, $10 | SPEED
	jr BattleCommand_StatUp

BattleCommand_SpecialAttackUp2:
; specialattackup2
	ld b, $10 | SP_ATTACK
	jr BattleCommand_StatUp

BattleCommand_SpecialDefenseUp2:
; specialdefenseup2
	ld b, $10 | SP_DEFENSE
	jr BattleCommand_StatUp

BattleCommand_AccuracyUp2:
; accuracyup2
	ld b, $10 | ACCURACY
	jr BattleCommand_StatUp

BattleCommand_EvasionUp2:
; evasionup2
	ld b, $10 | EVASION
; fallthrough

BattleCommand_StatUp:
; statup
	call RaiseStat
	ld a, [wFailedMessage]
	and a
	ret nz
	jp MinimizeDropSub

RaiseStat:
	ld a, b
	ld [wLoweredStat], a
	ld hl, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .got_stat_levels
	ld hl, wEnemyStatLevels
.got_stat_levels
	ld a, [wAttackMissed]
	and a
	jp nz, .stat_raise_failed
	ld a, [wEffectFailed]
	and a
	jp nz, .stat_raise_failed
	ld a, [wLoweredStat]
	and $f
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	inc b
	ld a, $d
	cp b
	jp c, .cant_raise_stat
	ld a, [wLoweredStat]
	and $f0
	jr z, .got_num_stages
	inc b
	ld a, $d
	cp b
	jr nc, .got_num_stages
	ld b, a
.got_num_stages
	ld [hl], b
	push hl
	ld a, c
	cp $5
	jr nc, .done_calcing_stats
	ld hl, wBattleMonStats + 1
	ld de, wPlayerStats
	ldh a, [hBattleTurn]
	and a
	jr z, .got_stats_pointer
	ld hl, wEnemyMonStats + 1
	ld de, wEnemyStats
.got_stats_pointer
	push bc
	sla c
	ld b, 0
	add hl, bc
	ld a, c
	add e
	ld e, a
	jr nc, .no_carry
	inc d
.no_carry
	pop bc
	ld a, [hld]
	sub LOW(MAX_STAT_VALUE)
	jr nz, .not_already_max
	ld a, [hl]
	sbc HIGH(MAX_STAT_VALUE)
	jp z, .stats_already_max
.not_already_max
	ldh a, [hBattleTurn]
	and a
	jr z, .calc_player_stats
	call CalcEnemyStats
	jr .done_calcing_stats

.calc_player_stats
	call CalcPlayerStats
.done_calcing_stats
	pop hl
	xor a
	ld [wFailedMessage], a
	ret

.stats_already_max
	pop hl
	dec [hl]
	; fallthrough

.cant_raise_stat
	ld a, $2
	ld [wFailedMessage], a
	ld a, $1
	ld [wAttackMissed], a
	ret

.stat_raise_failed
	ld a, $1
	ld [wFailedMessage], a
	ret

MinimizeDropSub:
; Lower the substitute if we're minimizing

	ld bc, wPlayerMinimized
	ld hl, DropPlayerSub
	ldh a, [hBattleTurn]
	and a
	jr z, .do_player
	ld bc, wEnemyMinimized
	ld hl, DropEnemySub
.do_player
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp MINIMIZE
	ret nz

	ld a, $1
	ld [bc], a
	call _CheckBattleScene
	ret nc

	xor a
	ldh [hBGMapMode], a
	call CallBattleCore
	call WaitBGMap
	jp BattleCommand_MoveDelay

BattleCommand_RandomStatDown:
; 
	ld a, 5
	call RandomRange
	jr BattleCommand_StatDown

BattleCommand_RandomStatDown2:
; 	
	ld a, 5
	call RandomRange
	add 16
	jr BattleCommand_StatDown

BattleCommand_AttackDown:
; attackdown
	ld a, ATTACK
	jr BattleCommand_StatDown

BattleCommand_DefenseDown:
; defensedown
	ld a, DEFENSE
	jr BattleCommand_StatDown

BattleCommand_SpeedDown:
; speeddown
	ld a, SPEED
	jr BattleCommand_StatDown

BattleCommand_SpecialAttackDown:
; specialattackdown
	ld a, SP_ATTACK
	jr BattleCommand_StatDown

BattleCommand_SpecialDefenseDown:
; specialdefensedown
	ld a, SP_DEFENSE
	jr BattleCommand_StatDown

BattleCommand_AccuracyDown:
; accuracydown
	ld a, ACCURACY
	jr BattleCommand_StatDown

BattleCommand_EvasionDown:
; evasiondown
	ld a, EVASION
	jr BattleCommand_StatDown

BattleCommand_AttackDown2:
; attackdown2
	ld a, $10 | ATTACK
	jr BattleCommand_StatDown

BattleCommand_DefenseDown2:
; defensedown2
	ld a, $10 | DEFENSE
	jr BattleCommand_StatDown

BattleCommand_SpeedDown2:
; speeddown2
	ld a, $10 | SPEED
	jr BattleCommand_StatDown

BattleCommand_SpecialAttackDown2:
; specialattackdown2
	ld a, $10 | SP_ATTACK
	jr BattleCommand_StatDown

BattleCommand_SpecialDefenseDown2:
; specialdefensedown2
	ld a, $10 | SP_DEFENSE
	jr BattleCommand_StatDown

BattleCommand_AccuracyDown2:
; accuracydown2
	ld a, $10 | ACCURACY
	jr BattleCommand_StatDown

BattleCommand_EvasionDown2:
; evasiondown2
	ld a, $10 | EVASION

BattleCommand_StatDown:
; statdown
	ld [wLoweredStat], a

	call CheckMist
	jp nz, .Mist

	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitPreventStatDown
	ld a, [wBuffer2]
	and a
	jr nz, .Trait

	ld hl, wEnemyStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .GetStatLevel
	ld hl, wPlayerStatLevels

.GetStatLevel:
; Attempt to lower the stat.
	ld a, [wLoweredStat]
	and $f
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	dec b
	jp z, .CantLower

; Sharply lower the stat if applicable.
	ld a, [wLoweredStat]
	and $f0
	jr z, .GotAmountToLower
	dec b
	jr nz, .GotAmountToLower
	inc b

.GotAmountToLower:
	call CheckSubstituteOpp
	jr nz, .Failed

	ld a, [wAttackMissed]
	and a
	jr nz, .Failed

	ld a, [wEffectFailed]
	and a
	jr nz, .Failed

	call CheckHiddenOpponent
	jr nz, .Failed

; Accuracy/Evasion reduction don't involve stats.
	ld [hl], b
	ld a, c
	cp ACCURACY
	jr nc, .Hit

	push hl
	ld hl, wEnemyMonAttack + 1
	ld de, wEnemyStats
	ldh a, [hBattleTurn]
	and a
	jr z, .do_enemy
	ld hl, wBattleMonAttack + 1
	ld de, wPlayerStats
.do_enemy
	call TryLowerStat
	pop hl
	jr z, .CouldntLower

.Hit:
	xor a
	ld [wFailedMessage], a
	ret

.CouldntLower:
	inc [hl]
.CantLower:
	ld a, 3
	ld [wFailedMessage], a
	ld a, 1
	ld [wAttackMissed], a
	ret

.Failed:
	ld a, 1
	ld [wFailedMessage], a
	ld [wAttackMissed], a
	ret

.Mist:
	ld a, 2
	ld [wFailedMessage], a
	ld a, 1
	ld [wAttackMissed], a
	ret

.Trait:
	ld a, 4
	ld [wFailedMessage], a
	ld [wAttackMissed], a
	ret

CheckMist:
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ATTACK_DOWN
	jr c, .dont_check_mist
	cp EFFECT_EVASION_DOWN + 1
	jr c, .check_mist
	cp EFFECT_ATTACK_DOWN_2
	jr c, .dont_check_mist
	cp EFFECT_EVASION_DOWN_2 + 1
	jr c, .check_mist
	cp EFFECT_ATTACK_DOWN_HIT
	jr c, .dont_check_mist
	cp EFFECT_EVASION_DOWN_HIT + 1
	jr c, .check_mist
.dont_check_mist
	xor a
	ret

.check_mist
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_MIST, a
	ret

BattleCommand_StatUpMessage:
	ld a, [wFailedMessage]
	and a
	ret nz
	ld a, [wLoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, .stat
	jp BattleTextBox

.stat
	text_jump Text_BattleEffectActivate
	start_asm
	ld hl, .up
	ld a, [wLoweredStat]
	and $f0
	ret z
	ld hl, .wayup
	ret

.wayup
	text_jump _BattleStatWentWayUpText
	db "@"

.up
	text_jump _BattleStatWentUpText
	db "@"

BattleCommand_StatDownMessage:
	ld a, [wFailedMessage]
	and a
	ret nz
	ld a, [wLoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, .stat
	jp BattleTextBox

.stat
	text_jump Text_BattleFoeEffectActivate
	start_asm
	ld hl, .fell
	ld a, [wLoweredStat]
	and $f0
	ret z
	ld hl, .sharplyfell
	ret

.sharplyfell
	text_jump _BattleStatSharplyFellText
	db "@"
.fell
	text_jump _BattleStatFellText
	db "@"

TryLowerStat:
; Lower stat c from stat struct hl (buffer de).
	push bc
	sla c
	ld b, 0
	add hl, bc
	ld a, c
	add e
	ld e, a
	jr nc, .no_carry
	inc d
.no_carry
	pop bc

; The lowest possible stat is 1.
	ld a, [hld]
	sub 1
	jr nz, .not_min
	ld a, [hl]
	and a
	ret z

.not_min
	ldh a, [hBattleTurn]
	and a
	jr z, .Player

	call BattleCommand_SwitchTurn
	call CalcPlayerStats
	call BattleCommand_SwitchTurn
	jr .end

.Player:
	call BattleCommand_SwitchTurn
	call CalcEnemyStats
	call BattleCommand_SwitchTurn
.end
	ld a, 1
	and a
	ret

BattleCommand_StatUpFailText:
; statupfailtext
	ld a, [wFailedMessage]
	and a
	ret z
	push af
	call BattleCommand_MoveDelay
	pop af
	dec a
	jp z, TryPrintButItFailed
	ld a, [wLoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, WontRiseAnymoreText
	jp StdBattleTextBox

BattleCommand_StatDownFailText:
; statdownfailtext
	ld a, BATTLE_VARS_TRAIT_OPP
	ld [wBuffer1], a
	farcall TraitRaiseStatOnStatDown

	ld a, [wFailedMessage]
	cp 4
	jp z, .trait
	and a
	ret z
	push af
	call BattleCommand_MoveDelay
	pop af
	dec a
	jp z, TryPrintButItFailed
	dec a
	ld hl, ProtectedByMistText
	jp z, StdBattleTextBox
	ld a, [wLoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, WontDropAnymoreText
	jp z, StdBattleTextBox
.trait
	call BattleCommand_MoveDelay
	ld hl, StatLoweringPreventedByTraitText
	jp z, StdBattleTextBox

GetStatName:
	ld hl, StatNames
	ld c, "@"
.CheckName:
	dec b
	jr z, .Copy
.GetName:
	ld a, [hli]
	cp c
	jr z, .CheckName
	jr .GetName

.Copy:
	ld de, wStringBuffer2
	ld bc, wStringBuffer3 - wStringBuffer2
	jp CopyBytes

INCLUDE "data/battle/stat_names.asm"

INCLUDE "data/battle/stat_multipliers.asm"

BattleCommand_AllStatsUp:
; allstatsup

	call ResetMiss
	call BattleCommand_AttackUp
	call BattleCommand_StatUpFailText
	call BattleCommand_DefenseUp
	call BattleCommand_StatUpFailText
	call BattleCommand_SpeedUp
	call BattleCommand_StatUpFailText
	call BattleCommand_SpecialAttackUp
	call BattleCommand_StatUpFailText
	call BattleCommand_SpecialDefenseUp
	call BattleCommand_StatUpFailText

	ld hl, BattleText_AllStatsUp
	jp StdBattleTextBox
	
BattleCommand_AtkDefUp:
; atkdefup

; Attack
	call ResetMiss
	call BattleCommand_AttackUp
	call BattleCommand_StatUpFailText
	call BattleCommand_StatUpMessage

; Defense
	call ResetMiss
	call BattleCommand_DefenseUp
	call BattleCommand_StatUpFailText
	jp   BattleCommand_StatUpMessage
	
BattleCommand_SpAtkSpDefUp:
; spatkspdefup

; Sp.Attack
	call ResetMiss
	call BattleCommand_SpecialAttackUp
	call BattleCommand_StatUpFailText
	call BattleCommand_StatUpMessage

; Sp.Defense
	call ResetMiss
	call BattleCommand_SpecialDefenseUp
	call BattleCommand_StatUpFailText
	jp   BattleCommand_StatUpMessage
	
	
BattleCommand_DefSpDefUp:
; spatkspdefup

; Defense
	call ResetMiss
	call BattleCommand_DefenseUp
	call BattleCommand_StatUpFailText
	call BattleCommand_StatUpMessage

; Sp.Defense
	call ResetMiss
	call BattleCommand_SpecialDefenseUp
	call BattleCommand_StatUpFailText
	jp   BattleCommand_StatUpMessage
	
BattleCommand_DefSpDefDown:
; defspdefdown

; Defense
	call ResetMiss
	call BattleCommand_DefenseDown
	call BattleCommand_StatDownFailText
	call BattleCommand_StatDownMessage

; Special Defense
	call ResetMiss
	call BattleCommand_SpecialDefenseDown
	call BattleCommand_StatDownFailText
	jp   BattleCommand_StatDownMessage
	
ResetMiss:
	xor a
	ld [wAttackMissed], a
	ret

LowerStat:
	ld [wLoweredStat], a

	ld hl, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .got_target
	ld hl, wEnemyStatLevels

.got_target
	ld a, [wLoweredStat]
	and $f
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	dec b
	jr z, .cant_lower_anymore

	ld a, [wLoweredStat]
	and $f0
	jr z, .got_num_stages
	dec b
	jr nz, .got_num_stages
	inc b

.got_num_stages
	ld [hl], b
	ld a, c
	cp 5
	jr nc, .accuracy_evasion

	push hl
	ld hl, wBattleMonStats + 1
	ld de, wPlayerStats
	ldh a, [hBattleTurn]
	and a
	jr z, .got_target_2
	ld hl, wEnemyMonStats + 1
	ld de, wEnemyStats

.got_target_2
	call TryLowerStat
	pop hl
	jr z, .failed

.accuracy_evasion
	ldh a, [hBattleTurn]
	and a
	jr z, .player

	call CalcEnemyStats

	jr .finish

.player
	call CalcPlayerStats

.finish
	xor a
	ld [wFailedMessage], a
	ret

.failed
	inc [hl]

.cant_lower_anymore
	ld a, 2
	ld [wFailedMessage], a
	ret

BattleCommand_TriStatusChance:
; tristatuschance

	call BattleCommand_EffectChance

.loop
	; 1/3 chance of each status
	call BattleRandom
	swap a
	and %11
	jr z, .loop
	dec a
	ld hl, .ptrs
	rst JumpTable
	ret

.ptrs
	dw BattleCommand_ParalyzeTarget ; paralyze
	dw BattleCommand_FreezeTarget ; freeze
	dw BattleCommand_BurnTarget ; burn

BattleCommand_Curl:
; curl
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	set SUBSTATUS_CURLED, [hl]
	ret

BattleCommand_RaiseSubNoAnim:
	ld hl, GetBattleMonBackpic
	ldh a, [hBattleTurn]
	and a
	jr z, .PlayerTurn
	ld hl, GetEnemyMonFrontpic
.PlayerTurn:
	xor a
	ldh [hBGMapMode], a
	call CallBattleCore
	jp WaitBGMap

BattleCommand_LowerSubNoAnim:
	ld hl, DropPlayerSub
	ldh a, [hBattleTurn]
	and a
	jr z, .PlayerTurn
	ld hl, DropEnemySub
.PlayerTurn:
	xor a
	ldh [hBGMapMode], a
	call CallBattleCore
	jp WaitBGMap

BattleCommand_RecalcStats:
; recalcstats
	ldh a, [hBattleTurn]
	push af

	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitRaiseLowerOddEven

	pop af
	ldh [hBattleTurn], a
	
	ret

CalcPlayerStats:
	ld hl, wPlayerAtkLevel
	ld de, wPlayerStats
	ld bc, wBattleMonAttack

	ld a, 5
	call CalcStats

	call BattleCommand_SwitchTurn

	ld hl, ApplyPrzEffectOnSpeed
	call CallEffectsExtraCore

	ld hl, ApplyBrnEffectOnAttack
	call CallEffectsExtraCore

	jp BattleCommand_SwitchTurn

CalcEnemyStats:
	ld hl, wEnemyAtkLevel
	ld de, wEnemyStats
	ld bc, wEnemyMonAttack

	ld a, 5
	call CalcStats

	call BattleCommand_SwitchTurn

	ld hl, ApplyPrzEffectOnSpeed
	call CallEffectsExtraCore

	ld hl, ApplyBrnEffectOnAttack
	call CallEffectsExtraCore

	jp BattleCommand_SwitchTurn

CalcStats:
.loop
	push af
	ld a, [hli]
	push hl
	push bc

	ld c, a
	dec c
	ld b, 0
	ld hl, StatLevelMultipliers
	add hl, bc
	add hl, bc

	xor a
	ldh [hMultiplicand + 0], a
	ld a, [de]
	ldh [hMultiplicand + 1], a
	inc de
	ld a, [de]
	ldh [hMultiplicand + 2], a
	inc de

	ld a, [hli]
	ldh [hMultiplier], a
	call Multiply

	ld a, [hl]
	ldh [hDivisor], a
	ld b, 4
	call Divide

	ldh a, [hQuotient + 2]
	ld b, a
	ldh a, [hQuotient + 3]
	or b
	jr nz, .check_maxed_out

	ld a, 1
	ldh [hQuotient + 3], a
	jr .not_maxed_out

.check_maxed_out
	ldh a, [hQuotient + 3]
	cp LOW(MAX_STAT_VALUE)
	ld a, b
	sbc HIGH(MAX_STAT_VALUE)
	jr c, .not_maxed_out

	ld a, LOW(MAX_STAT_VALUE)
	ldh [hQuotient + 3], a
	ld a, HIGH(MAX_STAT_VALUE)
	ldh [hQuotient + 2], a

.not_maxed_out
	pop bc
	ldh a, [hQuotient + 2]
	ld [bc], a
	inc bc
	ldh a, [hQuotient + 3]
	ld [bc], a
	inc bc
	pop hl
	pop af
	dec a
	jp nz, .loop
	ret

; .stamina_bonuses:
; 	dwlb  9, 10 ;  0 - 0.90
; 	dwlb  9, 10 ;  1 - 0.90
; 	dwlb 18, 19 ;  2 - 0.95
; 	dwlb 18, 19 ;  3 - 0.95
; 	dwlb 18, 19 ;  4 - 0.95
; 	dwlb  1,  1 ;  5 - 1.00
; 	dwlb  1,  1 ;  6 - 1.00
; 	dwlb  1,  1 ;  7 - 1.00
; 	dwlb  1,  1 ;  8 - 1.00
; 	dwlb  1,  1 ;  9 - 1.00
; 	dwlb 20, 19 ; 10 - 1.05
; 	dwlb 20, 19 ; 11 - 1.05
; 	dwlb 20, 19 ; 12 - 1.05
; 	dwlb 11, 10 ; 13 - 1.10
; 	dwlb 11, 10 ; 14 - 1.10

; .stamina_bonuses_exhausted:
; 	dwlb  9, 10 ;  0 - 0.90
; 	dwlb  9, 10 ;  1 - 0.90
; 	dwlb  9, 10 ;  2 - 0.90
; 	dwlb  9, 10 ;  3 - 0.90
; 	dwlb 18, 19 ;  4 - 0.95
; 	dwlb 18, 19 ;  5 - 0.95
; 	dwlb 18, 19 ;  6 - 0.95
; 	dwlb 18, 19 ;  7 - 0.95
; 	dwlb  1,  1 ;  8 - 1.00
; 	dwlb  1,  1 ;  9 - 1.00
; 	dwlb  1,  1 ; 10 - 1.00
; 	dwlb  1,  1 ; 11 - 1.00
; 	dwlb 20, 19 ; 12 - 1.05
; 	dwlb 20, 19 ; 13 - 1.05
; 	dwlb 20, 19 ; 14 - 1.05

INCLUDE "engine/battle/move_effects/stampede.asm"

INCLUDE "engine/battle/move_effects/fire_play.asm"

BattleCommand_CheckRampage:
; checkrampage

	ld de, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .player
	ld de, wEnemyRolloutCount
.player
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_RAMPAGE, [hl]
	ret z
	ld a, [de]
	dec a
	ld [de], a
	jr nz, .continue_rampage

	res SUBSTATUS_RAMPAGE, [hl]
	call BattleCommand_SwitchTurn
	call SafeCheckSafeguard
	push af
	call BattleCommand_SwitchTurn
	pop af
	jr nz, .continue_rampage

	set SUBSTATUS_CONFUSED, [hl]
	call BattleRandom
	and %00000001
	inc a
	inc a
	inc de ; ConfuseCount
	ld [de], a
.continue_rampage
	ld b, rampage_command
	jp SkipToBattleCommand

BattleCommand_Rampage:
; rampage

; No rampage during Sleep Talk.
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	ret nz

	ld de, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wEnemyRolloutCount
.ok
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	set SUBSTATUS_RAMPAGE, [hl]
; Rampage for 1 or 2 more turns
	call BattleRandom
	and %00000001
	inc a
	ld [de], a
	ld a, 1
	ld [wSomeoneIsRampaging], a
	ret

INCLUDE "engine/battle/move_effects/teleport.asm"

SetBattleDraw:
	ld a, [wBattleResult]
	and BATTLERESULT_BITMASK
	or DRAW
	ld [wBattleResult], a
	ret

BattleCommand_ForceSwitch:
; forceswitch

	ld a, [wBattleType]
	cp BATTLETYPE_SHINY
	jp z, .fail
	cp BATTLETYPE_TRAP
	jp z, .fail
	cp BATTLETYPE_CELEBI
	jp z, .fail
	cp BATTLETYPE_SUICUNE
	jp z, .fail
	ldh a, [hBattleTurn]
	and a
	jp nz, .force_player_switch
	ld a, [wAttackMissed]
	and a
	jr nz, .missed
	ld a, [wBattleMode]
	dec a
	jr nz, .trainer
	ld a, [wCurPartyLevel]
	ld b, a
	ld a, [wBattleMonLevel]
	cp b
	jr nc, .wild_force_flee
	add b
	ld c, a
	inc c
.random_loop_wild
	call BattleRandom
	cp c
	jr nc, .random_loop_wild
	srl b
	srl b
	cp b
	jr nc, .wild_force_flee
.missed
	jp .fail

.wild_force_flee
	call UpdateBattleMonInParty
	xor a
	ld [wNumHits], a
	inc a
	ld [wForcedSwitch], a
	call SetBattleDraw
	ld a, [wPlayerMoveStructAnimation]
	jp .succeed

.trainer
	call FindAliveEnemyMons
	jr c, .switch_fail
	ld a, [wEnemyGoesFirst]
	and a
	jr z, .switch_fail
	call UpdateEnemyMonInParty
	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	ld c, $14
	call DelayFrames
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	ld c, 20
	call DelayFrames
	ld a, [wOTPartyCount]
	ld b, a
	ld a, [wCurOTMon]
	ld c, a
; select a random enemy mon to switch to
.random_loop_trainer
	call BattleRandom
	and $7
	cp b
	jr nc, .random_loop_trainer
	cp c
	jr z, .random_loop_trainer
	push af
	push bc
	ld hl, wOTPartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	pop bc
	pop de
	jr z, .random_loop_trainer
	ld a, d
	inc a
	ld [wEnemySwitchMonIndex], a
	callfar ForceEnemySwitch

	ld hl, DraggedOutText
	call StdBattleTextBox

	ld hl, SpikesDamage
	jp CallBattleCore

.switch_fail
	jp .fail

.force_player_switch
	ld a, [wAttackMissed]
	and a
	jr nz, .player_miss

	ld a, [wBattleMode]
	dec a
	jr nz, .vs_trainer

	ld a, [wBattleMonLevel]
	ld b, a
	ld a, [wCurPartyLevel]
	cp b
	jr nc, .wild_succeed_playeristarget

	add b
	ld c, a
	inc c
.wild_random_loop_playeristarget
	call BattleRandom
	cp c
	jr nc, .wild_random_loop_playeristarget

	srl b
	srl b
	cp b
	jr nc, .wild_succeed_playeristarget

.player_miss
	jr .fail

.wild_succeed_playeristarget
	call UpdateBattleMonInParty
	xor a
	ld [wNumHits], a
	inc a
	ld [wForcedSwitch], a
	ld [wForcedPlayerSwitch], a
	call SetBattleDraw
	ld a, [wEnemyMoveStructAnimation]
	jr .succeed

.vs_trainer
	farcall CheckPlayerHasMonToSwitchTo
	jr c, .fail

	ld a, [wEnemyGoesFirst]
	cp $1
	jr z, .switch_fail

	call UpdateBattleMonInParty
	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	ld c, 20
	call DelayFrames
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox
	ld c, 20
	call DelayFrames
	ld a, [wPartyCount]
	ld b, a
	ld a, [wCurBattleMon]
	ld c, a
.random_loop_trainer_playeristarget
	call BattleRandom
	and $7
	cp b
	jr nc, .random_loop_trainer_playeristarget

	cp c
	jr z, .random_loop_trainer_playeristarget

	push af
	push bc
	ld hl, wPartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	pop bc
	pop de
	jr z, .random_loop_trainer_playeristarget

	ld a, d
	ld [wCurPartyMon], a
	ld hl, SwitchPlayerMon
	call CallBattleCore

	ld hl, DraggedOutText
	call StdBattleTextBox

	ld hl, SpikesDamage
	jp CallBattleCore

.fail
	call BattleCommand_LowerSub
	call BattleCommand_MoveDelay
	call BattleCommand_RaiseSub
	jp PrintButItFailed

.succeed
	push af
	call SetBattleDraw
	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	ld c, 20
	call DelayFrames
	pop af

	ld hl, FledInFearText
	cp ROAR
	jr z, .do_text
	ld hl, BlownAwayText
.do_text
	jp StdBattleTextBox
	farcall CheckPlayerHasMonToSwitchTo

BattleCommand_EndLoop:
; endloop

; Loop back to 'critical'.

	ld de, wPlayerRolloutCount
	ld bc, wPlayerDamageTaken
	ldh a, [hBattleTurn]
	and a
	jr z, .got_addrs
	ld de, wEnemyRolloutCount
	ld bc, wEnemyDamageTaken
.got_addrs

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_IN_LOOP, [hl]
	jp nz, .in_loop
	set SUBSTATUS_IN_LOOP, [hl]
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	ld a, [hl]
	cp EFFECT_POISON_MULTI_HIT
	jr z, .twineedle
	cp EFFECT_DOUBLE_HIT
	ld a, 1
	jr z, .double_hit
	ld a, [hl]
	cp EFFECT_TRIPLE_KICK
	jr nz, .not_triple_kick
.reject_triple_kick_sample
	call BattleRandom
	and $3 
	jr z, .reject_triple_kick_sample
	dec a
	jr nz, .double_hit
	ld a, 1
	ld [bc], a
	jr .done_loop
.not_triple_kick
	call BattleRandom
	and $3 ; multihit
	cp 2 ; multihit
	jr c, .got_number_hits
	call BattleRandom
	and $3
.got_number_hits
	push de
	push bc
	ld [wBuffer2], a
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitMultiHit
	ld a, [wBuffer2]
	pop bc
	pop de
	inc a
.double_hit
	ld [de], a
	inc a
	ld [bc], a
	jr .loop_back_to_critical

.twineedle
	ld a, 1
	jr .double_hit

.in_loop
	ld a, [de]
	dec a
	ld [de], a
	jr nz, .loop_back_to_critical
.done_loop
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_IN_LOOP, [hl]

	ld hl, PlayerHitTimesText
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hit_n_times_text
	ld hl, EnemyHitTimesText
.got_hit_n_times_text

	push bc
	call StdBattleTextBox
	
	pop bc
	xor a
	ld [bc], a
	ret

.loop_back_to_critical
	ld a, [wBattleScriptBufferAddress + 1]
	ld h, a
	ld a, [wBattleScriptBufferAddress]
	ld l, a
.not_critical
	ld a, [hld]
	cp critical_command
	jr nz, .not_critical
	inc hl
	ld a, h
	ld [wBattleScriptBufferAddress + 1], a
	ld a, l
	ld [wBattleScriptBufferAddress], a
	ret

BattleCommand_FakeOut:
	ld a, [wAttackMissed]
	and a
	ret nz

	call CheckSubstituteOpp
	jr nz, .fail

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and 1 << FRZ | SLP
	jr nz, .fail

	call CheckOpponentWentFirst
	jr z, FlinchTarget

.fail
	ld a, 1
	ld [wAttackMissed], a
	ret

BattleCommand_FlinchTarget:
	ld a, [wCurVariableMove]
	cp -1
	jr z, .not_variable
	call BattleCommand_EffectChance
	ld a, [wCurVariableMove]
	sub THUNDER_FANG
	jr c, .not_variable
	cp 3
	jr nc, .not_variable
	ld hl, .ptrs
	rst JumpTable
	jr .not_variable

.ptrs
	dw BattleCommand_BurnTarget ; burn
	dw BattleCommand_FreezeTarget ; freeze
	dw BattleCommand_ParalyzeTarget ; paralyze

.not_variable
	call BattleCommand_EffectChance
	call CheckSubstituteOpp
	ret nz

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and 1 << FRZ | SLP
	ret nz

	call CheckOpponentWentFirst
	ret nz

	ld a, [wEffectFailed]
	and a
	ret nz

	; fallthrough

FlinchTarget:
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	set SUBSTATUS_FLINCHED, [hl]
	jp EndRechargeOpp

CheckOpponentWentFirst:
; Returns a=0, z if user went first
; Returns a=1, nz if opponent went first
	push bc
	ld a, [wEnemyGoesFirst] ; 0 if player went first
	ld b, a
	ldh a, [hBattleTurn] ; 0 if it's the player's turn
	xor b ; 1 if opponent went first
	pop bc
	ret

BattleCommand_SetFiveTurns:
; Starts a 5 turn counter based on move id
	farcall SetFiveTurns
	ld a, [wCurVariableMove]
	ld [wBattleAnimParam], a
	call AnimateCurrentMove
; Check for Ingrain
	call BattleCommand_SwitchTurn
	call GetMoveID
	ret nc
	ld a, [wCurVariableMove]
	cp INGRAIN
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	set SUBSTATUS_CANT_RUN, [hl]
	ld hl, CantEscapeNowText
	jp StdBattleTextBox
	ret

BattleCommand_PostHitEffects:
; posthiteffects
	call HasEnemyFainted
	jr z, .skip_sub_check
	call CheckSubstituteOpp
	ret nz
.skip_sub_check
	ld a, [wAttackMissed]
	and a
	ret nz

	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitPostHitBattleCommand

	ld a, BATTLE_VARS_TRAIT_OPP
	ld [wBuffer1], a
	farcall TraitContactUser

	ld a, BATTLE_VARS_TRAIT_OPP
	ld [wBuffer1], a
	farcall TraitContact
	
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitPP
	ret

BattleCommand_PostBuffEffects:
; postbuffeffects
	ld a, [wAttackMissed]
	and a
	ret nz
	farcall TraitAfterRaiseStat
	ret

BattleCommand_PostDebuffEffects:
; postdebuffeffects
	ld a, [wAttackMissed]
	and a
	ret nz
	farcall TraitAfterLowerStat
	ret

BattleCommand_HeldFlinch:
; kingsrock

	ld a, [wAttackMissed]
	and a
	ret nz

	call GetUserItem
	ld a, b
	cp HELD_FLINCH
	ret nz

	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	ld d, h
	ld e, l
	call GetUserItem
	call BattleRandom
	cp c
	ret nc
	call EndRechargeOpp
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	set SUBSTATUS_FLINCHED, [hl]
	ret

BattleCommand_OHKO:
; ohko

	call ResetDamage
	ld a, [wTypeModifier]
	and $7f
	jr z, .no_effect
	ld hl, wEnemyMonLevel
	ld de, wBattleMonLevel
	ld bc, wPlayerMoveStruct + MOVE_ACC
	ldh a, [hBattleTurn]
	and a
	jr z, .got_move_accuracy
	push hl
	ld h, d
	ld l, e
	pop de
	ld bc, wEnemyMoveStruct + MOVE_ACC
.got_move_accuracy
	ld a, [de]
	sub [hl]
	jr c, .no_effect
	add a
	ld e, a
	ld a, [bc]
	add e
	jr nc, .finish_ohko
	ld a, $ff
.finish_ohko
	ld [bc], a
	call BattleCommand_CheckHit
	ld hl, wCurDamage
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ld a, $2
	ld [wCriticalHit], a
	farcall TraitSturdy
	ret

.no_effect
	ld a, $ff
	ld [wCriticalHit], a
	ld a, $1
	ld [wAttackMissed], a
	ret

BattleCommand_CheckCharge:
; checkcharge

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_CHARGED, [hl]
	ret z
	res SUBSTATUS_CHARGED, [hl]
	res SUBSTATUS_UNDERGROUND, [hl]
	res SUBSTATUS_FLYING, [hl]
	ld b, charge_command
	jp SkipToBattleCommand

BattleCommand_Charge:
; charge

	call BattleCommand_ClearText
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	jr z, .awake

	call BattleCommand_MoveDelay
	call BattleCommand_RaiseSub
	call PrintButItFailed
	jp EndMoveEffect

.awake
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	set SUBSTATUS_CHARGED, [hl]

	ld hl, IgnoredOrders2Text
	ld a, [wAlreadyDisobeyed]
	and a
	call nz, StdBattleTextBox

	call BattleCommand_LowerSub
	xor a
	ld [wNumHits], a
	inc a
	ld [wKickCounter], a
	call LoadMoveAnim
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp FLY
	jr z, .flying
	cp DIG
	jr z, .flying
	call BattleCommand_RaiseSub
	jr .not_flying

.flying
	call DisappearUser
.not_flying
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld b, a
	cp FLY
	jr z, .set_flying
	cp DIG
	jr nz, .dont_set_digging
	set SUBSTATUS_UNDERGROUND, [hl]
	jr .dont_set_digging

.set_flying
	set SUBSTATUS_FLYING, [hl]

.dont_set_digging
	call CheckUserIsCharging
	jr nz, .mimic
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr
	ld [hl], b
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], b

.mimic
	call ResetDamage

	ld hl, .UsedText
	call BattleTextBox

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_SKULL_BASH
	ld b, endturn_command
	jp z, SkipToBattleCommand
	jp EndMoveEffect

.UsedText:
	text_jump UnknownText_0x1c0d0e ; "<USER>"
	start_asm
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp SOLARBEAM
	ld hl, .Solarbeam
	jr z, .done

	cp SKY_ATTACK
	ld hl, .SkyAttack
	jr z, .done

	cp FLY
	ld hl, .Fly
	jr z, .done

	cp DIG
	ld hl, .Dig
	jr z, .done

	cp SKULL_BASH
	ld hl, .SkullBash
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp GRASS
	jr z, .brutalvine

.done
	ret

.brutalvine
	ld hl, .BrutalVine
	ret

.Solarbeam:
; 'took in sunlight!'
	text_jump UnknownText_0x1c0d26
	db "@"

.SkullBash:
; 'lowered its head!'
	text_jump Text_LoweredItsHead
	db "@"

.BrutalVine:
; 'lowered its head!'
	text_jump Text_VinesWaveAround
	db "@"

.SkyAttack:
; 'is glowing!'
	text_jump UnknownText_0x1c0d4e
	db "@"

.Fly:
; 'flew up high!'
	text_jump UnknownText_0x1c0d5c
	db "@"

.Dig:
; 'dug a hole!'
	text_jump UnknownText_0x1c0d6c
	db "@"

BattleCommand_TrapTarget:
; traptarget

	ld a, [wAttackMissed]
	and a
	ret nz
	ld hl, wEnemyWrapCount
	ld de, wEnemyTrappingMove
	ldh a, [hBattleTurn]
	and a
	jr z, .got_trap
	ld hl, wPlayerWrapCount
	ld de, wPlayerTrappingMove

.got_trap
	ld a, [hl]
	and a
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz
	call BattleRandom
	; trapped for 2-5 turns
	and %11
	inc a
	inc a
	inc a
	ld [hl], a
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld [de], a
	ld b, a
	ld hl, .Traps

.find_trap_text
	ld a, [hli]
	cp b
	jr z, .found_trap_text
	inc hl
	inc hl
	jr .find_trap_text

.found_trap_text
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp StdBattleTextBox

.Traps:
	dbw WRAP,       WrappedByText      ; 'was WRAPPED by'
	dbw FIRE_SPIN,  FireSpinTrapText   ; 'was trapped!'
	dbw MAGMA_STORM,MagmaStormTrapText ; 'was trapped!'
	dbw CLAMP,      ClampedByText      ; 'was CLAMPED by'
	dbw WHIRLPOOL,  WhirlpoolTrapText  ; 'was trapped!'

BattleCommand_ModType:
; modtype
	call AnimateCurrentMove
	ld hl, wPlayerTypeModCounter
	inc [hl]
	inc [hl]

	ld hl, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .player_type
	ld hl, wEnemyMonType1
.player_type
	ld a, [hl]
	ld [wPlayerTypeMod], a
	ld [wNamedObjectIndexBuffer], a
	farcall GetTypeName
	
	ld hl, BattleText_HarmonyStart
	jp StdBattleTextBox
	
INCLUDE "engine/battle/move_effects/mist.asm"

INCLUDE "engine/battle/move_effects/focus_energy.asm"

BattleCommand_Recoil:
; recoil
	push hl
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitReduceSelfRecoil
	pop hl
	
	hlcoord 10, 9
	ldh a, [hBattleTurn]
	and a
	ld a, 1
	jr z, .animate_hp_bar
	hlcoord 2, 2
	xor a
.animate_hp_bar
	ld [wWhichHPBar], a
	predef AnimateHPBar
	call RefreshBattleHuds
	ld hl, RecoilText
	jp StdBattleTextBox

BattleCommand_ConfuseTarget:
; confusetarget

	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_CONFUSE
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_CONFUSED, [hl]
	ret nz
	jr BattleCommand_FinishConfusingTarget

BattleCommand_Confuse:
; confuse

	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_CONFUSE
	jr nz, .no_item_protection
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	call AnimateFailedMove
	ld hl, ProtectedByText
	jp StdBattleTextBox

.no_item_protection
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_CONFUSED, [hl]
	jr z, .not_already_confused
	call AnimateFailedMove
	ld hl, AlreadyConfusedText
	jp StdBattleTextBox

.not_already_confused
	call CheckSubstituteOpp
	jr nz, BattleCommand_Confuse_CheckSnore_Swagger_ConfuseHit
	ld a, [wAttackMissed]
	and a
	jr nz, BattleCommand_Confuse_CheckSnore_Swagger_ConfuseHit
BattleCommand_FinishConfusingTarget:
	ld bc, wEnemyConfuseCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_confuse_count
	ld bc, wPlayerConfuseCount

.got_confuse_count
	set SUBSTATUS_CONFUSED, [hl]
	; confused for 2-5 turns
	call BattleRandom
	and %11
	inc a
	inc a
	ld [bc], a

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_CONFUSE_HIT
	jr z, .got_effect
	cp EFFECT_SNORE
	jr z, .got_effect
	cp EFFECT_SWAGGER
	jr z, .got_effect
	call AnimateCurrentMove

.got_effect
	ld de, ANIM_CONFUSED
	call PlayOpponentBattleAnim

	ld hl, BecameConfusedText
	call StdBattleTextBox

	call GetOpponentItem
	ld a, b
	cp HELD_HEAL_STATUS
	jr z, .heal_confusion
	cp HELD_HEAL_CONFUSION
	ret nz
.heal_confusion
	ld hl, UseConfusionHealingItem
	jp CallBattleCore

BattleCommand_Confuse_CheckSnore_Swagger_ConfuseHit:
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_CONFUSE_HIT
	ret z
	cp EFFECT_SNORE
	ret z
	cp EFFECT_SWAGGER
	ret z
	jp PrintDidntAffect2

BattleCommand_Paralyze:
; paralyze

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	bit PAR, a
	jr nz, .paralyzed
	ld a, [wTypeModifier]
	and $7f
	jr z, .didnt_affect
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_PARALYZE
	jr nz, .no_item_protection
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	call AnimateFailedMove
	ld hl, ProtectedByText
	jp StdBattleTextBox

.no_item_protection
	ldh a, [hBattleTurn]
	and a
	jr z, .dont_sample_failure

	ld a, [wLinkMode]
	and a
	jr nz, .dont_sample_failure

	ld a, [wInBattleTowerBattle]
	and a
	jr nz, .dont_sample_failure

	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .dont_sample_failure

	; call BattleRandom
	; cp 25 percent + 1 ; 25% chance AI fails
	; jr c, .failed

.dont_sample_failure
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	jr nz, .failed
	ld a, [wAttackMissed]
	and a
	jr nz, .failed
	call CheckSubstituteOpp
	jr nz, .failed
	ld c, 30
	call DelayFrames
	call AnimateCurrentMove
	ld a, $1
	ldh [hBGMapMode], a
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set PAR, [hl]
	call UpdateOpponentInParty
	ld hl, ApplyPrzEffectOnSpeed
	call CallEffectsExtraCore
	call UpdateBattleHuds
	call PrintParalyze
	ld hl, UseHeldStatusHealingItem
	jp CallBattleCore

.paralyzed
	call AnimateFailedMove
	ld hl, AlreadyParalyzedText
	jp StdBattleTextBox

.failed
	jp PrintDidntAffect2

.didnt_affect
	call AnimateFailedMove
	jp PrintDoesntAffect

INCLUDE "engine/battle/move_effects/substitute.asm"

BattleCommand_RechargeNextTurn:
; rechargenextturn
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_RECHARGE, [hl]
	ret

EndRechargeOpp:
	push hl
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	res SUBSTATUS_RECHARGE, [hl]
	pop hl
	ret

INCLUDE "engine/battle/move_effects/rage.asm"

BattleCommand_DoubleFlyingDamage:
; doubleflyingdamage
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_FLYING, a
	ret z
	jr DoubleDamage

BattleCommand_DoubleUndergroundDamage:
; doubleundergrounddamage
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_UNDERGROUND, a
	ret z

	; fallthrough

DoubleDamage:
	ld a, [hl]
	and a
	ret z
	ld hl, wCurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	ret nc
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret

INCLUDE "engine/battle/move_effects/mimic.asm"

INCLUDE "engine/battle/move_effects/leech_seed.asm"

INCLUDE "engine/battle/move_effects/disable.asm"

INCLUDE "engine/battle/move_effects/conversion.asm"

BattleCommand_ResetStats:
; resetstats
	call GetMoveID
	jr nc, .haze
	cp CLEAR_SMOG
	jr nz, .haze
	ld hl, wEnemyStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .player_turn
	ld hl, wPlayerStatLevels
.player_turn
	ld a, 7 ; neutral
	call .Fill
	jr .done
.haze
	ld a, 7 ; neutral
	ld hl, wPlayerStatLevels
	call .Fill
	ld hl, wEnemyStatLevels
	call .Fill
.done
	ldh a, [hBattleTurn]
	push af

	call SetPlayerTurn
	call CalcPlayerStats
	call SetEnemyTurn
	call CalcEnemyStats

	pop af
	ldh [hBattleTurn], a

	call AnimateCurrentMove

	ld hl, EliminatedStatsText
	jp StdBattleTextBox

.Fill:
	ld b, wPlayerStatLevelsEnd - wPlayerStatLevels
.next
	ld [hli], a
	dec b
	jr nz, .next
	ret

BattleCommand_Heal:
; heal

	ld de, wBattleMonHP
	ld hl, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld de, wEnemyMonHP
	ld hl, wEnemyMonMaxHP
.got_hp
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld b, a
	push hl
	push de
	push bc
	ld c, 2
	call CompareBytes
	pop bc
	pop de
	pop hl
	jp z, .hp_full
	ld a, b
	cp REST
	jr nz, .not_rest

	push hl
	push de
	push af
	call BattleCommand_MoveDelay
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	res SUBSTATUS_TOXIC, [hl]
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	ld a, [hl]
	and a
	ld [hl], REST_SLEEP_TURNS + 1
	ld hl, WentToSleepText
	jr z, .no_status_to_heal
	ld hl, RestedText
.no_status_to_heal
	call StdBattleTextBox
	ldh a, [hBattleTurn]
	and a
	jr nz, .calc_enemy_stats
	call CalcPlayerStats
	jr .got_stats

.calc_enemy_stats
	call CalcEnemyStats
.got_stats
	pop af
	pop de
	pop hl

.not_rest
	jr z, .restore_full_hp
	ld a, [wBuffer3]
	and a
	jr z, .finish2
	ld hl, GetHalfMaxHP
	call CallBattleCore
	jr .finish

.restore_full_hp
	ld hl, GetMaxHP
	call CallBattleCore
.finish
	ld a, [wCurVariableMove]
	ld [wBattleAnimParam], a
	call AnimateCurrentMove
.finish2
	call BattleCommand_SwitchTurn
	ld hl, RestoreHP
	call CallBattleCore
	call BattleCommand_SwitchTurn
	call UpdateUserInParty
	call RefreshBattleHuds
	ld hl, RegainedHealthText
	jp StdBattleTextBox

.hp_full
	call AnimateFailedMove
	ld hl, HPIsFullText
	jp StdBattleTextBox

INCLUDE "engine/battle/move_effects/transform.asm"

BattleSideCopy:
; Copy bc bytes from hl to de if it's the player's turn.
; Copy bc bytes from de to hl if it's the enemy's turn.
	ldh a, [hBattleTurn]
	and a
	jr z, .copy

; Swap hl and de
	push hl
	ld h, d
	ld l, e
	pop de
.copy
	jp CopyBytes

BattleEffect_ButItFailed:
	call AnimateFailedMove
	jp PrintButItFailed

ClearLastMove:
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr
	xor a
	ld [hl], a

	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	xor a
	ld [hl], a
	ret

ResetActorDisable:
	ldh a, [hBattleTurn]
	and a
	jr z, .player

	xor a
	ld [wEnemyDisableCount], a
	ld [wEnemyDisabledMove], a
	ret

.player
	xor a
	ld [wPlayerDisableCount], a
	ld [wDisabledMove], a
	ret

BattleCommand_Screen:
; screen

	ld hl, wPlayerScreens
	ld bc, wPlayerLightScreenCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens_pointer
	ld hl, wEnemyScreens
	ld bc, wEnemyLightScreenCount

.got_screens_pointer
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_LIGHT_SCREEN
	jr nz, .reflect

	bit SCREENS_LIGHT_SCREEN, [hl]
	jr nz, .failed
	set SCREENS_LIGHT_SCREEN, [hl]
	ld a, 5
	ld [bc], a
	ld hl, LightScreenEffectText
	jr .good

.reflect
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_REFLECT
	jr nz, .leaf_shield

	bit SCREENS_REFLECT, [hl]
	jr nz, .failed
	set SCREENS_REFLECT, [hl]	
	inc bc ; LightScreenCount -> ReflectCount
	ld a, 5
	ld [bc], a
	ld hl, ReflectEffectText
	jp .good
	
.leaf_shield
	bit SCREENS_LEAF_SHIELD, [hl]
	jr nz, .failed
	set SCREENS_LEAF_SHIELD, [hl]
	inc bc
	inc bc ; LightScreenCount -> ReflectCount
	ld a, 5
	ld [bc], a
	ld hl, LeafShieldEffectText

.good
	call AnimateCurrentMove
	jp StdBattleTextBox

.failed
	call AnimateFailedMove
	jp PrintButItFailed

PrintDoesntAffect:
; 'it doesn't affect'
	ld hl, DoesntAffectText
	jp StdBattleTextBox

PrintNothingHappened:
; 'but nothing happened!'
	ld hl, NothingHappenedText
	jp StdBattleTextBox

TryPrintButItFailed:
	ld a, [wAlreadyFailed]
	and a
	ret nz
	; fallthrough

PrintButItFailed:
; 'but it failed!'
	ld hl, ButItFailedText
	jp StdBattleTextBox

FailMove:
	call AnimateFailedMove
	; fallthrough

FailMimic:
	ld hl, ButItFailedText ; 'but it failed!'
	ld de, ItFailedText    ; 'it failed!'
	jp FailText_CheckOpponentProtect

PrintDidntAffect:
; 'it didn't affect'
	ld hl, DidntAffect1Text
	jp StdBattleTextBox

PrintDidntAffect2:
	call AnimateFailedMove
	ld hl, DidntAffect1Text ; 'it didn't affect'
	ld de, DidntAffect2Text ; 'it didn't affect'
	jp FailText_CheckOpponentProtect

PrintParalyze:
; 'paralyzed! maybe it can't attack!'
	ld hl, ParalyzedText
	jp StdBattleTextBox

CheckSubstituteOpp:
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret

INCLUDE "engine/battle/move_effects/selfdestruct.asm"

INCLUDE "engine/battle/move_effects/mirror_move.asm"

INCLUDE "engine/battle/move_effects/metronome.asm"

CheckUserMove:
; Return z if the user has move a.
	ld b, a
	ld de, wBattleMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wEnemyMonMoves
.ok

	ld c, NUM_MOVES
.loop
	ld a, [de]
	inc de
	cp b
	ret z

	dec c
	jr nz, .loop

	ld a, 1
	and a
	ret

ResetTurn:
	ld hl, wPlayerCharging
	ldh a, [hBattleTurn]
	and a
	jr z, .player
	ld hl, wEnemyCharging

.player
	ld [hl], 1
	xor a
	ld [wAlreadyDisobeyed], a
	call DoMove
	jp EndMoveEffect

BattleCommand_ArenaTrap:
; arenatrap

; Doesn't work on an absent opponent.

	call CheckHiddenOpponent
	jr nz, .failed

; Don't trap if the opponent is already trapped.

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	bit SUBSTATUS_CANT_RUN, [hl]
	jr nz, .failed

; Otherwise trap the opponent.

	set SUBSTATUS_CANT_RUN, [hl]
	call AnimateCurrentMove
	ld hl, CantEscapeNowText
	jp StdBattleTextBox

.failed
	call AnimateFailedMove
	jp PrintButItFailed

INCLUDE "engine/battle/move_effects/nightmare.asm"

BattleCommand_Defrost:
; defrost

; Thaw the user.

	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	bit FRZ, [hl]
	ret z
	res FRZ, [hl]

; Don't update the enemy's party struct in a wild battle.

	ldh a, [hBattleTurn]
	and a
	jr z, .party

	ld a, [wBattleMode]
	dec a
	jr z, .done

.party
	ld a, MON_STATUS
	call UserPartyAttr
	res FRZ, [hl]

.done
	call RefreshBattleHuds
	ld hl, WasDefrostedText
	jp StdBattleTextBox

INCLUDE "engine/battle/move_effects/curse.asm"

INCLUDE "engine/battle/move_effects/protect.asm"

INCLUDE "engine/battle/move_effects/endure.asm"

INCLUDE "engine/battle/move_effects/spikes.asm"

INCLUDE "engine/battle/move_effects/prism_light.asm"

INCLUDE "engine/battle/move_effects/perish_song.asm"

INCLUDE "engine/battle/move_effects/sandstorm.asm"

INCLUDE "engine/battle/move_effects/rollout.asm"

INCLUDE "engine/battle/move_effects/fury_cutter.asm"

INCLUDE "engine/battle/move_effects/attract.asm"

INCLUDE "engine/battle/move_effects/safeguard.asm"

SafeCheckSafeguard:
	push hl
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_turn
	ld hl, wPlayerScreens

.got_turn
	bit SCREENS_SAFEGUARD, [hl]
	pop hl
	ret

BattleCommand_CheckSafeguard:
; checksafeguard
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_turn
	ld hl, wPlayerScreens
.got_turn
	bit SCREENS_SAFEGUARD, [hl]
	ret z
	ld a, 1
	ld [wAttackMissed], a
	call BattleCommand_MoveDelay
	ld hl, SafeguardProtectText
	call StdBattleTextBox
	jp EndMoveEffect

INCLUDE "engine/battle/move_effects/magnitude.asm"

INCLUDE "engine/battle/move_effects/wild_storm.asm"

INCLUDE "engine/battle/move_effects/baton_pass.asm"

INCLUDE "engine/battle/move_effects/pursuit.asm"

INCLUDE "engine/battle/move_effects/rapid_spin.asm"

INCLUDE "engine/battle/move_effects/brick_break.asm"

BattleCommand_HealMorn:
; healmorn
	ld b, MORN_F
	jr BattleCommand_TimeBasedHealContinue

BattleCommand_HealDay:
; healday 
	ld b, DAY_F
	jr BattleCommand_TimeBasedHealContinue

BattleCommand_HealNite:
; healnite
	ld b, NITE_F
	; fallthrough

BattleCommand_TimeBasedHealContinue:
; Time- and weather-sensitive heal.

	ld hl, wBattleMonMaxHP
	ld de, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .start
	ld hl, wEnemyMonMaxHP
	ld de, wEnemyMonHP

.start
; Index for .Multipliers
; Default restores half max HP.
	ld c, 2

; Don't bother healing if HP is already full.
	push bc
	call CompareBytes
	pop bc
	jr z, .Full

; Don't factor in time of day in link battles.
	ld a, [wLinkMode]
	and a
	jr nz, .Weather

	ld a, [wTimeOfDay]
	cp b
	jr z, .Weather
	dec c ; double

.Weather:
	ld a, [wBattleWeather]
	and a
	jr z, .Heal

; x2 in sun
; /2 in rain/sandstorm
	inc c
	cp WEATHER_SUN
	jr z, .Heal
	dec c
	dec c

.Heal:
	ld b, 0
	ld hl, .Multipliers
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, BANK(GetMaxHP)
	rst FarCall

	call AnimateCurrentMove
	call BattleCommand_SwitchTurn

	callfar RestoreHP

	call BattleCommand_SwitchTurn
	call UpdateUserInParty

; 'regained health!'
	ld hl, RegainedHealthText
	jp StdBattleTextBox

.Full:
	call AnimateFailedMove

; 'hp is full!'
	ld hl, HPIsFullText
	jp StdBattleTextBox

.Multipliers:
	dw GetEighthMaxHP
	dw GetQuarterMaxHP
	dw GetHalfMaxHP
	dw GetMaxHP

INCLUDE "engine/battle/move_effects/hidden_power.asm"

INCLUDE "engine/battle/move_effects/rain_dance.asm"

INCLUDE "engine/battle/move_effects/sunny_day.asm"

INCLUDE "engine/battle/move_effects/belly_drum.asm"

INCLUDE "engine/battle/move_effects/psych_up.asm"

INCLUDE "engine/battle/move_effects/mirror_coat.asm"

INCLUDE "engine/battle/move_effects/weight_damage.asm"

BattleCommand_DoubleMinimizeDamage:
; doubleminimizedamage

	ld hl, wEnemyMinimized
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wPlayerMinimized
.ok
	ld a, [hl]
	and a
	ret z
	ld hl, wCurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	ret nc
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret

BattleCommand_SkipSunCharge:
; mimicsuncharge
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret nz
	ld b, charge_command
	jp SkipToBattleCommand

INCLUDE "engine/battle/move_effects/future_sight.asm"

INCLUDE "engine/battle/move_effects/thunder.asm"

CheckHiddenOpponent:
	xor a
	ret

GetUserItem:
; Return the effect of the user's item in bc, and its id at hl.
	ld hl, wBattleMonItem
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wEnemyMonItem
.go
	ld b, [hl]
	jp GetItemHeldEffect

GetOpponentItem:
; Return the effect of the opponent's item in bc, and its id at hl.
	ld hl, wEnemyMonItem
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wBattleMonItem
.go
	ld b, [hl]
; fallthrough

GetItemHeldEffect:
; Return the effect of item b in bc.
	ld a, b
	and a
	ret z

	push hl
	ld hl, ItemAttributes + ITEMATTR_EFFECT
	dec a
	ld c, a
	ld b, 0
	ld a, ITEMATTR_STRUCT_LENGTH
	call AddNTimes
	ld a, BANK(ItemAttributes)
	call GetFarHalfword
	ld b, l
	ld c, h
	ld a, c
	push bc
	push de
	ld [wBuffer2], a
	ld a, BATTLE_VARS_TRAIT_OPP
	ld [wBuffer1], a
	farcall TraitBoostBerryHeal
	ld a, [wBuffer2]
	pop de
	pop bc
	ld c, a
	pop hl
	ret

AnimateCurrentMoveEitherSide:
	push hl
	push de
	push bc
	ld a, [wKickCounter]
	push af
	call BattleCommand_LowerSub
	pop af
	ld [wKickCounter], a
	call PlayDamageAnim
	call BattleCommand_RaiseSub
	pop bc
	pop de
	pop hl
	ret

AnimateCurrentMove:
	push hl
	push de
	push bc
	ld a, [wKickCounter]
	push af
	call BattleCommand_LowerSub
	pop af
	ld [wKickCounter], a
	call LoadMoveAnim
	call BattleCommand_RaiseSub
	pop bc
	pop de
	pop hl
	ret

PlayDamageAnim:
	xor a
	ld [wFXAnimID + 1], a

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	and a
	ret z

	ld [wFXAnimID], a

	ldh a, [hBattleTurn]
	and a
	ld a, BATTLEANIM_ENEMY_DAMAGE
	jr z, .player
	ld a, BATTLEANIM_PLAYER_DAMAGE

.player
	ld [wNumHits], a

	jp PlayUserBattleAnim

LoadMoveAnim:
	xor a
	ld [wNumHits], a
	ld [wFXAnimID + 1], a

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	and a
	ret z

	; fallthrough

LoadAnim:
	ld [wFXAnimID], a

	; fallthrough

PlayUserBattleAnim:
	push hl
	push de
	push bc
	callfar PlayBattleAnim
	pop bc
	pop de
	pop hl
	ret

PlayOpponentBattleAnim:
	ld a, e
	ld [wFXAnimID], a
	ld a, d
	ld [wFXAnimID + 1], a
	xor a
	ld [wNumHits], a

	push hl
	push de
	push bc
	call BattleCommand_SwitchTurn

	callfar PlayBattleAnim

	call BattleCommand_SwitchTurn
	pop bc
	pop de
	pop hl
	ret

CallBattleCore:
	ld a, BANK("Battle Core")
	rst FarCall
	ret

CallEffectsExtraCore:
	ld a, BANK("bank5B")
	rst FarCall
	ret

AnimateFailedMove:
	call BattleCommand_LowerSub
	call BattleCommand_MoveDelay
	jp BattleCommand_RaiseSub

BattleCommand_MoveDelay:
; movedelay
; Wait 40 frames.
	ld c, 10 ; 40
	jp DelayFrames

BattleCommand_ClearText:
; cleartext

; Used in multi-hit moves.
	ld hl, .text
	jp BattleTextBox

.text
	db "@"

SkipToBattleCommand:
; Skip over commands until reaching command b.
	ld a, [wBattleScriptBufferAddress + 1]
	ld h, a
	ld a, [wBattleScriptBufferAddress]
	ld l, a
.loop
	ld a, [hli]
	cp b
	jr nz, .loop

	ld a, h
	ld [wBattleScriptBufferAddress + 1], a
	ld a, l
	ld [wBattleScriptBufferAddress], a
	ret

GetMoveAttr:
; Assuming hl = Moves + x, return attribute x of move a.
	push bc
	ld bc, MOVE_LENGTH
	call AddNTimes
	call GetMoveByte
	pop bc
	ret

GetMoveData:
; Copy move struct a to de.
	inc a
	push de
	ld e, a
	farcall IsVariableMove
	jr nc, .not_variable
	predef GetVariableMoveType
	jr nc, .not_variable
	ld a, e
	ld hl, VarMoves
	jr .got_move_data

.not_variable
	ld a, e
	dec a
	ld hl, Moves
.got_move_data
	pop de
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	jp FarCopyBytes

GetMoveByte:
	ld a, BANK(Moves)
	jp GetFarByte

DisappearUser:
	farcall _DisappearUser
	ret

AppearUserLowerSub:
	farcall _AppearUserLowerSub
	ret

AppearUserRaiseSub:
	farcall _AppearUserRaiseSub
	ret

_CheckBattleScene:
; Checks the options.  Returns carry if battle animations are disabled.
	push hl
	push de
	push bc
	farcall CheckBattleScene
	pop bc
	pop de
	pop hl
	ret
