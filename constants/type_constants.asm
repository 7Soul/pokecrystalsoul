; TypeNames indexes (see data/types/names.asm)
; also used in:
; - PokedexTypeSearchConversionTable (see data/types/search_types.asm)
; - PokedexTypeSearchStrings (see data/types/search_strings.asm)
; - TypeMatchups (see data/types/type_matchups.asm)
; - TypeBoostItems (see data/types/type_boost_items.asm)
	const_def

	const NORMAL	; 0
	const FIGHTING 	; 1
	const FLYING	; 2
	const POISON	; 3
	const GROUND	; 4
	const ROCK		; 5
	const STEEL		; 6
	const BUG		; 7
	const FIRE		; 8
	const WATER		; 9
	const GRASS		; a
	const ELECTRIC	; b
	const PSYCHIC	; c
	const ICE		; d
	const DARK		; e
TYPES_END EQU const_value

TYPE_MASK EQU %00001111
PHYSICAL  EQU %01000000
SPECIAL   EQU %10000000
STATUS    EQU %11000000
CONTACT   EQU %00100000

NUM_TYPES EQU TYPES_END
