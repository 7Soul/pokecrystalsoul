GiveParkBalls: ; starts victory count
	xor a
	ld [wContestMon], a
	ld a, 1
	ld [wParkBallsRemaining], a
	farcall StartBugContestTimer
	ret

GetContestType:
; SAT night (14) means no contest
	call GetWeekday ; 0 to 6 (SUN to SAT)
	add a ; 0, 2, 4, 6... 12
	ld b, a
	ld a, [wTimeOfDay]
	cp NITE_F
	jr c, .day
	inc b
.day
	ld a, b
	ld [wScriptVar], a
	ld [wNamedObjectIndexBuffer], a
	predef GetTypeName
	ret

CheckContestEntry: ; Checks if partymon1 is the right type
	ld a, [wPartyMon1Species]
	ld [wCurSpecies], a
	call GetBaseData
	call GetContestType
	ld a, [wScriptVar]
	ld b, a
	ld a, [wBaseType1]
	cp b
	jr z, .right_type
	ld a, [wBaseType2]
	cp b
	jr z, .right_type
	ld a, FALSE
	ld [wScriptVar], a
	ret
.right_type
	ld a, TRUE
	ld [wScriptVar], a
	ret

BugCatchingContestBattleScript::
	writecode VAR_BATTLETYPE, BATTLETYPE_CONTEST
	randomwildmon
	startbattle
	reloadmapafterbattle
	copybytetovar wParkBallsRemaining
	iffalse BugCatchingContestOutOfBallsScript
	end

BugCatchingContestOverScript::
	playsound SFX_ELEVATOR_END
	opentext
	writetext BugCatchingContestText_BeeepTimesUp
	waitbutton
	jump BugCatchingContestReturnToGateScript

BugCatchingContestOutOfBallsScript:
	playsound SFX_ELEVATOR_END
	opentext
	writetext BugCatchingContestText_ContestIsOver
	waitbutton

BugCatchingContestReturnToGateScript:
	closetext
	jumpstd bugcontestresultswarp

BugCatchingContestText_BeeepTimesUp:
	; ANNOUNCER: BEEEP! Time's up!
	text_jump UnknownText_0x1bd2ca
	db "@"

BugCatchingContestText_ContestIsOver:
	; ANNOUNCER: The Contest is over!
	text_jump UnknownText_0x1bd2e7
	db "@"
