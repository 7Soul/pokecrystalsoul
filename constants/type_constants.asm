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
	const GROUND	; 3
	const ROCK		; 4
	const BUG		; 5

UNUSED_TYPES EQU const_value
	const TYPE_10	; 6
	const TYPE_11	; 7
	const TYPE_12	; 8
	const TYPE_13	; 9
	const TYPE_14	; a
	const TYPE_15	; b
	const TYPE_16	; c
	const TYPE_17	; d
	const TYPE_18	; e
	const CURSE_T	; f
UNUSED_TYPES_END EQU const_value

	const FIRE		; 10
	const WATER		; 11
	const GRASS		; 12
	const ELECTRIC	; 13
	const PSYCHIC	; 14
	const ICE		; 15
	const DARK		; 16
TYPES_END EQU const_value

TYPE_MASK EQU %00111111
PHYSICAL  EQU %01000000
SPECIAL   EQU %10000000
STATUS    EQU %11000000

NUM_TYPES EQU TYPES_END + UNUSED_TYPES - UNUSED_TYPES_END
