	const_def 2 ; object constants
	const BLACKTHORNPOKECENTER1F_NURSE
	const BLACKTHORNPOKECENTER1F_GENTLEMAN
	const BLACKTHORNPOKECENTER1F_TWIN
	const BLACKTHORNPOKECENTER1F_COOLTRAINER_M
	const BLACKTHORNPOKECENTER1F_CLERK

BlackthornPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlackthornPokecenter1FNurseScript:
	jumpstd pokecenternurse

BlackthornPokecenter1FGentlemanScript:
	jumptextfaceplayer BlackthornPokecenter1FGentlemanText

BlackthornPokecenter1FTwinScript:
	jumptextfaceplayer BlackthornPokecenter1FTwinText

BlackthornPokecenter1FCooltrainerMScript:
	jumpstd happinesschecknpc

BlackthornMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_CITY
	closetext
	end

BlackthornPokecenter1FGentlemanText:
	text "Deep inside far-"
	line "off INDIGO PLATEAU"

	para "is the #MON"
	line "LEAGUE."

	para "I hear the best"
	line "trainers gather"

	para "there from around"
	line "the country."
	done

BlackthornPokecenter1FTwinText:
	text "There was this"
	line "move I just had"

	para "to teach my #-"
	line "MON."

	para "So I got the MOVE"
	line "DELETER to make it"
	cont "forget an HM move."
	done

BlackthornPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, BLACKTHORN_CITY, 5
	warp_event  6,  7, BLACKTHORN_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornPokecenter1FNurseScript, -1
	object_event  7,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornPokecenter1FGentlemanScript, -1
	object_event  1,  4, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornPokecenter1FTwinScript, -1
	object_event 10,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornPokecenter1FCooltrainerMScript, -1
	object_event 12,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornMartClerkScript, -1
