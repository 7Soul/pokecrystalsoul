PrintMoveDesc:
	push hl
	ld hl, MoveDescriptions
	ld a, [wCurSpecies]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl

	ld a, [wCurSpecies]
	cp FIRE_PLAY
	jr nz, .end
	ld a, [wBattleMonType1]
	cp WATER
	jr z, .water_play
	cp FIRE
	jr z, .fire_play
	ld a, [wBattleMonType2]
	cp WATER
	jr z, .water_play
	cp FIRE
	jr z, .fire_play
	ld de, .FlyingPlayDesc
	jr .end
.water_play
	ld de, .WaterPlayDesc
	jr .end
.fire_play
	ld de, .FirePlayDesc
.end
	jp PlaceString

INCLUDE "data/moves/variable_moves_data.asm"
