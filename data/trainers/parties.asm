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

SECTION "Enemy Trainer Parties 1", ROMX

FalknerGroup:
	; FALKNER (1)
	db "Falkner@", TRAINERTYPE_DVS | TRAINERTYPE_MOVES | TRAINERTYPE_ITEM
	db 0, 7, 12, 1, MURKROW, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, FEATHERGALE
	db 0, 5, 11, 1, HOOTHOOT, $5A, $92, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 6, 17, 14, 0, SKARMORY, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, WILD_STORM
	db 2, 6, 12, 1, HOPPIP, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 4, 7, 12, 1, TOGEPI, $58, $5A, 3, BERRY, $FF, $FF, $FF, $FF
	db 7, 17, 16, 1, TOGEPI, $58, $5A, 7, MIRACLEBERRY, $FF, $FF, $FF, $FF
	db 5, 17, 14, 1, HOOTHOOT, $5A, $92, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 7, 17, 12, 1, AERODACTYL, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 8, 17, 12, 0, ARTICUNO, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, FLY
	db 0, 2, 15, 1, PIDGEOTTO, $A0, $54, 0, NO_ITEM, $FF, $FF, $FF, FEATHERGALE
	db 2, 5, 15, 1, PIDGEOTTO, $A0, $54, 0, NO_ITEM, $FF, $FF, $FF, FEATHERGALE
	db 5, 17, 16, 1, PIDGEOTTO, $A3, $54, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db -1 ; end


BugsyGroup:
	; BUGSY (1)
	db "Bugsy@", TRAINERTYPE_DVS | TRAINERTYPE_ITEM | TRAINERTYPE_MOVES
	db 0, 4, 12, 0, PINSIR, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 0, 2, 13, 0, EEVEE, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 2, 17, 10, 2, EEVEE, $FA, $FF, 0, NO_ITEM, $FF, $FF, $FF, FELL_STINGER
	db 3, 7, 12, 0, SHUCKLE, $FA, $FF, 5, SILVERPOWDER, $FF, $FF, $FF, $FF
	db 4, 7, 15, 0, HERACROSS, $FA, $FF, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 7, 17, 16, 0, HERACROSS, $DF, $AF, 7, SILVERPOWDER, $FF, $FF, $FF, $FF
	db 14, 17, 15, 0, CELEBI, $77, $77, 7, MIRACLEBERRY, $FF, $FF, $FF, $FF
	db 8, 14, 16, 1, VENONAT, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 5, 17, 13, 0, PIKACHU, $77, $77, 0, BATTERY, $FF, $FF, $FF, $FF
	db 7, 9, 12, 1, PINECO, $FA,$FF, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 1, 4, 14, 0, SCYTHER, $E7, $F2, 7, SILVERPOWDER, $FF, $FF, $FF, FURY_CUTTER
	db 4, 17, 15, 0, SCIZOR, $E7, $F2, 7, SILVERPOWDER, $FF, $FF, $FF, FURY_CUTTER
	db -1 ; end

WhitneyGroup:
	; WHITNEY (1)
	db "Whitney@", TRAINERTYPE_DVS | TRAINERTYPE_ITEM | TRAINERTYPE_MOVES
	db 0, 3, 6, 0, DITTO, $E7,$F2, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 0, 1, 6, 0, MAGBY, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 0, 4, 10, 0, CLEFAIRY, $A7,$A2, 1, BERRY, $FF, $FF, $FF, $FF
	db 4, 17, 6, 1, CLEFAIRY, $AA,$56, 1, BERRY, $FF, $FF, $FF, $FF
	db 3, 17, 5, 1, TEDDIURSA, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 3, 7, 6, 1, SQUIRTLE, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 7, 17, 10, 1, SQUIRTLE, $A7,$A2, 0, NO_ITEM, HYPER_BEAM, SKULL_BASH, SWAGGER, PROTECT
	db 6, 17, 6, 1, MEOWTH, $77, $77, 0, NO_ITEM, $FF, $FF, $FF, $FF
	db 8, 17, 6, 1, CHANSEY, $AA,$56, 7, MIRACLEBERRY, $FF, $FF, $FF, ROLLOUT
	db 1, 4, 9, 0, MILTANK, $A7,$A2, 0, NO_ITEM, $FF, $FF, $FF, ROLLOUT
	db 4, 7, 10, 1, MILTANK, $AA,$56, 7, MIRACLEBERRY, $FF, $FF, $FF, ROLLOUT
	db 7, 17, 14, 1, MILTANK, $AA,$56, 7, MIRACLEBERRY, $FF, $FF, $FF, ROLLOUT
	db -1 ; end

MortyGroup:
	; MORTY (1)
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
	; PRYCE (1)
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
	; JASMINE (1)
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
	; CHUCK (1)
	db "Chuck@", TRAINERTYPE_MOVES
	db 0, 17, 10, 0, MANKEY, $FF, $FF, $FF, $FF
	db 0, 3, 6, 1, POLIWAG, $FF, BUBBLE, HYPNOSIS, WAKEUP_SLAP
	db 0, 17, 8, 0, HITMONLEE, $FF, $FF, $FF, $FF
	db 1, 3, 6, 1, PHANPY, $FF, $FF, $FF, $FF
	db 3, 7, 10, 1, POLIWAG, HYPNOSIS, SURF, WAKEUP_SLAP, BODY_SLAM
	db 3, 17, 8, 0, HITMONCHAN, $FF, $FF, $FF, $FF
	db 4, 17, 6, 1, PHANPY, $FF, $FF, $FF, $FF
	db 5, 17, 8, 1, TOTODILE, $FF, $FF, $FF, $FF
	db 7, 17, 13, 1, POLIWAG, $FF, $FF, $FF, $FF
	db -1 ; end

ClairGroup:
	; CLAIR (1)
	db "Clair@", TRAINERTYPE_NORMAL
	db 0, 4, 3, 1, HORSEA
	db 4, 6, 3, 1, SEADRA
	db 6, 17, 3, 1, KINGDRA
	db 0, 6, 3, 1, DRATINI
	db 0, 17, 5, 1, MAGIKARP
	db 6, 17, 4, 1, SLOWKING
	db 5, 17, 5, 0, AERODACTYL
	db 7, 17, 4, 1, SUICUNE
	db 6, 17, 8, 1, DRAGONITE
	db -1 ; end

Rival1Group:
	; RIVAL1 (1)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL1 (2)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL1 (3)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL1 (4)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL1 (5)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL1 (6)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL1 (7)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL1 (8)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL1 (9)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL1 (10)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL1 (11)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL1 (12)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL1 (13)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL1 (14)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL1 (15)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL1 (16)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL1 (17)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL1 (18)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

PokemonProfGroup:
WillGroup:
	; WILL (1)
	db "Will@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

PKMNTrainerGroup:
	; PKMNTRAINER (1)
	db "Cal@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PKMNTRAINER (2)
	db "Cal@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PKMNTRAINER (3)
	db "Cal@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BrunoGroup:
	; BRUNO (1)
	db "Bruno@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

KarenGroup:
	; KAREN (1)
	db "Karen@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

KogaGroup:
	; KOGA (1)
	db "Koga@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

ChampionGroup:
	; CHAMPION (1)
	db "Lance@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BrockGroup:
	; BROCK (1)
	db "Brock@", TRAINERTYPE_MOVES
	db 0, 17, 12, 1, GEODUDE, $FF, $FF, $FF, $FF
	db 0, 17, 11, 1, OMANYTE, $FF, $FF, $FF, $FF
	db 5, 7, 12, 1, RHYHORN, $FF, $FF, $FF, THUNDERBOLT
	db 7, 17, 14, 1, RHYHORN, $FF, $FF, $FF, THUNDER
	db 16, 17, 12, 1, SUDOWOODO, $FF, $FF, THUNDERPUNCH, ICE_PUNCH
	db 7, 16, 15, 0, SUDOWOODO, $FF, $FF, THUNDERPUNCH, ICE_PUNCH
	db 1, 5, 12, 1, ZUBAT, $FF, $FF, $FF, $FF
	db 5, 17, 15, 1, ZUBAT, $FF, $FF, $FF, HYPER_SONAR
	db 0, 2, 17, 1, ONIX, $FF, $FF, $FF, ROCK_TOMB
	db 2, 7, 19, 0, ONIX, $FF, $FF, $FF, ROCK_TOMB
	db 7, 16, 21, 0, ONIX, $FF, $FF, $FF, ROCK_TOMB
	db 16, 17, 28, 0, ONIX, $FF, $FF, $FF, $FF
	db -1 ; end

SECTION "Enemy Trainer Parties 2", ROMX

MistyGroup:
	; CAL (1)
	db "Misty@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

LtSurgeGroup:
	; LTSURGE (1)
	db "Lt.Surge@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

ScientistGroup:
	; SCIENTIST (1)
	db "Ross@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCIENTIST (2)
	db "Mitch@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCIENTIST (3)
	db "Jed@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCIENTIST (4)
	db "Marc@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCIENTIST (5)
	db "Rich@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

ErikaGroup:
	; ERIKA (1)
	db "Erika@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

YoungsterGroup:
	; YOUNGSTER (1)
	db "Joey@", TRAINERTYPE_ITEM | TRAINERTYPE_DVS
	db 0, 4, 4, 0, RATTATA, $AA,$AA, 1, CUTE_RIBBON
	db 4, 7, 8, 0, RATTATA, $AA,$AA, 1, CUTE_RIBBON
	db 7, 10, 15, 0, RATTATA, $AA,$AA, 1, CUTE_RIBBON
	db 10, 17, 26, 0, RATTATA, $AA,$AA, 1, CUTE_RIBBON
	db -1 ; end

	; YOUNGSTER (2)
	db "Mikey@", TRAINERTYPE_ITEM
	db 0, 6, 5, 0, CHARMANDER, 1, CINDERS
	db 2, 17, 0, 1, PIKACHU, 0, NO_ITEM
	db -1 ; end

	; YOUNGSTER (3)
	db "Albert@", TRAINERTYPE_NORMAL
	db 0, 17, 4, 1, RATTATA
	db 0, 4, 5, 1, ZUBAT
	db 4, 17, 8, 1, AIPOM
	db -1 ; end

	; YOUNGSTER (4)
	db "Gordon@", TRAINERTYPE_MOVES
	db 0, 6, 6, 0, DODUO, NO_MOVE, NO_MOVE, NO_MOVE, ICE_BEAM
	db 6, 17, 7, 1, DODUO, NO_MOVE, NO_MOVE, NO_MOVE, ICE_BEAM
	db 1, 17, 4, 1, ELEKID, NO_MOVE, NO_MOVE, NO_MOVE, ICE_BEAM
	db 7, 17, 8, 1, DODUO, NO_MOVE, NO_MOVE, NO_MOVE, ICE_BEAM
	db -1 ; end

	; YOUNGSTER (5)
	db "Samuel@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; YOUNGSTER (6)
	db "Ian@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; YOUNGSTER (7)
	db "Joey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; YOUNGSTER (8)
	db "Joey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; YOUNGSTER (9)
	db "Warren@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; YOUNGSTER (10)
	db "Jimmy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; YOUNGSTER (11)
	db "Owen@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; YOUNGSTER (12)
	db "Jason@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; YOUNGSTER (13)
	db "Joey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; YOUNGSTER (14)
	db "Joey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

SchoolboyGroup:
	; SCHOOLBOY (1)
	db "Jack@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (2)
	db "Kipp@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (3)
	db "Alan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (4)
	db "Johnny@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (5)
	db "Danny@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (6)
	db "Tommy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (7)
	db "Dudley@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (8)
	db "Joe@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (9)
	db "Billy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (10)
	db "Chad@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (11)
	db "Nate@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (12)
	db "Ricky@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (13)
	db "Jack@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (14)
	db "Jack@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (15)
	db "Alan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (16)
	db "Alan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (17)
	db "Chad@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (18)
	db "Jack@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (19)
	db "Jack@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (20)
	db "Alan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (21)
	db "Alan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (22)
	db "Alan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (23)
	db "Chad@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SCHOOLBOY (24)
	db "Chad@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BirdKeeperGroup:
	; BIRDKEEPER (1)
	db "Rod@", TRAINERTYPE_ITEM
	db 0, 17, 9, 1, SPEAROW, 0, PSNCUREBERRY
	db 0, 17, 9, 1, PIDGEY, 0, PSNCUREBERRY
	db -1 ; end

	; BIRDKEEPER (2)
	db "Abe@", TRAINERTYPE_ITEM
	db 0, 17, 9, 0, FARFETCH_D, 0, NO_ITEM
	db 0, 6, 10, 0, DELIBIRD, 0, BERRY
	db 6, 17, 12, 0, DELIBIRD, 0, GOLD_BERRY
	db -1 ; end

	; BIRDKEEPER (3)
	db "Bryan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIRDKEEPER (4)
	db "Theo@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIRDKEEPER (5)
	db "Toby@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIRDKEEPER (6)
	db "Denis@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIRDKEEPER (7)
	db "Vance@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIRDKEEPER (8)
	db "Hank@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIRDKEEPER (9)
	db "Roy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIRDKEEPER (10)
	db "Boris@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIRDKEEPER (11)
	db "Bob@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIRDKEEPER (12)
	db "Jose@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIRDKEEPER (13)
	db "Peter@", TRAINERTYPE_NORMAL
	db 0, 6, 5, 1, PIDGEY
	db 6, 17, 10, 1, PIDGEOTTO
	db 1, 17, 10, 1, NATU
	db 1, 17, 8, 1, NATU
	db -1 ; end

	; BIRDKEEPER (14)
	db "Jose@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIRDKEEPER (15)
	db "Perry@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIRDKEEPER (16)
	db "Bret@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIRDKEEPER (17)
	db "Jose@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIRDKEEPER (18)
	db "Vance@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIRDKEEPER (19)
	db "Vance@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIRDKEEPER (20)
	db "Chester@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

LassGroup:
	; LASS (1)
	db "Carrie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; LASS (2)
	db "Bridget@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; LASS (3)
	db "Alice@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; LASS (4)
	db "Krise@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; LASS (5)
	db "Connie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; LASS (6)
	db "Linda@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; LASS (7)
	db "Laura@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; LASS (8)
	db "Shannon@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; LASS (9)
	db "Michelle@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; LASS (10)
	db "Dana@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; LASS (11)
	db "Ellen@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; LASS (12)
	db "Connie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; LASS (13)
	db "Connie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; LASS (14)
	db "Dana@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; LASS (15)
	db "Dana@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; LASS (16)
	db "Dana@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; LASS (17)
	db "Dana@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

JanineGroup:
	; JANINE (1)
	db "Janine@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

CooltrainerMGroup:
	; COOLTRAINERM (1)
	db "Nick@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 1, CHARMANDER
	db 0, 17, 5, 1, BULBASAUR
	db 0, 17, 5, 1, SQUIRTLE
	db -1 ; end

	; COOLTRAINERM (2)
	db "Aaron@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERM (3)
	db "Paul@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERM (4)
	db "Cody@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERM (5)
	db "Mike@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERM (6)
	db "Gaven@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERM (7)
	db "Gaven@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERM (8)
	db "Ryan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERM (9)
	db "Jake@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERM (10)
	db "Gaven@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERM (11)
	db "Blake@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERM (12)
	db "Brian@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERM (13)
	db "Erick@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERM (14)
	db "Andy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERM (15)
	db "Tyler@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERM (16)
	db "Sean@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERM (17)
	db "Kevin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERM (18)
	db "Steve@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERM (19)
	db "Allen@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERM (20)
	db "Darin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

CooltrainerFGroup:
	; COOLTRAINERF (1)
	db "Gwen@", TRAINERTYPE_ITEM | TRAINERTYPE_DVS
	db 0, 6, 9, 0, EEVEE, $77, $77, 4, CUTE_RIBBON
	db 6, 17, 11, 0, EEVEE, $FD,$FD, 4, CUTE_RIBBON
	db 1, 17, 4, 0, JOLTEON, $77, $77, 0, NO_ITEM
	db 1, 17, 4, 0, FLAREON, $77, $77, 0, NO_ITEM
	db 1, 17, 4, 0, VAPOREON, $77, $77, 0, NO_ITEM
	db -1 ; end

	; COOLTRAINERF (2)
	db "Lois@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERF (3)
	db "Fran@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERF (4)
	db "Lola@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERF (5)
	db "Kate@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERF (6)
	db "Irene@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERF (7)
	db "Kelly@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERF (8)
	db "Joyce@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERF (9)
	db "Beth@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERF (10)
	db "Reena@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERF (11)
	db "Megan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERF (12)
	db "Beth@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERF (13)
	db "Carol@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERF (14)
	db "Quinn@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERF (15)
	db "Emma@", TRAINERTYPE_ITEM
	db 0, 17, 6, 2, POLIWAG, 4, GOLD_BERRY
	db 0, 5, 4, 1, POLIWAG, 4, GOLD_BERRY
	db 5, 17, 6, 0, POLIWHIRL, 4, GOLD_BERRY
	db -1 ; end

	; COOLTRAINERF (16)
	db "Cybil@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERF (17)
	db "Jenn@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERF (18)
	db "Beth@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERF (19)
	db "Reena@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERF (20)
	db "Reena@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; COOLTRAINERF (21)
	db "Cara@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BeautyGroup:
	; BEAUTY (1)
	db "Victoria@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BEAUTY (2)
	db "Samantha@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BEAUTY (3)
	db "Julie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BEAUTY (4)
	db "Jaclyn@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BEAUTY (5)
	db "Brenda@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BEAUTY (6)
	db "Cassie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BEAUTY (7)
	db "Caroline@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BEAUTY (8)
	db "Carlene@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BEAUTY (9)
	db "Jessica@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BEAUTY (10)
	db "Rachael@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BEAUTY (11)
	db "Angelica@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BEAUTY (12)
	db "Kendra@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BEAUTY (13)
	db "Veronica@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BEAUTY (14)
	db "Julia@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BEAUTY (15)
	db "Theresa@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BEAUTY (16)
	db "Valerie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BEAUTY (17)
	db "Olivia@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

PokemaniacGroup:
	; POKEMANIAC (1)
	db "Larry@", TRAINERTYPE_NORMAL
	db 2, 17, 4, 1, CHIKORITA
	db 0, 17, 6, 2, SLOWPOKE
	db 6, 17, 8, 2, LARVITAR
	db -1 ; end

	; POKEMANIAC (2)
	db "Andrew@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 1, CUBONE
	db 0, 17, 5, 1, CHARMANDER
	db -1 ; end

	; POKEMANIAC (3)
	db "Calvin@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 0, GLIGAR
	db 2, 17, 3, 0, KANGASKHAN
	db -1 ; end

	; POKEMANIAC (4)
	db "Shane@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEMANIAC (5)
	db "Ben@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEMANIAC (6)
	db "Brent@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEMANIAC (7)
	db "Ron@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEMANIAC (8)
	db "Ethan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEMANIAC (9)
	db "Brent@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEMANIAC (10)
	db "Brent@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEMANIAC (11)
	db "Issac@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEMANIAC (12)
	db "Donald@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEMANIAC (13)
	db "Zach@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEMANIAC (14)
	db "Brent@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEMANIAC (15)
	db "Miller@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

GruntMGroup:
	; GRUNTM (1)
	db "Grunt Dund@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 1, KOFFING
	db 0, 17, 5, 1, HOUNDOUR
	db -1 ; end

	; GRUNTM (2)
	db "Grunt Cain@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 1, RATTATA
	db 0, 17, 5, 1, ZUBAT
	db 0, 17, 5, 1, ZUBAT
	db -1 ; end

	; GRUNTM (3)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (4)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (5)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (6)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (7)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (8)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (9)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (10)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (11)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (12)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (13)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (14)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (15)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (16)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (17)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (18)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (19)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (20)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (21)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (22)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (23)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (24)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (25)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (26)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (27)
	db "Executive@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (28)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (29)
	db "Grunt Junior@", TRAINERTYPE_NORMAL
	db 0, 17, 0, 1, RATTATA
	db 0, 17, 0, 1, GRIMER
	db -1 ; end

	; GRUNTM (30)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTM (31)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

GentlemanGroup:
	; GENTLEMAN (1)
	db "Preston@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GENTLEMAN (2)
	db "Edward@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GENTLEMAN (3)
	db "Gregory@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GENTLEMAN (4)
	db "Virgil@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GENTLEMAN (5)
	db "Alfred@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

SkierGroup:
	; SKIER (1)
	db "Roxanne@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SKIER (2)
	db "Clarissa@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

TeacherGroup:
	; TEACHER (1)
	db "Colette@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; TEACHER (2)
	db "Hillary@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; TEACHER (3)
	db "Shirley@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

SabrinaGroup:
	; BIRD_KEEPER (1)
	db "Sabrina@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

SECTION "Enemy Trainer Parties 3", ROMX

BugCatcherGroup:
	; BUGCATCHER (1)
	db "Don@", TRAINERTYPE_NORMAL
	db 0, 17, 4, 1, CATERPIE
	db 0, 5, 4, 1, METAPOD
	db 1, 17, 0, 1, ELEKID
	db 5, 17, 12, 0, BUTTERFREE
	db -1 ; end

	; BUGCATCHER (2)
	db "Rob@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BUGCATCHER (3)
	db "Ed@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BUGCATCHER (4)
	db "Wade@", TRAINERTYPE_NORMAL
	db 0, 4, 4, 1, SPINARAK
	db 0, 4, 4, 1, SPINARAK
	db 0, 17, 8, 1, SPINARAK
	db 4, 17, 11, 1, SPINARAK
	db -1 ; end

	; BUGCATCHER (5)
	db "Benny@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BUGCATCHER (6)
	db "Al@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BUGCATCHER (7)
	db "Josh@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BUGCATCHER (8)
	db "Arnie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BUGCATCHER (9)
	db "Ken@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BUGCATCHER (10)
	db "Wade@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BUGCATCHER (11)
	db "Wade@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BUGCATCHER (12)
	db "Doug@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BUGCATCHER (13)
	db "Arnie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BUGCATCHER (14)
	db "Arnie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BUGCATCHER (15)
	db "Wade@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BUGCATCHER (16)
	db "Wade@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BUGCATCHER (17)
	db "Arnie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BUGCATCHER (18)
	db "Arnie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BUGCATCHER (19)
	db "Wayne@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BUGCATCHER (20)
	db "Maimo@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BUGCATCHER (21)
	db "Pippa@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

FisherGroup:
	; FISHER (1)
	db "Justin@", TRAINERTYPE_DVS
	db 0, 17, 5, 1, GOLDEEN, $47,$08
	db 1, 17, 8, 1, SLOWPOKE, $77, $77
	db 2, 17, 8, 0, GOLDEEN, $98,$8A
	db -1 ; end

	; FISHER (2)
	db "Ralph@", TRAINERTYPE_DVS | TRAINERTYPE_MOVES
	db 0, 17, 6, 1, MAGIKARP, $77, $77, $FF, $FF, $FF, $FF
	db 1, 9, 10, 0, DITTO, $23,$8A, CURSE,HIDDEN_POWER,TRANSFORM,NO_MOVE
	db 9, 17, 13, 0, DITTO, $23,$8A, CURSE,HIDDEN_POWER,TRANSFORM,NO_MOVE
	db -1 ; end

	; FISHER (3)
	db "Arnold@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 1, WOOPER
	db 1, 17, 10, 1, KRABBY
	db -1 ; end

	; FISHER (4)
	db "Kyle@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (5)
	db "Henry@", TRAINERTYPE_MOVES
	db 0, 4, 5, 1, POLIWAG, $FF, $FF, $FF, $FF
	db 0, 5, 5, 0, POLIWAG, $FF, $FF, $FF, $FF
	db 4, 17, 5, 1, POLIWHIRL, $FF, $FF, $FF, $FF
	db 5, 17, 3, 1, POLIWAG, $FF, $FF, $FF, SURF
	db -1 ; end

	; FISHER (6)
	db "Marvin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (7)
	db "Tully@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (8)
	db "Andre@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (9)
	db "Raymond@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (10)
	db "Wilton@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (11)
	db "Edgar@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (12)
	db "Jonah@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (13)
	db "Martin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (14)
	db "Stephen@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (15)
	db "Barney@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (16)
	db "Ralph@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (17)
	db "Ralph@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (18)
	db "Tully@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (19)
	db "Tully@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (20)
	db "Wilton@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (21)
	db "Scott@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (22)
	db "Wilton@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (23)
	db "Ralph@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (24)
	db "Ralph@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (25)
	db "Tully@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; FISHER (26)
	db "Terry@", TRAINERTYPE_NORMAL
	db 0, 5, 9, 0, DRATINI
	db 3, 17, 11, 0, DRATINI
	db 5, 17, 12, 0, DRAGONAIR
	db -1 ; end

SwimmerMGroup:
	; SWIMMERM (1)
	db "Harold@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (2)
	db "Simon@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (3)
	db "Randall@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (4)
	db "Charlie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (5)
	db "George@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (6)
	db "Berke@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (7)
	db "Kirk@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (8)
	db "Mathew@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (9)
	db "Hal@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (10)
	db "Paton@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (11)
	db "Daryl@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (12)
	db "Walter@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (13)
	db "Tony@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (14)
	db "Jerome@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (15)
	db "Tucker@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (16)
	db "Rick@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (17)
	db "Cameron@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (18)
	db "Seth@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (19)
	db "James@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (20)
	db "Lewis@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERM (21)
	db "Parker@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

SwimmerFGroup:
	; SWIMMERF (1)
	db "Elaine@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERF (2)
	db "Paula@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERF (3)
	db "Kaylee@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERF (4)
	db "Susie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERF (5)
	db "Denise@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERF (6)
	db "Kara@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERF (7)
	db "Wendy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERF (8)
	db "Lisa@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERF (9)
	db "Jill@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERF (10)
	db "Mary@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERF (11)
	db "Katie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERF (12)
	db "Dawn@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERF (13)
	db "Tara@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERF (14)
	db "Nicole@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERF (15)
	db "Lori@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERF (16)
	db "Jody@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERF (17)
	db "Nikki@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERF (18)
	db "Diana@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SWIMMERF (19)
	db "Briana@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

SailorGroup:
	; SAILOR (1)
	db "Eugene@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SAILOR (2)
	db "Huey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SAILOR (3)
	db "Terrell@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SAILOR (4)
	db "Kent@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SAILOR (5)
	db "Ernest@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SAILOR (6)
	db "Jeff@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SAILOR (7)
	db "Garrett@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SAILOR (8)
	db "Kenneth@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SAILOR (9)
	db "Stanly@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SAILOR (10)
	db "Harry@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SAILOR (11)
	db "Huey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SAILOR (12)
	db "Huey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SAILOR (13)
	db "Huey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

SuperNerdGroup:
	; SUPERNERD (1)
	db "Stan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SUPERNERD (2)
	db "Eric@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SUPERNERD (3)
	db "Gregg@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SUPERNERD (4)
	db "Jay@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SUPERNERD (5)
	db "Dave@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SUPERNERD (6)
	db "Sam@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SUPERNERD (7)
	db "Tom@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SUPERNERD (8)
	db "Pat@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SUPERNERD (9)
	db "Shawn@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SUPERNERD (10)
	db "Teru@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SUPERNERD (11)
	db "Russ@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SUPERNERD (12)
	db "Norton@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SUPERNERD (13)
	db "Hugh@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SUPERNERD (14)
	db "Markus@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

Rival2Group:
	; RIVAL2 (1)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL2 (2)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL2 (3)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL2 (4)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL2 (5)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; RIVAL2 (6)
	db "?@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

GuitaristGroup:
	; BUG_CATCHER (1)
	db "Clyde@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BUG_CATCHER (2)
	db "Vincent@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

HikerGroup:
	; HIKER (1)
	db "Anthony@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; HIKER (2)
	db "Russell@", TRAINERTYPE_NORMAL
	db 0, 6, 4, 1, GEODUDE
	db 1, 17, 6, 1, GEODUDE
	db 6, 17, 8, 1, PILOSWINE
	db 1, 17, 8, 1, GEODUDE
	db -1 ; end

	; HIKER (3)
	db "Phillip@", TRAINERTYPE_NORMAL
	db 0, 17, 6, 1, MAREEP
	db 0, 17, 9, 1, SENTRET
	db 4, 17, 9, 0, MURKROW
	db -1 ; end

	; HIKER (4)
	db "Leonard@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 1, MACHOP
	db 1, 17, 9, 1, GEODUDE
	db -1 ; end

	; HIKER (5)
	db "Anthony@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; HIKER (6)
	db "Benjamin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; HIKER (7)
	db "Erik@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; HIKER (8)
	db "Michael@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; HIKER (9)
	db "Parry@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; HIKER (10)
	db "Timothy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; HIKER (11)
	db "Bailey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; HIKER (12)
	db "Anthony@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; HIKER (13)
	db "Tim@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; HIKER (14)
	db "Noland@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; HIKER (15)
	db "Sidney@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; HIKER (16)
	db "Kenny@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; HIKER (17)
	db "Jim@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; HIKER (18)
	db "Daniel@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 0, ONIX
	db 6, 17, 10, 0, HITMONLEE
	db -1 ; end

	; HIKER (19)
	db "Parry@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; HIKER (20)
	db "Parry@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; HIKER (21)
	db "Anthony@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; HIKER (22)
	db "Anthony@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BikerGroup:
	; BIKER (1)
	db "Benny@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIKER (2)
	db "Kazu@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIKER (3)
	db "Dwayne@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIKER (4)
	db "Harris@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIKER (5)
	db "Zeke@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIKER (6)
	db "Charles@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIKER (7)
	db "Riley@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIKER (8)
	db "Joel@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BIKER (9)
	db "Glenn@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BlaineGroup:
	; BLAINE (1)
	db "Blaine@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BurglarGroup:
	; BURGLAR (1)
	db "Duncan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BURGLAR (2)
	db "Eddie@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BURGLAR (3)
	db "Corey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

FirebreatherGroup:
	; SUPER_NERD (1)
	db "Otis@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SUPER_NERD (2)
	db "Dick@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SUPER_NERD (3)
	db "Ned@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SUPER_NERD (4)
	db "Burt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SUPER_NERD (5)
	db "Bill@", TRAINERTYPE_MOVES
	db 0, 17, 4, 1, KOFFING, $FF, $FF, $FF, WILL_O_WISP
	db 0, 17, 4, 1, KOFFING, $FF, $FF, $FF, WILL_O_WISP
	db 5, 17, 0, 1, KOFFING, $FF, $FF, FIRE_FLICK, WILL_O_WISP
	db -1 ; end

	; SUPER_NERD (6)
	db "Walt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; SUPER_NERD (7)
	db "Ray@", TRAINERTYPE_MOVES
	db 0, 17, 6, 1, VULPIX, $FF, $FF, ZEN_HEADBUTT, $FF
	db 3, 17, 10, 1, VULPIX, $FF, $FF, ZEN_HEADBUTT, $FF
	db -1 ; end

	; SUPER_NERD (8)
	db "Lyle@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

JugglerGroup:
	; JUGGLER (1)
	db "Irwin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; JUGGLER (2)
	db "Fritz@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; JUGGLER (3)
	db "Horton@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; JUGGLER (4)
	db "Irwin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; JUGGLER (5)
	db "Irwin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; JUGGLER (6)
	db "Irwin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BlackbeltGroup:
	; BLACKBELT (1)
	db "Kenji@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BLACKBELT (2)
	db "Yoshi@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BLACKBELT (3)
	db "Kenji@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BLACKBELT (4)
	db "Lao@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BLACKBELT (5)
	db "Nob@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BLACKBELT (6)
	db "Kiyo@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BLACKBELT (7)
	db "Lung@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BLACKBELT (8)
	db "Kenji@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BLACKBELT (9)
	db "Wai@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

ExecutiveMGroup:
	; EXECUTIVEM (1)
	db "Executive@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; EXECUTIVEM (2)
	db "Executive@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; EXECUTIVEM (3)
	db "Executive@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; EXECUTIVEM (4)
	db "Executive@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

PsychicGroup:
	; PSYCHIC (1)
	db "Nathan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PSYCHIC (2)
	db "Franklin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PSYCHIC (3)
	db "Hernan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PSYCHIC (4)
	db "Fidel@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PSYCHIC (5)
	db "Greg@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PSYCHIC (6)
	db "Norman@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PSYCHIC (7)
	db "Mark@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PSYCHIC (8)
	db "Phil@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PSYCHIC (9)
	db "Richard@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PSYCHIC (10)
	db "Gilbert@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PSYCHIC (11)
	db "Jared@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PSYCHIC (12)
	db "Rodney@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

PicnickerGroup:
	; PICNICKER (1)
	db "Liz@", TRAINERTYPE_NORMAL
	db 0, 2, 7, 0, NIDORAN_F
	db 2, 4, 4, 1, NIDORAN_F
	db 2, 17, 9, 1, NIDORINA
	db 4, 17, 10, 1, SNEASEL
	db -1 ; end

	; PICNICKER (2)
	db "Gina@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (3)
	db "Brooke@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (4)
	db "Kim@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (5)
	db "Cindy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (6)
	db "Hope@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (7)
	db "Sharon@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (8)
	db "Debra@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (9)
	db "Gina@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (10)
	db "Erin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (11)
	db "Liz@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (12)
	db "Liz@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (13)
	db "Heidi@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (14)
	db "Edna@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (15)
	db "Gina@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (16)
	db "Tiffany@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (17)
	db "Tiffany@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (18)
	db "Erin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (19)
	db "Tanya@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (20)
	db "Tiffany@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (21)
	db "Erin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (22)
	db "Liz@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (23)
	db "Liz@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (24)
	db "Gina@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (25)
	db "Gina@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PICNICKER (26)
	db "Tiffany@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

SECTION "Enemy Trainer Parties 4", ROMX

CamperGroup:
	; CAMPER (1)
	db "Roland@", TRAINERTYPE_ITEM
	db 0, 5, 5, 1, NIDORAN_M, 0, NO_ITEM
	db 1, 6, 3, 1, NIDORAN_M, 6, MINT_BERRY
	db 6, 7, 6, 1, NIDORAN_M, 0, NO_ITEM
	db 5, 17, 6, 1, PINECO, 0, NO_ITEM
	db 7, 17, 10, 1, NIDORINO, 0, MINT_BERRY
	db -1 ; end

	; CAMPER (2)
	db "Todd@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; CAMPER (3)
	db "Ivan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; CAMPER (4)
	db "Elliot@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; CAMPER (5)
	db "Barry@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; CAMPER (6)
	db "Lloyd@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; CAMPER (7)
	db "Dean@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; CAMPER (8)
	db "Sid@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; CAMPER (9)
	db "Harvey@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 0, MANKEY
	db 4, 17, 5, 0, TAUROS
	db -1 ; end

	; CAMPER (10)
	db "Dale@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; CAMPER (11)
	db "Ted@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 1, MANKEY
	db 4, 17, 5, 0, TAUROS
	db -1 ; end

	; CAMPER (12)
	db "Todd@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; CAMPER (13)
	db "Todd@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; CAMPER (14)
	db "Thomas@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; CAMPER (15)
	db "Leroy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; CAMPER (16)
	db "David@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; CAMPER (17)
	db "John@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; CAMPER (18)
	db "Jerry@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; CAMPER (19)
	db "Spencer@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; CAMPER (20)
	db "Todd@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; CAMPER (21)
	db "Todd@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; CAMPER (22)
	db "Quentin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

ExecutiveFGroup:
	; BLACKBELT_T (1)
	db "Executive@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BLACKBELT_T (2)
	db "Executive@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

SageGroup:
	; PSYCHIC_T (1)
	db "Chow@", TRAINERTYPE_NORMAL
	db 0, 4, 3, 1, BELLSPROUT
	db 0, 4, 4, 1, BELLSPROUT
	db 4, 6, 1, 0, WEEPINBELL
	db 4, 17, 6, 1, BELLSPROUT
	db 0, 17, 4, 1, HOOTHOOT
	db -1 ; end

	; PSYCHIC_T (2)
	db "Nico@", TRAINERTYPE_NORMAL
	db 0, 6, 3, 1, BELLSPROUT
	db 0, 5, 3, 1, POLIWAG
	db 6, 17, 1, 0, WEEPINBELL
	db 5, 17, 6, 2, POLIWAG
	db -1 ; end

	; PSYCHIC_T (3)
	db "Jin@", TRAINERTYPE_ITEM
	db 0, 17, 4, 0, BELLSPROUT, 3, GOLD_BERRY
	db 0, 17, 4, 0, BELLSPROUT, 4, GOLD_BERRY
	db 0, 17, 4, 0, BELLSPROUT, 5, GOLD_BERRY
	db 3, 4, 6, 0, BELLSPROUT, 0, NO_ITEM
	db 4, 17, 10, 0, WEEPINBELL, 0, NO_ITEM
	db -1 ; end

	; PSYCHIC_T (4)
	db "Troy@", TRAINERTYPE_NORMAL
	db 0, 6, 9, 0, PSYDUCK
	db 6, 17, 13, 1, PSYDUCK
	db -1 ; end

	; PSYCHIC_T (5)
	db "Jeffrey@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PSYCHIC_T (6)
	db "Ping@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PSYCHIC_T (7)
	db "Edmond@", TRAINERTYPE_NORMAL
	db 0, 17, 7, 1, HOOTHOOT
	db 6, 17, 12, 0, UMBREON
	db -1 ; end

	; PSYCHIC_T (8)
	db "Neal@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PSYCHIC_T (9)
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

	; PSYCHIC_T (10)
	db "Gaku@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PSYCHIC_T (11)
	db "Masa@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; PSYCHIC_T (12)
	db "Koji@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

MediumGroup:
	; MEDIUM (1)
	db "Martha@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; MEDIUM (2)
	db "Grace@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; MEDIUM (3)
	db "Bethany@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; MEDIUM (4)
	db "Margret@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; MEDIUM (5)
	db "Ethel@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; MEDIUM (6)
	db "Rebecca@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; MEDIUM (7)
	db "Doris@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BoarderGroup:
	; BOARDER (1)
	db "Ronald@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BOARDER (2)
	db "Brad@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; BOARDER (3)
	db "Douglas@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

PokefanMGroup:
	; POKEFANM (1)
	db "William@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEFANM (2)
	db "Derek@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEFANM (3)
	db "Robert@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEFANM (4)
	db "Joshua@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEFANM (5)
	db "Carter@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEFANM (6)
	db "Trevor@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEFANM (7)
	db "Brandon@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEFANM (8)
	db "Jeremy@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEFANM (9)
	db "Colin@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEFANM (10)
	db "Derek@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEFANM (11)
	db "Derek@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEFANM (12)
	db "Alex@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEFANM (13)
	db "Rex@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEFANM (14)
	db "Allan@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

KimonoGirlGroup:
	; KIMONOGIRL (1)
	db "Naoko@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; KIMONOGIRL (2)
	db "Naoko@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; KIMONOGIRL (3)
	db "Sayo@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; KIMONOGIRL (4)
	db "Zuki@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; KIMONOGIRL (5)
	db "Kuni@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; KIMONOGIRL (6)
	db "Miki@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

TwinsGroup:
	; TWINS (1)
	db "Amy & May@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; TWINS (2)
	db "Ann & Anne@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; TWINS (3)
	db "Ann & Anne@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; TWINS (4)
	db "Amy  & May@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; TWINS (5)
	db "Jo & Zoe@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; TWINS (6)
	db "Jo & Zoe@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; TWINS (7)
	db "Meg & Peg@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; TWINS (8)
	db "Meg & Peg@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; TWINS (9)
	db "Lea & Pia@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; TWINS (10)
	db "Lea & Pia@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

PokefanFGroup:
	; POKEFANF (1)
	db "Beverly@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEFANF (2)
	db "Ruth@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEFANF (3)
	db "Beverly@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEFANF (4)
	db "Beverly@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEFANF (5)
	db "Georgia@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; POKEFANF (6)
	db "Jaime@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

RedGroup:
	; KIMONO_GIRL (1)
	db "Red@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

BlueGroup:
	; BLUE (1)
	db "Blue@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

OfficerGroup:
	; OFFICER (1)
	db "Keith@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; OFFICER (2)
	db "Dirk@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

GruntFGroup:
	; GRUNTF (1)
	db "Grunt Fenna@", TRAINERTYPE_NORMAL
	db 0, 17, 5, 1, EKANS
	db -1 ; end

	; GRUNTF (2)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTF (3)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTF (4)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

	; GRUNTF (5)
	db "Grunt@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

VideoGameBoyGroup:
	; VIDEOGAMEBOY (1)
	db "Arin@", TRAINERTYPE_DVS | TRAINERTYPE_MOVES | TRAINERTYPE_NICKNAME
	db 0, 6, 5, 1, CHARMANDER, "Sch@       ", $D2, $AA, $FF, $FF, $FF, $FF
	db 0, 6, 5, 1, GEODUDE, "TurntSNACO@", $EE, $EF, $FF, $FF, $FF, $FF
	db 6, 17, 10, 1, GRAVELER, "TurntSNACO@", $EE, $EF, $FF, $FF, $FF, $FF
	db 0, 17, 5, 0, RATTATA, "Knurttt@   ", $5D, $FE, $FF, $FF, $FF, $FF
	db 0, 17, 5, 1, DIGLETT, "Buttnuttz!@", $BA, $CC, $FF, $FF, $FF, $FF
	db 0, 17, 5, 1, PIKACHU, "SPLAART!!!@", $79, $EF, $FF, $FF, $FF, $FF
	db 6, 17, 10, 1, CHARMANDER, "Sch@       ", $D2, $AA, WING_ATTACK, CRUNCH, FIRE_SPIN, SCARY_FACE
	db 0, 5, 5, 1, WEEDLE, "Bundt,@    ", $FE, $EF, $FF, $FF, $FF, $FF
	db 5, 7, 12, 1, WEEDLE, "Bundt,@    ", $FE, $EF, $FF, $FF, $FF, $FF
	db 7, 17, 30, 1, WEEDLE, "Bundt,@    ", $FE, $EF, $FF, $FF, $FF, $FF
	db -1 ; end

TrainerDannyGroup:
	; TRAINERDANNY (1)
	db "Sexbang@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, GROWLITHE
	db 0, 17, 3, 0, LAPRAS
	db 0, 17, 0, 0, PONYTA
	db 0, 17, 0, 0, LICKITUNG
	db 0, 17, 0, 0, ENTEI
	db 0, 17, 3, 0, STANTLER
	db -1 ; end

MysticalmanGroup:
	; MYSTICALMAN (1)
	db "Eusine@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

ProJaredGroup:
	; PROJARED (1)
	db "Jared@", TRAINERTYPE_NICKNAME
	db 0, 4, 5, 1, SQUIRTLE, "Lagiacrus@ "
	db 0, 4, 5, 1, PIDGEY, "Oh,he@     "
	db 2, 4, 10, 1, GOLBAT, "Jeflump@   "
	db 2, 5, 10, 1, CUBONE, "Wepler@    "
	db 4, 6, 10, 1, SNORLAX, "Burden@    "
	db 4, 6, 5, 1, RATTATA, "Blamblegam@"
	db 6, 17, 10, 1, LAPRAS, "Jorm@      "
	db 6, 17, 0, 0, GROWLITHE, "Idilsor@   "
	db 6, 17, 5, 1, MAGNETON, "Q@         "
	db 6, 17, 0, 0, CLOYSTER, "Stellar@   "
	db 6, 17, 0, 0, TENTACOOL, "Leebin@    "
	db 1, 17, 10, 1, ODDISH, "Nuptup@    "
	db -1 ; end

BeekeeperBarryGroup:
	; BEEKEEPERBARRY (1)
	db "Barry@", TRAINERTYPE_NORMAL
	db 0, 17, 3, 0, BULBASAUR
	db -1 ; end

SECTION "Enemy Trainer Parties 5", ROMX

