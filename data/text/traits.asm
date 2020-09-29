
TraitText_FlameBody::
TraitText_PoisonPoint::
TraitText_Static::
TraitText_StunBody::
TraitText_HighTempo::
TraitText_CuteCharm::
TraitText_EffectSpore::
TraitText_LiquidOoze::
TraitText_MagmaFlow::
TraitText_HotCoals::
TraitText_Tailwind::
TraitText_MindGames::
	text "<TARGET>'s"
	line "@"
    text_from_ram wStringBuffer1
	text "!"
	prompt

TraitText_IronBarbs::
	text "<TARGET> is"
	line "damaged by the"
	cont "foe's Iron Barbs!"
	prompt

TraitText_SandBruiser::
	text "<TARGET> is"
	line "damaged by foe's"
	cont "Sand Bruiser!"
	prompt

TraitText_BurningMane::
	text "<TARGET> is"
	line "damaged by foe's"
	cont "Burning Mane!"
	prompt

TraitText_LightningFast::
    text "<TARGET>'s"
	line "@"
    text_from_ram wStringBuffer1
	text "!"
	para "<TARGET> is"
	line "faster!"
	prompt

TraitText_UnleashPower::
    text "<TARGET>'s"
	line "@"
    text_from_ram wStringBuffer1
	text "!"
	para "<TARGET> is"
	line "stronger!"
	prompt

TraitText_LifeDrain::
	text "<TARGET>'s"
	line "Life Drain! Heal"
	cont "when a foe faints!"
	prompt

TraitText_KeepGoing::
	text "<TARGET>'s"
	line "Keep Going! Get"
	cont "stamina after a"
	line "knock-out!"
	prompt

TraitText_Boom::
	text "<TARGET>"
	line "goes Boom!"
	prompt

TraitText_Eruption::
	text "<TARGET>'s"
	line "Eruption! Burns"
    cont "foe as it faints!"
	prompt

TraitText_GasExplosion::
	text "<TARGET>'s"
	line "Gas Explosion!"
    cont "Poisons foe as it"
    line "faints!"
	prompt

TraitText_NorthStar::
	text "<TARGET>'s"
	line "North Star!"
    cont "Freezes foe as it"
    line "faints!"
	prompt

TraitText_DeathlyHex::
	text "<TARGET>'s"
	line "Deathly Hex!"
    cont "Curses foe as it"
    line "faints!"
	prompt

TraitText_Moxie::
	text "<TARGET>'s"
	line "@"
    text_from_ram wStringBuffer1
    text "!"
	prompt


BattleText_TraitPassedStatus::
	text "Passed status to"
	line "foe!"
	prompt

BattleText_TraitColorPick::
	text "@"
	text_from_ram wStringBuffer1
	text " picked"
	line "@"
	text_from_ram wStringBuffer2
	text " type!"
	prompt

BattleText_AllStatsUp::
	text "<USER>'s"
	line "stats went up!"
	prompt

BattleText_NegatedDamage::
	text "<USER> "
	line "greatly resisted"
	cont "the attack!"
	prompt
