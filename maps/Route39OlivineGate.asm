	const_def 2 ; object constants
	const ROUTE39OLIVINEGATE_OFFICER

Route39OlivineGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route39OlivineGateOfficerScript:
	jumptextfaceplayer Route39OlivineGateOfficerText

Route39OlivineGateOfficerText:
	text "Where did you say"
	line "you're from?"

	para "NEW BARK TOWN?"

	para "PROF.ELM lives"
	line "over there, right?"

	para "You've come a long"
	line "way to get here."
	done

Route39OlivineGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_39, 3
	warp_event  5,  0, ROUTE_39, 4
	warp_event  4,  7, OLIVINE_CITY, 11
	warp_event  5,  7, OLIVINE_CITY, 11

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route39OlivineGateOfficerScript, -1
