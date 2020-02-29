BattleCommand_StartSandstorm:
; startsandstorm

	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	jr z, .failed

	ld a, WEATHER_SANDSTORM
	ld [wBattleWeather], a

	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitStartWeather ; this defines the number of turns wWeatherCount
	
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitSandstormStarts
	ld a, BATTLE_VARS_TRAIT_OPP
	ld [wBuffer1], a
	farcall TraitSandstormStarts

	call AnimateCurrentMove
	ld hl, SandstormBrewedText
	jp StdBattleTextBox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
