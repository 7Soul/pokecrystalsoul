	const_def 2 ; object constants
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4
	const PLAYERSHOUSE1F_POKEFAN_F

PlayersHouse1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

MeetMomLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetMomRightScript:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYER, LEFT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsTowardPlayerMovement
	jump MeetMomScript

.OnRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovement
MeetMomScript:
	opentext
	writetext ElmsLookingForYouText
	buttonsound
	stringtotext GearName, MEM_BUFFER_1
	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_FINISHED
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomGivesPokegearText
	buttonsound
; 	special SetDayOfWeek
; .SetDayOfWeek:
; 	writetext IsItDSTText
; 	yesorno
; 	iffalse .WrongDay
; 	special InitialSetDSTFlag
; 	yesorno
; 	iffalse .SetDayOfWeek
; 	jump .DayOfWeekDone

; .WrongDay:
; 	special InitialClearDSTFlag
; 	yesorno
; 	iffalse .SetDayOfWeek
; .DayOfWeekDone:
; 	writetext ComeHomeForDSTText
	; yesorno
	; iffalse .ExplainPhone
	; jump .KnowPhone

; .KnowPhone:
	; writetext KnowTheInstructionsText
	; buttonsound
	; jump .FinishPhone

; .ExplainPhone:
	; writetext DontKnowTheInstructionsText
	; buttonsound
	; jump .FinishPhone

; .FinishPhone:
	; writetext InstructionsNextText
	; waitbutton
	; closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft
	jump .Finish

.FromRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsBackMovement
	jump .Finish

.FromLeft:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackMovement
	jump .Finish

.Finish:
	if DEF(_DEBUG)
	setflag ENGINE_POKEDEX
	setflag ENGINE_UNOWN_DEX
	setflag ENGINE_MAP_CARD	
	setflag ENGINE_RADIO_CARD
	callasm SetHallOfFameFlag
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	clearevent EVENT_ROUTE_30_YOUNGSTER_JOEY
	setevent EVENT_ROUTE_30_BATTLE
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setmapscene NEW_BARK_TOWN, SCENE_FINISHED
	addcellnum PHONE_BILL
	setevent EVENT_RELEASED_THE_BEASTS
	special InitRoamMons
	special InitKantoRoamMons
	givecoins 9999
	givemoney 0, 100000
	giveitem MASTER_BALL, 99
	giveitem POKE_BALL, 99
	giveitem RARE_CANDY, 99
	giveitem MAX_REPEL, 99
	giveitem MAX_POTION, 99
	giveitem ETHER, 99
	giveitem MAX_REVIVE, 99
	giveitem TOUGH_HORN

	givepoke PIDGEY, 50
	givepoke HITMONLEE, 50
	givepoke HITMONCHAN, 50
	givepoke HITMONTOP, 50
	callasm CheatFillPokedex
	callasm CheatGiveTMs
	; callasm CheatGiveJohtoBadges
	; callasm CheatGiveKantoBadges
	callasm CheatGiveRandomBadges
	; setflag ENGINE_ZEPHYRBADGE
	; verbosegiveitem TM_MUD_BOMB
	; setflag ENGINE_HIVEBADGE
	; setflag ENGINE_PLAINBADGE
	; setflag ENGINE_STORMBADGE
	callasm CheatSetFlypoints
	; warp ROUTE_2, $5, $22
	warp ROUTE_46, $8, $10
	; warp ROUTE_40, $a, $a ; battle tower
	;warp ROUTE_37, $e, $a
	;warp ILEX_FOREST, $0, $21
	;warp ROUTE_34, $D, $24
endc

	closetext
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	end

MeetMomTalkedScript:
	playmusic MUSIC_MOM
	jump MeetMomScript

GearName:
	db "#GEAR@"

PlayersHouse1FReceiveItemStd:
	jumpstd receiveitem
	end

MomScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMomTalkedScript ; SCENE_DEFAULT
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetext HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfElmsErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special BankOfMom
	waitbutton
	closetext
	end

NeighborScript:
	faceplayer
	opentext
	checktime MORN
	iftrue .MornScript
	checktime DAY
	iftrue .DayScript
	checktime NITE
	iftrue .NiteScript

.MornScript:
	writetext NeighborMornIntroText
	buttonsound
	jump .Main

.DayScript:
	writetext NeighborDayIntroText
	buttonsound
	jump .Main

.NiteScript:
	writetext NeighborNiteIntroText
	buttonsound
	jump .Main

.Main:
	writetext NeighborText
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_POKEFAN_F, RIGHT
	end

TVScript:
	jumptext TVText

StoveScript:
	jumptext StoveText

SinkScript:
	jumptext SinkText

FridgeScript:
	jumptext FridgeText

MomTurnsTowardPlayerMovement:
	turn_head RIGHT
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	step_end

MomTurnsBackMovement:
	turn_head LEFT
	step_end

MomWalksBackMovement:
	slow_step LEFT
	step_end

ElmsLookingForYouText:
	text "Oh, <PLAYER>…! Our"
	line "neighbor, PROF."

	para "ELM, was looking"
	line "for you."

	para "He said he wanted"
	line "you to do some-"
	cont "thing for him."

	para "Oh! I almost for-"
	line "got! Your #MON"

	para "GEAR is back from"
	line "the repair shop."

	para "Here you go!"
	done

MomGivesPokegearText:
	text "Oh, the day of the"
	line "week isn't set."

	para "You mustn't forget"
	line "that!"
	done

IsItDSTText:
	text "Is it Daylight"
	line "Saving Time now?"
	done

ComeHomeForDSTText:
	text "Come home to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time."
	done

InstructionsNextText:
	text "Go now, Prof."
	line "Elm is waiting."
	done

HurryUpElmIsWaitingText:
	text "PROF.ELM is wait-"
	line "ing for you."

	para "Hurry up, baby!"
	done

SoWhatWasProfElmsErrandText:
	text "So, what was PROF."
	line "ELM's errand?"

	para "…"

	para "That does sound"
	line "challenging."

	para "But, you should be"
	line "proud that people"
	cont "rely on you."
	done

ImBehindYouText:
	text "<PLAYER>, do it!"

	para "I'm behind you all"
	line "the way!"
	done

NeighborMornIntroText:
	text "Good morning,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborDayIntroText:
	text "Hello, <PLAY_G>!"
	line "I'm visiting!"
	done

NeighborNiteIntroText:
	text "Good evening,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborText:
	text "<PLAY_G>, have you"
	line "heard?"

	para "My daughter is"
	line "adamant about"

	para "becoming PROF."
	line "ELM's assistant."

	para "She really loves"
	line "#MON!"
	done

StoveText:
	text "Mom's specialty!"

	para "CINNABAR VOLCANO"
	line "BURGER!"
	done

SinkText:
	text "The sink is spot-"
	line "less. Mom likes it"
	cont "clean."
	done

FridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "FRESH WATER and"
	line "tasty LEMONADE!"
	done

TVText:
	text "There's a movie on"
	line "TV: Stars dot the"

	para "sky as two boys"
	line "ride on a train…"

	para "I'd better get"
	line "rolling too!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, NEW_BARK_TOWN, 2
	warp_event  7,  7, NEW_BARK_TOWN, 2
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	db 2 ; coord events
	coord_event  8,  4, SCENE_DEFAULT, MeetMomLeftScript
	coord_event  9,  4, SCENE_DEFAULT, MeetMomRightScript

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, StoveScript
	bg_event  1,  1, BGEVENT_READ, SinkScript
	bg_event  2,  1, BGEVENT_READ, FridgeScript
	bg_event  4,  1, BGEVENT_READ, TVScript

	db 5 ; object events
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  4,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NeighborScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR


if def(_DEBUG)
CheatFillPokedex:
	ld a, BULBASAUR
	dec a
.loop
	; cp $c8 ; UNOWN - 1
	; jr z, .skip
	push af
	call SetSeenAndCaughtMon
	pop af
.skip
	inc a
	cp CELEBI
	jr nz, .loop
	ret

SetHallOfFameFlag:
	ld hl, wStatusFlags
	set STATUSFLAGS_HALL_OF_FAME_F, [hl]
	ret

CheatGiveJohtoBadges:
	ld a, ENGINE_ZEPHYRBADGE
.loop
	push af
	ld d, 0
	ld e, a
	ld b, SET_FLAG
	farcall EngineFlagAction
	pop af

	inc a
	cp ENGINE_RISINGBADGE + 1
	jr nz, .loop
	ret

CheatGiveKantoBadges:
	ld a, ENGINE_BOULDERBADGE
.loop
	push af
	ld d, 0
	ld e, a
	ld b, SET_FLAG
	farcall EngineFlagAction
	pop af

	inc a
	cp ENGINE_EARTHBADGE + 1
	jr nz, .loop
	ret

CheatGiveRandomBadges:
	ld a, ENGINE_ZEPHYRBADGE
.loop
	cp ENGINE_EARTHBADGE + 1
	ret nc

	ld b, a
	call Random
	cp 40 percent
	ld a, b
	inc a
	jr nc, .loop

	push af
	ld d, 0
	ld e, a
	ld b, SET_FLAG
	farcall EngineFlagAction
	pop af

	jr .loop

CheatSetFlypoints:
	ld a, ENGINE_FLYPOINT_PLAYERS_HOUSE
.loop
	push af
	ld d, 0
	ld e, a
	ld b, SET_FLAG
	farcall EngineFlagAction
	pop af

	inc a
	cp ENGINE_FLYPOINT_SILVER_CAVE
	jr nz, .loop
	ret

CheatGiveTMs:
	ld a, TM_DYNAMICPUNCH
.loop
	push af
	ld [wCurItem], a	
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld hl, wNumItems
	call ReceiveItem

	pop af
	inc a
	cp TM_HYPER_SONAR + 1
	jr nz, .loop
	ret
endc
