prob: MACRO
prob_total = prob_total + (\1)
	dw prob_total * $ffff / 100
ENDM

OddEggProbabilities:
prob_total = 0
; Pichu
	prob 8
	prob 1
; Cleffa
	prob 16
	prob 3
; Igglybuff
	prob 16
	prob 3
; Smoochum
	prob 14
	prob 2
; Magby
	prob 10
	prob 2
; Elekid
	prob 12
	prob 2
; Tyrogue
	prob 10
	prob 1

OddEggs:

OddEgg1:
	db PICHU
	db NO_ITEM
	db TRAIT_CONTACT_PSN
	db THUNDERSHOCK, CHARM, DIZZY_PUNCH, 0
	dw 02048 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $54, $00 ; DVs
	db 30, 20, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 5 ; Atk
	bigdw 5 ; Def
	bigdw 5 ; Spd
	bigdw 5 ; SAtk
	bigdw 5 ; SDef
	db "EGG@@@@@@@@"
OddEgg1End:

	db PICHU
	db NO_ITEM
	db TRAIT_CONTACT_PSN
	db THUNDERSHOCK, CHARM, DIZZY_PUNCH, 0
	dw 00256 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $CB, $00 ; DVs
	db 30, 20, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 5 ; Atk
	bigdw 5 ; Def
	bigdw 5 ; Spd
	bigdw 5 ; SAtk
	bigdw 5 ; SDef
	db "EGG@@@@@@@@"

	db CLEFFA
	db NO_ITEM
	db TRAIT_CONTACT_PSN
	db POUND, CHARM, DIZZY_PUNCH, 0
	dw 04096 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $54, $00 ; DVs
	db 35, 20, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 5 ; Atk
	bigdw 5 ; Def
	bigdw 5 ; Spd
	bigdw 5 ; SAtk
	bigdw 5 ; SDef
	db "EGG@@@@@@@@"

	db CLEFFA
	db NO_ITEM
	db TRAIT_CONTACT_PSN
	db POUND, CHARM, DIZZY_PUNCH, 0
	dw 00768 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $CB, $00 ; DVs
	db 35, 20, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 5 ; Atk
	bigdw 5 ; Def
	bigdw 5 ; Spd
	bigdw 5 ; SAtk
	bigdw 5 ; SDef
	db "EGG@@@@@@@@"

	db IGGLYBUFF
	db NO_ITEM
	db TRAIT_CONTACT_PSN
	db SING, POUND, DIZZY_PUNCH, 0
	dw 04096 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $54, $00 ; DVs
	db 15, 35, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 12 ; Max HP
	bigdw 5 ; Atk
	bigdw 5 ; Def
	bigdw 5 ; Spd
	bigdw 5 ; SAtk
	bigdw 5 ; SDef
	db "EGG@@@@@@@@"

	db IGGLYBUFF
	db NO_ITEM
	db TRAIT_CONTACT_PSN
	db SING, POUND, DIZZY_PUNCH, 0
	dw 00768 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $CB, $00 ; DVs
	db 15, 35, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 12 ; Max HP
	bigdw 5 ; Atk
	bigdw 5 ; Def
	bigdw 5 ; Spd
	bigdw 5 ; SAtk
	bigdw 5 ; SDef
	db "EGG@@@@@@@@"

	db SMOOCHUM
	db NO_ITEM
	db TRAIT_CONTACT_PSN
	db POUND, LICK, DIZZY_PUNCH, 0
	dw 03584 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $54, $00 ; DVs
	db 35, 30, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 5 ; Atk
	bigdw 5 ; Def
	bigdw 5 ; Spd
	bigdw 6 ; SAtk
	bigdw 5 ; SDef
	db "EGG@@@@@@@@"

	db SMOOCHUM
	db NO_ITEM
	db TRAIT_CONTACT_PSN
	db POUND, LICK, DIZZY_PUNCH, 0
	dw 00512 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $CB, $00 ; DVs
	db 35, 30, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 5 ; Atk
	bigdw 5 ; Def
	bigdw 5 ; Spd
	bigdw 6 ; SAtk
	bigdw 5 ; SDef
	db "EGG@@@@@@@@"

	db MAGBY
	db NO_ITEM
	db TRAIT_CONTACT_PSN
	db LEER, EMBER, DIZZY_PUNCH, 0
	dw 02560 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $54, $00 ; DVs
	db 30, 25, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 6 ; Atk
	bigdw 5 ; Def
	bigdw 6 ; Spd
	bigdw 5 ; SAtk
	bigdw 5 ; SDef
	db "EGG@@@@@@@@"

	db MAGBY
	db NO_ITEM
	db TRAIT_CONTACT_PSN
	db LEER, EMBER, DIZZY_PUNCH, 0
	dw 00512 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $CB, $00 ; DVs
	db 30, 25, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 6 ; Atk
	bigdw 5 ; Def
	bigdw 6 ; Spd
	bigdw 5 ; SAtk
	bigdw 5 ; SDef
	db "EGG@@@@@@@@"

	db ELEKID
	db NO_ITEM
	db TRAIT_CONTACT_PSN
	db LEER, THUNDERSHOCK, DIZZY_PUNCH, 0
	dw 03072 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $54, $00 ; DVs
	db 30, 30, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 5 ; Atk
	bigdw 5 ; Def
	bigdw 6 ; Spd
	bigdw 5 ; SAtk
	bigdw 5 ; SDef
	db "EGG@@@@@@@@"

	db ELEKID
	db NO_ITEM
	db TRAIT_CONTACT_PSN
	db LEER, THUNDERSHOCK, DIZZY_PUNCH, 0
	dw 00512 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $CB, $00 ; DVs
	db 30, 30, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 5 ; Atk
	bigdw 5 ; Def
	bigdw 6 ; Spd
	bigdw 5 ; SAtk
	bigdw 5 ; SDef
	db "EGG@@@@@@@@"

	db TYROGUE
	db NO_ITEM
	db TRAIT_CONTACT_PSN
	db TACKLE, LEER, DIZZY_PUNCH, 0
	dw 02560 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $54, $00 ; DVs
	db 35, 30, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 5 ; Atk
	bigdw 5 ; Def
	bigdw 6 ; Spd
	bigdw 5 ; SAtk
	bigdw 5 ; SDef
	db "EGG@@@@@@@@"

	db TYROGUE
	db NO_ITEM
	db TRAIT_CONTACT_PSN
	db TACKLE, LEER, DIZZY_PUNCH, 0
	dw 00256 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $CB, $00 ; DVs
	db 35, 30, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 5 ; Atk
	bigdw 5 ; Def
	bigdw 6 ; Spd
	bigdw 5 ; SAtk
	bigdw 5 ; SDef
	db "EGG@@@@@@@@"
