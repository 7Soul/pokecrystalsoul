	const_def 2 ; object constants
	const NEWBARKPOKECENTER1F_NURSE
	const NEWBARKPOKECENTER1F_POKEFAN_M
	const NEWBARKPOKECENTER1F_COOLTRAINER_F
	const NEWBARKPOKECENTER1F_GYM_GUY
	const NEWBARKPOKECENTER1F_CLERK

NewBarkPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NewBarkPokecenter1FNurseScript:
	jumpstd pokecenternurse

NewBarkPokecenter1FPokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer NewBarkPokecenter1FPokefanMText

.mobile
	jumptextfaceplayer NewBarkPokecenter1FPokefanMTextMobile

NewBarkPokecenter1FCooltrainerFScript:
	jumptextfaceplayer NewBarkPokecenter1FCooltrainerFText

NewBarkPokecenter1FGymGuyScript:
	jumptextfaceplayer NewBarkPokecenter1FGymGuyText

NewBarkMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_TOWN
	closetext
	end

NewBarkPokecenter1FPokefanMText:
	text "The way the KIMONO"
	line "GIRLS dance is"

	para "marvelous. Just"
	line "like the way they"
	cont "use their #MON."
	done

NewBarkPokecenter1FPokefanMTextMobile:
	text "You must be hoping"
	line "to battle more"

	para "people, right?"
	line "There's apparently"

	para "some place where"
	line "trainers gather."

	para "Where, you ask?"

	para "It's a little past"
	line "OLIVINE CITY."
	done

NewBarkPokecenter1FCooltrainerFText:
	text "MORTY, the GYM"
	line "LEADER, is soooo"
	cont "cool."

	para "His #MON are"
	line "really tough too."
	done

NewBarkPokecenter1FGymGuyText:
	text "LAKE OF RAGE…"

	para "The appearance of"
	line "a GYARADOS swarm…"

	para "I smell a conspir-"
	line "acy. I know it!"
	done

NewBarkPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, NEW_BARK_TOWN, 5
	warp_event  6,  7, NEW_BARK_TOWN, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkPokecenter1FNurseScript, -1
	object_event 12,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkPokecenter1FCooltrainerFScript, -1
	object_event  9,  1, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NewBarkPokecenter1FGymGuyScript, -1
	object_event 12,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkMartClerkScript, -1
