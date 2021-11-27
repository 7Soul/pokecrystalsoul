; MonMenuOptionStrings indexes
	const_def 1
	const MONMENUVALUE_STATS  ; 1
	const MONMENUVALUE_SWITCH ; 2
	const MONMENUVALUE_ITEM   ; 3
	const MONMENUVALUE_CANCEL ; 4
	const MONMENUVALUE_MOVE   ; 5
	const MONMENUVALUE_MAIL   ; 6
	const MONMENUVALUE_PAIR   ; 7
	const MONMENUVALUE_ERROR  ; 8

MonMenuOptionStrings:
; entries correspond to MONMENUVALUE_* constants
	db "Stats@"
	db "Switch@"
	db "Item@"
	db "Cancel@"
	db "Move@"
	db "Mail@"
	db "Pair@"
	db "ERROR!@"

FieldNamesIds:
	db RAZOR_LEAF
	db FURY_CUTTER
	db SLASH
	db VICEGRIP
	db X_SCISSOR
	db EMBER
	db FIRE_BLAST
	db FIRE_SPIN
	db FLAMETHROWER
	db FLAME_WHEEL
	db SACRED_FIRE
	db FIRE_PUNCH
	db FLY
	db ZOOM_FLIGHT
	db EXTREMESPEED
	db SURF
	db HAMMER_ARM
	db SEISMIC_TOSS
	db MEGA_PUNCH
	db THUNDER
	db WHIRLPOOL
	db DIG
	db SMOKESCREEN
	db TELEPORT
	db RECOVER
	db HEADBUTT
	db ROCK_SMASH
	db ROCK_SLIDE
	db ROCK_THROW
	db -1

FieldNamesString:
	db "Cut@"
	db "Cut@"
	db "Cut@"
	db "Cut@"
	db "Cut@"
	db "Burn@"
	db "Burn@"
	db "Burn@"
	db "Burn@"
	db "Burn@"
	db "Burn@"
	db "Burn@"
	db "Fly@"
	db "Fly@"
	db "Fly@"
	db "Surf@"
	db "Strength@"
	db "Strength@"
	db "Strength@"
	db "Flash@"
	db "Whirlpool@"
	db "Escape@"
	db "Escape@"
	db "Teleport@"
	db "Recover@"
	db "Headbutt@"
	db "Rock Smash@"
	db "Rock Smash@"
	db "Rock Smash@"
	db "Rock Smash@"
	db -1

MonMenuOptions:
; category, item, value; actions are in PokemonActionSubmenu (see engine/pokemon/mon_menu.asm)
; moves	
	db MONMENU_FIELD_MOVE, MONMENUITEM_CUT,        RAZOR_LEAF
	db MONMENU_FIELD_MOVE, MONMENUITEM_CUT,        FURY_CUTTER
	db MONMENU_FIELD_MOVE, MONMENUITEM_CUT,        SLASH
	db MONMENU_FIELD_MOVE, MONMENUITEM_CUT,        VICEGRIP
	db MONMENU_FIELD_MOVE, MONMENUITEM_CUT,        X_SCISSOR
	db MONMENU_FIELD_MOVE, MONMENUITEM_BURN,       EMBER
	db MONMENU_FIELD_MOVE, MONMENUITEM_BURN,       FIRE_BLAST
	db MONMENU_FIELD_MOVE, MONMENUITEM_BURN,       FIRE_SPIN
	db MONMENU_FIELD_MOVE, MONMENUITEM_BURN,       FLAMETHROWER
	db MONMENU_FIELD_MOVE, MONMENUITEM_BURN,       FLAME_WHEEL
	db MONMENU_FIELD_MOVE, MONMENUITEM_BURN,       SACRED_FIRE
	db MONMENU_FIELD_MOVE, MONMENUITEM_BURN,       FIRE_PUNCH
	db MONMENU_FIELD_MOVE, MONMENUITEM_FLY,        FLY
	db MONMENU_FIELD_MOVE, MONMENUITEM_FLY,        ZOOM_FLIGHT
	db MONMENU_FIELD_MOVE, MONMENUITEM_FLY,        EXTREMESPEED
	db MONMENU_FIELD_MOVE, MONMENUITEM_SURF,       SURF
	db MONMENU_FIELD_MOVE, MONMENUITEM_STRENGTH,   HAMMER_ARM
	db MONMENU_FIELD_MOVE, MONMENUITEM_STRENGTH,   SEISMIC_TOSS
	db MONMENU_FIELD_MOVE, MONMENUITEM_STRENGTH,   MEGA_PUNCH
	db MONMENU_FIELD_MOVE, MONMENUITEM_FLASH,      THUNDER
	; db MONMENU_FIELD_MOVE, MONMENUITEM_WATERFALL,  DARK_PULSE
	db MONMENU_FIELD_MOVE, MONMENUITEM_WHIRLPOOL,  WHIRLPOOL
	db MONMENU_FIELD_MOVE, MONMENUITEM_DIG,        DIG
	db MONMENU_FIELD_MOVE, MONMENUITEM_DIG,        SMOKESCREEN
	db MONMENU_FIELD_MOVE, MONMENUITEM_TELEPORT,   TELEPORT
	db MONMENU_FIELD_MOVE, MONMENUITEM_SOFTBOILED, RECOVER
	db MONMENU_FIELD_MOVE, MONMENUITEM_HEADBUTT,   HEADBUTT
	db MONMENU_FIELD_MOVE, MONMENUITEM_ROCKSMASH,  ROCK_SMASH
	db MONMENU_FIELD_MOVE, MONMENUITEM_ROCKSMASH,  ROCK_SLIDE
	db MONMENU_FIELD_MOVE, MONMENUITEM_ROCKSMASH,  ROCK_THROW
	db MONMENU_FIELD_MOVE, MONMENUITEM_ROCKSMASH,  CRABHAMMER
	;db MONMENU_FIELD_MOVE, MONMENUITEM_MILKDRINK,  MILK_DRINK
	; db MONMENU_FIELD_MOVE, MONMENUITEM_SWEETSCENT, FELL_STINGER
; options
	db MONMENU_MENUOPTION, MONMENUITEM_STATS,      MONMENUVALUE_STATS
	db MONMENU_MENUOPTION, MONMENUITEM_SWITCH,     MONMENUVALUE_SWITCH
	db MONMENU_MENUOPTION, MONMENUITEM_PAIR,       MONMENUVALUE_PAIR
	db MONMENU_MENUOPTION, MONMENUITEM_ITEM,       MONMENUVALUE_ITEM
	db MONMENU_MENUOPTION, MONMENUITEM_CANCEL,     MONMENUVALUE_CANCEL
	db MONMENU_MENUOPTION, MONMENUITEM_MOVE,       MONMENUVALUE_MOVE
	db MONMENU_MENUOPTION, MONMENUITEM_MAIL,       MONMENUVALUE_MAIL
	db MONMENU_MENUOPTION, MONMENUITEM_ERROR,      MONMENUVALUE_ERROR
	db -1
