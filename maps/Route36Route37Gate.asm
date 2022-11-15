	const_def 2 ; object constants
	const ROUTE36ROUTE37GATE_OFFICER
	const ROUTE36ROUTE37GATE_GRAMPS
	const ROUTE36ROUTE37GATE_COOLGUY

Route36Route37Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route36Route37GateOfficerScript:
	jumptextfaceplayer Route36Route37GateOfficerText

Route36Route37GateGrampsScript:
	jumptextfaceplayer Route36Route37GateGrampsText

Route36Route37GateCoolguyScript:
	opentext
	writetext Route36Route37GateCoolguyText
	waitbutton
	closetext
	wait 7
	turnobject ROUTE36ROUTE37GATE_COOLGUY, LEFT
	wait 5
	turnobject ROUTE36ROUTE37GATE_COOLGUY, DOWN
	wait 5
	turnobject ROUTE36ROUTE37GATE_COOLGUY, RIGHT
	wait 7
	opentext
	writetext Route36Route37GateCoolguyText2
	waitbutton
	closetext
	end

Route36Route37GateOfficerText:
	text "Going to Ecruteak"
	line "City? I've lost"
	cont "count of how"
	cont "many trainers"
	cont "went by today."
	done

Route36Route37GateGrampsText:
	text "My friends are"
	line "all out in Route"
	cont "37 trying to"
	cont "figure out a"
	cont "mystery..."

	para "Me? No, thank"
	line "you. This occult"
	cont "stuff doesn't"
	cont "interest me."
	done

Route36Route37GateCoolguyText:
	text "Whew! I spent all"
	line "day out there"
	cont "trying to find out"
	cont "more about this so"
	cont "called mystery."

	para "Apparently one of"
	line "the monks in"
	cont "Ecruteak is really"
	cont "fond of riddles,"

	para "and he set up some"
	line "super cool prize"
	cont "for whoever can"
	cont "solve it."
	done

Route36Route37GateCoolguyText2:
	text "What? That's"
	line "everything I know."
	done

Route36Route37Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_37, 1
	warp_event  5,  0, ROUTE_37, 2
	warp_event  4,  7, ROUTE_36, 5
	warp_event  5,  7, ROUTE_36, 5

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route36Route37GateOfficerScript, -1
	object_event  7,  5, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route36Route37GateGrampsScript, -1
	object_event  0,  1, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36Route37GateCoolguyScript, -1
