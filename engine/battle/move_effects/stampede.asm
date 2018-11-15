BattleCommand_Stampede:
; stampede
; Get the opponent's species
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr nz, .go
	ld a, [wEnemyMonSpecies]
.go
; Get the pointer for the enemy's Pokémon's base Attack	
	ld hl, BaseData + BASE_ATK
	ld bc, BASE_DATA_SIZE
	call AddNTimes
; Get the Pokémon's base Attack
	ld a, BANK(BaseData)
	call GetFarByte
	ld d, a
; Get the pointer for the enemy's Pokémon's base Defense
	ld bc, BASE_DEF - BASE_ATK
	add hl, bc
; Get the Pokémon's base Defense
	ld a, BANK(BaseData)
	call GetFarByte
	pop hl
	
	cp d
	ret nc ; check DEF (d) against ATK (a). If DEF is not lower (meaning the player is defensive), stop here
	
	call BattleCommand_ParalyzeTarget
	ret