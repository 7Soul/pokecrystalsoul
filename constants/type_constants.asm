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
	const BUG		; 6
	const FIRE		; 7
	const WATER		; 8
	const GRASS		; 9
	const ELECTRIC	; a
	const PSYCHIC	; b
	const ICE		; c
	const DARK		; d
TYPES_END EQU const_value

TYPE_MASK EQU %00001111
PHYSICAL  EQU %01000000
SPECIAL   EQU %10000000
STATUS    EQU %11000000
CONTACT   EQU %00100000

NUM_TYPES EQU TYPES_END
