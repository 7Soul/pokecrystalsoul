INCLUDE "data/trainers/party_pointers.asm"

Trainers:
; Trainer data structure:
; - db "NAME@", TRAINERTYPE_* constant
; - 1 to 6 Pokémon:
;	 * Always:                       db badges min, badges max, level, evolve bit, species
;	 * with TRAINERTYPE_NICKNAME:	 db "NICK@      " <- 11 characters (10 + @)
;	 * with TRAINERTYPE_DVS:		 db atk|def, spd|spc
;	 * with TRAINERTYPE_ITEM:		 db badges, item
;	 * with TRAINERTYPE_MOVES:		 db move 1, move 2, move 3, move 4
; evolve bit dictates if the mon scaling causes it to evolve
;	0 = never evolve
;	1+ = evolve
; - db -1 ; end

FalknerGroup:
	;  (1)
	db "Falkner@", TRAINERTYPE_DVS
	db 0, 7, 6, 1, MURKROW, $77, $77
	db 0, 5, 6, 1, HOOTHOOT, $AF, $9F
	db 0, 2, 9, 1, PIDGEOTTO, $E0, $5A
	db 0, 6, 6, 1, HOPPIP, $77, $77
	db 1, 7, 6, 1, TOGEPI, $77, $77
	db 2, 17, 12, 1, PIDGEOTTO, $E0, $5A
	db 5, 17, 12, 1, HOOTHOOT, $AF, $9F
	db 5, 8, 6, 1, ZUBAT, $77, $77
	db 8, 17, 6, 0, ARTICUNO, $77, $77
	db 7, 17, 6, 0, AERODACTYL, $77, $77
	db 6, 17, 8, 0, SKARMORY, $77, $77
	db 7, 17, 10, 1, TOGEPI, $AA, $EF
	db -1 ; end


BugsyGroup:
	;  (1)
	db "Bugsy@", TRAINERTYPE_DVS | TRAINERTYPE_ITEM
	db 0, 4, 8, 0, PINSIR, $77, $77, 0, NO_ITEM
	db 0, 2, 6, 0, EEVEE, $77, $77, 0, NO_ITEM
	db 2, 17, 10, 2, EEVEE, $FA, $FF, 0, NO_ITEM
	db 4, 1, 6, 0, SHUCKLE, $FA, $FF, 0, NO_ITEM
	db 2, 17, 6, 1, PINECO, $FA,$FF, 0, NO_ITEM
	db 1, 4, 8, 0, SCYTHER, $E7, $F2, 0, NO_ITEM
	db 4, 17, 9, 0, SCIZOR, $77, $77, 0, NO_ITEM
	db 4, 7, 9, 0, HERACROSS, $77, $77, 0, NO_ITEM
	db 5, 17, 10, 0, PIKACHU, $77, $77, 0, BATTERY
	db 7, 8, 10, 1, VENONAT, $77, $77, 0, NO_ITEM
	db 7, 17, 12, 0, HERACROSS, $DF, $AF, 7, SILVERPOWDER
	db 8, 17, 9, 0, CELEBI, $77, $77, 7, MIRACLEBERRY
	db -1 ; end

WhitneyGroup:
	;  (1)
	db "Whitney@", TRAINERTYPE_DVS | TRAINERTYPE_ITEM
	db 0, 3, 6, 0, DITTO, $E7,$F2, 0, NO_ITEM
	db 0, 1, 6, 0, MAGBY, $77, $77, 0, NO_ITEM
	db 0, 4, 10, 0, CLEFAIRY, $E7,$F2, 0, NO_ITEM
	db 4, 17, 6, 1, CLEFAIRY, $DA,$56, 0, NO_ITEM
	db 4, 17, 9, 1, TEDDIURSA, $FA,$FF, 0, NO_ITEM
	db 3, 7, 6, 1, SQUIRTLE, $FA,$FF, 0, NO_ITEM
	db 1, 4, 9, 0, MILTANK, $E7,$F2, 0, NO_ITEM
	db 6, 17, 6, 1, MEOWTH, $DA,$56, 0, NO_ITEM
	db 4, 7, 10, 1, MILTANK, $DA,$56, 0, NO_ITEM
	db 7, 17, 10, 1, SQUIRTLE, $77, $77, 0, NO_ITEM
	db 7, 17, 14, 0, MILTANK, $DA,$56, 0, NO_ITEM
	db 7, 17, 6, 1, CHANSEY, $77, $77, 7, MIRACLEBERRY
	db -1 ; end

MortyGroup:
	;  (1)
	db "Morty@", TRAINERTYPE_DVS
	db 0, 4, 6, 0, MISDREAVUS, $8F,$5F
	db 1, 2, 6, 0, UNOWN, $7F,$22
	db 4, 17, 10, 1, MISDREAVUS, $8F,$5F
	db 2, 17, 6, 1, SNEASEL, $FA,$FF
	db 1, 17, 8, 1, BULBASAUR, $7F,$22
	db 0, 4, 10, 1, GASTLY, $E7,$F2
	db 1, 5, 6, 1, PARAS, $FA,$FF
	db 5, 17, 8, 1, PARAS, $AF,$BF
	db 4, 7, 10, 1, GASTLY, $DA,$56
	db 7, 17, 10, 1, HOUNDOUR, $77, $77
	db 7, 17, 14, 1, GASTLY, $AA,$AA
	db -1 ; end

PryceGroup:
	;  (1)
	db "Pryce@", TRAINERTYPE_DVS | TRAINERTYPE_ITEM | TRAINERTYPE_MOVES
	db 0, 4, 9, 0, SWINUB, $A5,$F0, 0, NO_ITEM, $FF, $FF, $FF, POWDER_SNOW
	db 0, 4, 6, 0, SEEL, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, ICY_WIND
	db 0, 4, 6, 1, SHELLDER, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 2, 5, 6, 1, OMANYTE, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 4, 7, 4, 0, SEEL, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 4, 17, 8, 1, SEEL, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 4, 7, 7, 1, SWINUB, $A5,$FA, 4, BERRY, $FF, $FF, $FF, $FF
	db 6, 17, 4, 0, LAPRAS, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 5, 17, 4, 1, OMANYTE, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 7, 17, 13, 1, SWINUB, $A5,$FA, 7, MIRACLEBERRY, $FF, $FF, $FF, $FF
	db 7, 17, 13, 0, SEEL, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 7, 17, 10, 0, SUICUNE, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db -1 ; end

JasmineGroup:
	;  (1)
	db "Jasmine@", TRAINERTYPE_DVS | TRAINERTYPE_MOVES
	db 0, 6, 6, 1, CUBONE, $77, $77, $FF, $FF, $FF, MAKESHIFT
	db 0, 1, 6, 1, SHELLDER, $77, $77, $FF, $FF, $FF, LICK
	db 1, 5, 9, 1, ONIX, $8F,$11, $FF, $FF, $FF, SANDSTORM
	db 1, 4, 9, 1, LARVITAR, $77, $77, $FF, $FF, $FF, $FF
	db 2, 6, 7, 1, PHANPY, $77, $77, $FF, $FF, $FF, $FF
	db 6, 17, 8, 1, SKARMORY, $77, $77, $FF, $FF, $FF, $FF
	db 5, 17, 10, 1, STEELIX, $8F,$11, $FF, $FF, $FF, $FF
	db 5, 6, 6, 0, PUPITAR, $77, $77, $FF, $FF, $FF, $FF
	db 4, 17, 8, 1, SCIZOR, $85,$8F, $FF, $FF, $FF, $FF
	db 6, 17, 15, 0, ONIX, $8F,$55, STAMPEDE, SANDSTORM, SLAM, EARTHQUAKE
	db 7, 17, 10, 0, SANDSLASH, $77, $77, $FF, $FF, $FF, $FF
	db 6, 17, 8, 1, MAREEP, $77, $77, $FF, $FF, $FF, $FF
	db -1 ; end

ChuckGroup:
	;  (1)
	db "Chuck@", TRAINERTYPE_MOVES | TRAINERTYPE_DVS | TRAINERTYPE_ITEM
	db 0, 17, 10, 0, MANKEY, $77, $77, 7, GOLD_BERRY, $FF, $FF, $FF, $FF
	db 0, 3, 6, 1, POLIWAG, $D5, $AA, 2, BERRY, $FF, BUBBLE, HYPNOSIS, WAKEUP_SLAP
	db 0, 17, 8, 0, HITMONLEE, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 1, 3, 6, 1, PHANPY, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 3, 7, 10, 1, POLIWAG, $D5, $AA, 2, BERRY, HYPNOSIS, SURF, WAKEUP_SLAP, BODY_SLAM
	db 3, 17, 8, 0, HITMONCHAN, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 4, 17, 6, 1, PHANPY, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 5, 17, 8, 1, TOTODILE, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 7, 17, 13, 1, POLIWAG, $D5, $AA, 7, MIRACLEBERRY, $FF, $FF, $FF, $FF
	db -1 ; end

ClairGroup:
	;  (1)
	db "Clair@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

Rival1Group:
	;  (1)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (14)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (15)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (16)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (17)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (18)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

PokemonProfGroup:
WillGroup:
	;  (1)
	db "Will@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

PKMNTrainerGroup:
	;  (1)
	db "Cal@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Cal@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Cal@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BrunoGroup:
	;  (1)
	db "Bruno@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

KarenGroup:
	;  (1)
	db "Karen@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

KogaGroup:
	;  (1)
	db "Koga@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

ChampionGroup:
	;  (1)
	db "Lance@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BrockGroup:
	;  (1)
	db "Brock@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

MistyGroup:
	;  (1)
	db "Misty@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

LtSurgeGroup:
	;  (1)
	db "Lt.Surge@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

ScientistGroup:
	;  (1)
	db "Ross@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Mitch@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Jed@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Marc@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Rich@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

ErikaGroup:
	;  (1)
	db "Erika@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

YoungsterGroup:
	;  (1)
	db "Joey@", TRAINERTYPE_ITEM | TRAINERTYPE_DVS
	db 0, 4, 4, 0, RATTATA, $FF,$FF, 1, CUTE_RIBBON
	db 4, 6, 8, 0, RATTATA, $FF,$FF, 1, CUTE_RIBBON
	db 6, 8, 15, 0, RATTATA, $FF,$FF, 1, CUTE_RIBBON
	db 8, 17, 26, 0, RATTATA, $FF,$FF, 1, CUTE_RIBBON
	db -1 ; end

	;  (2)
	db "Mikey@", TRAINERTYPE_ITEM
	db 0, 6, 5, 0, CHARMANDER, 1, CINDERS
	db 2, 17, 0, 1, PIKACHU, 0, NO_ITEM
	db -1 ; end

	;  (3)
	db "Albert@", TRAINERTYPE_NORMAL
	db 0, 17, 4, 1, RATTATA
	db 0, 4, 5, 1, ZUBAT
	db 4, 17, 8, 1, AIPOM
	db -1 ; end

	;  (4)
	db "Gordon@", TRAINERTYPE_NORMAL
	db 0, 6, 6, 0, DODUO
	db 4, 17, 4, 1, ELEKID
	db 6, 17, 7, 1, DODUO
	db -1 ; end

	;  (5)
	db "Samuel@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Ian@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Joey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Joey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Warren@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Jimmy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Owen@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Jason@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "Joey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (14)
	db "Joey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

SchoolboyGroup:
	;  (1)
	db "Jack@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Kipp@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Alan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Johnny@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Danny@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Tommy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Dudley@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Joe@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Billy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Chad@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Nate@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Ricky@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "Jack@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (14)
	db "Jack@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (15)
	db "Alan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (16)
	db "Alan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (17)
	db "Chad@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (18)
	db "Jack@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (19)
	db "Jack@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (20)
	db "Alan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (21)
	db "Alan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (22)
	db "Alan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (23)
	db "Chad@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (24)
	db "Chad@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BirdKeeperGroup:
	;  (1)
	db "Rod@", TRAINERTYPE_ITEM
	db 0, 17, 9, 1, SPEAROW, 0, PSNCUREBERRY
	db 0, 17, 9, 1, PIDGEY, 0, PSNCUREBERRY
	db -1 ; end

	;  (2)
	db "Abe@", TRAINERTYPE_ITEM
	db 0, 17, 9, 0, FARFETCH_D, 0, NO_ITEM
	db 0, 6, 10, 0, DELIBIRD, 0, BERRY
	db 6, 17, 12, 0, DELIBIRD, 0, GOLD_BERRY
	db -1 ; end

	;  (3)
	db "Bryan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Theo@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Toby@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Denis@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Vance@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Hank@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Roy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Boris@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Bob@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Jose@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "Peter@", TRAINERTYPE_NORMAL
	db 0, 6, 5, 1, PIDGEY
	db 6, 17, 10, 1, PIDGEOTTO
	db 1, 17, 10, 1, NATU
	db 1, 17, 8, 1, NATU
	db -1 ; end

	;  (14)
	db "Jose@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (15)
	db "Perry@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (16)
	db "Bret@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (17)
	db "Jose@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (18)
	db "Vance@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (19)
	db "Vance@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

LassGroup:
	;  (1)
	db "Carrie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Bridget@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Alice@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Krise@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Connie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Linda@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Laura@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Shannon@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Michelle@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Dana@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Ellen@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Connie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "Connie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (14)
	db "Dana@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (15)
	db "Dana@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (16)
	db "Dana@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (17)
	db "Dana@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

JanineGroup:
	;  (1)
	db "Janine@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

CooltrainerMGroup:
	;  (1)
	db "Nick@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 1, CHARMANDER
	db 0, 17, 5, 1, BULBASAUR
	db 0, 17, 5, 1, SQUIRTLE
	db -1 ; end

	;  (2)
	db "Aaron@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Paul@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Cody@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Mike@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Gaven@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Gaven@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Ryan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Jake@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Gaven@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Blake@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Brian@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "Erick@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (14)
	db "Andy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (15)
	db "Tyler@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (16)
	db "Sean@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (17)
	db "Kevin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (18)
	db "Steve@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (19)
	db "Allen@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (20)
	db "Darin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

CooltrainerFGroup:
	;  (1)
	db "Gwen@", TRAINERTYPE_ITEM | TRAINERTYPE_DVS
	db 0, 6, 9, 0, EEVEE, $77, $77, 4, CUTE_RIBBON
	db 6, 17, 11, 0, EEVEE, $FD,$FD, 4, CUTE_RIBBON
	db 1, 17, 4, 0, JOLTEON, $77, $77, 0, NO_ITEM
	db 1, 17, 4, 0, FLAREON, $77, $77, 0, NO_ITEM
	db 1, 17, 4, 0, VAPOREON, $77, $77, 0, NO_ITEM
	db -1 ; end

	;  (2)
	db "Lois@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Fran@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Lola@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Kate@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Irene@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Kelly@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Joyce@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Beth@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Reena@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Megan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Beth@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "Carol@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (14)
	db "Quinn@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (15)
	db "Emma@", TRAINERTYPE_ITEM
	db 0, 17, 6, 2, POLIWAG, 4, GOLD_BERRY
	db 0, 5, 4, 1, POLIWAG, 4, GOLD_BERRY
	db 5, 17, 6, 0, POLIWHIRL, 4, GOLD_BERRY
	db -1 ; end

	;  (16)
	db "Cybil@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (17)
	db "Jenn@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (18)
	db "Beth@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (19)
	db "Reena@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (20)
	db "Reena@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (21)
	db "Cara@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BeautyGroup:
	;  (1)
	db "Victoria@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Samantha@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Julie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Jaclyn@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Brenda@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Cassie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Caroline@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Carlene@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Jessica@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Rachael@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Angelica@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Kendra@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "Veronica@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (14)
	db "Julia@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (15)
	db "Theresa@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (16)
	db "Valerie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (17)
	db "Olivia@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

PokemaniacGroup:
	;  (1)
	db "Larry@", TRAINERTYPE_NORMAL
	db 2, 17, 4, 1, CHIKORITA
	db 0, 17, 6, 2, SLOWPOKE
	db 6, 17, 8, 2, LARVITAR
	db -1 ; end

	;  (2)
	db "Andrew@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 1, CUBONE
	db 0, 17, 5, 1, CHARMANDER
	db -1 ; end

	;  (3)
	db "Calvin@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 0, GLIGAR
	db 2, 17, 3, 0, KANGASKHAN
	db -1 ; end

	;  (4)
	db "Shane@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Ben@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Brent@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Ron@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Ethan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Brent@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Brent@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Issac@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Donald@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "Zach@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (14)
	db "Brent@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (15)
	db "Miller@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

GruntMGroup:
	;  (1)
	db "Grunt Dund@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 1, KOFFING
	db 0, 17, 5, 1, HOUNDOUR
	db -1 ; end

	;  (2)
	db "Grunt Cain@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 1, RATTATA
	db 0, 17, 5, 1, ZUBAT
	db 0, 17, 5, 1, ZUBAT
	db -1 ; end

	;  (3)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (14)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (15)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (16)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (17)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (18)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (19)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (20)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (21)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (22)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (23)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (24)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (25)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (26)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (27)
	db "Executive@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (28)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (29)
	db "Grunt Junior@", TRAINERTYPE_NORMAL
	db 0, 17, 0, 1, RATTATA
	db 0, 17, 0, 1, GRIMER
	db -1 ; end

	;  (30)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (31)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

GentlemanGroup:
	;  (1)
	db "Preston@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Edward@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Gregory@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Virgil@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Alfred@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

SkierGroup:
	;  (1)
	db "Roxanne@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Clarissa@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

TeacherGroup:
	;  (1)
	db "Colette@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Hillary@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Shirley@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

SabrinaGroup:
	;  (1)
	db "Sabrina@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BugCatcherGroup:
	;  (1)
	db "Don@", TRAINERTYPE_NORMAL
	db 0, 17, 4, 1, CATERPIE
	db 0, 5, 4, 1, METAPOD
	db 1, 17, 0, 1, ELEKID
	db 5, 17, 12, 0, BUTTERFREE
	db -1 ; end

	;  (2)
	db "Rob@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Ed@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Wade@", TRAINERTYPE_NORMAL
	db 0, 4, 4, 1, SPINARAK
	db 0, 4, 4, 1, SPINARAK
	db 0, 17, 8, 1, SPINARAK
	db 4, 17, 11, 1, SPINARAK
	db -1 ; end

	;  (5)
	db "Benny@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Al@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Josh@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Arnie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Ken@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Wade@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Wade@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Doug@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "Arnie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (14)
	db "Arnie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (15)
	db "Wade@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (16)
	db "Wade@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (17)
	db "Arnie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (18)
	db "Arnie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (19)
	db "Wayne@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

FisherGroup:
	;  (1)
	db "Justin@", TRAINERTYPE_DVS
	db 0, 17, 5, 1, GOLDEEN, $77, $77
	db 1, 17, 8, 1, SLOWPOKE, $77, $77
	db 2, 17, 10, 0, GOLDEEN, $FA,$AA
	db -1 ; end

	;  (2)
	db "Ralph@", TRAINERTYPE_NORMAL
	db 0, 17, 6, 1, MAGIKARP
	db 1, 17, 10, 0, DITTO
	db -1 ; end

	;  (3)
	db "Arnold@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 1, WOOPER
	db 1, 17, 10, 1, KRABBY
	db -1 ; end

	;  (4)
	db "Kyle@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Henry@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Marvin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Tully@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Andre@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Raymond@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Wilton@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Edgar@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Jonah@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "Martin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (14)
	db "Stephen@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (15)
	db "Barney@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (16)
	db "Ralph@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (17)
	db "Ralph@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (18)
	db "Tully@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (19)
	db "Tully@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (20)
	db "Wilton@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (21)
	db "Scott@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (22)
	db "Wilton@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (23)
	db "Ralph@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (24)
	db "Ralph@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (25)
	db "Tully@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (26)
	db "Terry@", TRAINERTYPE_NORMAL
	db 0, 5, 9, 0, DRATINI
	db 3, 17, 11, 0, DRATINI
	db 5, 17, 12, 0, DRAGONAIR
	db -1 ; end

SwimmerMGroup:
	;  (1)
	db "Harold@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Simon@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Randall@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Charlie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "George@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Berke@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Kirk@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Mathew@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Hal@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Paton@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Daryl@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Walter@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "Tony@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (14)
	db "Jerome@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (15)
	db "Tucker@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (16)
	db "Rick@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (17)
	db "Cameron@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (18)
	db "Seth@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (19)
	db "James@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (20)
	db "Lewis@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (21)
	db "Parker@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

SwimmerFGroup:
	;  (1)
	db "Elaine@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Paula@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Kaylee@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Susie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Denise@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Kara@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Wendy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Lisa@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Jill@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Mary@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Katie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Dawn@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "Tara@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (14)
	db "Nicole@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (15)
	db "Lori@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (16)
	db "Jody@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (17)
	db "Nikki@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (18)
	db "Diana@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (19)
	db "Briana@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

SailorGroup:
	;  (1)
	db "Eugene@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Huey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Terrell@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Kent@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Ernest@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Jeff@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Garrett@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Kenneth@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Stanly@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Harry@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Huey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Huey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "Huey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

SuperNerdGroup:
	;  (1)
	db "Stan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Eric@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Gregg@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Jay@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Dave@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Sam@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Tom@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Pat@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Shawn@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Teru@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Russ@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Norton@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "Hugh@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (14)
	db "Markus@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

Rival2Group:
	;  (1)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

GuitaristGroup:
	;  (1)
	db "Clyde@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Vincent@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

HikerGroup:
	;  (1)
	db "Anthony@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Russell@", TRAINERTYPE_NORMAL
	db 0, 6, 4, 1, GEODUDE
	db 1, 17, 6, 1, GEODUDE
	db 6, 17, 8, 1, PILOSWINE
	db 1, 17, 8, 1, GEODUDE
	db -1 ; end

	;  (3)
	db "Phillip@", TRAINERTYPE_NORMAL
	db 0, 17, 6, 1, MAREEP
	db 0, 17, 9, 1, SENTRET
	db 4, 17, 9, 0, MURKROW
	db -1 ; end

	;  (4)
	db "Leonard@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 1, MACHOP
	db 1, 17, 9, 1, GEODUDE
	db -1 ; end

	;  (5)
	db "Anthony@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Benjamin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Erik@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Michael@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Parry@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Timothy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Bailey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Anthony@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "Tim@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (14)
	db "Noland@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (15)
	db "Sidney@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (16)
	db "Kenny@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (17)
	db "Jim@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (18)
	db "Daniel@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 0, ONIX
	db 6, 17, 10, 0, HITMONLEE
	db -1 ; end

	;  (19)
	db "Parry@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (20)
	db "Parry@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (21)
	db "Anthony@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (22)
	db "Anthony@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BikerGroup:
	;  (1)
	db "Benny@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Kazu@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Dwayne@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Harris@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Zeke@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Charles@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Riley@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Joel@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Glenn@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BlaineGroup:
	;  (1)
	db "Blaine@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BurglarGroup:
	;  (1)
	db "Duncan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Eddie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Corey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

FirebreatherGroup:
	;  (1)
	db "Otis@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Dick@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Ned@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Burt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Bill@", TRAINERTYPE_MOVES
	db 0, 17, 4, 1, KOFFING, $FF, $FF, $FF, WILL_O_WISP
	db 0, 17, 4, 1, KOFFING, $FF, $FF, $FF, WILL_O_WISP
	db 5, 17, 0, 1, KOFFING, $FF, $FF, FIRE_FLICK, WILL_O_WISP
	db -1 ; end

	;  (6)
	db "Walt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Ray@", TRAINERTYPE_MOVES
	db 0, 17, 6, 1, VULPIX, $FF, $FF, ZEN_HEADBUTT, $FF
	db 3, 17, 10, 1, VULPIX, $FF, $FF, ZEN_HEADBUTT, $FF
	db -1 ; end

	;  (8)
	db "Lyle@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

JugglerGroup:
	;  (1)
	db "Irwin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Fritz@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Horton@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Irwin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Irwin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Irwin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BlackbeltGroup:
	;  (1)
	db "Kenji@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Yoshi@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Kenji@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Lao@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Nob@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Kiyo@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Lung@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Kenji@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Wai@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

ExecutiveMGroup:
	;  (1)
	db "Executive@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Executive@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Executive@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Executive@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

PsychicGroup:
	;  (1)
	db "Nathan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Franklin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Hernan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Fidel@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Greg@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Norman@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Mark@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Phil@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Richard@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Gilbert@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Jared@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Rodney@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

PicnickerGroup:
	;  (1)
	db "Liz@", TRAINERTYPE_NORMAL
	db 0, 2, 7, 0, NIDORAN_F
	db 2, 4, 3, 1, NIDORAN_F
	db 1, 17, 9, 1, NIDORINA
	db 4, 17, 10, 1, SNEASEL
	db -1 ; end

	;  (2)
	db "Gina@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Brooke@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Kim@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Cindy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Hope@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Sharon@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Debra@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Gina@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Erin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Liz@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Liz@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "Heidi@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (14)
	db "Edna@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (15)
	db "Gina@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (16)
	db "Tiffany@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (17)
	db "Tiffany@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (18)
	db "Erin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (19)
	db "Tanya@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (20)
	db "Tiffany@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (21)
	db "Erin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (22)
	db "Liz@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (23)
	db "Liz@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (24)
	db "Gina@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (25)
	db "Gina@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (26)
	db "Tiffany@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

CamperGroup:
	;  (1)
	db "Roland@", TRAINERTYPE_ITEM
	db 0, 2, 0, 0, NIDORAN_M, 0, NO_ITEM
	db 1, 17, 2, 1, NIDORAN_M, 6, MINT_BERRY
	db 2, 6, 1, 1, NIDORAN_M, 0, NO_ITEM
	db 5, 17, 4, 1, PINECO, 0, NO_ITEM
	db 6, 17, 10, 0, NIDORINO, 0, MINT_BERRY
	db -1 ; end

	;  (2)
	db "Todd@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Ivan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Elliot@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Barry@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Lloyd@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Dean@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Sid@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Harvey@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 0, MANKEY
	db 4, 17, 5, 0, TAUROS
	db -1 ; end

	;  (10)
	db "Dale@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Ted@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 1, MANKEY
	db 4, 17, 5, 0, TAUROS
	db -1 ; end

	;  (12)
	db "Todd@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "Todd@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (14)
	db "Thomas@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (15)
	db "Leroy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (16)
	db "David@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (17)
	db "John@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (18)
	db "Jerry@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (19)
	db "Spencer@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (20)
	db "Todd@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (21)
	db "Todd@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (22)
	db "Quentin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

ExecutiveFGroup:
	;  (1)
	db "Executive@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Executive@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

SageGroup:
	;  (1)
	db "Chow@", TRAINERTYPE_NORMAL
	db 0, 4, 3, 1, BELLSPROUT
	db 0, 4, 4, 1, BELLSPROUT
	db 4, 6, 1, 0, WEEPINBELL
	db 4, 17, 6, 1, BELLSPROUT
	db 0, 17, 4, 1, HOOTHOOT
	db -1 ; end

	;  (2)
	db "Nico@", TRAINERTYPE_NORMAL
	db 0, 6, 3, 1, BELLSPROUT
	db 0, 5, 3, 1, POLIWAG
	db 6, 17, 1, 0, WEEPINBELL
	db 5, 17, 6, 2, POLIWAG
	db -1 ; end

	;  (3)
	db "Jin@", TRAINERTYPE_ITEM
	db 0, 17, 4, 0, BELLSPROUT, 3, GOLD_BERRY
	db 0, 17, 4, 0, BELLSPROUT, 4, GOLD_BERRY
	db 0, 17, 4, 0, BELLSPROUT, 5, GOLD_BERRY
	db 3, 4, 6, 0, BELLSPROUT, 0, NO_ITEM
	db 4, 17, 10, 0, WEEPINBELL, 0, NO_ITEM
	db -1 ; end

	;  (4)
	db "Troy@", TRAINERTYPE_NORMAL
	db 0, 6, 9, 0, PSYDUCK
	db 6, 17, 13, 1, PSYDUCK
	db -1 ; end

	;  (5)
	db "Jeffrey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Ping@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Edmond@", TRAINERTYPE_NORMAL
	db 0, 17, 7, 1, HOOTHOOT
	db 6, 17, 12, 0, UMBREON
	db -1 ; end

	;  (8)
	db "Neal@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Li@", TRAINERTYPE_DVS
	db 0, 4, 7, 1, BELLSPROUT, $77, $77
	db 4, 17, 8, 1, BELLSPROUT, $77, $77
	db 0, 5, 7, 1, DRATINI, $77, $77
	db 0, 5, 7, 1, DRATINI, $77, $77
	db 5, 17, 8, 0, DRAGONAIR, $77, $77
	db 5, 17, 8, 0, DRAGONAIR, $77, $77
	db 0, 5, 10, 1, VULPIX, $8A,$AA
	db 5, 17, 15, 1, VULPIX, $8A,$AA
	db -1 ; end

	;  (10)
	db "Gaku@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Masa@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Koji@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

MediumGroup:
	;  (1)
	db "Martha@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Grace@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Bethany@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Margret@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Ethel@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Rebecca@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Doris@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BoarderGroup:
	;  (1)
	db "Ronald@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Brad@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Douglas@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

PokefanMGroup:
	;  (1)
	db "William@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Derek@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Robert@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Joshua@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Carter@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Trevor@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Brandon@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Jeremy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Colin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Derek@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (11)
	db "Derek@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (12)
	db "Alex@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (13)
	db "Rex@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (14)
	db "Allan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

KimonoGirlGroup:
	;  (1)
	db "Naoko@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Naoko@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Sayo@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Zuki@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Kuni@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Miki@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

TwinsGroup:
	;  (1)
	db "Amy & May@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Ann & Anne@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Ann & Anne@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Amy  & May@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Jo & Zoe@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Jo & Zoe@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (7)
	db "Meg & Peg@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (8)
	db "Meg & Peg@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (9)
	db "Lea & Pia@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (10)
	db "Lea & Pia@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

PokefanFGroup:
	;  (1)
	db "Beverly@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Ruth@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Beverly@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Beverly@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Georgia@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (6)
	db "Jaime@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

RedGroup:
	;  (1)
	db "Red@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BlueGroup:
	;  (1)
	db "Blue@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

OfficerGroup:
	;  (1)
	db "Keith@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (2)
	db "Dirk@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

GruntFGroup:
	;  (1)
	db "Grunt Fenna@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 1, EKANS
	db -1 ; end

	;  (2)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (3)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (4)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	;  (5)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

MysticalmanGroup:
	;  (1)
	db "Eusine@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

