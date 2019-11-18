	const_def 2 ; object constants
	const OLIVINEPOKECENTER1F_NURSE
	const OLIVINEPOKECENTER1F_FISHING_GURU
	const OLIVINEPOKECENTER1F_FISHER
	const OLIVINEPOKECENTER1F_TEACHER
	const OLIVINEPOKECENTER1F_CLERK

OlivinePokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivinePokecenter1FNurseScript:
	jumpstd pokecenternurse

OlivinePokecenter1FFishingGuruScript:
	jumpstd happinesschecknpc

OlivinePokecenter1FFisherScript:
	jumptextfaceplayer OlivinePokecenter1FFisherText

OlivinePokecenter1FTeacherScript:
	jumptextfaceplayer OlivinePokecenter1FTeacherText

OlivineMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_CITY
	closetext
	end

OlivinePokecenter1FFisherText:
	text "The SAILOR in the"
	line "OLIVINE CAFE next"

	para "door is really"
	line "generous."

	para "He taught my"
	line "#MON STRENGTH."

	para "Now it can move"
	line "big boulders."
	done

OlivinePokecenter1FTeacherText:
	text "There's a person"
	line "in CIANWOOD CITY"
	cont "across the sea."

	para "I heard him brag-"
	line "ging about his"
	cont "rare #MON."
	done

OlivinePokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, OLIVINE_CITY, 1
	warp_event  6,  7, OLIVINE_CITY, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FNurseScript, -1
	object_event 10,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FFishingGuruScript, -1
	object_event  4,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FFisherScript, -1
	object_event  9,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FTeacherScript, -1
	object_event 12,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineMartClerkScript, -1
