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
	const ROCK		; 3
	const BUG		; 4

UNUSED_TYPES EQU const_value
	const TYPE_10	; 5
	const TYPE_11	; 6
	const TYPE_12	; 7
	const TYPE_13	; 8
	const TYPE_14	; 9
	const TYPE_15	; a
	const TYPE_16	; b
	const TYPE_17	; c
	const TYPE_18	; d
	const CURSE_T	; e
UNUSED_TYPES_END EQU const_value

	const FIRE		; f
	const WATER		; 10
	const GRASS		; 11
	const ELECTRIC	; 12
	const PSYCHIC	; 13
	const ICE		; 14
	const DARK		; 15
TYPES_END EQU const_value

TYPE_MASK EQU %00111111
PHYSICAL  EQU %01000000
SPECIAL   EQU %10000000
STATUS    EQU %11000000

NUM_TYPES EQU TYPES_END + UNUSED_TYPES - UNUSED_TYPES_END
