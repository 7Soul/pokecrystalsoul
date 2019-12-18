BattleText:: ; used only for BANK(BattleText)

BattleText_PlayerPickedUpPayDayMoney:
	text "<PLAYER> picked up"
	line "¥@"
	deciram wPayDayMoney, 3, 6
	text "!"
	prompt

WildPokemonAppearedText:
	text "Wild @"
	text_from_ram wEnemyMonNick
	text_start
	line "appeared!"
	done
	
WildHoldingText:
	text "It appears to be"
	line "holding an item!"
	prompt
	
TrainerHoldingText:
	text "It's holding a"
	line "@"
	text_from_ram wStringBuffer1
	text "!"
	prompt
	
ShinyPokemonAppearedText:
	text "A shiny @"
	text_from_ram wEnemyMonNick
	text_start
	line "appeared!!!"
	prompt

HookedPokemonAttackedText:
	text "The hooked"
	line "@"
	text_from_ram wEnemyMonNick
	text_start
	cont "attacked!"
	prompt

PokemonFellFromTreeText:
	text_from_ram wEnemyMonNick
	text " fell"
	line "out of the tree!"
	prompt

WildCelebiAppearedText:
	text "Wild @"
	text_from_ram wEnemyMonNick
	text_start
	line "appeared!"
	prompt

WantsToBattleText::
	text "<ENEMY>"
	line "wants to battle!"
	prompt

BattleText_WildFled:
	text "Wild @"
	text_from_ram wEnemyMonNick
	text_start
	line "fled!"
	prompt

BattleText_EnemyFled:
	text "Enemy @"
	text_from_ram wEnemyMonNick
	text_start
	line "fled!"
	prompt

HurtByPoisonText:
	text "<USER>"
	line "is hurt by poison!"
	prompt

HurtByBurnText:
	text "<USER>'s"
	line "hurt by its burn!"
	prompt

LeechSeedSapsText:
	text "LEECH SEED saps"
	line "<USER>!"
	prompt

HasANightmareText:
	text "<USER>"
	line "has a NIGHTMARE!"
	prompt

HurtByCurseText:
	text "<USER>'s"
	line "hurt by the CURSE!"
	prompt

SandstormHitsText:
	text "The SANDSTORM hits"
	line "<USER>!"
	prompt

PerishCountText:
	text "<USER>'s"
	line "PERISH count is @"
	deciram wDeciramBuffer, 1, 1
	text "!"
	prompt

BattleText_TargetRecoveredWithItem:
	text "<TARGET>"
	line "recovered with"
	cont "@"
	text_from_ram wStringBuffer1
	text "."
	prompt

BattleText_UserRecoveredPPUsing:
	text "<USER>"
	line "recovered PP using"
	cont "@"
	text_from_ram wStringBuffer1
	text "."
	prompt

BattleText_TargetWasHitByFutureSight:
	text "<TARGET>"
	line "was hit by FUTURE"
	cont "SIGHT!"
	prompt

BattleText_SafeguardFaded:
	text "<USER>'s"
	line "SAFEGUARD faded!"
	prompt

BattleText_MonsLightScreenFell:
	text_from_ram wStringBuffer1
	text " #MON's"
	line "LIGHT SCREEN fell!"
	prompt

BattleText_MonsReflectFaded:
	text_from_ram wStringBuffer1
	text " #MON's"
	line "REFLECT faded!"
	prompt

BattleText_MonsLeafShieldBroke:
	text_from_ram wStringBuffer1
	text " #MON's"
	line "LEAF SHIELD broke!"
	prompt

BattleText_RainContinuesToFall:
	text "Rain continues to"
	line "fall."
	prompt

BattleText_TheSunlightIsStrong:
	text "The sunlight is"
	line "strong."
	prompt

BattleText_TheSandstormRages:
	text "The SANDSTORM"
	line "rages."
	prompt

BattleText_TheRainStopped:
	text "The rain stopped."
	prompt

BattleText_TheSunlightFaded:
	text "The sunlight"
	line "faded."
	prompt

BattleText_TheSandstormSubsided:
	text "The SANDSTORM"
	line "subsided."
	prompt

BattleText_EnemyMonFainted:
	text "Enemy @"
	text_from_ram wEnemyMonNick
	text_start
	line "fainted!"
	prompt

GotMoneyForWinningText:
	text "<PLAYER> got ¥@"
	deciram wBattleReward, 3, 6
	text_start
	line "for winning!"
	prompt

BattleText_EnemyWasDefeated:
	text "<ENEMY>"
	line "was defeated!"
	prompt

TiedAgainstText:
	text "Tied against"
	line "<ENEMY>!"
	prompt

SentSomeToMomText:
	text "<PLAYER> got ¥@"
	deciram wBattleReward, 3, 6
	text_start
	line "for winning!"
	cont "Sent some to MOM!"
	prompt

SentHalfToMomText:
	text "Sent half to MOM!"
	prompt

SentAllToMomText:
	text "Sent all to MOM!"
	prompt

BattleText_0x80a4f:
	text "<RIVAL>: Huh? I"
	line "should've chosen"
	cont "your #MON!"
	prompt

BattleText_MonFainted:
	text_from_ram wBattleMonNick
	text_start
	line "fainted!"
	prompt

BattleText_UseNextMon:
	text "Use next #MON?"
	done

BattleText_0x80a93:
	text "<RIVAL>: Yes!"
	line "I guess I chose a"
	cont "good #MON!"
	prompt

LostAgainstText:
	text "Lost against"
	line "<ENEMY>!"
	prompt

BattleText_EnemyIsAboutToUseWillPlayerChangeMon:
	text "<ENEMY>"
	line "is about to use"
	cont "@"
	text_from_ram wEnemyMonNick
	text "."

	para "Will <PLAYER>"
	line "change #MON?"
	done

BattleText_EnemySentOut:
	text "<ENEMY>"
	line "sent out"
	cont "@"
	text_from_ram wEnemyMonNick
	text "!"
	done

BattleText_TheresNoWillToBattle:
	text "There's no will to"
	line "battle!"
	prompt

BattleText_AnEGGCantBattle:
	text "An EGG can't"
	line "battle!"
	prompt

BattleText_CantEscape2:
	text "Can't escape!"
	prompt

BattleText_TheresNoEscapeFromTrainerBattle:
	text "No! There's no"
	line "running from a"
	cont "trainer battle!"
	prompt

BattleText_GotAwaySafely:
	text "Got away safely!"
	prompt

BattleText_UserFledUsingAStringBuffer1:
	text "<USER>"
	line "fled using a"
	cont "@"
	text_from_ram wStringBuffer1
	text "!"
	prompt

BattleText_CantEscape:
	text "Can't escape!"
	prompt

BattleText_UserHurtBySpikes:
	text "<USER>'s"
	line "hurt by SPIKES!"
	prompt

RecoveredUsingText:
	text "<TARGET>"
	line "recovered using a"
	cont "@"
	text_from_ram wStringBuffer1
	text "!"
	prompt

BattleText_UsersStringBuffer1Activated:
	text "<USER>'s"
	line "@"
	text_from_ram wStringBuffer1
	text_start
	cont "activated!"
	prompt

BattleText_ItemsCantBeUsedHere:
	text "Items can't be"
	line "used here."
	prompt

BattleText_MonIsAlreadyOut:
	text_from_ram wBattleMonNick
	text_start
	line "is already out."
	prompt

BattleText_MonCantBeRecalled:
	text_from_ram wBattleMonNick
	text_start
	line "can't be recalled!"
	prompt

BattleText_TheresNoPPLeftForThisMove:
	text "There's no PP left"
	line "for this move!"
	prompt

BattleText_TheMoveIsDisabled:
	text "The move is"
	line "DISABLED!"
	prompt

BattleText_MonHasNoMovesLeft:
	text_from_ram wBattleMonNick
	text_start
	line "has no moves left!"
	done

BattleText_TargetsEncoreEnded:
	text "<TARGET>'s"
	line "ENCORE ended!"
	prompt

BattleText_StringBuffer1GrewToLevel:
	text_from_ram wStringBuffer1
	text " grew to"
	line "level @"
	deciram wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79
	db "@@"

BattleText_WildMonIsEating:
	text "Wild @"
	text_from_ram wEnemyMonNick
	text_start
	line "is eating!"
	prompt

BattleText_WildMonIsAngry:
	text "Wild @"
	text_from_ram wEnemyMonNick
	text_start
	line "is angry!"
	prompt

FastAsleepText:
	text "<USER>"
	line "is fast asleep!"
	prompt

WokeUpText:
	text "<USER>"
	line "woke up!"
	prompt

FrozenSolidText:
	text "<USER>"
	line "is frozen solid!"
	prompt

FlinchedText:
	text "<USER>"
	line "flinched!"
	prompt

MustRechargeText:
	text "<USER>"
	line "must recharge!"
	prompt

DisabledNoMoreText:
	text "<USER>'s"
	line "disabled no more!"
	prompt

IsConfusedText:
	text "<USER>"
	line "is confused!"
	prompt

HurtItselfText:
	text "It hurt itself in"
	line "its confusion!"
	prompt

ConfusedNoMoreText:
	text "<USER>'s"
	line "confused no more!"
	prompt

BecameConfusedText:
	text "<TARGET>"
	line "became confused!"
	prompt
; ItemHealedConfusion

BattleText_ItemHealedConfusion: ; ItemHealedConfusion
	text "A @"
	text_from_ram wStringBuffer1
	text " rid"
	line "<TARGET>"
	cont "of its confusion."
	prompt

AlreadyConfusedText:
	text "<TARGET>'s"
	line "already confused!"
	prompt

BattleText_UsersHurtByStringBuffer1:
	text "<USER>'s"
	line "hurt by"
	cont "@"
	text_from_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserWasReleasedFromStringBuffer1:
	text "<USER>"
	line "was released from"
	cont "@"
	text_from_ram wStringBuffer1
	text "!"
	prompt

WhirlpoolTrapText:
	text "<TARGET>"
	line "was trapped!"
	prompt

FireSpinTrapText:
	text "<TARGET>"
	line "was trapped!"
	prompt
	
MagmaStormTrapText:
	text "<TARGET>"
	line "was trapped by"
	cont "swirling magma!"
	prompt
	
WrappedByText:
	text "<TARGET>"
	line "was WRAPPED"
	prompt

ClampedByText:
	text "<TARGET>"
	line "was CLAMPED"
	prompt

StoringEnergyText:
	text "<USER>"
	line "is storing energy!"
	prompt

UnleashedEnergyText:
	text "<USER>"
	line "unleashed energy!"
	prompt

BattleText_HarmonyStart:
	text "<USER>'s"
	line "in harmony with"
	cont "@"
	text_from_ram wStringBuffer1
	text "!"
	prompt
	
BattleText_HarmonyOver:
	text "<TARGET>'s"
	line "@"
	text_from_ram wStringBuffer1
	text " harmony"
	cont "is over!"
	prompt

HungOnText:
	text "<TARGET>"
	line "hung on with"
	cont "@"
	text_from_ram wStringBuffer1
	text "!"
	prompt

EnduredText:
	text "<TARGET>"
	line "ENDURED the hit!"
	prompt

InLoveWithText:
	text "<USER>"
	line "is in love with"
	cont "<TARGET>!"
	prompt

InfatuationText:
	text "<USER>'s"
	line "infatuation kept"
	cont "it from attacking!"
	prompt

DisabledMoveText:
	text "<USER>'s"
	line "@"
	text_from_ram wStringBuffer1
	text " is"
	cont "DISABLED!"
	prompt

LoafingAroundText:
	text_from_ram wBattleMonNick
	text " is"
	line "loafing around."
	prompt

BeganToNapText:
	text_from_ram wBattleMonNick
	text " began"
	line "to nap!"
	prompt

WontObeyText:
	text_from_ram wBattleMonNick
	text " won't"
	line "obey!"
	prompt

TurnedAwayText:
	text_from_ram wBattleMonNick
	text " turned"
	line "away!"
	prompt

IgnoredOrdersText:
	text_from_ram wBattleMonNick
	text " ignored"
	line "orders!"
	prompt

IgnoredSleepingText:
	text_from_ram wBattleMonNick
	text " ignored"
	line "orders…sleeping!"
	prompt

NoPPLeftText:
	text "But no PP is left"
	line "for the move!"
	prompt

HasNoPPLeftText:
	text "<USER>"
	line "has no PP left for"
	cont "@"
	text_from_ram wStringBuffer2
	text "!"
	prompt

WentToSleepText:
	text "<USER>"
	line "went to sleep!"
	done

RestedText:
	text "<USER>"
	line "fell asleep and"
	cont "became healthy!"
	done

RegainedHealthText:
	text "<USER>"
	line "regained health!"
	prompt

AttackMissedText:
	text "<USER>'s"
	line "attack missed!"
	prompt

AttackMissed2Text:
	text "<USER>'s"
	line "attack missed!"
	prompt

CrashedText:
	text "<USER>"
	line "kept going and"
	cont "crashed!"
	prompt

UnaffectedText:
	text "<TARGET>'s"
	line "unaffected!"
	prompt

DoesntAffectText:
	text "It doesn't affect"
	line "<TARGET>!"
	prompt

CriticalHitText:
	text "A critical hit!"
	prompt

OneHitKOText:
	text "It's a one-hit KO!"
	prompt

SuperEffectiveText:
	text "It's super-"
	line "effective!"
	prompt

NotVeryEffectiveText:
	text "It's not very"
	line "effective…"
	prompt

TookDownWithItText:
	text "<TARGET>"
	line "took down with it,"
	cont "<USER>!"
	prompt

RageBuildingText:
	text "<USER>'s"
	line "RAGE is building!"
	prompt

GotAnEncoreText:
	text "<TARGET>"
	line "got an ENCORE!"
	prompt

SharedPainText:
	text "The battlers"
	line "shared pain!"
	prompt

TookAimText:
	text "<USER>"
	line "took aim!"
	prompt

SketchedText:
	text "<USER>"
	line "SKETCHED"
	cont "@"
	text_from_ram wStringBuffer1
	text "!"
	prompt

SpiteEffectText:
	text "<TARGET>'s"
	line "@"
	text_from_ram wStringBuffer1
	text " was"
	cont "reduced by @"
	deciram wDeciramBuffer, 1, 1
	text "!"
	prompt

BellChimedText:
	text "A bell chimed!"
	line ""
	prompt

FellAsleepText:
	text "<TARGET>"
	line "fell asleep!"
	prompt

AlreadyAsleepText:
	text "<TARGET>'s"
	line "already asleep!"
	prompt

WasPoisonedText:
	text "<TARGET>"
	line "was poisoned!"
	prompt

BadlyPoisonedText:
	text "<TARGET>'s"
	line "badly poisoned!"
	prompt

AlreadyPoisonedText:
	text "<TARGET>'s"
	line "already poisoned!"
	prompt

SuckedHealthText:
	text "Sucked health from"
	line "<TARGET>!"
	prompt

DreamEatenText:
	text "<TARGET>'s"
	line "dream was eaten!"
	prompt

WasBurnedText:
	text "<TARGET>"
	line "was burned!"
	prompt

DefrostedOpponentText:
	text "<TARGET>"
	line "was defrosted!"
	prompt

WasFrozenText:
	text "<TARGET>"
	line "was frozen solid!"
	prompt

WontRiseAnymoreText:
	text "<USER>'s"
	line "@"
	text_from_ram wStringBuffer2
	text " won't"
	cont "rise anymore!"
	prompt

WontDropAnymoreText:
	text "<TARGET>'s"
	line "@"
	text_from_ram wStringBuffer2
	text " won't"
	cont "drop anymore!"
	prompt

FledFromBattleText::
	text "<USER>"
	line "fled from battle!"
	prompt

FledInFearText:
	text "<TARGET>"
	line "fled in fear!"
	prompt

BlownAwayText:
	text "<TARGET>"
	line "was blown away!"
	prompt

PlayerHitTimesText:
	text "Hit @"
	deciram wPlayerDamageTaken, 1, 1
	text " times!"
	prompt

EnemyHitTimesText:
	text "Hit @"
	deciram wEnemyDamageTaken, 1, 1
	text " times!"
	prompt

MistText:
	text "<USER>'s"
	line "shrouded in MIST!"
	prompt

ProtectedByMistText:
	text "<TARGET>'s"
	line "protected by MIST."
	prompt

GettingPumpedText:
	interpret_data
	text "<USER>'s"
	line "getting pumped!"
	prompt

RecoilText:
	text "<USER>'s"
	line "hit with recoil!"
	prompt

MadeSubstituteText:
	text "<USER>"
	line "made a SUBSTITUTE!"
	prompt

HasSubstituteText:
	text "<USER>"
	line "has a SUBSTITUTE!"
	prompt

TooWeakSubText:
	text "Too weak to make"
	line "a SUBSTITUTE!"
	prompt

SubTookDamageText:
	text "The SUBSTITUTE"
	line "took damage for"
	cont "<TARGET>!"
	prompt
	
WaterResistantText:
	text "<TARGET>'s"
	line "WATER resistant!"
	prompt

SubFadedText:
	text "<TARGET>'s"
	line "SUBSTITUTE faded!"
	prompt

LearnedMoveText:
	text "<USER>"
	line "learned"
	cont "@"
	text_from_ram wStringBuffer1
	text "!"
	prompt

WasSeededText:
	text "<TARGET>"
	line "was seeded!"
	prompt

EvadedText:
	text "<TARGET>"
	line "evaded the attack!"
	prompt

WasDisabledText:
	text "<TARGET>'s"
	line "@"
	text_from_ram wStringBuffer1
	text " was"
	cont "DISABLED!"
	prompt

CoinsScatteredText:
	text "Coins scattered"
	line "everywhere!"
	prompt

TransformedTypeText:
	text "<USER>"
	line "transformed into"
	cont "the @"
	text_from_ram wStringBuffer1
	text "-type!"
	prompt

EliminatedStatsText:
	text "All stat changes"
	line "were eliminated!"
	prompt

TransformedText:
	text "<USER>"
	line "TRANSFORMED into"
	cont "@"
	text_from_ram wStringBuffer1
	text "!"
	prompt

LightScreenEffectText:
	text "<USER>'s"
	line "SPCL.DEF rises if"
	cont "hit by SPECIAL!"
	prompt

ReflectEffectText:
	text "<USER>'s"
	line "DEFENSE rises if"
	cont "hit by PHYSICAL!"
	prompt

LeafShieldEffectText:
	text "<USER>'s"
	line "protected from"
	cont "WATER!"
	prompt

NothingHappenedText:
	text "But nothing"
	line "happened."
	prompt

ButItFailedText:
	text "But it failed!"
	prompt

ItFailedText:
	text "It failed!"
	prompt

DidntAffect1Text:
	text "It didn't affect"
	line "<TARGET>!"
	prompt

DidntAffect2Text:
	text "It didn't affect"
	line "<TARGET>!"
	prompt

HPIsFullText:
	text "<USER>'s"
	line "HP is full!"
	prompt

DraggedOutText:
	text "<USER>"
	line "was dragged out!"
	prompt

ParalyzedText:
	text "<TARGET>'s"
	line "paralyzed!"
	prompt

FullyParalyzedText:
	text "<USER>'s"
	line "fully paralyzed!"
	prompt

AlreadyParalyzedText:
	text "<TARGET>'s"
	line "already paralyzed!"
	prompt

ProtectedByText:
	text "<TARGET>'s"
	line "protected by"
	cont "@"
	text_from_ram wStringBuffer1
	text "!"
	prompt

MirrorMoveFailedText:
	text "The MIRROR MOVE"
	next "failed!"
	prompt

StoleText:
	text "<USER>"
	line "stole @"
	text_from_ram wStringBuffer1
	text_start
	cont "from its foe!"
	prompt

CantEscapeNowText:
	text "<TARGET>"
	line "can't escape now!"
	prompt

StartedNightmareText:
	text "<TARGET>"
	line "started to have a"
	cont "NIGHTMARE!"
	prompt

WasDefrostedText:
	text "<USER>"
	line "was defrosted!"
	prompt

PutACurseText:
	text "<USER>"
	line "cut its own HP and"

	para "put a CURSE on"
	line "<TARGET>!"
	prompt

ProtectedItselfText:
	text "<USER>"
	line "PROTECTED itself!"
	prompt

ProtectingItselfText:
	text "<TARGET>'s"
	line "PROTECTING itself!"
	done

SpikesText:
	text "SPIKES scattered"
	line "all around"
	cont "<TARGET>!"
	prompt

IdentifiedText:
	text "<TARGET> is"
	line "under the prism"
	cont "light."
	
	para "It became weak"
	line "to the elements!"
	prompt

StartPerishText:
	text "Both #MON will"
	line "faint in 3 turns!"
	prompt

SandstormBrewedText:
	text "A SANDSTORM"
	line "brewed!"
	prompt

BracedItselfText:
	text "<USER>"
	line "braced itself!"
	prompt

FellInLoveText:
	text "<TARGET>"
	line "fell in love!"
	prompt

CoveredByVeilText:
	text "<USER>'s"
	line "covered by a veil!"
	prompt

SafeguardProtectText:
	text "<TARGET>"
	line "is protected by"
	cont "SAFEGUARD!"
	prompt

MagnitudeText:
	text "Magnitude @"
	deciram wDeciramBuffer, 1, 1
	text "!"
	prompt

WildStormText:
	text "@"
	deciram wDeciramBuffer, 1, 1
	text " bolts strike"
	line "forward!"
	prompt

ReleasedByText:
	text "<USER>"
	line "was released by"
	cont "<TARGET>!"
	prompt

ShedLeechSeedText:
	text "<USER>"
	line "shed LEECH SEED!"
	prompt

BlewSpikesText:
	text "<USER>"
	line "blew away SPIKES!"
	prompt
	
BrickBreakText1:
	text "<USER> "
	line "breaks down the"
	cont "REFLECT!"
	prompt
	
BrickBreakText2:
	text "<USER> "
	line "breaks down the"
	cont "LIGHT SCREEN!"
	prompt
	
FireFlickText1:
	text "<USER>"
	line "flicks the BRN"
	cont "into a flame!"
	prompt	
	
FireFlickText2:
	text "<USER>"
	line "flicks the FIRE"
	cont "into a flame!"
	prompt

DownpourText:
	text "A downpour"
	line "started!"
	prompt

SunGotBrightText:
	text "The sunlight got"
	line "bright!"
	prompt
	
BreezeText:
	text "A gentle breeze"
	line "starts blowing!"
	prompt

BellyDrumText:
	text "<USER>"
	line "cut its HP and"
	cont "maximized ATTACK!"
	prompt

CopiedStatsText:
	text "<USER>"
	line "copied the stat"

	para "changes of"
	line "<TARGET>!"
	prompt

ForesawAttackText:
	text "<USER>"
	line "foresaw an attack!"
	prompt

IgnoredOrders2Text:
	text "<USER>"
	line "ignored orders!"
	prompt

BattleText_LinkErrorBattleCanceled:
	text "Link error…"

	para "The battle has"
	line "been canceled…"
	prompt

BattleText_Trait::
	text "<USER>'s trait:"
	line "@"
	text_from_ram wStringBuffer1
	text "."
	prompt

BattleText_EnemyTrait::
	text "<TARGET>'s"
	line "trait: @"
	text_from_ram wStringBuffer1
	text "."
	prompt
