GetTrainerDVs:
; Creates DVs for trainers that don't have custom ones

; add up trainer Class, ID and MonSpecies to get a DV from 0 to 25
	ld a, [wOtherTrainerClass]
	ld b, a
	ld a, [wOtherTrainerID]
	add b
	ld b, a
	ld a, [wCurPartySpecies]
	ld [wTempEnemyMonSpecies], a
	callfar GetPreEvolution
	callfar GetPreEvolution
	ld a, [wCurPartySpecies]
	add b

.mod_25
	cp 25
	jr c, .ok
	sub 25
	jr .mod_25
.ok
	inc a
 	ld b, a	; b has base DV number
	push bc
; turns our value into 0~250 range, this means a slight higher chance for males
	ld a, b
	ld c, 10
	call SimpleMultiply
	ld b, a

	ld a, [wCurPartySpecies]
	dec a
	ld hl, BaseData + BASE_GENDER
	ld bc, BASE_DATA_SIZE
	call AddNTimes
	
	ld a, BANK(BaseData)
	call GetFarByte

	cp GENDER_UNKNOWN
	jr z, .Genderless

	and a ; GENDER_F0?
	jr z, .Male

	cp GENDER_F100
	jr z, .Female

; Values below the ratio are male, and vice versa.
	cp b
	jr c, .Male

.Female
	pop bc
	ld a, b
	set 6, a ; set gender bit
	jr .end_gender

.Male
	pop bc
	ld a, b
	res 6, a ; unset gender bit
	jr .end_gender

.Genderless
	pop bc
	ld a, b
	set 7, a
	jr .end_gender
	
.end_gender
	ld b, a
	ld a, [wTempEnemyMonSpecies]
	ld [wCurPartySpecies], a
	ret

; INCLUDE "data/trainers/dvs.asm"
