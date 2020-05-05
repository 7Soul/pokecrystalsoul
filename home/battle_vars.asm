GetBattleVar::
; Preserves hl.
	push hl
	call GetBattleVarAddr
	pop hl
	ret

GetBattleVarAddr::
; Get variable from pair a, depending on whose turn it is.
; There are 21 variable pairs.

	push bc

	ld hl, BattleVarPairs
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld h, [hl]
	ld l, a

; Enemy turn uses the second byte instead.
; This lets battle variable calls be side-neutral.
	ldh a, [hBattleTurn]
	and a
	jr z, .getvar
	inc hl

.getvar
; var id
	ld a, [hl]
	ld c, a
	ld b, 0

	ld hl, BattleVarLocations
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [hl]

	pop bc
	ret

BattleVarPairs:
; entries correspond to BATTLE_VARS_* constants
	dw .Substatus1
	dw .Substatus2
	dw .Substatus3
	dw .Substatus4
	dw .Substatus5
	dw .Substatus1Opp
	dw .Substatus2Opp
	dw .Substatus3Opp
	dw .Substatus4Opp
	dw .Substatus5Opp
	dw .Status
	dw .StatusOpp
	dw .Trait
	dw .TraitOpp
	dw .MoveAnim
	dw .MoveEffect
	dw .MovePower
	dw .MoveType
	dw .CurMove
	dw .LastCounter
	dw .LastCounterOpp
	dw .LastMove
	dw .LastMoveOpp
	dw .TurnsTaken
	dw .TurnsTakenOpp
	dw .Type1
	dw .Type1Opp
	dw .Type2
	dw .Type2Opp

;                   player                 enemy
.Substatus1:     db PLAYER_SUBSTATUS_1,    ENEMY_SUBSTATUS_1
.Substatus1Opp:  db ENEMY_SUBSTATUS_1,     PLAYER_SUBSTATUS_1
.Substatus2:     db PLAYER_SUBSTATUS_2,    ENEMY_SUBSTATUS_2
.Substatus2Opp:  db ENEMY_SUBSTATUS_2,     PLAYER_SUBSTATUS_2
.Substatus3:     db PLAYER_SUBSTATUS_3,    ENEMY_SUBSTATUS_3
.Substatus3Opp:  db ENEMY_SUBSTATUS_3,     PLAYER_SUBSTATUS_3
.Substatus4:     db PLAYER_SUBSTATUS_4,    ENEMY_SUBSTATUS_4
.Substatus4Opp:  db ENEMY_SUBSTATUS_4,     PLAYER_SUBSTATUS_4
.Substatus5:     db PLAYER_SUBSTATUS_5,    ENEMY_SUBSTATUS_5
.Substatus5Opp:  db ENEMY_SUBSTATUS_5,     PLAYER_SUBSTATUS_5
.Status:         db PLAYER_STATUS,         ENEMY_STATUS
.StatusOpp:      db ENEMY_STATUS,          PLAYER_STATUS
.Trait:          db PLAYER_TRAIT,          ENEMY_TRAIT
.TraitOpp:       db ENEMY_TRAIT,           PLAYER_TRAIT
.MoveAnim:       db PLAYER_MOVE_ANIMATION, ENEMY_MOVE_ANIMATION
.MoveEffect:     db PLAYER_MOVE_EFFECT,    ENEMY_MOVE_EFFECT
.MovePower:      db PLAYER_MOVE_POWER,     ENEMY_MOVE_POWER
.MoveType:       db PLAYER_MOVE_TYPE,      ENEMY_MOVE_TYPE
.CurMove:        db PLAYER_CUR_MOVE,       ENEMY_CUR_MOVE
.LastCounter:    db PLAYER_COUNTER_MOVE,   ENEMY_COUNTER_MOVE
.LastCounterOpp: db ENEMY_COUNTER_MOVE,    PLAYER_COUNTER_MOVE
.LastMove:       db PLAYER_LAST_MOVE,      ENEMY_LAST_MOVE
.LastMoveOpp:    db ENEMY_LAST_MOVE,       PLAYER_LAST_MOVE
.TurnsTaken:     db PLAYER_TURNS_TAKEN,    ENEMY_TURNS_TAKEN
.TurnsTakenOpp:  db ENEMY_TURNS_TAKEN,     PLAYER_TURNS_TAKEN
.Type1:          db PLAYER_TYPE1,          ENEMY_TYPE1
.Type1Opp:       db ENEMY_TYPE1,           PLAYER_TYPE1
.Type2:          db PLAYER_TYPE2,          ENEMY_TYPE2
.Type2Opp:       db ENEMY_TYPE2,           PLAYER_TYPE2

BattleVarLocations:
; entries correspond to PLAYER_* and ENEMY_* constants
	dw wPlayerSubStatus1,          wEnemySubStatus1
	dw wPlayerSubStatus2,          wEnemySubStatus2
	dw wPlayerSubStatus3,          wEnemySubStatus3
	dw wPlayerSubStatus4,          wEnemySubStatus4
	dw wPlayerSubStatus5,          wEnemySubStatus5
	dw wBattleMonStatus,           wEnemyMonStatus
	dw wBattleMonTrait,            wEnemyMonTrait
	dw wPlayerMoveStructAnimation, wEnemyMoveStructAnimation
	dw wPlayerMoveStructEffect,    wEnemyMoveStructEffect
	dw wPlayerMoveStructPower,     wEnemyMoveStructPower
	dw wPlayerMoveStructType,      wEnemyMoveStructType
	dw wCurPlayerMove,             wCurEnemyMove
	dw wLastPlayerCounterMove,     wLastEnemyCounterMove
	dw wLastPlayerMove,            wLastEnemyMove
	dw wPlayerTurnsTaken,          wEnemyTurnsTaken
	dw wBattleMonType1,            wEnemyMonType1
	dw wBattleMonType2,            wEnemyMonType2
