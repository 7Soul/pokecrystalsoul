DoBattleAnimFrame:
	ld hl, BATTLEANIMSTRUCT_FUNCTION
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
; entries correspond to BATTLEANIMFUNC_* constants
	dw BattleAnimFunction_Null                              ; 00
	dw BattleAnimFunction_MoveFromUserToTarget              ; BATTLEANIMFUNC_USER_TO_TARGET
	dw BattleAnimFunction_MoveFromUserToTargetAndDisappear  ; BATTLEANIMFUNC_USER_TO_TARGET_DISAPPEAR
	dw BattleAnimFunction_MoveInCircle                      ; BATTLEANIMFUNC_MOVE_IN_CIRCLE
	dw BattleAnimFunction_MoveVerticalWaveToTarget          ; BATTLEANIMFUNC_WAVE_TO_TARGET
	dw BattleAnimFunction_ThrowFromUserToTarget             ; BATTLEANIMFUNC_THROW_TO_TARGET
	dw BattleAnimFunction_ThrowFromUserToTargetAndDisappear ; BATTLEANIMFUNC_THROW_TO_TARGET_DISAPPEAR
	dw BattleAnimFunction_DropObject                        ; BATTLEANIMFUNC_DROP
	dw BattleAnimFunction_MoveFromUserToTargetSpinAround    ; BATTLEANIMFUNC_USER_TO_TARGET_SPIN
	dw BattleAnimFunction_Shake                             ; BATTLEANIMFUNC_SHAKE
	dw BattleAnimFunction_FireBlast                         ; BATTLEANIMFUNC_FIRE_BLAST
	dw BattleAnimFunction_RazorLeaf                         ; BATTLEANIMFUNC_0b
	dw BattleAnimFunction_Bubble                            ; BATTLEANIMFUNC_BUBBLE
	dw BattleAnimFunction_Surf                              ; BATTLEANIMFUNC_SURF
	dw BattleAnimFunction_Sing                              ; BATTLEANIMFUNC_SING
	dw BattleAnimFunction_WaterGun                          ; BATTLEANIMFUNC_WATER_GUN
	dw BattleAnimFunction_Ember                             ; BATTLEANIMFUNC_EMBER
	dw BattleAnimFunction_Powder                            ; BATTLEANIMFUNC_POWDER
	dw BattleAnimFunction_PokeBall                          ; BATTLEANIMFUNC_POKEBALL
	dw BattleAnimFunction_PokeBallBlocked                   ; BATTLEANIMFUNC_POKEBALL_BLOCKED
	dw BattleAnimFunction_Recover                           ; BATTLEANIMFUNC_RECOVER
	dw BattleAnimFunction_ThunderWave                       ; BATTLEANIMFUNC_THUNDER_WAVE
	dw BattleAnimFunction_Clamp                             ; BATTLEANIMFUNC_CLAMP_ENCORE
	dw BattleAnimFunction_Bite                              ; BATTLEANIMFUNC_BITE
	dw BattleAnimFunction_SolarBeam                         ; BATTLEANIMFUNC_SOLAR_BEAM
	dw BattleAnimFunction_Gust                              ; BATTLEANIMFUNC_GUST
	dw BattleAnimFunction_RazorWind                         ; BATTLEANIMFUNC_RAZOR_WIND
	dw BattleAnimFunction_Kick                              ; BATTLEANIMFUNC_KICK
	dw BattleAnimFunction_Absorb                            ; BATTLEANIMFUNC_ABSORB
	dw BattleAnimFunction_Egg                               ; BATTLEANIMFUNC_EGG
	dw BattleAnimFunction_MoveUp                            ; BATTLEANIMFUNC_MOVE_UP
	dw BattleAnimFunction_Wrap                              ; BATTLEANIMFUNC_WRAP
	dw BattleAnimFunction_LeechSeed                         ; BATTLEANIMFUNC_20
	dw BattleAnimFunction_Sound                             ; BATTLEANIMFUNC_SOUND
	dw BattleAnimFunction_ConfuseRay                        ; BATTLEANIMFUNC_CONFUSE_RAY
	dw BattleAnimFunction_Dizzy                             ; BATTLEANIMFUNC_DIZZY
	dw BattleAnimFunction_Amnesia                           ; BATTLEANIMFUNC_AMNESIA
	dw BattleAnimFunction_Sleep                             ; BATTLEANIMFUNC_FLOAT_UP
	dw BattleAnimFunction_Dig                               ; BATTLEANIMFUNC_DIG
	dw BattleAnimFunction_String                            ; BATTLEANIMFUNC_STRING
	dw BattleAnimFunction_Paralyzed                         ; BATTLEANIMFUNC_PARALYZED
	dw BattleAnimFunction_SpiralDescent                     ; BATTLEANIMFUNC_29
	dw BattleAnimFunction_PoisonGas                         ; BATTLEANIMFUNC_2a
	dw BattleAnimFunction_Horn                              ; BATTLEANIMFUNC_2b
	dw BattleAnimFunction_Needle                            ; BATTLEANIMFUNC_NEEDLE
	dw BattleAnimFunction_PetalDance                        ; BATTLEANIMFUNC_PETAL_DANCE
	dw BattleAnimFunction_ThiefPayday                       ; BATTLEANIMFUNC_THIEF_PAYDAY
	dw BattleAnimFunction_AbsorbCircle                      ; BATTLEANIMFUNC_ABSORB_CIRCLE
	dw BattleAnimFunction_Bonemerang                        ; BATTLEANIMFUNC_BONEMERANG
	dw BattleAnimFunction_Shiny                             ; BATTLEANIMFUNC_SHINY
	dw BattleAnimFunction_SkyAttack                         ; BATTLEANIMFUNC_SKY_ATTACK
	dw BattleAnimFunction_GrowthSwordsDance                 ; BATTLEANIMFUNC_GROWTH_SWORDS_DANCE
	dw BattleAnimFunction_SmokeFlameWheel                   ; BATTLEANIMFUNC_SMOKE_FLAME_WHEEL
	dw BattleAnimFunction_PresentSmokescreen                ; BATTLEANIMFUNC_PRESENT_SMOKESCREEN
	dw BattleAnimFunction_StrengthSeismicToss               ; BATTLEANIMFUNC_STRENGTH_SEISMIC_TOSS
	dw BattleAnimFunction_SpeedLine                         ; BATTLEANIMFUNC_SPEED_LINE
	dw BattleAnimFunction_Sludge                            ; BATTLEANIMFUNC_SLUDGE
	dw BattleAnimFunction_MetronomeHand                     ; BATTLEANIMFUNC_METRONOME_HAND
	dw BattleAnimFunction_MetronomeSparkleSketch            ; BATTLEANIMFUNC_METRONOME_SPARKLE_SKETCH
	dw BattleAnimFunction_Agility                           ; BATTLEANIMFUNC_AGILITY
	dw BattleAnimFunction_SacredFire                        ; BATTLEANIMFUNC_SACRED_FIRE
	dw BattleAnimFunction_SafeguardProtect                  ; BATTLEANIMFUNC_SAFEGUARD_PROTECT
	dw BattleAnimFunction_LockOnMindReader                  ; BATTLEANIMFUNC_LOCK_ON_MIND_READER
	dw BattleAnimFunction_Spikes                            ; BATTLEANIMFUNC_SPIKES
	dw BattleAnimFunction_HealBellNotes                     ; BATTLEANIMFUNC_HEAL_BELL_NOTES
	dw BattleAnimFunction_BatonPass                         ; BATTLEANIMFUNC_BATON_PASS
	dw BattleAnimFunction_Conversion                        ; BATTLEANIMFUNC_CONVERSION
	dw BattleAnimFunction_EncoreBellyDrum                   ; BATTLEANIMFUNC_ENCORE_BELLY_DRUM
	dw BattleAnimFunction_SwaggerMorningSun                 ; BATTLEANIMFUNC_SWAGGER_MORNING_SUN
	dw BattleAnimFunction_HiddenPower                       ; BATTLEANIMFUNC_HIDDEN_POWER
	dw BattleAnimFunction_Curse                             ; BATTLEANIMFUNC_CURSE
	dw BattleAnimFunction_PerishSong                        ; BATTLEANIMFUNC_PERISH_SONG
	dw BattleAnimFunction_RapidSpin                         ; BATTLEANIMFUNC_RAPID_SPIN
	dw BattleAnimFunction_Pursuit                           ; BATTLEANIMFUNC_BETA_PURSUIT
	dw BattleAnimFunction_RainSandstorm                     ; BATTLEANIMFUNC_RAIN_SANDSTORM
	dw BattleAnimFunction_Unused1                           ; BATTLEANIMFUNC_ANIM_OBJ_B0
	dw BattleAnimFunction_PsychUp                           ; BATTLEANIMFUNC_PSYCH_UP
	dw BattleAnimFunction_AncientPower                      ; BATTLEANIMFUNC_ANCIENT_POWER
	dw BattleAnimFunction_RockSmash                         ; BATTLEANIMFUNC_ROCK_SMASH
	dw BattleAnimFunction_Cotton                            ; BATTLEANIMFUNC_COTTON
	dw BattleAnimFunction_26b                               ; BATTLEANIMFUNC_DIGb
	dw BattleAnimFunction_33b                               ; BATTLEANIMFUNC_GROWTH_SWORDS_DANCEb
	dw BattleAnimFunction_36b                               ; BATTLEANIMFUNC_STRENGTH_SEISMIC_TOSSb

BattleAnimFunction_Null:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
.one
	call DeinitBattleAnimation
.zero
	ret

BattleAnimFunction_ThrowFromUserToTargetAndDisappear:
	call BattleAnimFunction_ThrowFromUserToTarget
	ret c
	call DeinitBattleAnimation
	ret

BattleAnimFunction_ThrowFromUserToTarget:
	; If x coord at $88 or beyond, abort.
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	ret nc
	; Move right 2 pixels
	add $2
	ld [hl], a
	; Move down 1 pixel
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	; Decrease ??? and hold onto its previous value (argument of the sine function)
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec [hl]
	; Get ???, which is the amplitude of the sine function
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld d, [hl]
	call BattleAnim_Sine
	; Store the result in the Y offset
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	; Carry flag denotes success
	scf
	ret

BattleAnimFunction_MoveVerticalWaveToTarget:
; Wave motion from one mon to another. Obj is cleared when it reaches x coord $88. Examples: Shadow Ball, Dragon Rage
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	jr c, .asm_cd0b3
	call DeinitBattleAnimation
	ret

.asm_cd0b3
	add $2
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ld d, $10
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	sra a
	sra a
	sra a
	sra a
	ld [hl], a
	ret

BattleAnimFunction_MoveInCircle:
; Slow circular motion. Examples: Thundershock, Flamethrower
; Obj Param: Distance from center (masked with $7F). Bit 7 causes object to start on other side of the circle
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	bit 7, [hl]
	ld a, $0
	jr z, .asm_cd0f9
	ld a, $20
.asm_cd0f9
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a
.one
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld d, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_MoveFromUserToTarget:
; Moves object diagonally at a ~30° angle towards opponent and stops when it reaches x coord $84. Obj Param changes the speed
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
.one
	call DeinitBattleAnimation
	ret

.zero
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	ret nc
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	call BattleAnim_StepToTarget
	ret

BattleAnimFunction_MoveFromUserToTargetAndDisappear:
; Same as BattleAnimFunction_01 but objs are cleared when they reach x coord $84
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	jr nc, .asm_cd158
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	call BattleAnim_StepToTarget
	ret

.asm_cd158
	call DeinitBattleAnimation
	ret

BattleAnimFunction_PokeBall:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
	dw .five
	dw .six
	dw .seven
	dw .eight
	dw .nine
	dw .ten
	dw .eleven
.zero ; init
	call GetBallAnimPal
	call BattleAnim_IncAnonJumptableIndex
	ret

.one
	call BattleAnimFunction_ThrowFromUserToTarget
	ret c
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	add [hl]
	ld [hl], a
	ld a, BATTLEANIMFRAMESET_0B
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ret

.three
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_09
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $0
	inc hl
	ld [hl], $10
.four
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and $1f
	ret nz
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	sub $4
	ld [hl], a
	ret nz
	ld a, BATTLEANIMFRAMESET_0C
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ret

.six
	ld a, BATTLEANIMFRAMESET_0D
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	dec [hl]
.two
.five
.nine
	ret

.seven
	call GetBallAnimPal
	ld a, BATTLEANIMFRAMESET_0A
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], $20
.eight
.ten
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and $1f
	jr z, .eleven
	and $f
	ret nz
	call BattleAnim_IncAnonJumptableIndex
	ret

.eleven
	call DeinitBattleAnimation
	ret

BattleAnimFunction_PokeBallBlocked:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
.zero
	call GetBallAnimPal
	call BattleAnim_IncAnonJumptableIndex
	ret

.one
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $70
	jr nc, .next
	call BattleAnimFunction_ThrowFromUserToTarget
	ret

.next
	call BattleAnim_IncAnonJumptableIndex
.two
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .done
	add $4
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
	dec [hl]
	ret

.done
	call DeinitBattleAnimation
	ret

GetBallAnimPal:
	ld hl, BallColors
	ldh a, [rSVBK]
	push af
	ld a, BANK(wCurItem)
	ldh [rSVBK], a
	ld a, [wCurItem]
	ld e, a
	pop af
	ldh [rSVBK], a
.IsInArray:
	ld a, [hli]
	cp -1
	jr z, .load
	cp e
	jr z, .load
	inc hl
	jr .IsInArray

.load
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_PALETTE
	add hl, bc
	ld [hl], a
	ret

INCLUDE "data/battle_anims/ball_colors.asm"

BattleAnimFunction_Ember:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
.zero
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	swap a
	and $f
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], a
	ret

.one
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	ret nc
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	call BattleAnim_StepToTarget
	ret

.two
	call DeinitBattleAnimation
	ret

.three
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_0F
	call ReinitBattleAnimFrameset
.four
	ret

BattleAnimFunction_DropObject:
; Drops obj. The Obj Param dictates how fast it is (lower value is faster) and how long it stays bouncing (lower value is longer). Example: Rock Slide
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $30
	inc hl
	ld [hl], $48
.one
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $20
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	sub [hl]
	jr z, .done
	jr c, .done
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], a
	ret

.done
	call DeinitBattleAnimation
	ret

BattleAnimFunction_MoveFromUserToTargetSpinAround:
; Object moves from user to target target and spins around it once. Example: Fire Spin, Swift
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
.zero
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .next
	call .SetCoords
	ret

.next
	call BattleAnim_IncAnonJumptableIndex
.one
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $0
.two
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $40
	jr nc, .loop_back
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld d, $18
	call BattleAnim_Cosine
	sub $18
	sra a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld d, $18
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	add [hl]
	ld [hl], a
	ret

.loop_back
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f0
	jr z, .finish
	sub $10
	ld d, a
	ld a, [hl]
	and $f
	or d
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	dec [hl]
	ret

.finish
	call BattleAnim_IncAnonJumptableIndex
.three
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $b0
	jr c, .retain
	call DeinitBattleAnimation
	ret

.retain
	call .SetCoords
	ret

.SetCoords:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	ld e, a
	srl e
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
.loop
	dec [hl]
	dec e
	jr nz, .loop
	ret

BattleAnimFunction_Shake:
; Object switches position side to side. Obj Param defines how far to move it. Example: Dynamic Punch
; Some objects use this function with a Param of 0
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $0
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
.one
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .done_one
	dec [hl]
	ret

.done_one
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	swap a
	and $f
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	ret

.two
	call DeinitBattleAnimation
	ret

BattleAnimFunction_FireBlast:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
	dw .five
	dw .six
	dw .seven
	dw .eight
	dw .nine
.zero
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], a
	cp $7
	jr z, .seven
	ld a, BATTLEANIMFRAMESET_11
	call ReinitBattleAnimFrameset
	ret

.seven
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	jr nc, .set_up_eight
	add $2
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

.set_up_eight
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_10
	call ReinitBattleAnimFrameset
.eight
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld d, $10
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	ret

.nine
	call DeinitBattleAnimation
	ret

.one 
	; Flame that moves upward
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	dec [hl]
	ret

.four
	; Flame that moves down and left
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	inc [hl]
.two
	; Flame that moves left
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	dec [hl]
	ret

.five
	; Flame that moves down and right
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	inc [hl]
.three
	; Flame that moves right
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	inc [hl]
.six
	ret

BattleAnimFunction_RazorLeaf:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
	dw .five
	dw .six
	dw .seven
	dw .eight
.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $40
.one
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $30
	jr nc, .sine_cosine
	call BattleAnim_IncAnonJumptableIndex
	xor a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hli], a
	ld [hl], a
	ld a, BATTLEANIMFRAMESET_17
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	bit 6, [hl]
	ret z
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], $5
	ret

.sine_cosine
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $3f
	ld d, a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	call Functioncd557
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], e
	ret

.two
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $20
	jr nz, .sine_cosine_2
	call DeinitBattleAnimation
	ret

.sine_cosine_2
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld d, $10
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	bit 6, [hl]
	jr nz, .decrease
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	jr .finish

.decrease
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	dec [hl]
.finish
	ld de, $80
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], e
	ret

.three
	ld a, BATTLEANIMFRAMESET_16
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_OAMFLAGS
	add hl, bc
	res 5, [hl]
.four
.five
.six
.seven
	call BattleAnim_IncAnonJumptableIndex
	ret

.eight
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $c0
	ret nc
	ld a, $8
	call BattleAnim_StepToTarget
	ret

Functioncd557:
; Affects sine movement based on bit 7 of Obj Param
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	bit 7, a
	jr nz, .negative
	cp $20
	jr nc, .plus_256
	cp $18
	jr nc, .plus_384
	ld de, $200
	ret

.plus_384
	ld de, $180
	ret

.plus_256
	ld de, $100
	ret

.negative
	and $3f
	cp $20
	jr nc, .minus_256
	cp $18
	jr nc, .minus_384
	ld de, -$200
	ret

.minus_384
	ld de, -$180
	ret

.minus_256
	ld de, -$100
	ret

BattleAnimFunction_RockSmash:
; Object moves at an arc
; Obj Param: Bit 7 makes arc flip horizontally
;            Bit 6 defines offset from base frameset FRAMESET_19
;            Rest defines arc radius
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
.zero
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $40
	rlca
	rlca
	add BATTLEANIMFRAMESET_19
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $40
.one
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $30
	jr nc, .sine_cosine
	call DeinitBattleAnimation
	ret

.sine_cosine
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $3f
	ld d, a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	call Functioncd557
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], e
	ret

BattleAnimFunction_Bubble:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $c
.one
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next
	dec [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	call BattleAnim_StepToTarget
	ret

.next
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $0
	ld a, BATTLEANIMFRAMESET_22
	call ReinitBattleAnimFrameset
.two
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $98
	jr nc, .okay
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld h, [hl]
	ld l, a
	ld de, $60
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
.okay
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $20
	ret c
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f0
	ld e, a
	ld d, $ff
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret

BattleAnimFunction_Surf:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
.zero
	call BattleAnim_IncAnonJumptableIndex
	ld a, LOW(rSCY)
	ldh [hLCDCPointer], a
	ld a, $58
	ldh [hLYOverrideStart], a
	ld a, $5e
	ldh [hLYOverrideEnd], a
	ret

.one
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld e, [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp e
	jr nc, .asm_cd69b
	call BattleAnim_IncAnonJumptableIndex
	xor a
	ldh [hLYOverrideStart], a
	ret

.asm_cd69b
	dec a
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld d, $10
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	add [hl]
	sub $10
	ret c
	ldh [hLYOverrideStart], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	inc a
	and $7
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	inc [hl]
.two
	ret

.three
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $70
	jr c, asm_cd6da
	xor a
	ldh [hLCDCPointer], a
	ldh [hLYOverrideStart], a
	ldh [hLYOverrideEnd], a
.four
	call DeinitBattleAnimation
	ret

asm_cd6da:
	inc a
	inc a
	ld [hl], a
	sub $10
	ret c
	ldh [hLYOverrideStart], a
	ret

BattleAnimFunction_Sing:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd6ea
	dw Functioncd6f7

Functioncd6ea:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, BATTLEANIMFRAMESET_24
	add [hl] ; BATTLEANIMFRAMESET_25 BATTLEANIMFRAMESET_26
	call ReinitBattleAnimFrameset

Functioncd6f7:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $b8
	jr c, .asm_cd704
	call DeinitBattleAnimation
	ret

.asm_cd704
	ld a, $2
	call BattleAnim_StepToTarget
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld d, $8
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_WaterGun:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd725
	dw Functioncd728
	dw Functioncd763
	dw Functioncd776

Functioncd725:
	call BattleAnim_IncAnonJumptableIndex
Functioncd728:
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .run_down
	ld a, $2
	call BattleAnim_StepToTarget
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld d, $8
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.run_down
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_28
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $0
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], $30
	ld hl, BATTLEANIMSTRUCT_OAMFLAGS
	add hl, bc
	ld a, [hl]
	and $1
	ld [hl], a
Functioncd763:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $18
	jr nc, .splash
	inc [hl]
	ret

.splash
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_29
	call ReinitBattleAnimFrameset
Functioncd776:
	ret

BattleAnimFunction_Powder:
; Obj moves down and disappears at x coord $38
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $38
	jr c, .move
	call DeinitBattleAnimation
	ret

.move
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld l, [hl]
	ld h, a
	ld de, $80
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	; Shakes object back and forth 16 pixels
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	xor $10
	ld [hl], a
	ret

BattleAnimFunction_Recover:
; Obj moves in an ever shrinking circle. Obj Param defines initial position in the circle
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd7ab
	dw Functioncd7d2

Functioncd7ab:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f0
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	sla a
	sla a
	sla a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld [hl], $1
Functioncd7d2:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_cd7de
	call DeinitBattleAnimation
	ret

.asm_cd7de
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld d, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	xor $1
	ld [hl], a
	ret z
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	dec [hl]
	ret

BattleAnimFunction_ThunderWave:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd81f
	dw Functioncd817
	dw Functioncd81f
	dw Functioncd820

Functioncd817:
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_35
	call ReinitBattleAnimFrameset
Functioncd81f:
	ret

Functioncd820:
	call DeinitBattleAnimation
	ret

BattleAnimFunction_Clamp:
; Claps two objects together, twice. Also used by Encore
; Second object's frameset and position relative to first are both defined via this function
; Obj Param: Distance from center (masked with $7F). Bit 7 flips object horizontally by switching to a different frameset
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd835
	dw Functioncd860
	dw Functioncd88f
	dw Functioncd88f
	dw Functioncd88f
	dw Functioncd88f
	dw Functioncd893

Functioncd835:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	bit 7, [hl]
	jr nz, .encore
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $10
	jr .clamp

.encore
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $30
.clamp
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a
Functioncd860:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	bit 7, a
	jr nz, .load_no_inc
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	inc a ; BATTLEANIMFRAMESET_3B (Clamp Flipped)
	      ; BATTLEANIMFRAMESET_A1 (Hands Flipped)
	jr .reinit

.load_no_inc
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl] ; BATTLEANIMFRAMESET_3A (Clamp)
	           ; BATTLEANIMFRAMESET_A0 (Hands)
.reinit
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $1f
	ret nz
Functioncd88f:
	call BattleAnim_IncAnonJumptableIndex
	ret

Functioncd893:
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], $1
	ret

BattleAnimFunction_Bite:
; Claps two objects together (vertically), twice
; Second object's frameset and position relative to first are both defined via this function
; Obj Param: Distance from center (masked with $7F). Bit 7 flips object vertically by switching to a different frameset
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd8ab
	dw Functioncd8cc
	dw Functioncd8f5
	dw Functioncd8f5
	dw Functioncd8f5
	dw Functioncd8f5
	dw Functioncd8f9

Functioncd8ab:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	bit 7, [hl]
	jr nz, .asm_cd8be
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $10
	jr .asm_cd8c4

.asm_cd8be
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $30
.asm_cd8c4
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a

Functioncd8cc:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	bit 7, a
	jr nz, .asm_cd8e6
	ld a, BATTLEANIMFRAMESET_3D
	jr .asm_cd8e8

.asm_cd8e6
	ld a, BATTLEANIMFRAMESET_3C
.asm_cd8e8
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	inc [hl]
	ld a, [hl]
	and $1f
	ret nz

Functioncd8f5:
	call BattleAnim_IncAnonJumptableIndex
	ret

Functioncd8f9:
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], $1
	ret

BattleAnimFunction_SolarBeam:
; Solar Beam charge up animation
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd907
	dw Functioncd913

Functioncd907:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $28
	inc hl
	ld [hl], $0
Functioncd913:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld d, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cd950
	ld d, a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld e, [hl]
	ld hl, -$80
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], d
	ret

.asm_cd950
	call DeinitBattleAnimation
	ret

BattleAnimFunction_Gust:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .one
	dw .three

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld [hl], $0
.one
	call .GustWobble
	ret

.two
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	jr c, .move
	call BattleAnim_IncAnonJumptableIndex
	ret

.three
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $b8
	jr c, .move
	call DeinitBattleAnimation
	ret

.move
	call .GustWobble
	; Move horizontally every frame
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	inc [hl]
	ld a, [hl]
	; Move in the vertically every other frame
	and $1
	ret nz
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

.GustWobble:
	; Circular movement where width is retrieved from a list, and height is 1/16 of that
	call .GetGustRadius
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	sub $8
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cd9d7
	cp $c2
	jr c, .asm_cd9e2
.asm_cd9d7
	dec a
	ld [hl], a
	and $7
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	inc [hl]
	ret

.asm_cd9e2
	xor a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hli], a
	ld [hl], a
	ret

.GetGustRadius:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .GustOffsets
	add hl, de
	ld d, [hl]
	ret

.GustOffsets:
	db 8, 6, 5, 4, 5, 6, 8, 12, 16

BattleAnimFunction_Absorb:
; Moves object from target to user and disappears when reaches x coord $30. Example: Absorb, Mega Drain, Leech Seed status
; Obj Param: Speed in the X axis
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $30
	jr nc, .asm_cda17
	call DeinitBattleAnimation
	ret

.asm_cda17
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	ld e, a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	sub e
	ld [hl], a
	srl e
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
.asm_cda2c
	inc [hl]
	dec e
	jr nz, .asm_cda2c
	ret

BattleAnimFunction_Wrap:
; Plays out object Frameset. Use anim_incobj to move to next frameset
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncda4c
	dw Functioncda3a
	dw Functioncda4c

Functioncda3a:
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, [hl]
	inc a ; BATTLEANIMFRAMESET_53
	      ; BATTLEANIMFRAMESET_55
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1 ; Unused?
	add hl, bc
	ld [hl], $8
Functioncda4c:
	ret

BattleAnimFunction_LeechSeed:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
.zero:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], $40
	ret

.one:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, .sprout
	call BattleAnim_StepThrownToTarget
	ret

.sprout
	ld [hl], $40
	ld a, BATTLEANIMFRAMESET_57
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ret

.two:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .flutter
	dec [hl]
	ret

.flutter
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_58
	call ReinitBattleAnimFrameset
.three:
	ret

BattleAnim_StepThrownToTarget:
; Inches object towards the opponent's side in a parabola arc defined by the lower and upper nybble of Obj Param
	dec [hl]
	ld d, $20
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YFIX
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld e, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld h, [hl]
	ld a, h
	and $f
	swap a
	ld l, a
	ld a, h
	and $f0
	swap a
	ld h, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	and $1
	ret nz
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

BattleAnimFunction_Spikes:
; Object is thrown at target. After $20 frames it stops and waits another $20 frames then disappear
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdadf
	dw Functioncdae9
	dw Functioncdaf9

Functioncdadf:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], $40
	ret

Functioncdae9:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, .wait
	call BattleAnim_StepThrownToTarget
	ret

.wait
	call BattleAnim_IncAnonJumptableIndex
Functioncdaf9:
	ret

BattleAnimFunction_RazorWind:
	call BattleAnimFunction_MoveInCircle
	; Causes object to skip ahead the circular motion every frame
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	add $f
	ld [hl], a
	ret

BattleAnimFunction_Kick:
; Uses anim_setobj for different kick types
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdb13
	dw Functioncdb14
	dw Functioncdb28 ; 2 (Jump Kick, Hi Jump Kick)
	dw Functioncdb50 ; 3 (Rolling Kick)
	dw Functioncdb65

Functioncdb13:
	ret

Functioncdb14: ; Unused?
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_cdb24
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], $0
	ret

.asm_cdb24
	add $4
	ld [hl], a
	ret

Functioncdb28:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $98
	ret nc
	inc [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_OAMFLAGS
	add hl, bc
	set 0, [hl]
	ld hl, BATTLEANIMSTRUCT_YFIX
	add hl, bc
	ld [hl], $90
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], $0
	ld hl, BATTLEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], $2
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

Functioncdb50:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $2c
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], $0
	ld hl, BATTLEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], $80
Functioncdb65:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $98
	ret nc
	inc [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $8
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_Egg:
; Used in Egg Bomb and Softboiled
; Obj Param: Defines jumptable starting index
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one ; Egg Bomb starts here
	dw .two
	dw .three
	dw .four ; ret
	dw .five 
	dw .six ; Softboiled egg 1 starts here
	dw .seven
	dw .eight
	dw .nine
	dw .four ; ret
	dw .ten ; Softboiled egg 2 starts here
	dw .eleven 
	dw .four ; ret

.zero
; Object starts here then jumps to jumptable index defined by the Obj Param
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $28
	inc hl ; BATTLEANIMSTRUCT_VAR2
	ld [hl], $10
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], a
	ret

.one
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $40
	jr nc, .egg_bomb_arc
	inc [hl]
.egg_bomb_arc
	call .EggVerticalWaveMotion
	ret

.six
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $4b
	jr nc, .asm_cdbcb
	inc [hl]
.asm_cdbcb
	call .EggVerticalWaveMotion
	ret

.two
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	jr nc, .egg_bomb_done
	and $f
	jr nz, .egg_bomb_step
	; wait in place (jumps to .three)
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], $10
	call BattleAnim_IncAnonJumptableIndex
	ret

.egg_bomb_done
	call BattleAnim_IncAnonJumptableIndex
	inc [hl]
	ret

.three ; wait
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .done_waiting
	dec [hl]
	ret

.done_waiting
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	dec [hl]
.egg_bomb_step
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld e, [hl]
	ld hl, -$80
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], e
	ret

.five
	call DeinitBattleAnimation
	ret

.seven
	ld a, BATTLEANIMFRAMESET_4E ; Egg wobbling
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ret

.eight
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $2
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.nine
	ld a, BATTLEANIMFRAMESET_50 ; Cracked egg bottom
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $4
	call BattleAnim_IncAnonJumptableIndex
	ret

.ten
	ld a, BATTLEANIMFRAMESET_4F ; Cracked egg top
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $40
	ret

.eleven
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld d, $20
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_cdc71
	dec [hl]
	ret

.asm_cdc71
	call BattleAnim_IncAnonJumptableIndex
.four
	ret

.EggVerticalWaveMotion:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hli]
	ld d, [hl] ; BATTLEANIMSTRUCT_VAR2
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f ; cp 64
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $20
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	sub $8
	ld [hl], a
	ret nz
	xor a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hli], a
	ld [hl], a
	call BattleAnim_IncAnonJumptableIndex
	ret

BattleAnimFunction_MoveUp:
; Moves object up for 41 frames
; Obj Param: Movement speed
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cdcb6
	cp $d8
	jr nc, .asm_cdcb6
	call DeinitBattleAnimation
	ret

.asm_cdcb6
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	sub d
	ld [hl], a
	ret

BattleAnimFunction_Sound:
; Moves object back and forth in one of three angles using a sine behavior and disappear after 8 frames. Used in Growl, Snore and Kinesis
; Obj Param: Used to define object angle. How much to increase from base frameset, which is hardcoded as BATTLEANIMFRAMESET_59
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdcca
	dw Functioncdced

Functioncdcca:
	ldh a, [hBattleTurn]
	and a
	jr z, .got_turn
	; enemy
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	xor $ff
	add $3
	ld [hl], a
.got_turn
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $8 ; duration
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, BATTLEANIMFRAMESET_59
	add [hl] ; BATTLEANIMFRAMESET_5A BATTLEANIMFRAMESET_5B
	call ReinitBattleAnimFrameset
	ret

Functioncdced:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .done_anim
	dec [hl]
	call Functioncdcfe
	ret

.done_anim
	call DeinitBattleAnimation
	ret

Functioncdcfe:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $10
	call BattleAnim_Sine
	ld d, a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	jr z, .negative
	dec a
	ret z
	; Obj Param 2
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	ret

.negative
	; Obj Param 0
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, d
	xor $ff
	inc a
	ld [hl], a
	ret

BattleAnimFunction_ConfuseRay:
; Creates the Confuse Ray object and moves it across the screen until x coord $80
; Moves horizontally every frame and vertically every 3 frames
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdd31
	dw Functioncdd4f

Functioncdd31:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $3f
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $80
	rlca
	ld [hl], a
	add BATTLEANIMFRAMESET_5D ; BATTLEANIMFRAMESET_5E
	call ReinitBattleAnimFrameset
	ret

Functioncdd4f:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	swap a
	ld d, a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	inc [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $80
	ret nc
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	and $3
	jr nz, .skip_vertical_movement
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
.skip_vertical_movement
	and $1
	ret nz
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_Dizzy:
; Moves object in a circle where the height is 1/4 the width, with the next frameset from base whether moving left or right. Also used for Nightmare
; Obj Param: Defines starting position in the circle (masked with $80). Bit 7 flips it at the start
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdd97
	dw Functioncddbc

Functioncdd97:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $80
	rlca
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	add [hl] ; BATTLEANIMFRAMESET_61 BATTLEANIMFRAMESET_62
	         ; BATTLEANIMFRAMESET_9C BATTLEANIMFRAMESET_9D
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a
Functioncddbc:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $10
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	and $3f
	jr z, .not_flipped
	and $1f
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc a ; BATTLEANIMFRAMESET_62
	      ; BATTLEANIMFRAMESET_9D
	jr .got_frameset

.not_flipped
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl] ; BATTLEANIMFRAMESET_61
	           ; BATTLEANIMFRAMESET_9C
.got_frameset
	call ReinitBattleAnimFrameset
	ret

BattleAnimFunction_Amnesia:
; Creates 3 objects based on Obj Param
; Obj Param: How much to increase from base frameset, which is hardcoded as BATTLEANIMFRAMESET_63
; anim_incobj is used to DeInit object (used by Present)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncde02
	dw Functioncde20
	dw Functioncde21

Functioncde02:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	add BATTLEANIMFRAMESET_63 ; BATTLEANIMFRAMESET_64 BATTLEANIMFRAMESET_65
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, AmnesiaOffsets
	add hl, de
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
Functioncde20:
	ret

Functioncde21:
	; anim_incobj forces obj to deinit
	call DeinitBattleAnimation
	ret

AmnesiaOffsets: ; Hardcoded Y Offsets for each Obj Param
	db $ec, $f8, $00

BattleAnimFunction_Sleep:
; Object moves horizontally in a sine wave, while also moving up. Also used by Charm and the Nightmare status
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $4
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld e, [hl]
	lb hl, -1, $a0
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], e
	ret

BattleAnimFunction_Dig:
; Object moves up then down with a wave motion, while also moving away from the user 1 pixel per frame
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec [hl]
	dec [hl]
	ld d, $10
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_String:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncde72
	dw Functioncde88

Functioncde72:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .not_param_zero
	; Obj Param 0 flips when used by enemy
	ld hl, BATTLEANIMSTRUCT_OAMFLAGS
	add hl, bc
	set OAM_Y_FLIP, [hl]
.not_param_zero
	add BATTLEANIMFRAMESET_6A ; BATTLEANIMFRAMESET_6B BATTLEANIMFRAMESET_6C
	call ReinitBattleAnimFrameset
Functioncde88:
	ret

BattleAnimFunction_Paralyzed:
; Also used by Disable
; Obj Param: When bit 7 is set, frameset is replaced with flipped version. This bit is discarded and object then moves back and forth between position in lower nybble and upper nybble of Param every other frame
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncde90
	dw Functioncdebf

Functioncde90:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $0
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld e, [hl]
	ld a, e
	and $70
	swap a
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, e
	and $80
	jr nz, .right
	ld a, e
	and $f
	ld [hl], a
	ret

.right
	ld a, e
	and $f
	xor $ff
	inc a
	ld [hl], a
	ld a, BATTLEANIMFRAMESET_6E
	call ReinitBattleAnimFrameset
	ret

Functioncdebf:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .var1_is_zero
	dec [hl]
	ret

.var1_is_zero
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	ret

BattleAnimFunction_SpiralDescent:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $7
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	cp $28
	jr nc, .delete
	inc [hl]
	ret

.delete
	call DeinitBattleAnimation
	ret

BattleAnimFunction_PetalDance:
; Object moves downwards in a spiral around the user. Object disappears at y coord $28
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	cp $28
	jr nc, .end
	inc [hl]
	ret

.end
	call DeinitBattleAnimation
	ret

BattleAnimFunction_PoisonGas:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdf60
	dw BattleAnimFunction_SpiralDescent

Functioncdf60:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	jr nc, .next
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $18
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	and $1
	ret nz
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

.next
	call BattleAnim_IncAnonJumptableIndex
	ret

BattleAnimFunction_SmokeFlameWheel:
; Object spins around target while also moving upward until it disappears at x coord $e8
; Obj Param: Defines where the object starts in the circle
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	inc [hl]
	inc [hl]
	ld a, [hl]
	and $7
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	cp $e8
	jr z, .done
	dec [hl]
	ret

.done
	call DeinitBattleAnimation
	ret

BattleAnimFunction_SacredFire:
; Moves object in a circle where the height is 1/8 the width, while also moving upward 2 pixels per frame for 24 frames after which it disappears
; Obj Param: Is used internally only
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	inc [hl]
	inc [hl]
	ld a, [hl]
	and $3
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .done
	dec [hl]
	dec [hl]
	ret

.done
	call DeinitBattleAnimation
	ret

BattleAnimFunction_PresentSmokescreen:
; Object bounces from user to target and stops at x coord $6c. Uses anim_incobj to clear object
; Obj Param: Defined but not used
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce014
	dw Functionce023
	dw Functionce05f

Functionce014:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $34
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], $10
Functionce023:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $6c
	jr c, .do_move
	ret

.do_move
	ld a, $2
	call BattleAnim_StepToTarget
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld d, [hl]
	call BattleAnim_Sine
	bit 7, a
	jr nz, .negative
	xor $ff
	inc a
.negative
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	sub $4
	ld [hl], a
	and $1f
	cp $20
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	srl [hl]
	ret

Functionce05f:
	call DeinitBattleAnimation
	ret

BattleAnimFunction_Horn:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw Functionce09e
.zero:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a
	ret

.one:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $58
	ret nc
	ld a, $2
	call BattleAnim_StepToTarget
	ret

.two:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, Functionce09e
	call DeinitBattleAnimation
	ret

Functionce09e:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	ld d, $8
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	sra a
	xor $ff
	inc a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	add $8
	ld [hl], a
	ret

BattleAnimFunction_Needle:
; Moves object towards target, either in a straight line or arc. Stops at x coord $84
; Obj Param: Upper nybble defines the index of the jumptable. Lower nybble defines the speed.
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce0ce
	dw Functionce0f8
	dw Functionce0dd

Functionce0ce:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f0
	swap a
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], a
	ret

Functionce0dd:
	; Pin Missile needle (arc)
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld d, $10
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	bit 7, a
	jr z, .asm_ce0f0
	ld [hl], a
.asm_ce0f0
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	sub $4
	ld [hl], a
Functionce0f8:
	; Normal needle (line)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	jr c, .move_to_target
	call DeinitBattleAnimation
	ret

.move_to_target
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	call BattleAnim_StepToTarget
	ret

BattleAnimFunction_ThiefPayday:
; Object drops off target and bounces once on the floor
; Obj Param: Defines every how many frames the object moves horizontally
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce115
	dw Functionce12a

Functionce115:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $28
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	sub $28
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], a
Functionce12a:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	and [hl]
	jr nz, .var_doesnt_equal_param
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
.var_doesnt_equal_param
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $20
	inc hl
	srl [hl]
	ret

BattleAnimFunction_AbsorbCircle:
; A circle of objects that starts at the target and moves to the user. It expands until x coord $5a and then shrinks. Once radius reaches 0, the object disappears. Also used by Mimic and Conversion2
; Obj Param: Defines the position in the circle the object starts at
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld d, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $1
	jr nz, .dont_move_x
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
.dont_move_x
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $3
	jr nz, .dont_move_y
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]
.dont_move_y
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	cp $5a
	jr nc, .increase_radius
	ld a, [hl]
	and a
	jr z, .end
	dec [hl] ; decreases radius
	ret

.increase_radius
	inc [hl]
	ret

.end
	call DeinitBattleAnimation
	ret

BattleAnimFunction_Conversion:
; A rotating circle of objects centered at a position. It expands for $40 frames and then shrinks. Once radius reaches 0, the object disappears.
; Obj Param: Defines starting point in the circle
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld d, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	cp $40
	jr nc, .shrink
	inc [hl]
	ret

.shrink
	ld a, [hl]
	dec [hl]
	and a
	ret nz
	call DeinitBattleAnimation
	ret

BattleAnimFunction_Bonemerang:
; Boomerang-like movement from user to target
; Obj Param: Defines position to start at in the circle
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce1ee
	dw Functionce1fb

Functionce1ee:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], a
Functionce1fb:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $30
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	add $8
	ld d, $30
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_Shiny:
; Puts object in a circle formation of radius $10. Also used by Flash and Light Screen
; Obj Param: Defines where the object starts in the circle
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce22d
	dw Functionce254

Functionce22d:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $10
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $10
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR2 ; unused?
	add hl, bc
	ld [hl], $f
Functionce254:
	ret

BattleAnimFunction_SkyAttack:
; Uses anim_incobj to move to next step
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce260
	dw Functionce274
	dw Functionce278
	dw Functionce289

Functionce260:
	call BattleAnim_IncAnonJumptableIndex
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy_turn
	ld a, $f0
	jr .got_var1

.enemy_turn
	ld a, $cc
.got_var1
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a
	ret

Functionce274:
	call SkyAttack_CyclePalette
	ret

Functionce278:
; Moves towards target and stops at x coord $84
	call SkyAttack_CyclePalette
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	ret nc
	ld a, $4
	call BattleAnim_StepToTarget
	ret

Functionce289:
; Moves towards target and disappears at x coord $d0
	call SkyAttack_CyclePalette
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $d0
	jr nc, .done
	ld a, $4
	call BattleAnim_StepToTarget
	ret

.done
	call DeinitBattleAnimation
	ret

SkyAttack_CyclePalette: 
; Cycles wOBP0 pallete
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	and $7
	inc [hl]
	srl a
	ld e, a
	ld d, $0
	ldh a, [hSGB]
	and a
	jr nz, .sgb
	ld hl, GBCPals
	jr .got_pals

.sgb
	ld hl, SGBPals
.got_pals
	add hl, de
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	and [hl]
	ld [wOBP0], a
	ret

GBCPals:
	db $ff, $aa, $55, $aa
SGBPals:
	db $ff, $ff, $00, $00

BattleAnimFunction_GrowthSwordsDance:
; Moves object in a circle where the height is 1/8 the width, while also moving upward 2 pixels per frame
; Obj Param: Defines where the object starts in the circle
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $18
	call BattleAnim_Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $18
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	dec [hl]
	dec [hl]
	ret

BattleAnimFunction_StrengthSeismicToss:
; Moves object up for $e0 frames, then shakes it vertically and throws it at the target. Uses anim_incobj to move to final phase
; Obj Param: Defined but not used
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce306
	dw Functionce330
	dw Functionce34c

Functionce306:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $e0
	jr nz, .done
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $2
	ret

.done
	ld d, a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld e, [hl]
	ld hl, -$80
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], e
	ret

Functionce330:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .switch_position
	dec [hl]
	ret

.switch_position
	ld [hl], $4
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	add [hl]
	ld [hl], a
	ret

Functionce34c:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	jr nc, .done
	ld a, $4
	call BattleAnim_StepToTarget
	ret

.done
	call DeinitBattleAnimation
	ret

BattleAnimFunction_SpeedLine:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce366
	dw Functionce375

Functionce366:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $7f
	add BATTLEANIMFRAMESET_81 ; BATTLEANIMFRAMESET_82 BATTLEANIMFRAMESET_83
	call ReinitBattleAnimFrameset
Functionce375:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	bit 7, [hl]
	jr nz, .asm_ce383
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	inc [hl]
	ret

.asm_ce383
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	dec [hl]
	ret

BattleAnimFunction_Sludge:
; Object moves upward for $c frames and switches to FRAMESET_20
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce392
	dw Functionce39c
	dw Functionce3ae

Functionce392:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $c
	ret

Functionce39c:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ret

.done
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_20
	call ReinitBattleAnimFrameset
Functionce3ae:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	dec [hl]
	ret

BattleAnimFunction_MetronomeHand:
; Fast circular motion with an x radius of $8 and y radius of $2
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	push af
	ld d, $2
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop af
	ld d, $8
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_MetronomeSparkleSketch:
; Sideways wave motion while also moving downward until it disappears at y coord $20
; Obj Param: Is used internally only
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, .do_move
	call DeinitBattleAnimation
	ret

.do_move
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $8
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	and $7
	ret nz
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_Agility:
; Object moves sideways at a speed determined by Obj Param. Can use anim_incobj to make it disappear
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce406
	dw Functionce412

Functionce406:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	ld [hl], a
	ret

Functionce412:
	call DeinitBattleAnimation
	ret

BattleAnimFunction_SafeguardProtect:
; Moves object in a circle where the width is 1/2 the height
; Obj Param: Defines starting point in circle
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	sra a
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	ret

BattleAnimFunction_LockOnMindReader:
; Moves objects towards a center position
; Obj Param: Used to define object angle from 0 to 3. Lower nybble defines how much to increase from base frameset while upper nybble defines angle of movement. The object moves for $28 frames, then waits for $10 frames and disappears
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce443
	dw Functionce465
	dw Functionce490

Functionce443:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $28
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	add [hl] ; BATTLEANIMFRAMESET_8F BATTLEANIMFRAMESET_90 BATTLEANIMFRAMESET_91
	         ; BATTLEANIMFRAMESET_93 BATTLEANIMFRAMESET_94 BATTLEANIMFRAMESET_95
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f0
	or $8
	ld [hl], a
Functionce465:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	add $8
	ld d, a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.done
	ld [hl], $10
	call BattleAnim_IncAnonJumptableIndex
Functionce490:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec [hl]
	and a
	ret nz
	call DeinitBattleAnimation
	ret

BattleAnimFunction_HealBellNotes:
; Object moves horizontally in a sine wave, while also moving left every other frame and downwards for $38 frames after which it disappears
; Obj Param: Defines a frameset offset from FRAMESET_24
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce4a3
	dw Functionce4b0

Functionce4a3:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, BATTLEANIMFRAMESET_24
	add [hl] ; BATTLEANIMFRAMESET_25 BATTLEANIMFRAMESET_26
	call ReinitBattleAnimFrameset
Functionce4b0:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $38
	jr nc, .done
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $18
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	and $1
	ret nz
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
	ret

.done
	call DeinitBattleAnimation
	ret

BattleAnimFunction_BatonPass:
; Object falls vertially and bounces on the ground
; Obj Param: Defines speed and duration
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	ret z
	ld d, a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	call BattleAnim_Sine
	bit 7, a
	jr nz, .negative
	xor $ff
	inc a
.negative
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and $1f
	ret nz
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	srl [hl]
	ret

BattleAnimFunction_EncoreBellyDrum:
; Object moves at an arc for 8 frames and disappears
; Obj Param: Defines startging position in the arc
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $10
	jr nc, .done
	inc [hl]
	inc [hl]
	ld d, a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.done
	call DeinitBattleAnimation
	ret

BattleAnimFunction_SwaggerMorningSun:
; Moves object at an angle
; Obj Param: Lower 6 bits define angle of movement and upper 2 bits define speed
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld e, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld d, [hl]
	ld a, e
	and $c0
	rlca
	rlca
	add [hl]
	ld [hl], a
	ld a, e
	and $3f
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_HiddenPower:
; Moves object in a ring around position. Uses anim_incobj to move to second phase,  where it expands the radius 8 pixels at a time for 13 frames and then disappears
; Obj Param: Defines starting position in circle
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce564
	dw Functionce56e
	dw Functionce577

Functionce564:
	ld d, $18
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	jr step_circle

Functionce56e:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $18
Functionce577:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .done
	ld d, a
	add $8
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	jr step_circle

.done
	call DeinitBattleAnimation
	ret

step_circle:
	call BattleAnim_StepCircle
	ret

BattleAnimFunction_Curse:
; Object moves down and to the left 2 pixels at a time until it reaches x coord $30 and disappears. Can also use anim_incobj to make it disappear
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce5b3
	dw Functionce59a

Functionce59a:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .done
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
	dec [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]
	inc [hl]
	ret

.done
	call DeinitBattleAnimation
Functionce5b3:
	ret

BattleAnimFunction_PerishSong:
; Moves object in a large circle with a x radius of $50 and a y radius 1/4 or that, while also moving downwards
; Obj Param: Defines starting position in the circle
	ld d, $50
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	add [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_RapidSpin:
; Object moves upwards 4 pixels per frame until it disappears at y coord $d0
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .done
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret

.done
	call DeinitBattleAnimation
	ret

BattleAnimFunction_Pursuit:
; Working but unused animation
; Object moves either down or up 4 pixels per frame, depending on Obj Param. Object disappears after 23 frames when going down, or at y coord $d8 when going up
; Obj Param: 0 moves downwards, 1 moves upwards
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce5f9
	dw Functionce60a
	dw Functionce622
	dw Functionce618

Functionce5f9:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	jr nz, move_up
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $ec
Functionce60a:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $4
	jr z, Functionce618
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ret

Functionce618:
	call DeinitBattleAnimation
	ret

move_up:
	call BattleAnim_IncAnonJumptableIndex
	call BattleAnim_IncAnonJumptableIndex
Functionce622:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $d8
	ret z
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret

BattleAnimFunction_RainSandstorm:
; Object moves down 4 pixels at a time and right a variable distance
; Obj Param: Defines variation in the movement
;            $0: 2 pixels horizontal movement
;            $1: 8 pixels horizontal movement
;            $2: 4 pixels horizontal movement
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce63a
	dw Functionce648
	dw Functionce65c
	dw Functionce672

Functionce63a:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], a
	call BattleAnim_IncAnonJumptableIndex
	ret

Functionce648: ; Obj Param 0
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	add $4
	cp $70
	jr c, .dont_reset_y_offset
	xor a
.dont_reset_y_offset
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	inc [hl]
	inc [hl]
	ret

Functionce65c: ; Obj Param 1
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	add $4
	cp $70
	jr c, .dont_reset_y_offset
	xor a
.dont_reset_y_offset
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	add $8
	ld [hl], a
	ret

Functionce672: ; Obj Param 2
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	add $4
	cp $70
	jr c, .dont_reset_y_offset
	xor a
.dont_reset_y_offset
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	add $4
	ld [hl], a
	ret

BattleAnimFunction_Unused1:
; Used by object ANIM_OBJ_B0, with itself is not used in any animation
; Obj Param: Lower nybble is added to VAR1 while upper nybble is added to XCOORD
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld e, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld l, a
	and $f0
	ld h, a
	swap a
	or h
	ld h, a
	ld a, l
	and $f
	swap a
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], e
	ret

BattleAnimFunction_PsychUp:
; Object moves in a circle
; Obj Param: Defines starting position in the circle
	ld d, $18
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	call BattleAnim_StepCircle
	ret

BattleAnimFunction_Cotton:
; Object moves in a circle slowly
; Obj Param: Defines starting position in the circle
	ld d, $18
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	inc [hl]
	srl a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	add [hl]
	call BattleAnim_StepCircle
	ret

BattleAnimFunction_AncientPower:
; Object moves up and down in an arc for $20 frames and then disappear
; Obj Param: Defines range of arc motion
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $20
	jr nc, .done
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld d, [hl]
	call BattleAnim_Sine
	xor $ff
	inc a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.done
	call DeinitBattleAnimation
	ret

BattleAnim_StepCircle:
; Inches object in a circular movement where its height is 1/4 the width
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnim_StepToTarget:
; Inches object towards the opponent's side, moving half as much in the Y axis as it did in the X axis. Uses lower nybble of A
	and $f
	ld e, a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	ld [hl], a
	srl e
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
.loop
	dec [hl]
	dec e
	jr nz, .loop
	ret

BattleAnim_AnonJumptable:
	pop de
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

BattleAnim_IncAnonJumptableIndex:
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ret

BattleAnim_Cosine:
; a = d * cos(a * pi/32)
	add %010000 ; cos(x) = sin(x + pi/2)
	; fallthrough
BattleAnim_Sine:
; a = d * sin(a * pi/32)
	calc_sine_wave BattleAnimSineWave

BattleAnim_Sine_e:
	ld a, e
	call BattleAnim_Sine
	ld e, a
	ret

BattleAnim_Cosine_e:
	ld a, e
	call BattleAnim_Cosine
	ld e, a
	ret

BattleAnim_AbsSinePrecise:
	ld a, e
	call BattleAnim_Sine
	ld e, l
	ld d, h
	ret

BattleAnim_AbsCosinePrecise:
	ld a, e
	call BattleAnim_Cosine
	ld e, l
	ld d, h
	ret

BattleAnimSineWave:
	sine_table 32


BattleAnimFunction_26b:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec [hl]
	dec [hl]
	ld d, $10
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
	ret
	
BattleAnimFunction_33b:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $18
	call BattleAnim_Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	sub [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld d, $18
	ld a, [hl]
	inc [hl]
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	dec [hl]
	ret

BattleAnimFunction_36b: ; rock_blast / rockblast
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce34c2

Functionce34c2:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	jr nc, .asm_ce35b
	ld a, $16 ; was 4
	call BattleAnim_StepToTarget
	ret

.asm_ce35b
	call DeinitBattleAnimation
	ret