CheckWarpCollision::
; Is this tile a warp?
	ld a, [wPlayerStandingTile]
	cp COLL_PIT
	jr z, .warp
	cp COLL_PIT_68
	jr z, .warp
	and $f0
	cp HI_NYBBLE_WARPS
	jr z, .warp
	and a
	ret

.warp
	scf
	ret

CheckDirectionalWarp::
; If this is a directional warp, clear carry (press the designated button to warp).
; Else, set carry (immediate warp).
	ld a, [wPlayerStandingTile]
	cp COLL_WARP_CARPET_DOWN
	jr z, .directional
	cp COLL_WARP_CARPET_LEFT
	jr z, .directional
	cp COLL_WARP_CARPET_UP
	jr z, .directional
	cp COLL_WARP_CARPET_RIGHT
	jr z, .directional
	scf
	ret

.directional
	xor a
	ret

CheckWarpFacingDown:
	ld de, 1
	ld hl, .blocks
	ld a, [wPlayerStandingTile]
	call IsInArray
	ret

.blocks
	db COLL_DOOR
	db COLL_DOOR_79
	db COLL_STAIRCASE
	db COLL_STAIRCASE_73
	db COLL_CAVE
	db COLL_CAVE_74
	db COLL_WARP_PANEL
	db COLL_DOOR_75
	db COLL_DOOR_7D
	db -1

CheckGrassCollision:: ; used for wildmon encounters
	ld a, [wPlayerStandingTile]
	ld hl, .blocks
	ld de, 1
	call IsInArray
	ret

.blocks
	db COLL_TALL_GRASS
	db COLL_LONG_GRASS
	db COLL_SHALLOW_WATER
	db COLL_WATER
	db -1

CheckCutCollision:
	ld a, c
	ld hl, .blocks
	ld de, 1
	call IsInArray
	ret

.blocks
	db COLL_CUT_TREE
	db COLL_TALL_GRASS
	db COLL_LONG_GRASS
	db -1

GetWarpSFX::
	ld a, [wPlayerStandingTile]
	ld de, SFX_ENTER_DOOR
	cp COLL_DOOR
	ret z
	ld de, SFX_WARP_TO
	cp COLL_WARP_PANEL
	ret z
	ld de, SFX_EXIT_BUILDING
	ret
	
CheckBurnCollision:
	ld a, c
	ld hl, .blocks
	ld de, 1
	call IsInArray
	ret

.blocks
	db COLL_CUT_TREE
	db -1
