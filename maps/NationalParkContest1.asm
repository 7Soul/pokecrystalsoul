	const_def 2 ; object constants
	const NATIONALPARKCONTEST1_NORMAL1
	const NATIONALPARKCONTEST1_NORMAL2
	const NATIONALPARKCONTEST1_NORMAL3

NationalParkContest1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NationalParkContest1RelaxationSquareSign:
	jumptext NationalParkContest1RelaxationSquareText

NationalParkContest1BattleNoticeSign:
	jumptext NationalParkContest1BattleNoticeText

CatchingContestant1_1:
	trainer TEACHER, YOHANE, EVENT_BEAT_CONTESTANT1_1, CatchingContestant1_1SeenText, CatchingContestant1_1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CatchingContestant1_1AfterText
	waitbutton
	closetext
	end

CatchingContestant1_2:
	trainer TEACHER, EMILY, EVENT_BEAT_CONTESTANT1_2, CatchingContestant1_1SeenText, CatchingContestant1_1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CatchingContestant1_1AfterText
	waitbutton
	closetext
	end

CatchingContestant1_3:
	trainer TEACHER, SHIRLEY, EVENT_BEAT_CONTESTANT1_3, CatchingContestant1_1SeenText, CatchingContestant1_1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CatchingContestant1_1AfterText
	waitbutton
	closetext
	end

CatchingContestant1_1SeenText:
	text "I'm going to win."
	line "Don't bother me."
	done

CatchingContestant1_1BeatenText:
	text "Impressive!"
	done

CatchingContestant1_1AfterText:
	text "I should try to"
	line "get some better"
	cont "NORMAL-type TMs."
	done

NationalParkContest1RelaxationSquareText:
	text "RELAXATION SQUARE"
	line "NATIONAL PARK"
	done

NationalParkContest1BattleNoticeText:
	text "What is this"
	line "notice?"

	para "Please battle only"
	line "in the grass."

	para "NATIONAL PARK"
	line "WARDEN'S OFFICE"
	done

NationalParkContest1_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 33, 18, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 33, 19, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 10, 47, ROUTE_35_NATIONAL_PARK_GATE, 1
	warp_event 11, 47, ROUTE_35_NATIONAL_PARK_GATE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14, 44, BGEVENT_READ, NationalParkContest1RelaxationSquareSign
	bg_event 27, 31, BGEVENT_READ, NationalParkContest1BattleNoticeSign

	db 3 ; object events
	object_event $1E, $11, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 0, CatchingContestant1_1, EVENT_CONTESTANT1_1
	object_event $1D, $11, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 0, CatchingContestant1_2, EVENT_CONTESTANT1_2
	object_event $1C, $11, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 0, CatchingContestant1_3, EVENT_CONTESTANT1_3
