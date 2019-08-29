; Johto Pokémon in grass

JohtoGrassRareWildMons:

	; mapgroup, mapid, base weekday, species
	; species id is used to define base hour
	; Encounter runs from base hour to + 8h, from base weekday to +2 days
	db 24, 3, TUESDAY, CHARMANDER ; Route 29, between 4 AM and Noon	
	db 3, 1, MONDAY, BELLSPROUT ; Sprout Tower 1F, 9PM to 5AM
	db 3, 2, MONDAY, BELLSPROUT ; Sprout Tower 2F, 9PM to 5AM
	db 3, 3, MONDAY, BELLSPROUT ; Sprout Tower 3F, 9PM to 5AM
	db 3, 22, TUESDAY, AERODACTYL ; Ruins of Alph, 10PM to 6AM
	db 10, 2, WEDNESDAY, BULBASAUR ; Route 32, 1AM to 9AM
	db 8, 6, MONDAY, LEDYBA ; Route 33, 9PM to 5AM
	db 2, 6, SATURDAY, AERODACTYL ; Route 44, 10PM to 6AM
	db 27, 1, WEDNESDAY, MACHOP ; Route 46, 6PM to 2AM
	
	db -1 ; end

JohtoShallowRareWildMons:

	; mapgroup, mapid, hour min, hour max, day 1, day 2, species
	db 26, 1, SATURDAY, MARILL ; Route 30, between 3 PM and 11 PM
	db 26, 2, FRIDAY, POLIWAG ; Route 31, between Noon and 8 PM
	db 10, 2, WEDNESDAY, SQUIRTLE ; Route 32, 7AM to 3PM
	
	db -1 ; end

JohtoWaterRareWildMons:

	; mapgroup, mapid, hour min, hour max, day 1, day 2, species
	db 27, 1, MONDAY, TAUROS
	
	db -1 ; end
