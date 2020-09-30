	const_def 2 ; object constants
	const VIRIDIANFOREST_BLUE
	const VIRIDIANFOREST_TUTOR
	const VIRIDIANFOREST_BARRY
	const VIRIDIANFOREST_PIPPA
	const VIRIDIANFOREST_CHESTER
	const VIRIDIANFOREST_POKE_BALL1
	const VIRIDIANFOREST_TREE1
	const VIRIDIANFOREST_TREE2

ViridianForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBugCatcherMaimo:
	trainer BUG_CATCHER, MAIMO, EVENT_BEAT_BUG_CATCHER_BARRY, BugCatcherMaimo1SeenText, BugCatcherMaimo1BeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BugCatcherMaimoAfterText
	waitbutton
	closetext
	end

TrainerBugCatcherPippa:
	trainer BUG_CATCHER, PIPPA, EVENT_BEAT_BUG_CATCHER_PIPPA, BugCatcherPippa1SeenText, BugCatcherPippa1BeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BugCatcherPippaAfterText
	waitbutton
	closetext
	end

TrainerBirdKeeperChester:
	trainer BUG_CATCHER, CHESTER, EVENT_BEAT_BIRD_KEEPER_CHESTER, BirdKeeperChesterSeenText, BirdKeeperChesterBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BirdKeeperChesterAfterText
	waitbutton
	closetext
	end

ViridianForestBlueScript:
	faceplayer
	opentext
	writetext ViridianForestBlueText
	waitbutton
	checkflag ENGINE_EARTHBADGE
	iftrue .hasBadge

.hasBadge
	writetext ViridianForestBlueText2
	waitbutton
	closetext
	end

ViridianForestSign:
	jumptext ViridianForestSignText

BirdFeeder:
	jumptext BirdFeederText

ScytherSign:
	jumptext ScytherSignText

ViridianForestPPUp:
	itemball PP_UP

ViridianForestFruitTree1:
	fruittree FRUITTREE_VIRIDIAN_FOREST_1

ViridianForestFruitTree2:
	fruittree FRUITTREE_VIRIDIAN_FOREST_2

ViridianForestHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_VIRIDIAN_FOREST_HIDDEN_HYPER_POTION

MoveTutorViridianForestScript:
	faceplayer
	opentext
	writetext ViridianForest_Tutor_Intro
	yesorno
	iffalse .Refused
	special PlaceMoneyTopRight
	writetext ViridianForest_Tutor_Cost
	yesorno
	iffalse .Refused2
	checkmoney YOUR_MONEY, 8000
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext ViridianForest_HasMoney
	jump .Harmony
	jump .Incompatible

.Harmony:
	writebyte MOVETUTOR_SILVER_WIND
	writetext ViridianForest_Tutor_Start
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
	db "Silver Wind@"
	db "Cancel@"

.Refused:
	writetext ViridianForest_Tutor_Refused
	waitbutton
	closetext
	end

.Refused2:
	writetext ViridianForest_Tutor_Refused2
	waitbutton
	closetext
	end

.TeachMove:
	writetext ViridianForest_Tutor_Teach
	buttonsound
	takemoney YOUR_MONEY, 8000
	waitsfx
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetext ViridianForest_Tutor_Farewell
	waitbutton
	closetext
	
.Incompatible:
	writetext ViridianForest_Tutor_Incompatible
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext ViridianForest_NotEnoughMoney
	waitbutton
	closetext
	end

BugCatcherMaimo1SeenText:
	text "All kinds of bugs"
	line "hide under the"
	cont "rocks."
	done

BugCatcherMaimo1BeatenText:
	text "Maybe I'll hide"
	line "under a rock too…"
	done

BugCatcherMaimoAfterText:
	text "What if there was"
	line "a #MON that was"
	cont "also a rock!"
	done

BugCatcherPippa1SeenText:
	text "Are you after"
	line "the Scyther too?"
	done

BugCatcherPippa1BeatenText:
	text "My bug team needs"
	line "more attack power!"
	done

BugCatcherPippaAfterText:
	text "I hear Scyther"
	line "only shows up on"
	cont "certain days..."
	done

BirdKeeperChesterSeenText:
	text ""
	line ""
	done

BirdKeeperChesterBeatenText:
	text ""
	line ""
	done

BirdKeeperChesterAfterText:
	text ""
	line ""
	cont ""
	done

ViridianForestBlueText:
	text "Hi! I'm Blue,"
	line "leader of the"
	cont "Viridian Gym."

	text "I'm researching the"
	line "habits of Scythers"
	cont "in this area."
	done

ViridianForestBlueText2:
	text "See you later!"
	done

ViridianForestSignText:
	text "VIRIDIAN FOREST"
	done

ScytherSignText:
	text "WARN: Scyther"
	line "swarms have been"

	para "spotted MONDAY"
	line "through WEDNES-"
	cont "DAY in the "

	para "early hours in"
	line "the morning."

	para "They can be"
	line "dangerous, so stay"
	cont "out of the grass."

	para "- The Viridian"
	line "City Gym"
	done

BirdFeederText:
	text "It's a bird feeder!"
	done

ViridianForest_Tutor_Intro:
	text "I can teach your"
	line "#MON the move"
	cont "Silver Wind."
	
	para "It's a strong BUG"
	line "move with a small"
	
	para "chance to raise"
	line "all your stats."

	para "Should I teach a"
	line "new move?"
	done

ViridianForest_Tutor_Cost:
	text "It will cost you"
	line "8000¥. Okay?"
	done

ViridianForest_Tutor_Refused:
	text "Come back if you"
	line "change your mind."
	done

ViridianForest_HasMoney:
	text "Wahahah! You won't"
	line "regret it!"

	para "Which move should"
	line "I teach?"
	done

ViridianForest_Tutor_Refused2:
	text "Hm, too bad. I'll"
	line "have to get some"
	cont "cash from home…"
	done

ViridianForest_Tutor_Teach:
	text "If you understand"
	line "what's so amazing"

	para "about this move,"
	line "you've made it as"
	cont "a trainer."
	done

ViridianForest_Tutor_Farewell:
	text "Wahahah!"
	line "Farewell, kid!"
	done

ViridianForest_Tutor_Incompatible:
	text "B-but…"
	done

ViridianForest_NotEnoughMoney:
	text "…You don't have"
	line "enough coins here…"
	done

ViridianForest_Tutor_Start:
	text_start
	done

ViridianForest_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 18, 43, ROUTE_2, 6
	warp_event 19, 43, ROUTE_2, 6
	warp_event  3,  3, ROUTE_2, 7

	db 0 ; coord events

	db 8 ; bg events
	bg_event 17, 39, BGEVENT_READ, ViridianForestSign
	bg_event 19, 31, BGEVENT_READ, ScytherSign
	bg_event 16, 34, BGEVENT_READ, BirdFeeder
	bg_event 20, 34, BGEVENT_READ, BirdFeeder
	bg_event 18, 36, BGEVENT_READ, BirdFeeder
	bg_event 12,  0, BGEVENT_READ, BirdFeeder
	bg_event 10,  0, BGEVENT_READ, BirdFeeder
	bg_event 32, 39, BGEVENT_ITEM, ViridianForestHiddenHyperPotion

	db 8 ; object events
	object_event 18, 34, SPRITE_BLUE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianForestBlueScript, -1
	object_event 31,  0, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorViridianForestScript, -1
	object_event 27, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerBugCatcherMaimo, -1
	object_event 31, 38, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherPippa, -1
	object_event 11,  0, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperChester, -1
	object_event  2, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestPPUp, EVENT_VIRIDIAN_FOREST_PP_UP
	object_event 34, 17, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianForestFruitTree1, -1
	object_event 34, 21, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianForestFruitTree2, -1
