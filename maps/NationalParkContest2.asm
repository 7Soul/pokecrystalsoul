	const_def 2 ; object constants
	const NATIONALPARKCONTEST2_YOUNGSTER1

NationalParkContest2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NationalParkContest2RelaxationSquareSign:
	jumptext NationalParkContest2RelaxationSquareText

NationalParkContest2BattleNoticeSign:
	jumptext NationalParkContest2BattleNoticeText

CatchingContestant2_1:
	trainer YOUNGSTER, MIKEY, EVENT_BEAT_CONTESTANT2_1, CatchingContestant2_1SeenText, CatchingContestant2_1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CatchingContestant2_1AfterText
	waitbutton
	closetext
	end

CatchingContestant2_1SeenText:
	text "DON: I'm going to"
	line "win! Don't bother"
	cont "me."
	done

CatchingContestant2_1BeatenText:
	text "DON: I'm going to"
	line "win! Don't bother"
	cont "me."
	done

CatchingContestant2_1AfterText:
	text "DON: I'm going to"
	line "win! Don't bother"
	cont "me."
	done

NationalParkContest2RelaxationSquareText:
	text "RELAXATION SQUARE"
	line "NATIONAL PARK"
	done

NationalParkContest2BattleNoticeText:
	text "What is this"
	line "notice?"

	para "Please battle only"
	line "in the grass."

	para "NATIONAL PARK"
	line "WARDEN'S OFFICE"
	done

NationalParkContest2_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 33, 18, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 33, 19, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 10, 47, ROUTE_35_NATIONAL_PARK_GATE, 1
	warp_event 11, 47, ROUTE_35_NATIONAL_PARK_GATE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14, 44, BGEVENT_READ, NationalParkContest2RelaxationSquareSign
	bg_event 27, 31, BGEVENT_READ, NationalParkContest2BattleNoticeSign

	db 1 ; object events
	object_event 19, 29, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CatchingContestant2_1, EVENT_CONTESTANT2_1
