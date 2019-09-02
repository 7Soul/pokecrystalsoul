; Kanto Pokémon in grass

KantoGrassRareWildMons:

	; landmark, base weekday, species
	; species id is used to define base hour
	; Encounter runs from base hour to + 8h, from base weekday to +2 days
	db VIRIDIAN_FOREST, FRIDAY,		SCYTHER ; 3AM to 11AM
	db VIRIDIAN_FOREST, MONDAY,		PINSIR ; 7AM to 3PM
	db ROUTE_1, 	 	TUESDAY, 	CHARMANDER	; 4AM to Noon	
	db ROUTE_2,	        MONDAY, 	BELLSPROUT	; 9PM to 5AM
	db ROUTE_3,         TUESDAY, 	MACHOP	; 10PM to 6AM
	db ROUTE_15,        SATURDAY, 	SCYTHER	; 3AM to 11AM, right of Fuchsia
	
	db -1 ; end

KantoShallowRareWildMons:

	; landmark, base weekday, species
	db ROUTE_1, SATURDAY, MARILL ; Route 30, between 3 PM and 11 PM
	
	db -1 ; end

KantoWaterRareWildMons:

	; landmark, base weekday, species
	db ROUTE_1, MONDAY, TAUROS
	
	db -1 ; end
