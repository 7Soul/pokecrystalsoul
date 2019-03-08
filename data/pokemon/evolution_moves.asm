LearnEvolutionMove:
	ld a, [wTempSpecies]
	ld [wCurPartySpecies], a
	dec a
	ld c, a
	ld b, 0
	ld hl, EvolutionMoves
	add hl, bc
	ld a, [hl]
	and a
	ret z

	push hl
	ld d, a
	ld hl, wPartyMon1Moves
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes

	ld b, NUM_MOVES
.check_move
	ld a, [hli]
	cp d
	jr z, .has_move
	dec b
	jr nz, .check_move

	ld a, d
	ld [wPutativeTMHMMove], a
	ld [wNamedObjectIndexBuffer], a
	call GetMoveName
	call CopyName1
	predef LearnMove
	ld a, [wCurPartySpecies]
	ld [wTempSpecies], a

.has_move
	pop hl
	ret

EvolutionMoves::
	db NO_MOVE ; Bulbasaur
	db NO_MOVE ; Ivysaur
	db PETAL_DANCE ; Venusaur
	db NO_MOVE ; Charmander
	db NO_MOVE ; Charmeleon
	db WING_ATTACK ; Charizard
	db NO_MOVE ; Squirtle
	db NO_MOVE ; Wartortle
	db NO_MOVE ; Blastoise
	db NO_MOVE ; Caterpie
	db HARDEN ; Metapod
	db GUST ; Butterfree
	db NO_MOVE ; Weedle
	db HARDEN ; Kakuna
	db TWINEEDLE ; Beedrill
	db NO_MOVE ; Pidgey
	db NO_MOVE ; Pidgeotto
	db NO_MOVE ; Pidgeot
	db NO_MOVE ; Rattata
	db SCARY_FACE ; Raticate
	db NO_MOVE ; Spearow
	db NO_MOVE ; Fearow
	db NO_MOVE ; Ekans
	db CRUNCH ; Arbok
	db NO_MOVE ; Pikachu
	db NO_MOVE ; Raichu
	db NO_MOVE ; Sandshrew
	db NO_MOVE ; Sandslash
	db NO_MOVE ; NidoranF
	db NO_MOVE ; Nidorina
	db SUBMISSION ; Nidoqueen
	db NO_MOVE ; NidoranM
	db NO_MOVE ; Nidorino
	db BRICK_BREAK ; Nidoking
	db NO_MOVE ; Clefairy
	db NO_MOVE ; Clefable
	db NO_MOVE ; Vulpix
	db NO_MOVE ; Ninetales
	db NO_MOVE ; Jigglypuff
	db NO_MOVE ; Wigglytuff
	db NO_MOVE ; Zubat
	db NO_MOVE ; Golbat
	db NO_MOVE ; Oddish
	db NO_MOVE ; Gloom
	db NO_MOVE ; Vileplume
	db NO_MOVE ; Paras
	db NO_MOVE ; Parasect
	db NO_MOVE ; Venonat
	db GUST ; Venomoth
	db NO_MOVE ; Diglett
	db TRI_ATTACK ; Dugtrio
	db NO_MOVE ; Meowth
	db POWER_GEM ; Persian
	db NO_MOVE ; Psyduck
	db NO_MOVE ; Golduck
	db NO_MOVE ; Mankey
	db RAGE ; Primeape
	db NO_MOVE ; Growlithe
	db NO_MOVE ; Arcanine
	db NO_MOVE ; Poliwag
	db NO_MOVE ; Poliwhirl
	db SUBMISSION ; Poliwrath
	db NO_MOVE ; Abra
	db CONFUSION ; Kadabra
	db NO_MOVE ; Alakazam
	db NO_MOVE ; Machop
	db NO_MOVE ; Machoke
	db NO_MOVE ; Machamp
	db NO_MOVE ; Bellsprout
	db NO_MOVE ; Weepinbell
	db NO_MOVE ; Victreebel
	db NO_MOVE ; Tentacool
	db NO_MOVE ; Tentacruel
	db NO_MOVE ; Geodude
	db NO_MOVE ; Graveler
	db NO_MOVE ; Golem
	db NO_MOVE ; Ponyta
	db STAMPEDE ; Rapidash
	db NO_MOVE ; Slowpoke
	db HARDEN ; Slowbro
	db NO_MOVE ; Magnemite
	db TRI_ATTACK ; Magneton
	db NO_MOVE ; FarfetchD
	db NO_MOVE ; Doduo
	db TRI_ATTACK ; Dodrio
	db NO_MOVE ; Seel
	db FISSURE ; Dewgong
	db NO_MOVE ; Grimer
	db NO_MOVE ; Muk
	db NO_MOVE ; Shellder
	db NO_MOVE ; Cloyster
	db NO_MOVE ; Gastly
	db NO_MOVE ; Haunter
	db NO_MOVE ; Gengar
	db NO_MOVE ; Onix
	db NO_MOVE ; Drowzee
	db NO_MOVE ; Hypno
	db NO_MOVE ; Krabby
	db NO_MOVE ; Kingler
	db NO_MOVE ; Voltorb
	db NO_MOVE ; Electrode
	db NO_MOVE ; Exeggcute
	db STOMP ; Exeggutor
	db NO_MOVE ; Cubone
	db NO_MOVE ; Marowak
	db DOUBLE_KICK ; Hitmonlee
	db COMET_PUNCH ; Hitmonchan
	db NO_MOVE ; Lickitung
	db NO_MOVE ; Koffing
	db NO_MOVE ; Weezing
	db NO_MOVE ; Rhyhorn
	db HAMMER_ARM ; Rhydon
	db NO_MOVE ; Chansey
	db NO_MOVE ; Tangela
	db NO_MOVE ; Kangaskhan
	db NO_MOVE ; Horsea
	db NO_MOVE ; Seadra
	db NO_MOVE ; Goldeen
	db NO_MOVE ; Seaking
	db NO_MOVE ; Staryu
	db NO_MOVE ; Starmie
	db NO_MOVE ; MrMime
	db NO_MOVE ; Scyther
	db NO_MOVE ; Jynx
	db NO_MOVE ; Electabuzz
	db NO_MOVE ; Magmar
	db NO_MOVE ; Pinsir
	db NO_MOVE ; Tauros
	db NO_MOVE ; Magikarp
	db BITE ; Gyarados
	db NO_MOVE ; Lapras
	db NO_MOVE ; Ditto
	db NO_MOVE ; Eevee
	db WATER_GUN ; Vaporeon
	db THUNDERSHOCK ; Jolteon
	db EMBER ; Flareon
	db NO_MOVE ; Porygon
	db NO_MOVE ; Omanyte
	db SPIKE_CANNON ; Omastar
	db NO_MOVE ; Kabuto
	db SLASH ; Kabutops
	db NO_MOVE ; Aerodactyl
	db NO_MOVE ; Snorlax
	db NO_MOVE ; Articuno
	db NO_MOVE ; Zapdos
	db NO_MOVE ; Moltres
	db NO_MOVE ; Dratini
	db NO_MOVE ; Dragonair
	db WING_ATTACK ; Dragonite
	db NO_MOVE ; Mewtwo
	db NO_MOVE ; Mew
	db NO_MOVE ; Chikorita
	db NO_MOVE ; Bayleef
	db PETAL_DANCE ; Meganium
	db NO_MOVE ; Cyndaquil
	db NO_MOVE ; Quilava
	db NO_MOVE ; Typhlosion
	db NO_MOVE ; Totodile
	db NO_MOVE ; Croconaw
	db NO_MOVE ; Feraligatr
	db AGILITY ; Sentret
	db NO_MOVE ; Furret
	db NO_MOVE ; Hoothoot
	db NO_MOVE ; Noctowl
	db NO_MOVE ; Ledyba
	db NO_MOVE ; Ledian
	db NO_MOVE ; Spinarak
	db NO_MOVE ; Ariados
	db NO_MOVE ; Crobat
	db NO_MOVE ; Chinchou
	db NO_MOVE ; Lanturn
	db NO_MOVE ; Pichu
	db NO_MOVE ; Cleffa
	db NO_MOVE ; Igglybuff
	db NO_MOVE ; Togepi
	db NO_MOVE ; Togetic
	db NO_MOVE ; Natu
	db AIR_SLASH ; Xatu
	db NO_MOVE ; Mareep
	db NO_MOVE ; Flaaffy
	db THUNDERPUNCH ; Ampharos
	db MAGICAL_LEAF ; Bellossom
	db NO_MOVE ; Marill
	db NO_MOVE ; Azumarill
	db NO_MOVE ; Sudowoodo
	db NO_MOVE ; Politoed
	db NO_MOVE ; Hoppip
	db NO_MOVE ; Skiploom
	db NO_MOVE ; Jumpluff
	db NO_MOVE ; Aipom
	db NO_MOVE ; Sunkern
	db NO_MOVE ; Sunflora
	db NO_MOVE ; Yanma
	db NO_MOVE ; Wooper
	db NO_MOVE ; Quagsire
	db CONFUSION ; Espeon
	db PURSUIT ; Umbreon
	db NO_MOVE ; Murkrow
	db NO_MOVE ; Slowking
	db NO_MOVE ; Misdreavus
	db NO_MOVE ; Unown
	db NO_MOVE ; Wobbuffet
	db NO_MOVE ; Girafarig
	db NO_MOVE ; Pineco
	db NO_MOVE ; Forretress
	db NO_MOVE ; Dunsparce
	db NO_MOVE ; Gligar
	db NO_MOVE ; Steelix
	db NO_MOVE ; Snubbull
	db NO_MOVE ; Granbull
	db NO_MOVE ; Qwilfish
	db NO_MOVE ; Scizor
	db NO_MOVE ; Shuckle
	db NO_MOVE ; Heracross
	db NO_MOVE ; Sneasel
	db NO_MOVE ; Teddiursa
	db NO_MOVE ; Ursaring
	db NO_MOVE ; Slugma
	db NO_MOVE ; Magcargo
	db NO_MOVE ; Swinub
	db NO_MOVE ; Piloswine
	db NO_MOVE ; Corsola
	db NO_MOVE ; Remoraid
	db OCTAZOOKA ; Octillery
	db NO_MOVE ; Delibird
	db NO_MOVE ; Mantine
	db NO_MOVE ; Skarmory
	db NO_MOVE ; Houndour
	db NO_MOVE ; Houndoom
	db NO_MOVE ; Kingdra
	db NO_MOVE ; Phanpy
	db STAMPEDE ; Donphan
	db NO_MOVE ; Porygon2
	db NO_MOVE ; Stantler
	db NO_MOVE ; Smeargle
	db NO_MOVE ; Tyrogue
	db ROLLING_KICK ; Hitmontop
	db NO_MOVE ; Smoochum
	db NO_MOVE ; Elekid
	db NO_MOVE ; Magby
	db NO_MOVE ; Miltank
	db NO_MOVE ; Blissey
	db NO_MOVE ; Raikou
	db NO_MOVE ; Entei
	db NO_MOVE ; Suicune
	db NO_MOVE ; Larvitar
	db NO_MOVE ; Pupitar
	db NO_MOVE ; Tyranitar
	db NO_MOVE ; Lugia
	db NO_MOVE ; HoOh
	db NO_MOVE ; Celebi
	