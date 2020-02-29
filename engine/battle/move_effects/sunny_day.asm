BattleCommand_StartSun:
; startsun
	ld a, WEATHER_SUN
	ld [wBattleWeather], a
	
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitStartWeather ; this defines the number of turns wWeatherCount

	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitSunshineStarts
	ld a, BATTLE_VARS_TRAIT_OPP
	ld [wBuffer1], a
	farcall TraitSunshineStarts

	call AnimateCurrentMove
	ld hl, SunGotBrightText
	jp StdBattleTextBox
