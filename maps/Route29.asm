	const_def 2 ; object constants
	const ROUTE29_YOUNGSTER
	const ROUTE29_TEACHER1
	const ROUTE29_FRUIT_TREE
	const ROUTE29_FISHER
	const ROUTE29_COOLTRAINER_M1
	const ROUTE29_TUSCANY
	const ROUTE29_POKE_BALL
	const ROUTE29_MOVETUTOR

Route29_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE29_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Tuscany

.DummyScene0:
	end

.TuscanyDisappears:
	disappear ROUTE29_TUSCANY
	return

.Tuscany:
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, .TuscanyDisappears
	appear ROUTE29_TUSCANY
	return
	
MoveTutorScript29:
	faceplayer
	opentext
	writetext Route29_Tutor_Intro
	yesorno
	iffalse .Refused
	special PlaceMoneyTopRight
	writetext Route29_Tutor_Cost
	yesorno
	iffalse .Refused2
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext Route29_HasMoney
	jump .Harmony
	jump .Incompatible

.Harmony:
	writebyte MOVETUTOR_HARMONY
	writetext Route29_Tutor_Start
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 5, 11, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 2 ; items
	db "Harmony@"
	db "Cancel@"

.Refused:
	writetext Route29_Tutor_Refused
	waitbutton
	closetext
	end

.Refused2:
	writetext Route29_Tutor_Refused2
	waitbutton
	closetext
	end

.TeachMove:
	writetext Route29_Tutor_Teach
	buttonsound
	takemoney YOUR_MONEY, 5000
	waitsfx
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetext Route29_Tutor_Farewell
	waitbutton
	closetext
	
.Incompatible:
	writetext Route29_Tutor_Incompatible
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext Route29_NotEnoughMoney
	waitbutton
	closetext
	end

Route29YoungsterScript:
	jumptextfaceplayer Route29YoungsterText

Route29TeacherScript:
	jumptextfaceplayer Route29TeacherText

Route29FisherScript:
	jumptextfaceplayer Route29FisherText

Route29CooltrainerMScript:
	faceplayer
	opentext
	checktime DAY
	iftrue .day_morn
	checktime NITE
	iftrue .nite
.day_morn
	writetext Route29CooltrainerMText_WaitingForNight
	waitbutton
	closetext
	end

.nite
	writetext Route29CooltrainerMText_WaitingForMorning
	waitbutton
	closetext
	end

TuscanyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	iftrue TuscanyTuesdayScript
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftrue .MetTuscany
	writetext MeetTuscanyText
	buttonsound
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany:
	writetext TuscanyGivesGiftText
	buttonsound
	verbosegiveitem PINK_BOW
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	writetext TuscanyGaveGiftText
	waitbutton
	closetext
	end

TuscanyTuesdayScript:
	writetext TuscanyTuesdayText
	waitbutton
TuscanyDoneScript:
	closetext
	end

TuscanyNotTuesdayScript:
	writetext TuscanyNotTuesdayText
	waitbutton
	closetext
	end

Route29Sign1:
	jumptext Route29Sign1Text

Route29Sign2:
	jumptext Route29Sign2Text

Route29FruitTree:
	fruittree FRUITTREE_ROUTE_29

Route29Potion:
	itemball POTION

DudeMovementData1a:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

DudeMovementData2a:
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

DudeMovementData1b:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

DudeMovementData2b:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

Route29YoungsterText:
	text "Yo. How are your"
	line "#MON?"

	para "If they're weak"
	line "and not ready for"

	para "battle, keep out"
	line "of the grass."
	done

Route29TeacherText:
	text "See those ledges?"
	line "It's scary to jump"
	cont "off them."

	para "But you can go to"
	line "NEW BARK without"

	para "walking through"
	line "the grass."
	done

Route29FisherText:
	text "I wanted to take a"
	line "break, so I saved"

	para "to record my"
	line "progress."
	done

; unused
Text_WaitingForDay:
	text "I'm waiting for"
	line "#MON that"

	para "appear only in the"
	line "daytime."
	done

Route29CooltrainerMText_WaitingForNight:
	text "I'm waiting for"
	line "#MON that"

	para "appear only at"
	line "night."
	done

Route29CooltrainerMText_WaitingForMorning:
	text "I'm waiting for"
	line "#MON that"

	para "appear only in the"
	line "morning."
	done

MeetTuscanyText:
	text "TUSCANY: I do be-"
	line "lieve that this is"

	para "the first time"
	line "we've met?"

	para "Please allow me to"
	line "introduce myself."

	para "I am TUSCANY of"
	line "Tuesday."
	done

TuscanyGivesGiftText:
	text "By way of intro-"
	line "duction, please"

	para "accept this gift,"
	line "a PINK BOW."
	done

TuscanyGaveGiftText:
	text "TUSCANY: Wouldn't"
	line "you agree that it"
	cont "is most adorable?"

	para "It strengthens"
	line "normal-type moves."

	para "I am certain it"
	line "will be of use."
	done

TuscanyTuesdayText:
	text "TUSCANY: Have you"
	line "met MONICA, my"
	cont "older sister?"

	para "Or my younger"
	line "brother, WESLEY?"

	para "I am the second of"
	line "seven children."
	done

TuscanyNotTuesdayText:
	text "TUSCANY: Today is"
	line "not Tuesday. That"
	cont "is unfortunate…"
	done

Route29Sign1Text:
	text "ROUTE 29"

	para "CHERRYGROVE CITY -"
	line "NEW BARK TOWN"
	done

Route29Sign2Text:
	text "ROUTE 29"

	para "CHERRYGROVE CITY -"
	line "NEW BARK TOWN"
	done
	
Route29_Tutor_Intro:
	text "I can teach your"
	line "#MON the move"
	cont "Harmony."
	
	para "It turns all moves"
	line "from both sides"
	
	para "into your primary"
	line "type for 1 turn."

	para "Should I teach a"
	line "new move?"
	done

Route29_Tutor_Cost:
	text "It will cost you"
	line "5000¥. Okay?"
	done

Route29_Tutor_Refused:
	text "Come back if you"
	line "change your mind."
	done

Route29_HasMoney:
	text "Wahahah! You won't"
	line "regret it!"

	para "Which move should"
	line "I teach?"
	done

Route29_Tutor_Refused2:
	text "Hm, too bad. I'll"
	line "have to get some"
	cont "cash from home…"
	done

Route29_Tutor_Teach:
	text "If you understand"
	line "what's so amazing"

	para "about this move,"
	line "you've made it as"
	cont "a trainer."
	done

Route29_Tutor_Farewell:
	text "Wahahah!"
	line "Farewell, kid!"
	done

Route29_Tutor_Incompatible:
	text "B-but…"
	done

Route29_NotEnoughMoney:
	text "…You don't have"
	line "enough coins here…"
	done

Route29_Tutor_Start:
	text_start
	done

Route29_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 27,  1, ROUTE_29_ROUTE_46_GATE, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event 51,  7, BGEVENT_READ, Route29Sign1
	bg_event  7,  7, BGEVENT_READ, Route29Sign2

	db 8 ; object events
	object_event 29, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29YoungsterScript, -1
	object_event 34,  8, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29TeacherScript, -1
	object_event 17,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route29FruitTree, -1
	object_event 8,  10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route29FisherScript, -1
	object_event 16, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29CooltrainerMScript, -1
	object_event 36,  6, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_29_TUSCANY_OF_TUESDAY
	object_event 23, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route29Potion, EVENT_ROUTE_29_POTION
	object_event  9,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorScript29, -1
