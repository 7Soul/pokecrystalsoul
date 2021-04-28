; PrintDayCareText.TextTable indexes
	const_def
	const DAYCARETEXT_MAN_INTRO
	const DAYCARETEXT_MAN_EGG
	const DAYCARETEXT_LADY_INTRO
	const DAYCARETEXT_LADY_EGG
	const DAYCARETEXT_WHICH_ONE
	const DAYCARETEXT_DEPOSIT
	const DAYCARETEXT_CANT_BREED_EGG
	const DAYCARETEXT_LAST_MON
	const DAYCARETEXT_LAST_ALIVE_MON
	const DAYCARETEXT_COME_BACK_LATER
	const DAYCARETEXT_REMOVE_MAIL
	const DAYCARETEXT_GENIUSES
	const DAYCARETEXT_ASK_WITHDRAW
	const DAYCARETEXT_WITHDRAW
	const DAYCARETEXT_GOT_BACK
	const DAYCARETEXT_TOO_SOON
	const DAYCARETEXT_PARTY_FULL
	const DAYCARETEXT_NOT_ENOUGH_MONEY
	const DAYCARETEXT_OH_FINE
	const DAYCARETEXT_COME_AGAIN

DayCareMan:
	ld hl, wDayCareMan
	bit DAYCAREMAN_HAS_MON_F, [hl]
	jr nz, .AskWithdrawMon
	ld hl, wDayCareMan
	ld a, DAYCARETEXT_MAN_INTRO
	call DayCareManIntroText
	jr c, .cancel
	call DayCareAskDepositPokemon
	jr c, .print_text
	farcall DepositMonWithDayCareMan
	ld hl, wDayCareMan
	set DAYCAREMAN_HAS_MON_F, [hl]
	call DayCare_DepositPokemonText
	call DayCare_InitBreeding
	ret

.AskWithdrawMon:
	farcall GetBreedMon1LevelGrowth
	ld hl, wBreedMon1Nick
	call GetPriceToRetrieveBreedmon
	call DayCare_AskWithdrawBreedMon
	jr c, .print_text
	farcall RetrieveMonFromDayCareMan
	call DayCare_GetBackMonForMoney
	ld hl, wDayCareMan
	res DAYCAREMAN_HAS_MON_F, [hl]
	res DAYCAREMAN_MONS_COMPATIBLE_F, [hl]
	jr .cancel

.print_text
	call PrintDayCareText

.cancel
	ld a, DAYCARETEXT_COME_AGAIN
	call PrintDayCareText
	ret

DayCareLady:
	ld hl, wDayCareLady
	bit DAYCARELADY_HAS_MON_F, [hl]
	jr nz, .AskWithdrawMon
	ld hl, wDayCareLady
	ld a, DAYCARETEXT_LADY_INTRO
	call DayCareLadyIntroText
	jr c, .cancel
	call DayCareAskDepositPokemon
	jr c, .print_text
	farcall DepositMonWithDayCareLady
	ld hl, wDayCareLady
	set DAYCARELADY_HAS_MON_F, [hl]
	call DayCare_DepositPokemonText
	call DayCare_InitBreeding
	ret

.AskWithdrawMon:
	farcall GetBreedMon2LevelGrowth
	ld hl, wBreedMon2Nick
	call GetPriceToRetrieveBreedmon
	call DayCare_AskWithdrawBreedMon
	jr c, .print_text
	farcall RetrieveMonFromDayCareLady
	call DayCare_GetBackMonForMoney
	ld hl, wDayCareLady
	res DAYCARELADY_HAS_MON_F, [hl]
	ld hl, wDayCareMan
	res DAYCAREMAN_MONS_COMPATIBLE_F, [hl]
	jr .cancel

.print_text
	call PrintDayCareText

.cancel
	ld a, DAYCARETEXT_COME_AGAIN
	call PrintDayCareText
	ret

DayCareLadyIntroText:
	bit DAYCARELADY_ACTIVE_F, [hl]
	jr nz, .okay
	set DAYCARELADY_ACTIVE_F, [hl]
	inc a
.okay
	call PrintDayCareText
	call YesNoBox
	ret

DayCareManIntroText:
	set DAYCAREMAN_ACTIVE_F, [hl]
	call PrintDayCareText
	call YesNoBox
	ret

DayCareAskDepositPokemon:
	ld a, [wPartyCount]
	cp 2
	jr c, .OnlyOneMon
	ld a, DAYCARETEXT_WHICH_ONE
	call PrintDayCareText
	ld b, PARTYMENUACTION_GIVE_MON
	farcall SelectTradeOrDayCareMon
	jr c, .Declined
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .Egg
	farcall CheckCurPartyMonFainted
	jr c, .OutOfUsableMons
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld d, [hl]
	farcall ItemIsMail
	jr c, .HoldingMail
	ld hl, wPartyMonNicknames
	ld a, [wCurPartyMon]
	call GetNick
	and a
	ret

.Declined:
	ld a, DAYCARETEXT_OH_FINE
	scf
	ret

.Egg:
	ld a, DAYCARETEXT_CANT_BREED_EGG
	scf
	ret

.OnlyOneMon:
	ld a, DAYCARETEXT_LAST_MON
	scf
	ret

.OutOfUsableMons:
	ld a, DAYCARETEXT_LAST_ALIVE_MON
	scf
	ret

.HoldingMail:
	ld a, DAYCARETEXT_REMOVE_MAIL
	scf
	ret

.DummyText:
	;
	text_jump UnknownText_0x1bdaa7
	db "@"

DayCare_DepositPokemonText:
	ld a, DAYCARETEXT_DEPOSIT
	call PrintDayCareText
	ld a, [wCurPartySpecies]
	call PlayMonCry
	ld a, DAYCARETEXT_COME_BACK_LATER
	call PrintDayCareText
	ret

DayCare_AskWithdrawBreedMon:
	ld a, [wStringBuffer2 + 1]
	and a
	jr nz, .grew_at_least_one_level
	ld a, DAYCARETEXT_TOO_SOON
	call PrintDayCareText
	call YesNoBox
	jr c, .refused
	jr .check_money

.grew_at_least_one_level
	ld a, DAYCARETEXT_GENIUSES
	call PrintDayCareText
	call YesNoBox
	jr c, .refused
	ld a, DAYCARETEXT_ASK_WITHDRAW
	call PrintDayCareText
	call YesNoBox
	jr c, .refused

.check_money
	ld de, wMoney
	ld bc, wStringBuffer2 + 2
	farcall CompareMoney
	jr c, .not_enough_money
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr nc, .PartyFull
	and a
	ret

.refused
	ld a, DAYCARETEXT_OH_FINE
	scf
	ret

.not_enough_money
	ld a, DAYCARETEXT_NOT_ENOUGH_MONEY
	scf
	ret

.PartyFull:
	ld a, DAYCARETEXT_PARTY_FULL
	scf
	ret

DayCare_GetBackMonForMoney:
	ld bc, wStringBuffer2 + 2
	ld de, wMoney
	farcall TakeMoney
	ld a, DAYCARETEXT_WITHDRAW
	call PrintDayCareText
	ld a, [wCurPartySpecies]
	call PlayMonCry
	ld a, DAYCARETEXT_GOT_BACK
	call PrintDayCareText
	ret

GetPriceToRetrieveBreedmon:
	ld a, b
	ld [wStringBuffer2], a
	ld a, d
	ld [wStringBuffer2 + 1], a
	ld de, wStringBuffer1
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, 0
	ld bc, 100
	ld a, [wStringBuffer2 + 1]
	call AddNTimes
	ld de, 100
	add hl, de
	xor a
	ld [wStringBuffer2 + 2], a
	ld a, h
	ld [wStringBuffer2 + 3], a
	ld a, l
	ld [wStringBuffer2 + 4], a
	ret

PrintDayCareText:
	ld e, a
	ld d, 0
	ld hl, .TextTable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	ret

.TextTable:
; entries correspond to DAYCARETEXT_* constants
	dw .DayCareManIntro ; 00
	dw .DayCareManOddEgg ; 01
	dw .DayCareLadyIntro ; 02
	dw .DayCareLadyOddEgg ; 03
	dw .WhichOne ; 04
	dw .OkayIllRaiseYourMon ; 05
	dw .CantAcceptEgg ; 06
	dw .JustOneMon ; 07
	dw .LastHealthyMon ; 08
	dw .ComeBackForItLater ; 09
	dw .RemoveMail ; 0a
	dw .AreWeGeniusesOrWhat ; 0b
	dw .AskRetrieveMon ; 0c
	dw .PerfectHeresYourMon ; 0d
	dw .GotBackMon ; 0e
	dw .ImmediatelyWithdrawMon ; 0f
	dw .PartyFull ; 10
	dw .NotEnoughMoney ; 11
	dw .OhFineThen ; 12
	dw .ComeAgain ; 13

.DayCareManIntro:
	; I'm the DAY-CARE MAN. Want me to raise a #MON?
	text_jump UnknownText_0x1bdaa9
	db "@"

.DayCareManOddEgg:
	; I'm the DAY-CARE MAN. Do you know about EGGS? I was raising #MON with my wife, you see. We were shocked to find an EGG! How incredible is that? So, want me to raise a #MON?
	text_jump UnknownText_0x1bdad8
	db "@"

.DayCareLadyIntro:
	; I'm the DAY-CARE LADY. Should I raise a #MON for you?
	text_jump UnknownText_0x1bdb85
	db "@"

.DayCareLadyOddEgg:
	; I'm the DAY-CARE LADY. Do you know about EGGS? My husband and I were raising some #MON, you see. We were shocked to find an EGG! How incredible could that be? Should I raise a #MON for you?
	text_jump UnknownText_0x1bdbbb
	db "@"

.WhichOne:
	; What should I raise for you?
	text_jump UnknownText_0x1bdc79
	db "@"

.JustOneMon:
	; Oh? But you have just one #MON.
	text_jump UnknownText_0x1bdc97
	db "@"

.CantAcceptEgg:
	; Sorry, but I can't accept an EGG.
	text_jump UnknownText_0x1bdcb8
	db "@"

.RemoveMail:
	; Remove MAIL before you come see me.
	text_jump UnknownText_0x1bdcda
	db "@"

.LastHealthyMon:
	; If you give me that, what will you battle with?
	text_jump UnknownText_0x1bdcff
	db "@"

.OkayIllRaiseYourMon:
	; OK. I'll raise your @ .
	text_jump UnknownText_0x1bdd30
	db "@"

.ComeBackForItLater:
	; Come back for it later.
	text_jump UnknownText_0x1bdd4b
	db "@"

.AreWeGeniusesOrWhat:
	; Are we geniuses or what? Want to see your @ ?
	text_jump UnknownText_0x1bdd64
	db "@"

.AskRetrieveMon:
	; Your @ has grown a lot. By level, it's grown by @ . If you want your #MON back, it will cost ¥@ .
	text_jump UnknownText_0x1bdd96
	db "@"

.PerfectHeresYourMon:
	; Perfect! Here's your #MON.
	text_jump UnknownText_0x1bde04
	db "@"

.GotBackMon:
	; got back @ .
	text_jump UnknownText_0x1bde1f
	db "@"

.ImmediatelyWithdrawMon:
	; Huh? Back already? Your @ needs a little more time with us. If you want your #MON back, it will cost ¥100.
	text_jump UnknownText_0x1bde32
	db "@"

.PartyFull:
	; You have no room for it.
	text_jump UnknownText_0x1bdea2
	db "@"

.NotEnoughMoney:
	; You don't have enough money.
	text_jump UnknownText_0x1bdebc
	db "@"

.OhFineThen:
	; Oh, fine then.
	text_jump UnknownText_0x1bded9
	db "@"

.ComeAgain:
	; Come again.
	text_jump UnknownText_0x1bdee9
	db "@"

DayCareManOutside:
	ld hl, wDayCareMan
	bit DAYCAREMAN_HAS_EGG_F, [hl]
	jr nz, .AskGiveEgg
	ld hl, .NotYet
	call PrintText
	ret

.NotYet:
	; Not yet…
	text_jump UnknownText_0x1bdef6
	db "@"

.AskGiveEgg:
	ld hl, .IntroText
	call PrintText
	call YesNoBox
	jr c, .Declined
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr nc, .PartyFull
	call DayCare_GiveEgg
	ld hl, wDayCareMan
	res DAYCAREMAN_HAS_EGG_F, [hl]
	call DayCare_InitBreeding
	ld hl, .GotEggText
	call PrintText
	ld de, SFX_GET_EGG_FROM_DAY_CARE_LADY
	call PlaySFX
	ld c, 120
	call DelayFrames
	ld hl, .TakeGoodCareOfItText
	jr .Load0

.Declined:
	ld hl, .IllKeepItThanksText

.Load0:
	call PrintText
	xor a ; FALSE
	ld [wScriptVar], a
	ret

.PartyFull:
	ld hl, .PartyFullText
	call PrintText
	ld a, TRUE
	ld [wScriptVar], a
	ret

.IntroText:
	; Ah, it's you! We were raising your #MON, and my goodness, were we surprised! Your #MON had an EGG! We don't know how it got there, but your #MON had it. You want it?
	text_jump UnknownText_0x1bdf00
	db "@"

.GotEggText:
	; received the EGG!
	text_jump UnknownText_0x1bdfa5
	db "@"

.TakeGoodCareOfItText:
	; Take good care of it.
	text_jump UnknownText_0x1bdfba
	db "@"

.IllKeepItThanksText:
	; Well then, I'll keep it. Thanks!
	text_jump UnknownText_0x1bdfd1
	db "@"

.PartyFullText:
	; You have no room in your party. Come back later.
	text_jump UnknownText_0x1bdff2
	db "@"

DayCare_GiveEgg:
	ld a, [wEggMonLevel]
	ld [wCurPartyLevel], a
	ld hl, wPartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	jr nc, .PartyFull
	inc a
	ld [hl], a

	ld c, a
	ld b, 0
	add hl, bc
	ld a, EGG
	ld [hli], a
	ld a, [wEggMonSpecies]
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	ld a, -1
	ld [hl], a

	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	call DayCare_GetCurrentPartyMember
	ld hl, wEggNick
	call CopyBytes

	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	call DayCare_GetCurrentPartyMember
	ld hl, wEggOT
	call CopyBytes

	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call DayCare_GetCurrentPartyMember
	ld hl, wEggMon
	ld bc, wEggMonEnd - wEggMon
	call CopyBytes

	call GetBaseData
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld b, h
	ld c, l
	ld hl, MON_ID + 1
	add hl, bc
	push hl
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	push bc
	ld b, FALSE
	predef CalcMonStats
	pop bc
	ld hl, MON_HP
	add hl, bc
	xor a
	ld [hli], a
	ld [hl], a
	and a
	ret

.PartyFull:
	scf
	ret

DayCare_GetCurrentPartyMember:
	ld a, [wPartyCount]
	dec a
	call AddNTimes
	ld d, h
	ld e, l
	ret

DayCare_InitBreeding:
	ld a, [wDayCareLady]
	bit DAYCARELADY_HAS_MON_F, a
	ret z
	ld a, [wDayCareMan]
	bit DAYCAREMAN_HAS_MON_F, a
	ret z
	callfar CheckBreedmonCompatibility
	ld a, [wBreedingCompatibility]
	and a
	ret z
	inc a
	ret z
	ld hl, wDayCareMan
	set DAYCAREMAN_MONS_COMPATIBLE_F, [hl]
.loop
	call Random
	cp 150 ; generates a number over 150
	jr c, .loop
	ld [wStepsToEgg], a
	xor a
	ld hl, wEggMon
	ld bc, wEggMonEnd - wEggMon
	call ByteFill
	ld hl, wEggNick
	ld bc, MON_NAME_LENGTH
	call ByteFill
	ld hl, wEggOT
	ld bc, NAME_LENGTH
	call ByteFill
	ld a, [wBreedMon1DVs]
	ld [wTempMonDVs], a
	ld a, [wBreedMon1DVs + 1]
	ld [wTempMonDVs + 1], a
	ld a, [wBreedMon1Species]
	ld [wCurPartySpecies], a
	ld a, TEMPMON
	ld [wMonType], a
	ld a, [wBreedMon1Species]
	cp DITTO
	ld a, $1
	jr z, .LoadWhichBreedmonIsTheMother
	ld a, [wBreedMon2Species]
	cp DITTO
	ld a, $0
	jr z, .LoadWhichBreedmonIsTheMother
	farcall GetGender
	ld a, $0
	jr z, .LoadWhichBreedmonIsTheMother
	inc a

.LoadWhichBreedmonIsTheMother:
	ld [wBreedMotherOrNonDitto], a
	and a
	ld a, [wBreedMon1Species]
	jr z, .GotMother
	ld a, [wBreedMon2Species]

.GotMother:
	ld [wCurPartySpecies], a
	callfar GetPreEvolution
	callfar GetPreEvolution
	ld a, EGG_LEVEL
	ld [wCurPartyLevel], a

; Nidoran♀ can give birth to either gender of Nidoran
	ld a, [wCurPartySpecies]
	cp NIDORAN_F
	jr nz, .GotEggSpecies
	call Random
	cp 50 percent + 1
	ld a, NIDORAN_F
	jr c, .GotEggSpecies
	ld a, NIDORAN_M
.GotEggSpecies:
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	ld [wEggMonSpecies], a

	call GetBaseData
	ld hl, wEggNick
	ld de, .String_EGG
	call CopyName2
	ld hl, wPlayerName
	ld de, wEggOT
	ld bc, NAME_LENGTH
	call CopyBytes
	xor a
	ld [wEggMonItem], a
	ld de, wEggMonMoves
	xor a
	ld [wBuffer1], a
	predef FillMoves
	farcall InitEggMoves
	ld hl, wEggMonID
	ld a, [wPlayerID]
	ld [hli], a
	ld a, [wPlayerID + 1]
	ld [hl], a
	ld a, [wCurPartyLevel]
	ld d, a
	callfar CalcExpAtLevel
	ld hl, wEggMonExp
	ldh a, [hMultiplicand]
	ld [hli], a
	ldh a, [hMultiplicand + 1]
	ld [hli], a
	ldh a, [hMultiplicand + 2]
	ld [hl], a
	xor a
	ld b, wEggMonDVs - wEggMonStatExp
	ld hl, wEggMonStatExp
.loop2
	ld [hli], a
	dec b
	jr nz, .loop2
	ld hl, wEggMonDVs
	ld a, $1A ; 0 to 25
	call RandomRange
	inc a
	ld [hl], a
.TryShiny
	call Random
	cp 5 percent ; 4.7%
	jr nc, .TryGender
	call Random
	cp 5 percent ; 4.7%
	jr nc, .TryGender
.set_shiny ; 0.16%
	set DV_SHINY_BIT, [hl] ; set shiny bit
.TryGender
	call Random
	ld b, a
	push bc
	ld a, [wEggMonSpecies]
	dec a
	ld hl, BaseData + BASE_GENDER
	ld bc, BASE_DATA_SIZE
	call AddNTimes
	pop bc
	ld a, BANK(BaseData)
	call GetFarByte

	ld hl, wEggMonDVs

	cp GENDER_UNKNOWN
	jr z, .end_gender

	and a ; GENDER_F0?
	jr z, .Male

	cp GENDER_F100
	jr z, .Female

; Values below the ratio are male, and vice versa.
	cp b
	jr c, .Male

.Female
	set 6, [hl] ; set gender bit
	jr .end_gender

.Male
	res 6, [hl] ; unset gender bit
	jr .end_gender

.end_gender
	ld a, [hl]
	ld [wEggMonDVs], a
.dvs_set
; Chance to not inherit a trait
	call Random
	cp 25 percent
	jr nc, .get_random_trait
; pass parent trait to egg
; if the one parent is ditto, check trait from other parent
	ld de, wBreedMon2Trait
	ld a, [wBreedMon1Species]
	cp DITTO
	jr z, .GotParentTrait
	ld de, wBreedMon1Trait
	ld a, [wBreedMon2Species]
	cp DITTO
	jr z, .GotParentTrait

	ld de, wBreedMon1Trait
	ld bc, wBreedMon2Trait
	call Random
	cp 50 percent
	jr nc, .GotParentTrait
	ld d, b
	ld e, c

.GotParentTrait: ; parent's trait
	call GetEggTraits
	jr c, .got_trait
	ld a, [de]
	ld b, a
	ld a, [wEggMonSpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld hl, wBaseTraits ; eggmon's traits list
	ld c, 4
.traits_loop
	ld a, [hl]
	cp b ; compare with parent's trait
	jr z, .got_trait
	dec c
	jr z, .get_random_trait
	inc hl
	jr .traits_loop

.get_random_trait
	ld hl, wBaseTraits
	call Random
	cp 30 percent ; 30%
	jr c, .got_random_trait
	inc hl
	cp 60 percent ; 30%
	jr c, .got_random_trait
	inc hl
	cp 85 percent ; 25%
	jr c, .got_random_trait
	inc hl ; 15%
.got_random_trait
	ld a, [hl]
.got_trait
	ld a, b
	ld hl, wEggMonTrait
	ld [hl], a	

.SkipTrait:
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, wEggMonMoves
	ld de, wEggMonPP
	predef FillPP
	ld hl, wMonOrItemNameBuffer
	ld de, wStringBuffer1
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wBaseEggSteps]
	ld hl, wEggMonHappiness
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, [wCurPartyLevel]
	ld [wEggMonLevel], a
	ret

.String_EGG:
	db "EGG@"

GetEggTraits:
	push hl
	push de
	push bc
	ld hl, EggTraitPointers
	ld a, [wEggMonSpecies]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, BANK(EggTraitPointers)
	call GetFarHalfword
	push hl
	ld c, 0
	dec hl
.count_traits_loop
	inc c
	inc hl
	ld a, BANK("Egg Traits")
	call GetFarByte
	cp -1	
	jr nz, .count_traits_loop
	
.reached_end
	pop hl
	ld a, c
	call RandomRange

; go to hl according to move number
.get_position
	ld c, a
	ld b, 0
	add hl, bc

; get trait from hl
	pop bc
	pop de
	ld a, [de]
	ld b, a ; parent's trait
	ld a, BANK("Egg Traits")
	ld c, 4
.traits_loop
	call GetFarByte
	cp b ; compare with parent's trait
	jr z, .got_trait
	dec c
	jr z, .no_egg_traits
	inc hl
	jr .traits_loop
.no_egg_traits
	pop hl
	and a
	ret
.got_trait
	pop hl
	scf
	ret
