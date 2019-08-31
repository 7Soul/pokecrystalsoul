; Johto Pokémon in grass

JohtoGrassRareWildMons:

	; landmark, base weekday, species
	; species id is used to define base hour
	; Encounter runs from base hour to + 8h, from base weekday to +2 days
	db ROUTE_29, 	 	TUESDAY, 	CHARMANDER	; Route 29, between 4 AM and Noon	
	db SPROUT_TOWER,	MONDAY, 	BELLSPROUT	; Sprout Tower, 9PM to 5AM
	db RUINS_OF_ALPH,	TUESDAY, 	AERODACTYL	; Ruins of Alph, 10PM to 6AM
	db ROUTE_32,		WEDNESDAY, 	BULBASAUR	; Route 32, 1AM to 9AM
	db ROUTE_33, 		MONDAY, 	LEDYBA		; Route 33, 9PM to 5AM
	db ROUTE_44, 		SATURDAY, 	AERODACTYL	; Route 44, 10PM to 6AM
	db ROUTE_46, 		WEDNESDAY, 	MACHOP		; Route 46, 6PM to 2AM
	
	db -1 ; end

JohtoShallowRareWildMons:

	; landmark, base weekday, species
	db ROUTE_30, SATURDAY, MARILL ; Route 30, between 3 PM and 11 PM
	db ROUTE_31, FRIDAY, POLIWAG ; Route 31, between Noon and 8 PM
	db ROUTE_32, WEDNESDAY, SQUIRTLE ; Route 32, 7AM to 3PM
	
	db -1 ; end

JohtoWaterRareWildMons:

	; landmark, base weekday, species
	db ROUTE_1, MONDAY, TAUROS
	
	db -1 ; end
