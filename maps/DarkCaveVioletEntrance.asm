	const_def 2 ; object constants
	const DARKCAVEVIOLETENTRANCE_POKE_BALL1
	const DARKCAVEVIOLETENTRANCE_ROCK1
	const DARKCAVEVIOLETENTRANCE_ROCK2
	const DARKCAVEVIOLETENTRANCE_ROCK3
	const DARKCAVEVIOLETENTRANCE_ROCK4
	const DARKCAVEVIOLETENTRANCE_POKE_BALL2
	const DARKCAVEVIOLETENTRANCE_POKE_BALL3
	const DARKCAVEVIOLETENTRANCE_POKE_BALL4

DarkCaveVioletEntrance_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
DarkCaveFisherScript:
	trainer FISHER, TERRY, EVENT_BEAT_FISHER_TERRY, FisherTerrySeenText, FisherTerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherTerryAfterText
	waitbutton
	closetext
	end

DarkCaveVioletEntrancePotion:
	itemball POTION

DarkCaveVioletEntranceFullHeal:
	itemball FULL_HEAL

DarkCaveVioletEntranceHyperPotion:
	itemball HYPER_POTION

DarkCaveVioletEntranceDireHit:
	itemball DIRE_HIT

DarkCaveVioletEntranceRock:
	jumpstd smashrock

DarkCaveVioletEntranceHiddenElixer:
	hiddenitem ELIXER, EVENT_DARK_CAVE_VIOLET_ENTRANCE_HIDDEN_ELIXER
	
FisherTerryAfterText:
	text "I can't even see"
	line "my bobber!"
	done

FisherTerrySeenText:
	text "Fishing in the"
	line "dark is fun!"
	done

FisherTerryBeatenText:
	text "Impossible!"
	done

DarkCaveVioletEntrance_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5, 31, ROUTE_31, 3
	warp_event 11,  7, DARK_CAVE_BLACKTHORN_ENTRANCE, 2
	warp_event 35, 17, ROUTE_46, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 28,  2, BGEVENT_ITEM, DarkCaveVioletEntranceHiddenElixer

	db 9 ; object events
	object_event 13, 27, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, DarkCaveFisherScript, -1
	object_event  5, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntrancePotion, EVENT_DARK_CAVE_VIOLET_ENTRANCE_POTION
	object_event 20, 12, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveVioletEntranceRock, -1
	object_event 33, 15, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveVioletEntranceRock, -1
	object_event 28,  5, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveVioletEntranceRock, -1
	object_event 29,  3, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveVioletEntranceRock, -1
	object_event 16,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceFullHeal, EVENT_DARK_CAVE_VIOLET_ENTRANCE_FULL_HEAL
	object_event 29, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceHyperPotion, EVENT_DARK_CAVE_VIOLET_ENTRANCE_HYPER_POTION
	object_event  9,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceDireHit, EVENT_DARK_CAVE_VIOLET_ENTRANCE_DIRE_HIT
