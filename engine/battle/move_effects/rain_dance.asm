BattleCommand_StartRain:
; startrain
	ld a, WEATHER_RAIN
	ld [wBattleWeather], a
	
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitStartWeather ; this defines the number of turns wWeatherCount
	
	ld a, BATTLE_VARS_TRAIT
	ld [wBuffer1], a
	farcall TraitRainStarts
	ld a, BATTLE_VARS_TRAIT_OPP
	ld [wBuffer1], a
	farcall TraitRainStarts

	call AnimateCurrentMove
	ld hl, DownpourText
	jp StdBattleTextBox