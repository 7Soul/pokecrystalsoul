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

FieldNamesString: ; needs to match ACTION_ number and order
	db "Cut@"
	db "Surf@"
	db "Fly@"
	db "Strength@"
	db "Sweet Scent@"
	db "Flash@"
	db "Rock Smash@"
	db "Investigate@"
	db "Headbutt@"
	db "Hold@"
	db "Lucky@"
	db "Evolution Beam@"
	db "Flame Body@"
	db "Searchlight@"
	db "Find Family@"
	db "Ride@"
	db -1

MonMenuOptions:
; category, item, value; actions are in PokemonActionSubmenu (see engine/pokemon/mon_menu.asm)
; moves	
	db MONMENU_FIELD_MOVE, MONMENUITEM_CUT,        ACTION_CUT
	db MONMENU_FIELD_MOVE, MONMENUITEM_SURF,       ACTION_SURF
	db MONMENU_FIELD_MOVE, MONMENUITEM_FLY,        ACTION_FLY
	db MONMENU_FIELD_MOVE, MONMENUITEM_FLASH,      ACTION_FLASH
	db MONMENU_FIELD_MOVE, MONMENUITEM_RIDE,  	   ACTION_RIDE
	db MONMENU_FIELD_MOVE, MONMENUITEM_SWEETSCENT, ACTION_SWEETSCENT
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

MonMenuShow: ; actions that appear in the menu
	db ACTION_FLY, ACTION_SWEETSCENT, ACTION_RIDE, ACTION_FLASH
	db -1