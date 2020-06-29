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

UNUSED_TYPES EQU const_value
	const TYPE_10	; 7
	const TYPE_11	; 8
	const TYPE_12	; 9
	const TYPE_13	; a
	const TYPE_14	; b
	const TYPE_15	; c
	const TYPE_16	; d
	const TYPE_17	; e
	const TYPE_18	; f
	const CURSE_T	; 10
UNUSED_TYPES_END EQU const_value

	const FIRE		; 11
	const WATER		; 12
	const GRASS		; 13
	const ELECTRIC	; 14
	const PSYCHIC	; 15
	const ICE		; 16
	const DARK		; 17
TYPES_END EQU const_value

TYPE_MASK EQU %00111111
PHYSICAL  EQU %01000000
SPECIAL   EQU %10000000
STATUS    EQU %11000000

NUM_TYPES EQU TYPES_END + UNUSED_TYPES - UNUSED_TYPES_END
