; item ids
; indexes for:
; - ItemNames (see data/items/names.asm)
; - ItemDescriptions (see data/items/descriptions.asm)
; - ItemAttributes (see data/items/attributes.asm)
; - ItemEffects (see engine/items/item_effects.asm)
	const_def
	const NO_ITEM      ; 00
	const MASTER_BALL  ; 01
	const ULTRA_BALL   ; 02
	const BRIGHTPOWDER ; 03
	const GREAT_BALL   ; 04
	const POKE_BALL    ; 05
	const TOWN_MAP     ; 06
	const BICYCLE      ; 07
	const MOON_STONE   ; 08
	const ANTIDOTE     ; 09
	const BURN_HEAL    ; 0a
	const ICE_HEAL     ; 0b
	const AWAKENING    ; 0c
	const PARLYZ_HEAL  ; 0d
	const FULL_RESTORE ; 0e
	const MAX_POTION   ; 0f
	const HYPER_POTION ; 10
	const SUPER_POTION ; 11
	const POTION       ; 12
	const ESCAPE_ROPE  ; 13
	const REPEL        ; 14
	const MAX_ELIXER   ; 15
	const FIRE_STONE   ; 16
	const THUNDERSTONE ; 17
	const WATER_STONE  ; 18
	const TOUGH_HORN   ; 19 ; new
	const HP_UP        ; 1a
	const PROTEIN      ; 1b
	const IRON         ; 1c
	const CARBOS       ; 1d
	const LUCKY_PUNCH  ; 1e
	const CALCIUM      ; 1f
	const RARE_CANDY   ; 20
	const X_ACCURACY   ; 21
	const LEAF_STONE   ; 22
	const METAL_POWDER ; 23
	const NUGGET       ; 24
	const POKE_DOLL    ; 25
	const FULL_HEAL    ; 26
	const REVIVE       ; 27
	const MAX_REVIVE   ; 28
	const GUARD_SPEC   ; 29
	const SUPER_REPEL  ; 2a
	const MAX_REPEL    ; 2b
	const DIRE_HIT     ; 2c
	const CARAPACE     ; 2d ; new
	const FRESH_WATER  ; 2e
	const SODA_POP     ; 2f
	const LEMONADE     ; 30
	const X_ATTACK     ; 31
	const STEEL_WING   ; 32 ; new
	const X_DEFEND     ; 33
	const X_SPEED      ; 34
	const X_SPECIAL    ; 35
	const COIN_CASE    ; 36
	const ITEMFINDER   ; 37
	const POKE_FLUTE   ; 38
	const EXP_SHARE    ; 39
	const OLD_ROD      ; 3a
	const GOOD_ROD     ; 3b
	const SILVER_LEAF  ; 3c
	const SUPER_ROD    ; 3d
	const PP_UP        ; 3e
	const ETHER        ; 3f
	const MAX_ETHER    ; 40
	const ELIXER       ; 41
	const RED_SCALE    ; 42
	const SECRETPOTION ; 43
	const S_S_TICKET   ; 44
	const MYSTERY_EGG  ; 45
	const CLEAR_BELL   ; 46
	const SILVER_WING  ; 47
	const MOOMOO_MILK  ; 48
	const QUICK_CLAW   ; 49
	const PSNCUREBERRY ; 4a
	const GOLD_LEAF    ; 4b
	const SOFT_SAND    ; 4c
	const SHARP_BEAK   ; 4d
	const PRZCUREBERRY ; 4e
	const BURNT_BERRY  ; 4f
	const ICE_BERRY    ; 50
	const POISON_BARB  ; 51
	const KINGS_ROCK   ; 52
	const BITTER_BERRY ; 53
	const MINT_BERRY   ; 54
	const RED_APRICORN ; 55
	const TINYMUSHROOM ; 56
	const BIG_MUSHROOM ; 57
	const SILVERPOWDER ; 58
	const BLU_APRICORN ; 59
	const BATTERY      ; 5a ; new
	const AMULET_COIN  ; 5b
	const YLW_APRICORN ; 5c
	const GRN_APRICORN ; 5d
	const CLEANSE_TAG  ; 5e
	const MYSTIC_WATER ; 5f
	const TWISTEDSPOON ; 60
	const WHT_APRICORN ; 61
	const BLACKBELT    ; 62
	const BLK_APRICORN ; 63
	const CINDERS      ; 64 ; new
	const PNK_APRICORN ; 65
	const BLACKGLASSES ; 66
	const SLOWPOKETAIL ; 67
	const PINK_BOW     ; 68
	const LEEK         ; 69
	const SMOKE_BALL   ; 6a
	const NEVERMELTICE ; 6b
	const MAGNET       ; 6c
	const MIRACLEBERRY ; 6d
	const PEARL        ; 6e
	const BIG_PEARL    ; 6f
	const EVERSTONE    ; 70
	const SPELL_TAG    ; 71
	const RAGECANDYBAR ; 72
	const GS_BALL      ; 73
	const BLUE_CARD    ; 74
	const MIRACLE_SEED ; 75
	const THICK_CLUB   ; 76
	const FOCUS_BAND   ; 77
	const DARK_MIRROR  ; 78 ; new
	const ENERGYPOWDER ; 79
	const ENERGY_ROOT  ; 7a
	const HEAL_POWDER  ; 7b
	const REVIVAL_HERB ; 7c
	const HARD_STONE   ; 7d
	const LUCKY_EGG    ; 7e
	const CARD_KEY     ; 7f
	const MACHINE_PART ; 80
	const EGG_TICKET   ; 81
	const LOST_ITEM    ; 82
	const STARDUST     ; 83
	const STAR_PIECE   ; 84
	const BASEMENT_KEY ; 85
	const PASS         ; 86
	const DUMBELL	   ; 87 ; new
	const GRASSWHISTLE ; 88 ; new
	const ACCELEROCK   ; 89 ; new
	const CHARCOAL     ; 8a
	const BERRY_JUICE  ; 8b
	const SCOPE_LENS   ; 8c
	const HARDENEDSAND ; 8d ; new
	const SHINY_CORAL  ; 8e ; new
	const METAL_COAT   ; 8f
	const DRAGON_FANG  ; 90
	const CUTE_RIBBON  ; 91 ; new
	const LEFTOVERS    ; 92
	const FROZEN_DEW   ; 93 ; new
	const EYE_GLYPH    ; 94 ; new
	const STICK        ; 95 ; new
	const MYSTERYBERRY ; 96
	const DRAGON_SCALE ; 97
	const BERSERK_GENE ; 98
	const ITEM_99      ; 99 ; unused
	const ITEM_9A      ; 9a ; unused
	const ITEM_9B      ; 9b ; unused
	const SACRED_ASH   ; 9c
	const HEAVY_BALL   ; 9d
	const FLOWER_MAIL  ; 9e
	const LEVEL_BALL   ; 9f
	const LURE_BALL    ; a0
	const FAST_BALL    ; a1
	const ITEM_A2      ; a2 ; unused
	const LIGHT_BALL   ; a3
	const FRIEND_BALL  ; a4
	const MOON_BALL    ; a5
	const LOVE_BALL    ; a6
	const NORMAL_BOX   ; a7
	const GORGEOUS_BOX ; a8
	const SUN_STONE    ; a9
	const POLKADOT_BOW ; aa
	const ITEM_AB      ; ab ; unused
	const UP_GRADE     ; ac
	const BERRY        ; ad
	const GOLD_BERRY   ; ae
	const SQUIRTBOTTLE ; af
	const ITEM_B0      ; b0 ; unused
	const PARK_BALL    ; b1
	const RAINBOW_WING ; b2
	const ITEM_B3      ; b3 ; unused
	const BRICK_PIECE  ; b4
	const SURF_MAIL    ; b5
	const LITEBLUEMAIL ; b6
	const PORTRAITMAIL ; b7
	const LOVELY_MAIL  ; b8
	const EON_MAIL     ; b9
	const MORPH_MAIL   ; ba
	const BLUESKY_MAIL ; bb
	const MUSIC_MAIL   ; bc
	const MIRAGE_MAIL  ; bd
	const ITEM_BE      ; be ; unused
	const ITEM_C3      ; bf
	const ITEM_DC      ; c0

add_tm: MACRO
if !DEF(TM01)
TM01 = const_value
	enum_start 1
endc
	define _\@_1, "TM_\1"
	const _\@_1
	enum \1_TMNUM
ENDM

; see data/moves/tmhm_moves.asm for moves
	add_tm DYNAMICPUNCH ; c1 TM01
	add_tm HEADBUTT     ; c2
	add_tm CURSE        ; c3
	add_tm ROLLOUT      ; c4
	add_tm ROAR         ; c5
	add_tm TOXIC        ; c6
	add_tm ZAP_CANNON   ; c7
	add_tm ROCK_SMASH   ; c8
	add_tm PSYCH_UP     ; c9
	add_tm HIDDEN_POWER ; ca TM10
	add_tm SUNNY_DAY    ; cb
	add_tm FELL_STINGER ; cc
	add_tm SNORE        ; cd
	add_tm BLIZZARD     ; ce
	add_tm HYPER_BEAM   ; cf
	add_tm ICY_WIND     ; d0
	add_tm PROTECT      ; d1
	add_tm RAIN_DANCE   ; d2
	add_tm GIGA_DRAIN   ; d3
	add_tm ENDURE       ; d4 TM20
	add_tm LEAF_SHIELD  ; d5
	add_tm SOLARBEAM    ; d6
	add_tm FROZEN_TAIL  ; d7
	add_tm HYDRO_PUMP   ; d8
	add_tm THUNDER      ; d9
	add_tm EARTHQUAKE   ; da
	add_tm HARMONY      ; db
	add_tm DIG          ; dc
	add_tm PSYCHIC_M    ; dd
	add_tm SHADOW_BALL  ; de TM30
	add_tm MUD_BOMB     ; df
	add_tm DOUBLE_TEAM  ; e0
	add_tm ICE_PUNCH    ; e1
	add_tm SWAGGER      ; e2
	add_tm SLEEP_TALK   ; e3
	add_tm SLUDGE_BOMB  ; e4
	add_tm SANDSTORM    ; e5
	add_tm FIRE_BLAST   ; e6
	add_tm SWIFT        ; e7
	add_tm DEFENSE_CURL ; e8 TM40
	add_tm THUNDERPUNCH ; e9
	add_tm DREAM_EATER  ; ea
	add_tm BRICK_BREAK  ; eb
	add_tm REST         ; ec
	add_tm ATTRACT      ; ed
	add_tm BULK_UP      ; ee
	add_tm ICICLE_WING  ; ef
	add_tm FIRE_PUNCH   ; f0
	add_tm FURY_CUTTER  ; f1
	add_tm NIGHTMARE    ; f2 TM50
	add_tm ROCK_TOMB    ; f3
	add_tm JET_STREAM   ; f4
	add_tm THUNDERBOLT  ; f5
	add_tm PSYWAVE      ; f6
	add_tm INFERNO      ; f7
	add_tm AIR_SLASH    ; f8
	add_tm AQUA_TAIL    ; f9 TM60
NUM_TMS = const_value - TM01

add_hm: MACRO
if !DEF(HM01)
HM01 = const_value
endc
	define _\@_1, "HM_\1"
	const _\@_1
	enum \1_TMNUM
ENDM

	add_hm AQUA_TAIL    ; f3
	add_hm FLY          ; f7
	add_hm SURF         ; f5
	add_hm NASTY_PLOT   ; f6
	add_hm MAGMA_STORM  ; f7
	add_hm WHIRLPOOL    ; f8
	; add_hm DARK_PULSE   ; f9
NUM_HMS = const_value - HM01

add_mt: MACRO
	enum \1_TMNUM
ENDM

	add_mt FLAMETHROWER
	add_mt THUNDERBOLT
	add_mt ICE_BEAM
	add_mt HARMONY
NUM_TM_HM_TUTOR = __enum__ + -1

	const ITEM_FA       ; fa

USE_SCRIPT_VAR EQU $00
ITEM_FROM_MEM  EQU $ff

; leftovers from red
SAFARI_BALL    EQU $08 ; MOON_STONE
MOON_STONE_RED EQU $0a ; BURN_HEAL
FULL_HEAL_RED  EQU $34 ; X_SPEED
