; Kanto Pokémon in grass

KantoGrassRareWildMons:

	; landmark, base weekday, species
	; species id is used to define base hour
	; Encounter runs from base hour to + 8h, from base weekday to +2 days
	db ROUTE_1, 	 	TUESDAY, 	CHARMANDER	; Route 29, between 4 AM and Noon	
	db ROUTE_2,	        MONDAY, 	BELLSPROUT	; Sprout Tower, 9PM to 5AM
	db ROUTE_3,         TUESDAY, 	MACHOP	; Ruins of Alph, 10PM to 6AM
	
	db -1 ; end

KantoShallowRareWildMons:

	; landmark, base weekday, species
	db ROUTE_1, SATURDAY, MARILL ; Route 30, between 3 PM and 11 PM
	
	db -1 ; end

KantoWaterRareWildMons:

	; landmark, base weekday, species
	db ROUTE_1, MONDAY, TAUROS
	
	db -1 ; end
