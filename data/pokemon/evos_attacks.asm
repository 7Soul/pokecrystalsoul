INCLUDE "constants.asm"
SECTION "Evolutions and Attacks", ROMX

; Evos+attacks data structure:
; - Evolution methods:
;    * db EVOLVE_LEVEL, level, species
;    * db EVOLVE_ITEM, used item, species
;    * db EVOLVE_TRADE, held item (or -1 for none), species
;    * db EVOLVE_HAPPINESS, TR_* constant (ANYTIME, MORNDAY, NITE), species
;    * db EVOLVE_STAT, level, ATK_*_DEF constant (LT, GT, EQ), species
; - db 0 ; no more evolutions
; - Learnset (in increasing level order):
;    * db level, move
; - db 0 ; no more level-up moves

;INCLUDE "data/pokemon/evolution_moves.asm"
INCLUDE "data/pokemon/evos_attacks_pointers.asm"
BulbasaurEvosAttacks:
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWL
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 15, POISONPOWDER
	db 15, SLEEP_POWDER
	db 18, RAZOR_LEAF
	db 22, LEAF_SHIELD
	db 27, GROWTH
	db 32, DOUBLE_EDGE
	db 39, SYNTHESIS
	db 43, DRILL_PECK ; becomes Seed Bomb
	db 46, SOLARBEAM
	db 50, LEAF_STORM
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 15, POISONPOWDER
	db 15, SLEEP_POWDER
	db 21, RAZOR_LEAF
	db 28, LEAF_SHIELD
	db 31, GROWTH
	db 36, DOUBLE_EDGE
	db 43, SYNTHESIS
	db 46, DRILL_PECK ; becomes Seed Bomb
	db 50, SOLARBEAM
	db 54, LEAF_STORM
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	db 0 ; no more evolutions
	db 15, SLEEP_POWDER
	db 21, RAZOR_LEAF
	db 28, LEAF_SHIELD
	db 31, PETAL_DANCE
	db 35, GROWTH
	db 40, DOUBLE_EDGE
	db 47, SYNTHESIS
	db 50, DRILL_PECK ; becomes Seed Bomb
	db 54, SOLARBEAM
	db 63, LEAF_STORM
	db 0 ; no more level-up moves

CharmanderEvosAttacks:
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 8, SMOKESCREEN
	db 11, EMBER
	db 18, FURY_ATTACK
	db 20, RAGE
	db 25, SCARY_FACE
	db 27, FIRE_SPIN
	db 33, SLASH
	db 37, FLAMETHROWER
	db 44, CRUNCH
	db 52, MIRROR_MOVE
	db 52, DOUBLE_EDGE ; becomes Flare Blitz
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 8, SMOKESCREEN
	db 11, EMBER
	db 18, FURY_ATTACK
	db 22, RAGE
	db 27, SCARY_FACE
	db 29, FIRE_SPIN
	db 35, SLASH
	db 41, FLAMETHROWER
	db 48, CRUNCH
	db 60, MIRROR_MOVE
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	db 27, SCARY_FACE
	db 29, FIRE_SPIN
	db 35, SLASH
	db 35, WING_ATTACK
	db 43, FLAMETHROWER
	db 50, CRUNCH
	db 62, MIRROR_MOVE
	db 66, AIR_SLASH
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, TAIL_WHIP
	db 7, BUBBLE
	db 10, HARDEN
	db 13, WATER_GUN
	db 19, BITE
	db 21, RAPID_SPIN
	db 24, SIGNAL_BEAM ; becomes Water Pulse
	db 26, PROTECT
	db 31, AQUA_TAIL
	db 37, SKULL_BASH
	db 40, RAIN_DANCE
	db 43, VITAL_THROW
	db 46, HYDRO_PUMP
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	db 4, TAIL_WHIP
	db 7, BUBBLE
	db 10, HARDEN
	db 13, WATER_GUN
	db 19, BITE
	db 21, RAPID_SPIN
	db 26, SIGNAL_BEAM ; becomes Water Pulse
	db 28, PROTECT
	db 33, AQUA_TAIL
	db 41, SKULL_BASH
	db 44, RAIN_DANCE
	db 47, VITAL_THROW
	db 53, HYDRO_PUMP
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	db 0 ; no more evolutions
	db 19, BITE
	db 21, RAPID_SPIN
	db 24, SIGNAL_BEAM ; becomes Water Pulse
	db 28, PROTECT
	db 32, AQUA_TAIL
	db 44, SKULL_BASH
	db 47, RAIN_DANCE
	db 53, VITAL_THROW
	db 60, HYDRO_PUMP
	db 0 ; no more level-up moves

CaterpieEvosAttacks:
	db EVOLVE_LEVEL, 7, METAPOD
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, STRING_SHOT
	db 5, DOUBLESLAP ; becomes Pin Missile
	db 9, LEECH_LIFE
	db 14, NASTY_PLOT
	db 19, PURSUIT
	db 22, TWINEEDLE
	db 32, BULK_UP
	db 34, REFLECT
	db 41, FELL_STINGER
	db 49, MEGAHORN
	db 0 ; no more level-up moves

MetapodEvosAttacks:
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0 ; no more evolutions
	db 1, HARDEN
	db 5, DOUBLESLAP ; becomes Pin Missile
	db 6, HARDEN
	db 9, LEECH_LIFE
	db 14, NASTY_PLOT
	db 20, PURSUIT
	db 23, TWINEEDLE
	db 33, MOONLIGHT
	db 35, REFLECT
	db 43, FELL_STINGER
	db 53, MEGAHORN
	db 0 ; no more level-up moves

ButterfreeEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 9, GUST
	db 11, CONFUSION
	db 13, POISONPOWDER
	db 14, STUN_SPORE
	db 15, SLEEP_POWDER
	db 18, SUPERSONIC
	db 20, SILVER_WIND
	db 25, WHIRLWIND	
	db 34, PSYBEAM
	db 40, SAFEGUARD
	db 49, BUG_BUZZ
	db 0 ; no more level-up moves

WeedleEvosAttacks:
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 5, LEAF_SHIELD
	db 10, LEECH_LIFE
	db 14, ACID
	db 19, ACID_ARMOR
	db 22, TWINEEDLE
	db 29, CHARM
	db 34, SPIKES
	db 41, FELL_STINGER
	db 50, PAIN_SPLIT
	db 0 ; no more level-up moves

KakunaEvosAttacks:
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0 ; no more evolutions
	db 1, HARDEN
	db 5, LEAF_SHIELD
	db 6, HARDEN
	db 10, LEECH_LIFE
	db 15, ACID
	db 20, ACID_ARMOR
	db 24, TWINEEDLE
	db 33, CHARM
	db 39, SPIKES
	db 44, FELL_STINGER
	db 54, PAIN_SPLIT
	db 0 ; no more level-up moves

BeedrillEvosAttacks:
	db 0 ; no more evolutions
	db 1, FURY_ATTACK
	db 9, TWINEEDLE
	db 11, FURY_ATTACK
	db 15, FOCUS_ENERGY
	db 19, RAGE
	db 23, VENOSHOCK
	db 28, ZOOM_FLIGHT
	db 30, PURSUIT
	db 35, DOUBLESLAP ; becomes Pin Missile
	db 41, AGILITY
	db 44, FELL_STINGER
	db 51, SKY_ATTACK
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, SAND_ATTACK
	db 8, GUST
	db 13, QUICK_ATTACK
	db 21, TWISTER
	db 23, SCREECH ; becomes Feather Dance
	db 29, AGILITY
	db 33, WING_ATTACK
	db 35, DOUBLE_TEAM ; unevolved move
	db 37, RECOVER ; becomes Roost
	db 40, MIRROR_MOVE
	db 46, SWAGGER
	db 46, FLY ;;;;;
	db 50, DIZZY_PUNCH ; becomes Hurricane
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	db EVOLVE_LEVEL, 36, PIDGEOT
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, SAND_ATTACK
	db 8, GUST
	db 13, QUICK_ATTACK
	db 21, TWISTER
	db 24, SCREECH ; becomes Feather Dance
	db 31, AGILITY
	db 35, WING_ATTACK
	db 39, RECOVER ; becomes Roost
	db 43, MIRROR_MOVE
	db 49, SWAGGER
	db 54, DIZZY_PUNCH ; becomes Hurricane
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	db 21, TWISTER
	db 24, SCREECH ; becomes Feather Dance
	db 31, AGILITY
	db 35, WING_ATTACK
	db 42, RECOVER ; becomes Roost
	db 45, MIRROR_MOVE
	db 51, SWAGGER
	db 57, DIZZY_PUNCH ; becomes Hurricane
	db 0 ; no more level-up moves

RattataEvosAttacks:
	db EVOLVE_LEVEL, 20, RATICATE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, QUICK_ATTACK
	db 10, BITE
	db 13, PURSUIT
	db 16, HYPER_FANG	
	db 21, LEAF_SHIELD	
	db 23, DIG
	db 27, CRUNCH
	db 30, FOCUS_ENERGY
	db 36, SUPER_FANG
	db 42, DOUBLE_EDGE
	db 46, REVERSAL
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 13, PURSUIT
	db 16, HYPER_FANG
	db 19, SCARY_FACE
	db 23, LEAF_SHIELD	
	db 26, DIG
	db 31, CRUNCH
	db 34, FOCUS_ENERGY
	db 40, SUPER_FANG
	db 47, DOUBLE_EDGE
	db 52, REVERSAL
	db 0 ; no more level-up moves

SpearowEvosAttacks:
	db EVOLVE_LEVEL, 20, FEAROW
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 5, LEER
	db 9, FURY_ATTACK
	db 12, PURSUIT
	db 15, FEATHERGALE
	db 17, FAINT_ATTACK ; becomes Aerial Ace
	db 21, MIRROR_MOVE
	db 25, AGILITY
	db 33, RECOVER ; becomes Roost
	db 37, DRILL_PECK
	db 48, JUMP_KICK ; becomes Sand Dive
	db 0 ; no more level-up moves

FearowEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 8, LEER
	db 12, FURY_ATTACK
	db 15, FEATHERGALE
	db 20, FAINT_ATTACK ; becomes Aerial Ace
	db 23, FIRE_PLAY ; becomes Flutter Clap
	db 27, MIRROR_MOVE
	db 37, RECOVER ; becomes Roost
	db 41, DRILL_PECK
	db 48, AGILITY
	db 0 ; no more level-up moves

EkansEvosAttacks:
	db EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 4, POISON_STING
	db 9, BITE
	db 12, GLARE
	db 17, SCREECH
	db 20, ACID
	db 24, ACUPRESSURE ; becomes Gather Sand
	db 28, VENOSHOCK
	db 36, MUD_BOMB
	db 41, HAZE
	db 44, ACID_ARMOR
	db 49, GUNK_SHOT
	db 55, CHARGE_BEAM ; becomes Poison Fang
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	db 12, GLARE	
	db 17, SCREECH
	db 20, ACID
	db 21, CRUNCH
	db 28, ACUPRESSURE ; becomes Gather Sand
	db 30, VENOSHOCK
	db 39, MUD_BOMB
	db 45, HAZE
	db 49, ACID_ARMOR
	db 54, GUNK_SHOT
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, GROWL
	db 6, TAIL_WHIP
	db 8, THUNDER_WAVE
	db 11, QUICK_ATTACK
	db 15, DOUBLE_TEAM
	db 20, SLAM
	db 24, THUNDERBOLT
	db 33, AGILITY
	db 41, THUNDER
	db 50, LIGHT_SCREEN
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, TAIL_WHIP
	db 1, QUICK_ATTACK
	db 1, THUNDERBOLT
	db 31, THUNDERBOLT
	db 36, AGILITY
	db 45, THUNDER
	db 56, LIGHT_SCREEN
	db 0 ; no more level-up moves

SandshrewEvosAttacks:
	db EVOLVE_LEVEL, 22, SANDSLASH
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, DEFENSE_CURL
	db 5, SAND_ATTACK
	db 7, POISON_STING
	db 9, ROLLOUT
	db 11, RAPID_SPIN
	db 14, SWIFT
	db 18, MAGNITUDE
	db 22, ACUPRESSURE ; becomes Gather Sand
	db 26, SLASH
	db 30, DIG
	db 34, GYRO_BALL
	db 38, SWORDS_DANCE
	db 42, SANDSTORM
	db 46, EARTHQUAKE
	db 0 ; no more level-up moves

SandslashEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, DEFENSE_CURL
	db 5, SAND_ATTACK
	db 7, POISON_STING
	db 9, ROLLOUT
	db 11, RAPID_SPIN
	db 14, SWIFT
	db 18, MAGNITUDE
	db 22, ACUPRESSURE ; becomes Gather Sand
	db 27, SLASH
	db 32, DIG
	db 36, GYRO_BALL
	db 42, SWORDS_DANCE
	db 46, SANDSTORM
	db 51, EARTHQUAKE
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	db 1, LEAF_SHIELD
	db 1, SCRATCH
	db 6, POISON_STING
	db 10, DOUBLE_KICK
	db 13, TAIL_WHIP
	db 17, BITE
	db 20, HYPER_FANG
	db 24, ROCK_SMASH
	db 30, PSYCH_UP
	db 34, MUD_BOMB
	db 39, MAGNITUDE
	db 45, CHARGE_BEAM ; becomes Poison Fang
	db 49, CLOSE_COMBAT
	db 54, HEAL_BELL
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	db 1, LEAF_SHIELD
	db 6, POISON_STING
	db 10, DOUBLE_KICK
	db 13, TAIL_WHIP
	db 18, BITE
	db 22, HYPER_FANG
	db 26, ROCK_SMASH
	db 33, PSYCH_UP
	db 37, MUD_BOMB
	db 43, MAGNITUDE
	db 49, CHARGE_BEAM ; becomes Poison Fang
	db 54, CLOSE_COMBAT
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEAF_SHIELD
	db 6, POISON_STING
	db 10, DOUBLE_KICK
	db 13, TAIL_WHIP
	db 19, BITE
	db 23, HYPER_FANG
	db 27, ROCK_SMASH
	db 35, PSYCH_UP
	db 40, MUD_BOMB
	db 45, MAGNITUDE
	db 51, CHARGE_BEAM ; becomes Poison Fang
	db 56, CLOSE_COMBAT
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	db 1, LEAF_SHIELD
	db 1, PECK
	db 6, POISON_STING
	db 10, HORN_ATTACK
	db 17, TAIL_WHIP
	db 19, HYPER_FANG
	db 24, ROCK_SMASH
	db 30, PSYCH_UP
	db 35, FAINT_ATTACK
	db 39, MAGNITUDE
	db 44, HORN_DRILL
	db 49, CROSS_CHOP
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	db 1, LEAF_SHIELD
	db 1, PECK
	db 6, POISON_STING
	db 10, HORN_ATTACK
	db 17, TAIL_WHIP
	db 19, HYPER_FANG
	db 24, ROCK_SMASH
	db 30, PSYCH_UP
	db 35, FAINT_ATTACK
	db 39, MAGNITUDE
	db 44, HORN_DRILL
	db 49, CROSS_CHOP
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEAF_SHIELD
	db 1, PECK
	db 6, POISON_STING
	db 10, HORN_ATTACK
	db 17, TAIL_WHIP
	db 19, HYPER_FANG
	db 24, ROCK_SMASH
	db 30, PSYCH_UP
	db 35, FAINT_ATTACK
	db 39, MAGNITUDE
	db 44, HORN_DRILL
	db 49, CROSS_CHOP
	; mega horn?
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, CLEFABLE
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 4, ENCORE
	db 8, SING
	db 13, DOUBLESLAP
	db 19, MINIMIZE
	db 22, WAKEUP_SLAP
	db 26, DEFENSE_CURL
	db 29, METRONOME
	db 34, FIRE_FLICK
	db 38, MOONLIGHT
	db 42, GROWTH ; becomes Cosmic Power
	db 45, LIGHT_SCREEN
	db 49, BODY_SLAM
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	db 1, SING
	db 1, DOUBLESLAP
	db 20, MINIMIZE
	db 24, WAKEUP_SLAP
	db 29, DEFENSE_CURL
	db 32, METRONOME
	db 39, FIRE_FLICK
	db 43, MOONLIGHT
	db 46, GROWTH ; becomes Cosmic Power
	db 50, LIGHT_SCREEN
	db 58, BODY_SLAM
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, NINETALES
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, TAIL_WHIP
	db 6, QUICK_ATTACK
	db 8, ROAR
	db 12, CONFUSE_RAY
	db 15, FIRE_SPIN
	db 20, WILL_O_WISP
	db 25, SAFEGUARD
	db 29, DARK_PULSE ; becomes Extrasensory
	db 33, FLAMETHROWER
	db 39, FIRE_BLAST
	db 44, SILVER_WIND
	db 51, INFERNO
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, TAIL_WHIP
	db 1, QUICK_ATTACK
	db 1, CONFUSE_RAY
	db 17, FIRE_SPIN
	db 24, WILL_O_WISP
	db 29, SAFEGUARD
	db 32, DARK_PULSE ; becomes Extrasensory
	db 37, FLAMETHROWER
	db 45, FIRE_BLAST
	db 54, SILVER_WIND
	db 59, INFERNO
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	db 0 ; no more evolutions
	db 1, SING
	db 1, POUND
	db 4, DEFENSE_CURL
	db 8, CHARM
	db 14, DISABLE
	db 19, ROLLOUT
	db 23, DOUBLESLAP
	db 27, WAKEUP_SLAP
	db 30, REST
	db 35, BODY_SLAM
	db 39, MIMIC
	db 42, DOUBLE_EDGE
	db 48, FIRE_FLICK
	db 52, SKULL_BASH
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db 0 ; no more evolutions
	db 1, SING
	db 1, POUND
	db 4, DEFENSE_CURL
	db 8, CHARM
	db 14, DISABLE
	db 20, ROLLOUT
	db 24, DOUBLESLAP
	db 29, WAKEUP_SLAP
	db 32, REST
	db 38, BODY_SLAM
	db 42, MIMIC
	db 47, DOUBLE_EDGE
	db 54, FIRE_FLICK
	db 59, SKULL_BASH
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, SCREECH
	db 6, SUPERSONIC
	db 10, BITE
	db 15, WING_ATTACK	
	db 17, CONFUSE_RAY
	db 19, SLASH ; becomes Air Cutter
	db 23, SWIFT
	db 25, CHARGE_BEAM ; becomes Poison Fang
	db 29, MEAN_LOOK
	db 31, LEECH_LIFE
	db 35, HAZE
	db 37, VENOSHOCK
	db 41, AIR_SLASH
	db 43, HYPER_SONAR
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	db 0 ; no more evolutions	
	db 1, ABSORB
	db 1, SCREECH
	db 6, SUPERSONIC
	db 10, BITE
	db 15, WING_ATTACK	
	db 17, CONFUSE_RAY
	db 19, SLASH ; becomes Air Cutter
	db 25, SWIFT
	db 27, CHARGE_BEAM ; becomes Poison Fang
	db 32, MEAN_LOOK
	db 34, LEECH_LIFE
	db 39, HAZE
	db 43, VENOSHOCK
	db 46, AIR_SLASH
	db 51, HYPER_SONAR
	db 0 ; no more level-up moves

OddishEvosAttacks:
	db EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWTH
	db 5, LEAF_SHIELD
	;db 9, ACID
	db 13, POISONPOWDER
	db 14, STUN_SPORE
	db 15, SLEEP_POWDER
	db 19, MEGA_DRAIN
	db 23, ACID
	db 26, MOONLIGHT
	db 30, ENDURE
	db 32, GIGA_DRAIN
	db 39, TOXIC
	db 43, PETAL_DANCE
	db 0 ; no more level-up moves

GloomEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	db EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	db 0 ; no more evolutions
	db 14, POISONPOWDER
	db 16, STUN_SPORE
	db 18, SLEEP_POWDER
	db 20, MEGA_DRAIN
	db 24, ACID
	db 28, MOONLIGHT
	db 32, ENDURE
	db 35, GIGA_DRAIN
	db 43, TOXIC
	db 48, PETAL_DANCE
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISONPOWDER
	db 1, STUN_SPORE
	db 1, SLEEP_POWDER
	db 20, MEGA_DRAIN
	db 28, ACID
	db 32, MOONLIGHT
	db 36, ENDURE
	db 40, GIGA_DRAIN
	db 49, TOXIC
	db 55, PETAL_DANCE
	db 61, SOLARBEAM
	db 0 ; no more level-up moves

ParasEvosAttacks:
	db EVOLVE_LEVEL, 24, PARASECT
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 7, STUN_SPORE
	db 10, POISONPOWDER
	db 16, TWINEEDLE
	db 19, LEECH_LIFE
	db 22, SPORE
	db 28, FELL_STINGER
	db 31, SLASH
	db 37, GROWTH
	db 43, GIGA_DRAIN
	db 54, X_SCISSOR
	db 0 ; no more level-up moves

ParasectEvosAttacks:
	db 0 ; no more evolutions
	db 1, STUN_SPORE
	db 1, POISONPOWDER
	db 7, STUN_SPORE
	db 16, TWINEEDLE
	db 19, LEECH_LIFE
	db 28, SPORE
	db 32, FELL_STINGER
	db 37, SLASH
	db 46, GROWTH
	db 55, GIGA_DRAIN	
	db 60, X_SCISSOR
	db 0 ; no more level-up moves

VenonatEvosAttacks:
	db EVOLVE_LEVEL, 27, VENOMOTH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DISABLE
	db 7, SUPERSONIC
	db 11, CONFUSION
	db 13, POISONPOWDER
	db 17, LEECH_LIFE
	db 23, STUN_SPORE
	db 26, PSYBEAM
	db 29, SLEEP_POWDER
	db 35, SIGNAL_BEAM
	db 37, ZEN_HEADBUTT
	db 41, CHARGE_BEAM ; becomes Poison Fang
	db 44, PSYCHIC_M
	db 49, BUG_BUZZ
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	db 17, LEECH_LIFE
	db 23, STUN_SPORE
	db 26, PSYBEAM
	db 26, GUST
	db 31, SLEEP_POWDER
	db 37, SIGNAL_BEAM
	db 41, ZEN_HEADBUTT
	db 45, CHARGE_BEAM ; becomes Poison Fang
	db 49, PSYCHIC_M
	db 54, BUG_BUZZ
	db 0 ; no more level-up moves

DiglettEvosAttacks:
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 4, GROWL
	db 5, SAND_ATTACK
	db 13, MAGNITUDE
	db 17, DIG
	db 20, ACUPRESSURE ; becomes Gather Sand
	db 25, MUD_BOMB
	db 29, POWER_GEM
	db 35, SLASH
	db 38, MEAN_LOOK
	db 41, EARTHQUAKE
	db 49, HORN_DRILL ; becomes Fissure
	db 0 ; no more level-up moves

DugtrioEvosAttacks:
	db 0 ; no more evolutions
	db 13, MAGNITUDE
	db 17, DIG
	db 20, ACUPRESSURE ; becomes Gather Sand
	db 25, TRI_ATTACK
	db 27, STAMPEDE
	db 35, POWER_GEM
	db 39, SLASH
	db 44, MEAN_LOOK
	db 48, EARTHQUAKE
	db 57, HORN_DRILL ; becomes Fissure
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 6, LICK
	db 10, BITE
	db 17, POWER_GEM
	db 26, FAINT_ATTACK
	db 33, SLASH ; becomes Night Slash
	db 35, SCREECH
	db 38, NASTY_PLOT
	db 41, FURY_ATTACK
	db 45, SWIFT
	db 49, TAKE_DOWN
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	db 6, LICK
	db 10, BITE
	db 17, POWER_GEM
	db 26, FAINT_ATTACK
	db 35, SLASH
	db 38, SCREECH
	db 41, NASTY_PLOT
	db 45, FURY_ATTACK
	db 49, SWIFT
	db 55, TAKE_DOWN
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	db EVOLVE_LEVEL, 33, GOLDUCK
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 5, TAIL_WHIP
	db 7, WATER_GUN
	db 10, CONFUSION
	db 13, FURY_ATTACK
	db 16, SIGNAL_BEAM ; becomes Water Pulse
	db 19, DISABLE
	db 22, SCREECH
	db 25, ZEN_HEADBUTT
	db 28, AQUA_TAIL
	db 33, PSYCH_UP
	db 37, AMNESIA
	db 40, HYDRO_PUMP
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 5, TAIL_WHIP
	db 7, WATER_GUN
	db 10, CONFUSION
	db 13, FURY_ATTACK
	db 16, SIGNAL_BEAM ; becomes Water Pulse
	db 19, DISABLE
	db 22, SCREECH
	db 25, ZEN_HEADBUTT
	db 30, AQUA_TAIL
	db 33, PSYCH_UP
	db 42, AMNESIA
	db 45, HYDRO_PUMP
	db 51, PSYBEAM
	db 0 ; no more level-up moves

MankeyEvosAttacks:
	db EVOLVE_LEVEL, 28, PRIMEAPE
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, FOCUS_ENERGY
	db 4, LOW_KICK
	db 6, FURY_ATTACK
	db 10, KARATE_CHOP
	db 13, PURSUIT
	db 18, SEISMIC_TOSS
	db 21, SWAGGER
	db 23, CROSS_CHOP
	db 26, BRICK_BREAK
	db 32, CLOSE_COMBAT
	db 37, BULK_UP
	db 50, THRASH
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	db 0 ; no more evolutions
	db 13, PURSUIT
	db 18, SEISMIC_TOSS
	db 21, SWAGGER
	db 23, CROSS_CHOP
	db 26, BRICK_BREAK
	db 27, RAGE
	db 34, CLOSE_COMBAT
	db 39, BULK_UP
	db 55, THRASH
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, ARCANINE
	db 0 ; no more evolutions
	db 1, BITE
	db 1, ROAR
	db 5, EMBER
	db 7, LEER
	db 14, TAKE_DOWN
	db 17, FLAME_WHEEL
	db 19, REVERSAL
	db 23, ABSORB ; becomes Fire Fang
	db 28, CRUNCH
	db 30, AGILITY
	db 32, THRASH
	db 38, FLAMETHROWER
	db 45, BODY_SLAM
	db 49, DOUBLE_EDGE ; becomes Flare Blitz
	db 55, EXTREMESPEED
	db 63, SACRED_FIRE ;
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 5, EMBER
	db 22, FLAME_WHEEL
	db 27, REVERSAL
	db 32, CRUNCH
	db 34, AGILITY
	db 36, THRASH
	db 44, FLAMETHROWER
	db 52, BODY_SLAM
	db 57, DOUBLE_EDGE ; becomes Flare Blitz
	db 62, EXTREMESPEED
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 7, HYPNOSIS
	db 12, WATER_GUN
	db 15, DOUBLESLAP
	db 18, RAIN_DANCE
	db 21, BODY_SLAM
	db 25, BUBBLEBEAM
	db 28, ICY_WIND ; becomes Mud Shot
	db 31, BELLY_DRUM
	db 35, WAKEUP_SLAP
	db 40, HYDRO_PUMP
	db 44, MUD_BOMB
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, POLIWRATH
	db EVOLVE_ITEM, SUN_STONE, POLITOED
	db 0 ; no more evolutions
	db 12, WATER_GUN
	db 15, DOUBLESLAP
	db 18, RAIN_DANCE
	db 21, BODY_SLAM
	db 25, BUBBLEBEAM
	db 29, ICY_WIND ; becomes Mud Shot
	db 33, BELLY_DRUM
	db 38, WAKEUP_SLAP
	db 44, HYDRO_PUMP
	db 48, MUD_BOMB
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	db 12, WATER_GUN
	db 15, DOUBLESLAP
	db 18, RAIN_DANCE
	db 21, BODY_SLAM
	db 25, BUBBLEBEAM
	db 30, ICY_WIND ; becomes Mud Shot
	db 35, BELLY_DRUM
	db 41, WAKEUP_SLAP
	db 48, HYDRO_PUMP
	db 53, MUD_BOMB
	db 55, COUNTER
	db 0 ; no more level-up moves

AbraEvosAttacks:
	db EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	db 1, LICK ; becomes Psyshock
	db 5, KINESIS
	db 8, PSYWAVE
	db 14, CONFUSION
	db 17, DISABLE
	db 20, ICY_WIND ; becomes Mud Shot
	db 23, PSYBEAM
	db 27, RECOVER
	db 31, FUTURE_SIGHT
	db 33, GROWTH ; becomes Calm Mind
	db 37, PSYCHIC_M
	db 41, REFLECT
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	db EVOLVE_LEVEL, 32, ALAKAZAM
	db 0 ; no more evolutions
	db 1, LICK ; becomes Psyshock
	db 5, KINESIS
	db 8, PSYWAVE
	db 14, CONFUSION
	db 18, DISABLE
	db 22, ICY_WIND ; becomes Mud Shot
	db 26, PSYBEAM
	db 30, RECOVER
	db 34, FUTURE_SIGHT
	db 36, GROWTH ; becomes Calm Mind
	db 41, PSYCHIC_M
	db 45, REFLECT
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	db 1, LICK ; becomes Psyshock
	db 5, KINESIS
	db 8, PSYWAVE
	db 14, CONFUSION
	db 18, DISABLE
	db 22, ICY_WIND ; becomes Mud Shot
	db 26, PSYBEAM
	db 30, RECOVER
	db 35, FUTURE_SIGHT
	db 41, GROWTH ; becomes Calm Mind
	db 43, PSYCHIC_M
	db 48, REFLECT
	db 0 ; no more level-up moves

MachopEvosAttacks:
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	db 1, KARATE_CHOP
	db 1, LEER
	db 6, LOW_KICK
	db 8, FOCUS_ENERGY	
	db 15, SEISMIC_TOSS
	db 19, VITAL_THROW
	db 22, CONFUSION ; becomes Revenge
	db 26, SUBMISSION
	db 30, BULK_UP
	db 36, CROSS_CHOP
	db 40, SCARY_FACE	
	db 44, DYNAMICPUNCH
	db 50, CLOSE_COMBAT
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	db EVOLVE_LEVEL, 42, MACHAMP
	db 0 ; no more evolutions
	db 8, FOCUS_ENERGY	
	db 15, SEISMIC_TOSS
	db 19, VITAL_THROW
	db 22, CONFUSION ; becomes Revenge
	db 26, SUBMISSION
	db 31, BULK_UP
	db 38, CROSS_CHOP
	db 43, SCARY_FACE	
	db 47, DYNAMICPUNCH
	db 54, CLOSE_COMBAT
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	db 26, SUBMISSION
	db 32, BULK_UP
	db 38, CROSS_CHOP
	db 46, SCARY_FACE	
	db 50, DYNAMICPUNCH
	db 59, CLOSE_COMBAT
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 6, GROWTH
	db 11, WRAP
	db 13, SLEEP_POWDER
	db 15, POISONPOWDER
	db 17, STUN_SPORE
	db 20, ACID
	db 24, COUNTER
	db 33, ACID_ARMOR
	db 35, RAZOR_LEAF
	db 41, REVERSAL
	db 46, SLASH ; becomes Leaf Blade
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db 0 ; no more evolutions
	db 13, SLEEP_POWDER
	db 15, POISONPOWDER
	db 17, STUN_SPORE
	db 20, ACID
	db 25, COUNTER
	db 35, ACID_ARMOR
	db 38, RAZOR_LEAF
	db 45, REVERSAL
	db 50, SLASH ; becomes Leaf Blade
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	db 0 ; no more evolutions
	db 13, SLEEP_POWDER
	db 15, POISONPOWDER
	db 17, STUN_SPORE
	db 20, ACID
	db 26, COUNTER
	db 36, ACID_ARMOR
	db 40, RAZOR_LEAF
	db 47, REVERSAL
	db 55, SLASH ; becomes Leaf Blade
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 5, SUPERSONIC
	db 8, ACID
	db 10, CONSTRICT
	db 14, WRAP
	db 17, SIGNAL_BEAM ; becomes Water Pulse
	db 22, BUBBLEBEAM
	db 28, BARRIER
	db 31, SPARK ; becomes Shock Sting
	db 34, SCREECH
	db 37, SLUDGE
	db 42, VENOSHOCK
	db 46, HYDRO_PUMP
	db 48, MINIMIZE
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	db 18, WRAP
	db 17, SIGNAL_BEAM ; becomes Water Pulse
	db 22, BUBBLEBEAM
	db 28, BARRIER
	db 33, SPARK ; becomes Shock Sting
	db 38, SCREECH
	db 41, SLUDGE
	db 46, VENOSHOCK
	db 51, HYDRO_PUMP
	db 54, MINIMIZE
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 5, ROLLOUT
	db 11, ROCK_THROW
	db 16, MAGNITUDE
	db 24, SELFDESTRUCT
	db 26, HARDEN
	db 29, DOUBLESLAP ; becomes Rock Blast
	db 34, EARTHQUAKE
	db 36, EXPLOSION
	db 40, DOUBLE_EDGE ; changes to wood hammer
	db 42, CROSS_CHOP ; changes to Stone Edge
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	db EVOLVE_LEVEL, 37, GOLEM
	db 0 ; no more evolutions
	db 5, ROLLOUT
	db 11, ROCK_THROW
	db 16, MAGNITUDE
	db 24, SELFDESTRUCT
	db 27, HARDEN
	db 31, DOUBLESLAP ; becomes Rock Blast
	db 36, EARTHQUAKE
	db 40, EXPLOSION
	db 45, DOUBLE_EDGE
	db 49, CROSS_CHOP ; changes to Stone Edge
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db 0 ; no more evolutions
	db 24, SELFDESTRUCT
	db 27, HARDEN
	db 31, DOUBLESLAP ; becomes Rock Blast
	db 36, EARTHQUAKE
	db 44, EXPLOSION
	db 59, DOUBLE_EDGE
	db 54, CROSS_CHOP ; changes to Stone Edge
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	db EVOLVE_LEVEL, 30, RAPIDASH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 4, TAIL_WHIP	
	db 9, EMBER	
	db 13, FLAME_WHEEL
	db 17, STOMP
	db 25, FIRE_SPIN
	db 29, TAKE_DOWN
	db 33, INFERNO
	db 38, STAMPEDE
	db 42, AGILITY
	db 49, FIRE_BLAST
	db 53, DOUBLE_EDGE ; becomes Flare Blitz
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	db 13, FLAME_WHEEL
	db 17, STOMP
	db 25, FIRE_SPIN
	db 29, TAKE_DOWN
	db 35, INFERNO
	db 39, STAMPEDE
	db 45, AGILITY
	db 53, FIRE_BLAST
	db 59, DOUBLE_EDGE ; becomes Flare Blitz
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, SLOWKING
	db EVOLVE_LEVEL, 30, SLOWBRO
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 6, GROWL
	db 9, WATER_GUN
	db 14, CONFUSION
	db 19, DISABLE
	db 23, HEADBUTT
	db 28, SIGNAL_BEAM ; becomes Water Pulse
	db 32, ZEN_HEADBUTT
	db 41, AMNESIA
	db 45, PSYCHIC_M
	db 49, RAIN_DANCE
	db 54, PSYCH_UP
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	db 14, CONFUSION
	db 19, DISABLE
	db 23, HEADBUTT
	db 29, SIGNAL_BEAM ; becomes Water Pulse
	db 33, ZEN_HEADBUTT
	db 44, AMNESIA
	db 49, PSYCHIC_M
	db 54, RAIN_DANCE
	db 59, PSYCH_UP
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, DISABLE
	db 6, THUNDERSHOCK
	db 11, SUPERSONIC
	db 16, SONICBOOM
	db 20, THUNDER_WAVE
	db 23, CHARGE_BEAM
	db 27, LOCK_ON
	db 33, SWIFT
	db 39, SCREECH
	db 43, HYPER_SONAR
	db 49, ZAP_CANNON
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	db 0 ; no more evolutions
	db 16, SONICBOOM
	db 20, THUNDER_WAVE
	db 23, CHARGE_BEAM
	db 27, LOCK_ON
	db 37, SWIFT
	db 45, SCREECH
	db 49, HYPER_SONAR
	db 54, ZAP_CANNON
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, POISON_STING
	db 7, SAND_ATTACK
	db 9, FIRE_PLAY ; becomes Flutter Clap
	db 13, MAKESHIFT
	db 19, FURY_ATTACK
	db 21, FEATHERGALE
	db 25, SWORDS_DANCE
	db 31, AGILITY
	db 37, SLASH ; becomes Night Slash
	db 44, FALSE_SWIPE
	db 49, AIR_SLASH
	db 55, DOUBLE_EDGE ; becomes Brave Bird
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	db EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 8, QUICK_ATTACK
	db 10, RAGE
	db 12, FURY_ATTACK
	db 17, PURSUIT
	db 22, IRON_TAIL
	db 28, ACUPRESSURE
	db 32, DOUBLE_KICK ; becomes Double Hit
	db 37, AGILITY
	db 40, JUMP_KICK
	db 43, DRILL_PECK
	db 48, THRASH
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	db 12, FURY_ATTACK
	db 17, PURSUIT
	db 22, IRON_TAIL
	db 28, ACUPRESSURE
	db 34, DOUBLE_KICK ; becomes Double Hit
	db 39, AGILITY
	db 43, JUMP_KICK
	db 47, DRILL_PECK
	db 53, THRASH
	db 0 ; no more level-up moves

SeelEvosAttacks:
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 4, GROWL
	db 8, ENCORE
	db 11, AQUA_JET
	db 15, QUICK_ATTACK ; becomes Ice Shard
	db 18, AURORA_BEAM
	db 21, REST
	db 27, DARK_PULSE ; becomes Waterfall
	db 32, TAKE_DOWN
	db 37, BUBBLE ; becomes Brine
	; dive
	db 43, AQUA_TAIL
	db 47, ICE_BEAM
	db 49, SAFEGUARD
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	db 0 ; no more evolutions
	db 18, AURORA_BEAM
	db 21, REST
	db 27, DARK_PULSE ; becomes Waterfall
	db 32, TAKE_DOWN
	db 33, HORN_DRILL ; becomes Sheer Cold
	db 39, BUBBLE ; becomes Brine
	db 47, AQUA_TAIL
	db 53, ICE_BEAM
	db 56, SAFEGUARD
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	db EVOLVE_LEVEL, 38, MUK
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, POUND
	db 5, HARDEN
	db 8, BUBBLE
	db 10, DISABLE
	db 16, SLUDGE
	db 23, MINIMIZE
	db 31, SCREECH
	db 36, MEGA_DRAIN
	db 40, ACID_ARMOR
	db 45, SLUDGE_BOMB
	db 50, GUNK_SHOT
	db 0 ; no more level-up moves

MukEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, POUND
	db 1, HARDEN
	db 1, BUBBLE
	db 33, HARDEN
	db 37, DISABLE
	db 45, SLUDGE
	db 23, MINIMIZE
	db 31, SCREECH
	db 36, MEGA_DRAIN
	db 45, ACID_ARMOR
	db 50, SLUDGE_BOMB
	db 56, GUNK_SHOT
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, CLOYSTER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, HARDEN ; becomes Withdraw
	db 8, SUPERSONIC
	db 13, DOUBLESLAP ; becomes Icicle Spear
	db 16, PROTECT
	db 20, LEER
	db 24, CLAMP
	db 28, QUICK_ATTACK	; becomes Ice Shard
	db 32, IRON_TAIL ; becomes Razor Shell
	db 37, AURORA_BEAM
	db 40, WHIRLPOOL
	db 43, BARRIER ; Becomes Iron Defense
	db 46, ICE_BEAM
	db 53, HYDRO_PUMP
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	db 1, PROTECT
	db 1, LEER
	db 1, CLAMP
	db 1, QUICK_ATTACK	; becomes Ice Shard
	db 33, IRON_TAIL ; becomes Razor Shell
	db 38, AURORA_BEAM
	db 42, WHIRLPOOL
	db 46, BARRIER ; Becomes Iron Defense
	db 50, ICE_BEAM
	db 57, HYDRO_PUMP
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 6, SPITE
	db 8, MEAN_LOOK
	db 12, CURSE
	db 15, NIGHT_SHADE
	db 19, CONFUSE_RAY
	db 22, ICY_WIND
	db 24, MIMIC
	db 29, SHADOW_BALL
	db 33, DREAM_EATER
	db 40, HAZE
	db 47, NIGHTMARE
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	db EVOLVE_LEVEL, 37, GENGAR
	db 0 ; no more evolutions
	db 15, NIGHT_SHADE
	db 19, CONFUSE_RAY
	db 22, ICY_WIND
	db 25, MIMIC
	db 32, SHADOW_BALL
	db 36, DREAM_EATER
	db 45, HAZE
	db 53, NIGHTMARE
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	db 19, CONFUSE_RAY
	db 22, ICY_WIND
	db 25, MIMIC
	db 33, SHADOW_BALL
	db 36, DREAM_EATER
	db 47, HAZE
	db 55, NIGHTMARE
	db 0 ; no more level-up moves

OnixEvosAttacks:
	db EVOLVE_LEVEL, 26, STEELIX
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCREECH
	db 1, WRAP
	db 7, ROCK_THROW
	db 11, ROCK_TOMB
	db 20, HARDEN
	db 25, DIG
	db 28, SEISMIC_TOSS ; becomes Rock Tumble
	db 33, STAMPEDE
	db 36, SANDSTORM
	db 40, SLAM
	db 46, CROSS_CHOP ; changes to Stone Edge
	db 52, EARTHQUAKE
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	db EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	db 1, POUND
	db 1, HYPNOSIS
	db 5, DISABLE
	db 9, CONFUSION
	db 13, WAKEUP_SLAP
	db 17, POISON_GAS
	db 21, MEDITATE
	db 25, PSYBEAM
	db 30, PSYCH_UP
	db 34, ZEN_HEADBUTT
	db 39, SWAGGER
	db 42, PSYCHIC_M
	db 46, NASTY_PLOT
	db 51, FUTURE_SIGHT	
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	db 1, WAKEUP_SLAP
	db 18, POISON_GAS
	db 22, MEDITATE
	db 25, PSYBEAM
	db 31, PSYCH_UP
	db 36, ZEN_HEADBUTT
	db 41, SWAGGER
	db 45, PSYCHIC_M
	db 49, NASTY_PLOT
	db 54, FUTURE_SIGHT
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	db EVOLVE_LEVEL, 22, KINGLER
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 5, VICEGRIP
	db 8, LEER
	db 10, HARDEN ; becomes Withdraw
	db 13, BUBBLEBEAM
	db 16, PROTECT
	db 19, ICY_WIND ; becomes Mud Shot
	db 23, STOMP
	db 28, REVERSAL ; becomes Flail
	db 31, HORN_DRILL ; becomes Guillotine
	db 34, IRON_TAIL ; becomes Razor Shell
	db 37, SLAM
	db 41, CRABHAMMER
	db 44, BUBBLE ; becomes Brine
	db 47, SHARPEN
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	db 0 ; no more evolutions
	db 10, HARDEN ; becomes Withdraw
	db 13, BUBBLEBEAM
	db 16, PROTECT
	db 19, ICY_WIND ; becomes Mud Shot
	db 25, STOMP
	db 30, REVERSAL ; becomes Flail
	db 34, HORN_DRILL ; becomes Guillotine
	db 39, IRON_TAIL ; becomes Razor Shell
	db 43, SLAM
	db 47, CRABHAMMER
	db 50, BUBBLE ; becomes Brine
	db 52, SHARPEN
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	db 1, SONICBOOM
	db 5, EERIEIMPULSE
	db 9, SPARK
	db 13, ROLLOUT
	db 15, SCREECH
	db 18, SELFDESTRUCT
	db 22, SWIFT
	db 26, CHARGE_BEAM
	db 31, THUNDERBOLT
	db 38, MIRROR_COAT
	db 45, EXPLOSION
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	db 1, SONICBOOM
	db 8, EERIEIMPULSE
	db 10, SPARK
	db 13, ROLLOUT
	db 15, SCREECH
	db 18, SELFDESTRUCT
	db 22, SWIFT
	db 26, CHARGE_BEAM
	db 33, THUNDERBOLT
	db 41, MIRROR_COAT
	db 49, EXPLOSION
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 7, REFLECT
	db 13, LEECH_SEED
	db 19, CONFUSION
	db 25, STUN_SPORE
	db 27, POISONPOWDER
	db 29, SLEEP_POWDER
	db 35, EGG_BOMB
	db 41, LEAF_STORM
	db 43, SOLARBEAM
	db 47, DARK_PULSE ; becomes Extrasensory
	db 49, PSYBEAM
	db 55, SYNTHESIS
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, CONFUSION
	db 35, EGG_BOMB
	db 39, STAMPEDE
	db 44, LEAF_STORM
	db 46, DOUBLE_EDGE ; becomes Wood Hammer
	db 52, PSYBEAM
	db 59, SYNTHESIS
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, TACKLE
	db 5, RAGE
	db 10, MAKESHIFT
	db 13, LEER
	db 18, FOCUS_ENERGY
	db 21, FEATHERGALE ; becomes Bonemerang
	db 24, LEAF_SHIELD	
	db 27, FALSE_SWIPE
	db 37, DOUBLESLAP ; becomes Bone Rush
	db 42, SKULL_BASH
	db 45, DOUBLE_EDGE ; becomes Wood Hammer
	db 50, EARTHQUAKE
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	db 18, FOCUS_ENERGY
	db 21, FEATHERGALE ; becomes Bonemerang
	db 24, LEAF_SHIELD	
	db 27, FALSE_SWIPE
	db 38, DOUBLESLAP ; becomes Bone Rush
	db 44, SKULL_BASH
	db 49, DOUBLE_EDGE ; becomes Wood Hammer
	db 55, EARTHQUAKE
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_KICK
	db 1, FOCUS_ENERGY
	db 6, MEDITATE
	db 11, ROLLING_KICK
	db 18, BULK_UP
	db 25, BRICK_BREAK
	db 31, LOCK_ON
	db 35, IRON_TAIL ; becomes Spiral Kick
	db 41, ENDURE
	db 46, MEGA_KICK
	db 51, REVERSAL
	db 57, CLOSE_COMBAT
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	db 1, COMET_PUNCH
	db 16, AGILITY
	db 18, BULK_UP
	db 20, PURSUIT
	db 26, THUNDERPUNCH
	db 26, ICE_PUNCH
	db 26, FIRE_PUNCH
	db 32, MACH_PUNCH
	db 38, MEGA_PUNCH
	db 44, PROTECT
	db 50, COUNTER
	db 56, CLOSE_COMBAT
	db 0 ; no more level-up moves

LickitungEvosAttacks:
	db 0 ; no more evolutions
	db 1, LICK
	db 7, SUPERSONIC
	db 10, ACID
	db 13, DEFENSE_CURL
	db 18, STOMP
	db 21, DISABLE
	db 25, WRAP	
	db 30, SLAM
	db 33, ROLLOUT
	db 36, SCREECH
	db 45, THRASH
	db 53, CONSTRICT ; becomes Power Whip
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	db 1, MUD_BOMB
	db 1, TACKLE
	db 5, EMBER
	db 9, SMOG
	db 17, SELFDESTRUCT
	db 25, SMOKESCREEN
	db 28, WILL_O_WISP
	db 33, HAZE
	db 35, ROLLOUT
	db 41, EXPLOSION
	db 45, SUNNY_DAY
	db 49, FIRE_FLICK
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	db 1, SMOG
	db 1, SELFDESTRUCT
	db 27, SMOKESCREEN
	db 31, WILL_O_WISP
	db 33, DOUBLE_KICK ; becomes Double Hit
	db 36, HAZE
	db 39, ROLLOUT
	db 45, EXPLOSION
	db 50, SUNNY_DAY
	db 54, FIRE_FLICK
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	db EVOLVE_LEVEL, 40, RHYDON
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, TAIL_WHIP
	db 8, STOMP
	db 12, FURY_ATTACK
	db 18, DOUBLESLAP ; becomes Rock Blast
	db 22, SCARY_FACE
	db 26, ROCK_TOMB
	db 30, STAMPEDE
	db 37, HORN_DRILL
	db 41, TAKE_DOWN
	db 44, CROSS_CHOP ; changes to Stone Edge
	db 46, EARTHQUAKE
	db 51, MEGAHORN
	db 54, ENDURE ; evolution move
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	db 0 ; no more evolutions
	db 22, SCARY_FACE
	db 26, ROCK_TOMB
	db 30, STAMPEDE
	db 37, HORN_DRILL
	db 44, TAKE_DOWN
	db 48, CROSS_CHOP ; changes to Stone Edge
	db 52, EARTHQUAKE
	db 59, MEGAHORN
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
	db 0 ; no more evolutions
	db 1, GROWL
	db 4, POUND
	db 6, DEFENSE_CURL
	db 9, TAIL_WHIP
	db 12, DOUBLESLAP
	db 16, RECOVER
	db 20, MINIMIZE
	db 25, TAKE_DOWN
	db 30, SING
	db 34, WAKEUP_SLAP
	db 41, EGG_BOMB
	db 46, LIGHT_SCREEN
	db 54, DOUBLE_EDGE
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 4, SLEEP_POWDER
	db 10, ABSORB
	db 13, POISONPOWDER
	db 19, VINE_WHIP
	db 25, WRAP
	db 31, MEGA_DRAIN
	db 34, STUN_SPORE
	db 40, SLAM
	db 43, GROWTH
	db 46, CONSTRICT ; becomes Power Whip
	db 51, SKULL_BASH ; becomes Brutal Vine
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	db 1, COMET_PUNCH
	db 7, LEER
	db 13, BITE
	db 19, DOUBLESLAP
	db 25, RAGE
	db 31, MEGA_PUNCH
	db 34, DIZZY_PUNCH
	db 37, CRUNCH
	db 43, ENDURE	
	db 48, THRASH
	db 53, REVERSAL
	db 59, PROTECT
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	db EVOLVE_LEVEL, 20, SEADRA
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 5, SMOKESCREEN
	db 9, WATER_GUN
	db 15, LEER
	db 18, BUBBLEBEAM
	db 21, OCTAZOOKA
	db 26, FOCUS_ENERGY
	db 29, TWISTER
	db 33, BUBBLE ; becomes Brine
	db 35, AGILITY
	db 39, DARK_PULSE ; becomes Waterfall
	db 43, HYDRO_PUMP
	db 48, EXTREMESPEED
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, KINGDRA
	db 0 ; no more evolutions
	db 9, WATER_GUN
	db 15, LEER
	db 18, BUBBLEBEAM
	db 23, OCTAZOOKA
	db 29, FOCUS_ENERGY
	db 33, TWISTER
	db 36, BUBBLE ; becomes Brine
	db 38, AGILITY
	db 43, DARK_PULSE ; becomes Waterfall
	db 48, HYDRO_PUMP
	db 53, SPARK
	db 60, EXTREMESPEED
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	db EVOLVE_LEVEL, 33, SEAKING
	db 0 ; no more evolutions
	db 1, PECK
	db 1, TAIL_WHIP
	db 8, FIRE_PLAY ; becomes Tide Clash
	db 10, SUPERSONIC
	db 13, HORN_ATTACK
	db 16, SIGNAL_BEAM ; becomes Water Pulse
	db 24, REVERSAL ; becomes Flail
	db 29, FURY_ATTACK	
	db 33, AGILITY
	db 38, WATERFALL
	db 40, TWISTER
	db 43, HORN_DRILL
	db 46, MEGAHORN
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	db 13, HORN_ATTACK
	db 16, SIGNAL_BEAM ; becomes Water Pulse
	db 24, REVERSAL ; becomes Flail
	db 29, FURY_ATTACK	
	db 33, AGILITY
	db 40, WATERFALL
	db 43, TWISTER
	db 47, HORN_DRILL
	db 52, MEGAHORN
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 7, WATER_GUN
	db 13, RAPID_SPIN
	db 16, SWIFT
	db 18, BUBBLEBEAM
	db 20, RECOVER
	db 24, GYRO_BALL
	db 28, BUBBLE ; becomes Brine
	db 31, MINIMIZE
	db 35, POWER_GEM
	db 42, PSYCHIC_M
	db 45, LIGHT_SCREEN
	db 49, GROWTH ; becomes Cosmic Power
	db 51, HYDRO_PUMP
	db 54, PRISM_LIGHT
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 7, WATER_GUN
	db 13, RAPID_SPIN
	db 16, SWIFT
	db 18, BUBBLEBEAM
	db 21, RECOVER
	db 25, GYRO_BALL
	db 30, BUBBLE ; becomes Brine
	db 33, MINIMIZE
	db 38, POWER_GEM
	db 45, PSYCHIC_M
	db 49, LIGHT_SCREEN
	db 53, GROWTH ; becomes Cosmic Power
	db 56, HYDRO_PUMP
	db 60, PRISM_LIGHT
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRIER
	db 1, POUND
	db 1, MIMIC
	db 6, CONFUSION
	db 9, MEDITATE
	db 11, SUBSTITUTE
	db 15, DOUBLESLAP
	db 19, MAGICAL_LEAF
	db 22, LIGHT_SCREEN
	db 22, REFLECT
	db 25, PSYBEAM
	db 29, FIRE_FLICK
	db 33, ENCORE
	db 39, PSYCHIC_M
	db 46, BATON_PASS
	db 50, SAFEGUARD
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	db EVOLVE_LEVEL, 36, SCIZOR
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 6, FOCUS_ENERGY
	db 12, PURSUIT
	db 18, FALSE_SWIPE
	db 20, SEISMIC_TOSS
	db 24, AGILITY
	db 29, SLASH
	db 30, WING_ATTACK
	db 41, X_SCISSOR
	db 42, SWORDS_DANCE
	db 48, DOUBLE_TEAM
	db 0 ; no more level-up moves

JynxEvosAttacks:
	db 0 ; no more evolutions
	db 1, LICK
	db 9, SING
	db 13, POWDER_SNOW
	db 21, DOUBLESLAP
	db 25, ICE_PUNCH
	db 31, PSYWAVE
	db 33, WAKEUP_SLAP
	db 36, MEAN_LOOK
	db 41, CONFUSION ; becomes Avalanche
	db 45, BODY_SLAM
	db 53, PERISH_SONG
	db 57, BLIZZARD
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 5, THUNDERSHOCK
	db 8, QUICK_ATTACK
	db 13, LOW_KICK
	db 15, THUNDER_WAVE
	db 19, LIGHT_SCREEN
	db 23, WILD_STORM
	db 28, SWIFT
	db 33, THUNDERPUNCH
	db 39, SCREECH
	db 46, THUNDERBOLT
	db 54, THUNDER
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 5, EMBER
	db 7, SMOG
	db 11, DOUBLESLAP
	db 15, FIRE_SPIN
	db 19, FIRE_PUNCH
	db 25, SMOKESCREEN
	db 29, MAGMA_STORM
	db 34, SUNNY_DAY
	db 39, DIZZY_PUNCH	
	db 45, CONFUSE_RAY
	db 49, FLAMETHROWER
	db 55, FIRE_BLAST
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	db 0 ; no more evolutions
	db 1, VICEGRIP
	db 1, FOCUS_ENERGY
	db 4, WRAP
	db 8, SEISMIC_TOSS
	db 11, HARDEN
	db 15, CONFUSION ; becomes Revenge
	db 22, DOUBLESLAP
	db 26, BRICK_BREAK
	db 29, X_SCISSOR	
	db 33, SUBMISSION
	db 40, SWORDS_DANCE
	db 43, THRASH
	db 50, HORN_DRILL ; becomes Guillotine
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 5, RAGE
	db 9, HORN_ATTACK
	db 12, SCARY_FACE
	db 17, BULK_UP
	db 20, PURSUIT
	db 23, STAMPEDE
	db 26, REST
	db 35, TAKE_DOWN
	db 43, THRASH
	db 48, SWAGGER
	db 55, DOUBLE_EDGE
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 4, TACKLE
	db 9, WHIRLPOOL
	db 18, HARMONY
	db 21, SWIFT
	db 26, MIRROR_MOVE
	db 31, PSYCH_UP
	db 40, REVERSAL ; becomes Flail
	db 46, CLOSE_COMBAT
	db 51, SKY_ATTACK
	db 55, ICY_WIND ; becomes Mega Splash
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	db 1, THRASH
	db 19, BITE
	db 22, LEER
	db 25, TWISTER
	db 31, AQUA_TAIL
	db 33, SCARY_FACE
	db 39, CRUNCH
	db 42, HYDRO_PUMP
	db 45, RAIN_DANCE
	db 50, HYPER_BEAM	
	db 54, IRON_TAIL
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, GROWL
	db 1, SING
	db 5, MIST
	db 7, CONFUSE_RAY
	db 10, QUICK_ATTACK ; becomes Ice Shard
	db 15, SIGNAL_BEAM ; becomes Water Pulse
	db 18, BODY_SLAM
	db 22, RAIN_DANCE
	db 27, PERISH_SONG
	db 32, ICE_BEAM
	db 37, BUBBLE ; becomes Brine
	db 43, SAFEGUARD
	db 47, HYDRO_PUMP
	db 50, HORN_DRILL ; becomes Sheer Cold
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRANSFORM
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, VAPOREON
	db EVOLVE_ITEM, FIRE_STONE, FLAREON
	db EVOLVE_HAPPINESS, TR_MORNDAY, ESPEON
	db EVOLVE_HAPPINESS, TR_NITE, UMBREON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, GROWL
	db 8, SAND_ATTACK
	db 13, QUICK_ATTACK
	db 17, SWIFT
	db 25, TAKE_DOWN	
	db 30, BITE
	db 33, BATON_PASS
	db 36, FOCUS_ENERGY
	db 40, DOUBLE_EDGE
	db 49, CRUNCH
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, SAND_ATTACK
	db 6, WATER_GUN
	db 13, QUICK_ATTACK
	db 17, JET_STREAM
	db 20, AURORA_BEAM
	db 24, BITE
	db 35, DARK_PULSE ; becomes Waterfall
	db 42, HAZE
	db 47, ACID_ARMOR

	db 47, PECK

	db 51, HYDRO_PUMP
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, SAND_ATTACK
	db 1, THUNDERSHOCK
	db 13, QUICK_ATTACK
	db 19, SHARPEN
	db 20, PSYBEAM ; becomes Thunder Fang
	db 24, BITE
	db 30, DOUBLE_KICK
	db 36, DOUBLESLAP ; becomes Pin Missile
	db 42, THUNDER_WAVE
	db 47, AGILITY
	db 52, THUNDER
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, SAND_ATTACK
	db 1, EMBER
	db 13, QUICK_ATTACK
	db 17, FIRE_SPIN
	db 20, ABSORB ; becomes Fire Fang
	db 24, BITE
	db 28, SMOG
	db 33, SWIFT
	db 38, SKULL_BASH
	db 44, MAGMA_STORM
	db 49, FLAMETHROWER
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, PORYGON2
	db 0 ; no more evolutions
	db 1, CONVERSION2
	db 1, TACKLE
	db 1, CONVERSION
	db 6, SHARPEN
	db 7, PSYBEAM
	db 12, AGILITY
	db 18, RECOVER
	db 23, ZOOM_FLIGHT
	db 29, SIGNAL_BEAM
	db 34, LOCK_ON
	db 40, TRI_ATTACK
	db 45, KINESIS
	db 50, ZAP_CANNON
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	db EVOLVE_LEVEL, 35, OMASTAR
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, HARDEN ; becomes Withdraw
	db 6, BITE
	db 10, WATER_GUN
	db 15, ROLLOUT
	db 19, LEER
	db 25, ICY_WIND ; becomes Mud Shot
	db 28, JET_STREAM
	db 32, PROTECT
	db 37, ANCIENTPOWER
	db 44, DOUBLESLAP ; becomes Rock Blast
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	db 19, LEER
	db 25, ICY_WIND ; becomes Mud Shot
	db 28, JET_STREAM
	db 32, PROTECT
	db 38, ANCIENTPOWER
	db 48, DOUBLESLAP ; becomes Rock Blast
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

KabutoEvosAttacks:
	db EVOLVE_LEVEL, 35, KABUTOPS
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, HARDEN
	db 6, ABSORB
	db 11, LEER
	db 16, ICY_WIND ; becomes Mud Shot
	db 21, SAND_ATTACK
	db 26, ENDURE
	db 31, AQUA_TAIL
	db 36, MEGA_DRAIN
	; add metal sound
	db 46, ANCIENTPOWER
	db 50, ROCK_SLIDE
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	db 16, ICY_WIND ; becomes Mud Shot
	db 21, SAND_ATTACK
	db 26, ENDURE
	db 31, AQUA_TAIL
	db 38, MEGA_DRAIN
	; add metal sound
	db 48, ANCIENTPOWER
	db 55, ROCK_SLIDE
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 8, AGILITY ; becomes Rock Polish
	db 11, QUICK_ATTACK ; becomes Accelerock
	db 15, BITE
	db 22, SUPERSONIC
	db 29, ANCIENTPOWER
	db 36, SCARY_FACE
	db 43, TAKE_DOWN
	db 45, SCREECH
	db 47, ROCK_SLIDE
	db 50, HYPER_BEAM
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, DEFENSE_CURL
	db 8, AMNESIA
	db 12, LICK
	db 18, HEADBUTT
	db 25, BODY_SLAM
	db 28, SNORE
	db 28, REST
	db 33, SLEEP_TALK
	db 36, ROLLOUT	
	db 40, DRILL_PECK ; becomes Seed Bomb
	db 44, BELLY_DRUM
	db 50, CRUNCH
	db 57, HYPER_BEAM
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 5, POWDER_SNOW
	db 8, MIST
	db 13, TWISTER
	db 19, METAL_CLAW
	db 25, ANCIENTPOWER
	db 31, AGILITY
	db 36, ICE_BEAM
	db 40, REFLECT
	db 45, CONFUSE_RAY
	db 51, BLIZZARD
	db 55, RECOVER ; becomes Roost
	db 60, SKY_ATTACK
	db 65, HORN_DRILL ; becomes Sheer Cold
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 5, THUNDERSHOCK
	db 9, THUNDER_WAVE
	db 15, PROTECT
	db 18, FIRE_PLAY  ; becomes Flutter Clap
	db 25, ANCIENTPOWER
	db 31, AGILITY
	db 36, WILD_STORM
	db 40, LIGHT_SCREEN
	db 50, DRILL_PECK	
	db 53, THUNDER
	db 55, RECOVER ; becomes Roost
	db 60, SKY_ATTACK
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 5, FIRE_PLAY  ; becomes Kindle Clash
	db 8, FIRE_SPIN
	db 15, AGILITY
	db 22, ENDURE
	db 29, ANCIENTPOWER
	db 33, SUNNY_DAY
	db 36, FLAMETHROWER
	db 41, SAFEGUARD
	db 41, AIR_SLASH
	db 52, SACRED_FIRE
	db 55, RECOVER ; becomes Roost
	db 59, SKY_ATTACK
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	db EVOLVE_LEVEL, 25, DRAGONAIR
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 1, BUBBLE
	db 8, THUNDER_WAVE
	db 11, TWISTER
	db 15, PRISM_LIGHT
	db 21, SLAM
	db 25, AGILITY
	db 31, CHARGE_BEAM
	db 35, AQUA_TAIL
	db 43, SAFEGUARD
	db 49, THRASH
	db 54, HYPER_BEAM
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	db EVOLVE_LEVEL, 40, DRAGONITE
	db 0 ; no more evolutions
	db 1, TWISTER
	db 8, THUNDER_WAVE
	db 15, TWISTER
	db 15, PRISM_LIGHT
	db 21, SLAM
	db 25, AGILITY
	db 31, CHARGE_BEAM
	db 36, AQUA_TAIL
	db 47, SAFEGUARD
	db 52, THRASH
	db 52, HYDRO_PUMP
	db 59, HYPER_BEAM
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	db 21, SLAM
	db 25, AGILITY
	db 31, CHARGE_BEAM
	db 36, AQUA_TAIL
	db 40, WING_ATTACK
	db 47, SAFEGUARD
	db 55, THRASH
	db 62, SLASH ; becomes Air Cutter
	db 62, HYPER_BEAM
	db 62, RECOVER ; becomes Roost
	db 62, DIZZY_PUNCH ; becomes Hurricane
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, DISABLE
	db 5, BARRIER
	db 10, PSYWAVE
	db 15, SWIFT
	db 20, MIST
	db 25, FUTURE_SIGHT
	db 30, PSYCH_UP
	db 35, PECK ; becomes Aura Sphere
	db 40, AMNESIA
	db 45, PSYCHIC_M
	db 50, RECOVER
	db 55, SAFEGUARD
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, TRANSFORM
	db 5, MEGA_PUNCH
	db 10, METRONOME
	db 20, GROWTH ; becomes Cosmic Power
	db 25, PSYCHIC_M
	db 30, BARRIER
	db 35, AMNESIA
	db 40, BATON_PASS
	db 45, ANCIENTPOWER
	db 50, NASTY_PLOT
	db 55, PECK ; becomes Aura Sphere
	db 0 ; no more level-up moves

ChikoritaEvosAttacks:
	db EVOLVE_LEVEL, 16, BAYLEEF
	db 0 ; no more evolutions 
	db 1, TACKLE
	db 1, GROWL
	db 6, RAZOR_LEAF
	db 9, POISONPOWDER
	db 12, SYNTHESIS
	db 17, REFLECT
	db 20, MAGICAL_LEAF
	db 23, HIDDEN_POWER
	db 31, LIGHT_SCREEN
	db 34, BODY_SLAM
	db 39, SAFEGUARD
	db 43, SOLARBEAM
	db 50, LEAF_STORM
	db 0 ; no more level-up moves

BayleefEvosAttacks:
	db EVOLVE_LEVEL, 34, MEGANIUM
	db 0 ; no more evolutions
	db 9, POISONPOWDER
	db 12, SYNTHESIS
	db 18, REFLECT
	db 22, MAGICAL_LEAF
	db 26, HIDDEN_POWER
	db 36, LIGHT_SCREEN
	db 40, BODY_SLAM
	db 46, SAFEGUARD
	db 50, SOLARBEAM
	db 53, LEAF_STORM
	db 0 ; no more level-up moves

MeganiumEvosAttacks:
	db 0 ; no more evolutions
	db 12, SYNTHESIS
	db 17, REFLECT
	db 20, MAGICAL_LEAF
	db 23, HIDDEN_POWER
	db 39, LIGHT_SCREEN
	db 46, BODY_SLAM
	db 51, SAFEGUARD
	db 54, SOLARBEAM
	db 63, LEAF_STORM
	db 0 ; no more level-up moves

CyndaquilEvosAttacks:
	db EVOLVE_LEVEL, 15, QUILAVA
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, SMOKESCREEN
	db 10, EMBER
	db 13, QUICK_ATTACK
	db 19, FLAME_WHEEL
	db 22, DEFENSE_CURL
	db 31, SWIFT
	db 38, FLAMETHROWER
	db 43, INFERNO
	db 47, ROLLOUT
	db 53, DOUBLE_EDGE
	db 0 ; no more level-up moves

QuilavaEvosAttacks:
	db EVOLVE_LEVEL, 36, TYPHLOSION
	db 0 ; no more evolutions
	db 1, LEER
	db 6, SMOKESCREEN
	db 10, EMBER
	db 13, QUICK_ATTACK
	db 20, FLAME_WHEEL
	db 24, DEFENSE_CURL
	db 31, SWIFT
	db 42, FLAMETHROWER
	db 52, INFERNO
	db 56, ROLLOUT
	db 63, DOUBLE_EDGE
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db 0 ; no more evolutions
	db 10, EMBER
	db 13, QUICK_ATTACK
	db 19, FLAME_WHEEL
	db 22, DEFENSE_CURL
	db 31, SWIFT
	db 48, FLAMETHROWER
	db 56, INFERNO
	db 61, ROLLOUT
	db 69, DOUBLE_EDGE
	db 0 ; no more level-up moves

TotodileEvosAttacks:
	db EVOLVE_LEVEL, 17, CROCONAW
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 6, WATER_GUN
	db 8, RAGE
	db 13, BITE
	db 15, SCARY_FACE
	db 20, METAL_CLAW
	db 22, REVERSAL ; becomes Flail
	db 27, CRUNCH
	db 34, SLASH
	db 36, SCREECH
	db 41, THRASH
	db 43, AQUA_TAIL
	db 48, HAMMER_ARM
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

CroconawEvosAttacks:
	db EVOLVE_LEVEL, 32, FERALIGATR
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, WATER_GUN
	db 8, RAGE
	db 13, BITE
	db 15, SCARY_FACE
	db 21, METAL_CLAW
	db 24, REVERSAL ; becomes Flail
	db 30, CRUNCH
	db 39, SLASH
	db 42, SCREECH
	db 48, THRASH
	db 51, AQUA_TAIL
	db 57, HAMMER_ARM
	db 60, HYDRO_PUMP
	db 0 ; no more level-up moves

FeraligatrEvosAttacks:
	db 0 ; no more evolutions
	db 16, BITE
	db 15, SCARY_FACE
	db 21, METAL_CLAW
	db 24, REVERSAL ; becomes Flail
	db 32, CRUNCH
	db 45, SLASH
	db 50, SCREECH
	db 57, THRASH
	db 61, AQUA_TAIL
	db 66, HAMMER_ARM
	db 69, HYDRO_PUMP
	db 0 ; no more level-up moves

SentretEvosAttacks:
	db EVOLVE_LEVEL, 15, FURRET
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 4, DEFENSE_CURL
	db 7, QUICK_ATTACK
	db 10, LEAF_SHIELD
	db 13, FURY_ATTACK
	db 17, MAKESHIFT
	db 19, CHARM
	db 25, SLAM
	db 29, REST
	db 35, EXTREMESPEED
	db 39, AMNESIA
	db 42, BATON_PASS
	db 45, SWORDS_DANCE
	db 51, HYPER_SONAR
	db 0 ; no more level-up moves

FurretEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 4, DEFENSE_CURL
	db 7, QUICK_ATTACK
	db 10, LEAF_SHIELD
	db 13, FURY_ATTACK
	db 14, AGILITY
	db 18, MAKESHIFT
	db 21, CHARM
	db 28, SLAM
	db 32, REST
	db 39, EXTREMESPEED
	db 42, AMNESIA
	db 46, BATON_PASS
	db 50, SWORDS_DANCE
	db 55, HYPER_SONAR
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	db EVOLVE_LEVEL, 20, NOCTOWL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 7, PECK
	db 10, CONFUSION
	db 14, HYPNOSIS
	db 16, ZEN_HEADBUTT
	db 22, REFLECT
	db 25, DARK_PULSE ; becomes Extrasensory
	db 28, TAKE_DOWN
	db 31, AIR_SLASH
	db 34, CONFUSION
	db 38, RECOVER ; becomes Roost
	db 45, DREAM_EATER
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 10, CONFUSION
	db 16, HYPNOSIS
	db 16, ZEN_HEADBUTT
	db 22, FAINT_ATTACK
	db 25, REFLECT
	db 29, DARK_PULSE ; becomes Extrasensory
	db 33, TAKE_DOWN
	db 36, AIR_SLASH
	db 41, CONFUSION
	db 45, RECOVER ; becomes Roost
	db 50, DREAM_EATER
	db 0 ; no more level-up moves

LedybaEvosAttacks:
	db EVOLVE_LEVEL, 20, LEDIAN
	db 0 ; no more evolutions
	db 1, COMET_PUNCH
	db 1, WAKEUP_SLAP
	db 7, SUPERSONIC
	db 9, SWIFT
	db 12, LIGHT_SCREEN
	db 12, SAFEGUARD
	db 12, REFLECT
	db 16, MACH_PUNCH
	db 21, SILVER_WIND	
	db 26, BATON_PASS
	db 28, ZOOM_FLIGHT
	db 31, AGILITY
	db 36, AIR_SLASH
	db 43, DOUBLE_EDGE
	db 50, BUG_BUZZ
	db 0 ; no more level-up moves

LedianEvosAttacks:
	db 0 ; no more evolutions
	db 9, SWIFT
	db 12, LIGHT_SCREEN
	db 12, REFLECT
	db 16, MACH_PUNCH
	db 22, SILVER_WIND
	db 29, BATON_PASS
	db 31, ZOOM_FLIGHT
	db 34, AGILITY
	db 40, AIR_SLASH
	db 47, DOUBLE_EDGE
	db 56, BUG_BUZZ
	db 0 ; no more level-up moves

SpinarakEvosAttacks:
	db EVOLVE_LEVEL, 22, ARIADOS
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 6, SCARY_FACE
	db 9, LEECH_LIFE
	db 11, CONSTRICT
	db 17, NIGHT_SHADE	
	db 28, FURY_ATTACK	
	db 34, FELL_STINGER
	db 37, MEAN_LOOK
	db 45, AGILITY
	db 53, PSYCHIC_M
	db 0 ; no more level-up moves

AriadosEvosAttacks:
	db 0 ; no more evolutions
	db 6, SCARY_FACE
	db 9, LEECH_LIFE
	db 11, CONSTRICT
	db 17, NIGHT_SHADE
	db 25, TWINEEDLE
	db 32, FURY_ATTACK
	db 38, FELL_STINGER
	db 40, MEAN_LOOK
	db 48, AGILITY
	db 56, PSYCHIC_M
	db 0 ; no more level-up moves

CrobatEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 5, SUPERSONIC
	db 8, BITE
	db 13, WING_ATTACK
	db 17, CONFUSE_RAY
	db 19, SLASH ; becomes Air Cutter
	db 24, SWIFT
	db 27, CHARGE_BEAM ; becomes Poison Fang
	db 32, MEAN_LOOK
	db 35, LEECH_LIFE
	db 43, VENOSHOCK
	db 45, CRUNCH
	db 48, AIR_SLASH
	db 51, EXTREMESPEED
	db 0 ; no more level-up moves

ChinchouEvosAttacks:
	db EVOLVE_LEVEL, 27, LANTURN
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, THUNDER_WAVE
	db 5, SUPERSONIC	
	db 10, EERIEIMPULSE
	db 12, WATER_GUN
	db 17, CONFUSE_RAY
	db 21, SPARK
	db 26, BUBBLEBEAM
	db 31, REVERSAL ; becomes Flail
	db 34, SIGNAL_BEAM
	db 39, TAKE_DOWN
	db 43, AQUA_TAIL
	db 47, HYDRO_PUMP
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	db 10, EERIEIMPULSE
	db 12, WATER_GUN
	db 17, CONFUSE_RAY
	db 21, SPARK
	db 26, BUBBLEBEAM
	db 33, REVERSAL ; becomes Flail
	db 37, SIGNAL_BEAM
	db 44, TAKE_DOWN
	db 48, AQUA_TAIL
	db 54, HYDRO_PUMP
	db 0 ; no more level-up moves

PichuEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, PIKACHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, CHARM
	db 5, TAIL_WHIP
	db 8, THUNDER_WAVE
	db 10, SWEET_KISS
	db 12, QUICK_ATTACK
	db 15, DOUBLE_TEAM
	db 19, SLAM
	db 22, THUNDERBOLT
	db 30, AGILITY
	db 37, THUNDER
	db 45, LIGHT_SCREEN
	db 0 ; no more level-up moves

CleffaEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CLEFAIRY
	db 0 ; no more evolutions
	db 1, POUND
	db 1, CHARM
	db 5, ENCORE
	db 7, SWEET_KISS
	db 8, SING
	db 13, DOUBLESLAP
	db 18, MINIMIZE
	db 21, WAKEUP_SLAP
	db 25, DEFENSE_CURL
	db 27, METRONOME
	db 30, FIRE_FLICK
	db 35, MOONLIGHT
	db 39, GROWTH ; becomes Cosmic Power
	db 42, LIGHT_SCREEN
	db 47, BODY_SLAM
	db 0 ; no more level-up moves

IgglybuffEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, JIGGLYPUFF
	db 0 ; no more evolutions
	db 1, SING
	db 1, POUND
	db 5, DEFENSE_CURL
	db 7, CHARM
	db 13, DISABLE
	db 19, ROLLOUT
	db 23, DOUBLESLAP
	db 26, WAKEUP_SLAP
	db 29, REST
	db 34, BODY_SLAM
	db 37, MIMIC
	db 40, DOUBLE_EDGE
	db 44, FIRE_FLICK
	db 47, SKULL_BASH
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, TOGETIC
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CHARM
	db 7, METRONOME
	db 18, SWEET_KISS
	db 21, DOUBLESLAP
	db 25, ENCORE
	db 33, ANCIENTPOWER
	db 38, ZEN_HEADBUTT
	db 41, SAFEGUARD
	db 43, DOUBLE_EDGE
	db 47, EGG_BOMB
	db 50, HYPER_SONAR
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CHARM
	db 7, METRONOME
	db 18, SWEET_KISS
	db 21, DOUBLESLAP
	db 26, ENCORE
	db 35, ANCIENTPOWER
	db 40, ZEN_HEADBUTT
	db 43, SAFEGUARD
	db 46, DOUBLE_EDGE	
	db 50, EGG_BOMB
	db 56, SKY_ATTACK
	db 0 ; no more level-up moves

NatuEvosAttacks:
	db EVOLVE_LEVEL, 25, XATU
	db 0 ; no more evolutions
	db 1, PECK
	db 1, LEER
	db 6, NIGHT_SHADE
	db 9, TELEPORT
	db 12, GUST
	db 18, AMNESIA
	db 23, CONFUSE_RAY
	db 28, MIRROR_MOVE
	db 33, PSYCHIC_M
	db 38, NASTY_PLOT
	db 44, FUTURE_SIGHT
	db 49, BUG_BUZZ
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, NIGHT_SHADE
	db 1, TELEPORT
	db 24, AIR_SLASH
	db 30, MIRROR_MOVE
	db 35, PSYCHIC_M
	db 41, NASTY_PLOT
	db 47, FUTURE_SIGHT
	db 54, BUG_BUZZ
	db 0 ; no more level-up moves

MareepEvosAttacks:
	db EVOLVE_LEVEL, 15, FLAAFFY
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 4, THUNDER_WAVE
	db 9, THUNDERSHOCK
	db 11, COTTON_SPORE
	db 18, TAKE_DOWN
	db 22, CHARGE_BEAM
	db 25, CONFUSE_RAY
	db 29, POWER_GEM
	db 36, BARRIER
	db 39, SIGNAL_BEAM
	db 42, LIGHT_SCREEN
	db 46, THUNDER
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	db EVOLVE_LEVEL, 30, AMPHAROS
	db 0 ; no more evolutions
	db 18, TAKE_DOWN
	db 22, CHARGE_BEAM
	db 25, CONFUSE_RAY
	db 31, POWER_GEM
	db 38, BARRIER
	db 41, SIGNAL_BEAM
	db 46, LIGHT_SCREEN
	db 51, THUNDER
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	db 18, TAKE_DOWN
	db 22, CHARGE_BEAM
	db 25, CONFUSE_RAY
	db 29, THUNDERPUNCH
	db 34, POWER_GEM
	db 42, BARRIER
	db 45, SIGNAL_BEAM
	db 49, LIGHT_SCREEN
	db 57, THUNDER
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, POISONPOWDER
	db 1, STUN_SPORE
	db 1, SLEEP_POWDER
	db 20, MEGA_DRAIN
	db 24, MAGICAL_LEAF
	db 30, MOONLIGHT
	db 36, PETAL_DANCE
	db 40, GIGA_DRAIN
	db 44, SAFEGUARD
	db 52, SOLARBEAM
	db 56, SUNNY_DAY
	db 60, LEAF_STORM
	db 0 ; no more level-up moves

MarillEvosAttacks:
	db EVOLVE_LEVEL, 18, AZUMARILL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 6, WATER_GUN
	db 9, TAIL_WHIP
	db 11, ROLLOUT
	db 15, BUBBLEBEAM
	db 21, AQUA_TAIL
	db 24, PROTECT
	db 29, DIZZY_PUNCH
	db 32, RAIN_DANCE
	db 38, DOUBLE_EDGE
	db 41, CLOSE_COMBAT
	db 48, HYDRO_PUMP
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	db 1, TAIL_WHIP
	db 1, ROLLOUT
	db 1, BUBBLEBEAM
	db 22, AQUA_TAIL
	db 26, PROTECT
	db 31, DIZZY_PUNCH
	db 35, RAIN_DANCE
	db 40, DOUBLE_EDGE
	db 44, CLOSE_COMBAT
	db 53, HYDRO_PUMP
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROCK_THROW
	db 5, MIMIC
	db 10, REVERSAL
	db 14, LOW_KICK
	db 17, SLAM
	db 20, ROCK_TOMB
	db 26, DEFENSE_CURL
	db 29, ROCK_SLIDE
	db 33, COUNTER
	db 37, FAINT_ATTACK
	db 43, DOUBLE_EDGE ; becomes Wood Hammer
	db 47, CROSS_CHOP ; changes to Stone Edge
	db 52, HAMMER_ARM
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 5, HYPNOSIS
	db 10, DOUBLESLAP
	db 15, PERISH_SONG
	db 17, FIRE_PLAY ; becomes Tide Clash
	db 19, RAIN_DANCE
	db 29, BODY_SLAM
	db 35, PERISH_SONG
	db 44, HYPER_SONAR
	db 51, SWAGGER
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

HoppipEvosAttacks:
	db EVOLVE_LEVEL, 18, SKIPLOOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 4, TAIL_WHIP
	db 6, SYNTHESIS
	db 9, VINE_WHIP
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 19, RAZOR_LEAF
	db 20, LEECH_SEED
	db 25, COTTON_SPORE
	db 30, MEGA_DRAIN
	db 40, LIGHT_SCREEN
	db 49, GIGA_DRAIN
	db 0 ; no more level-up moves

SkiploomEvosAttacks:
	db EVOLVE_LEVEL, 27, JUMPLUFF
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, TAIL_WHIP
	db 1, SYNTHESIS
	db 1, VINE_WHIP
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 19, RAZOR_LEAF
	db 22, LEECH_SEED
	db 29, COTTON_SPORE
	db 36, MEGA_DRAIN
	db 43, LIGHT_SCREEN
	db 52, GIGA_DRAIN
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, TAIL_WHIP
	db 1, SYNTHESIS
	db 1, VINE_WHIP
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 20, RAZOR_LEAF
	db 22, LEECH_SEED
	db 33, COTTON_SPORE
	db 44, MEGA_DRAIN
	db 49, LIGHT_SCREEN
	db 55, GIGA_DRAIN
	db 0 ; no more level-up moves

AipomEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 6, SAND_ATTACK
	db 8, LEAF_SHIELD
	db 12, BATON_PASS
	db 19, MAKESHIFT
	db 22, FURY_ATTACK
	db 27, SWIFT
	db 36, SCREECH
	db 39, NASTY_PLOT
	db 45, EGG_BOMB
	db 49, AGILITY
	db 0 ; no more level-up moves

SunkernEvosAttacks:
	db EVOLVE_ITEM, SUN_STONE, SUNFLORA
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, POUND
	db 4, GROWTH
	db 6, CONSTRICT
	db 9, MEGA_DRAIN
	db 12, LEECH_SEED
	db 15, RAZOR_LEAF	
	db 21, SPORE
	db 27, PETAL_DANCE
	db 33, SOLARBEAM
	db 39, SUNNY_DAY	
	db 43, SHADOW_BALL ; becomes Energy Ball
	db 0 ; no more level-up moves

SunfloraEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, POUND
	db 4, GROWTH
	db 6, CONSTRICT
	db 10, MEGA_DRAIN
	db 13, LEECH_SEED
	db 16, RAZOR_LEAF	
	db 25, SPORE
	db 31, PETAL_DANCE
	db 37, SOLARBEAM
	db 43, SUNNY_DAY	
	db 50, SHADOW_BALL ; becomes Energy Ball
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, FIRE_PLAY ; becomes Flutter Clap
	db 9, TWINEEDLE
	db 14, DOUBLE_TEAM
	db 19, SONICBOOM
	db 25, PROTECT
	db 31, SUPERSONIC
	db 37, WING_ATTACK
	db 40, ZOOM_FLIGHT
	db 43, SCREECH
	db 53, BUG_BUZZ
	db 0 ; no more level-up moves

WooperEvosAttacks:
	db EVOLVE_LEVEL, 20, QUAGSIRE
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, TAIL_WHIP
	db 9, ICY_WIND ; becomes Mud Shot
	db 14, SLAM
	db 19, MUD_BOMB
	db 21, AMNESIA
	db 23, JET_STREAM
	db 26, DISABLE
	db 31, EARTHQUAKE
	db 41, RAIN_DANCE
	db 51, MIST
	db 51, HAZE
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	db 1, TAIL_WHIP
	db 9, ICY_WIND ; becomes Mud Shot
	db 14, SLAM
	db 19, MUD_BOMB
	db 22, AMNESIA
	db 25, JET_STREAM
	db 28, DISABLE
	db 34, EARTHQUAKE
	db 44, RAIN_DANCE
	db 56, MIST
	db 56, HAZE
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, SAND_ATTACK
	db 1, CONFUSION
	db 16, QUICK_ATTACK
	db 30, SWIFT
	db 36, PSYBEAM
	db 42, PSYCH_UP
	db 47, PSYCHIC_M
	db 52, MORNING_SUN
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, SAND_ATTACK
	db 1, PURSUIT
	db 16, QUICK_ATTACK
	db 30, CONFUSE_RAY
	db 36, FAINT_ATTACK
	db 42, MEAN_LOOK
	db 47, SCREECH
	db 50, DARK_PULSE
	db 52, MOONLIGHT
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, CONFUSE_RAY
	db 11, PURSUIT
	db 16, HAZE
	db 20, FEATHERGALE
	db 24, NIGHT_SHADE
	db 31, FAINT_ATTACK
	db 33, WHIRLWIND
	db 41, MEAN_LOOK
	db 44, SWORDS_DANCE
	db 48, HARMONY
	db 51, SLAM
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 6, GROWL
	db 9, WATER_GUN
	db 14, CONFUSION
	db 19, DISABLE
	db 23, HEADBUTT
	db 25, HIDDEN_POWER
	db 32, ZEN_HEADBUTT
	db 36, NASTY_PLOT
	db 41, SWAGGER
	db 45, PSYCHIC_M
	db 54, PSYCH_UP
	db 60, POWER_GEM
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, PSYWAVE
	db 6, SPITE
	db 10, NIGHT_SHADE
	db 12, CONFUSE_RAY
	db 19, MEAN_LOOK
	db 27, PSYBEAM
	db 36, PAIN_SPLIT
	db 41, DARK_PULSE
	db 47, POWER_GEM
	db 55, AURORA_BEAM
	db 0 ; no more level-up moves

UnownEvosAttacks:
	db 0 ; no more evolutions
	db 1, HIDDEN_POWER
	db 0 ; no more level-up moves

WobbuffetEvosAttacks:
	db 0 ; no more evolutions
	db 1, METRONOME
	db 1, AMNESIA
	db 1, ENCORE
	db 1, LEECH_SEED
	db 1, SWAGGER
	db 1, SPITE
	db 1, COUNTER
	db 1, MIRROR_COAT
	db 1, SAFEGUARD
	db 1, PAIN_SPLIT
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CONFUSION
	db 1, STOMP
	db 14, STAMPEDE
	db 20, AGILITY
	db 26, PSYBEAM
	db 32, ZEN_HEADBUTT
	db 37, CRUNCH
	db 41, BATON_PASS
	db 46, NASTY_PLOT
	db 50, PSYCHIC
	db 0 ; no more level-up moves

PinecoEvosAttacks:
	db EVOLVE_LEVEL, 31, FORRETRESS
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, PROTECT
	db 1, LEECH_LIFE
	db 8, SELFDESTRUCT
	db 15, TAKE_DOWN
	db 22, RAPID_SPIN
	db 28, SPIKES
	db 32, ZOOM_FLIGHT
	db 36, EXPLOSION
	db 41, ACID_ARMOR
	db 44, ROCK_SLIDE
	db 49, DOUBLE_EDGE
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	db 8, SELFDESTRUCT
	db 15, TAKE_DOWN
	db 22, RAPID_SPIN
	db 28, SPIKES
	db 34, ZOOM_FLIGHT
	db 38, EXPLOSION
	db 44, ACID_ARMOR
	db 49, ROCK_SLIDE
	db 56, DOUBLE_EDGE
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAGE
	db 1, DEFENSE_CURL
	db 3, ROLLOUT
	db 6, SPITE
	db 8, PURSUIT
	db 13, GLARE
	db 16, MUD_BOMB
	db 19, ANCIENTPOWER
	db 25, BODY_SLAM
	db 26, RECOVER ; becomes Roost
	db 29, SCREECH
	db 33, DIG
	db 35, ROCK_SLIDE
	db 39, TAKE_DOWN
	db 43, REVERSAL ; becomes Flail
	db 49, DOUBLE_EDGE
	db 0 ; no more level-up moves

GligarEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 4, SAND_ATTACK
	db 7, HARDEN
	db 13, QUICK_ATTACK
	db 19, FAINT_ATTACK
	db 24, SLASH
	db 34, SCREECH
	db 38, X_SCISSOR
	db 41, SANDSTORM
	db 45, SUBMISSION
	db 50, SWORDS_DANCE
	db 54, HORN_DRILL ; becomes Guillotine
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCREECH
	db 1, WRAP
	db 10, ROCK_THROW
	db 14, ROCK_TOMB	
	db 19, ICY_WIND
	db 23, HARDEN
	db 28, DIG
	db 30, RAGE
	db 39, IRON_TAIL
	db 41, SANDSTORM
	db 44, SLAM
	db 50, GYRO_BALL
	db 52, CRUNCH
	db 55, CROSS_CHOP ; changes to Stone Edge
	db 0 ; no more level-up moves

SnubbullEvosAttacks:
	db EVOLVE_LEVEL, 23, GRANBULL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCARY_FACE
	db 1, TAIL_WHIP
	db 5, CHARM
	db 7, BITE
	db 13, LICK
	db 19, HEADBUTT
	db 26, ROAR
	db 35, RAGE
	db 44, TAKE_DOWN
	db 46, CLOSE_COMBAT
	db 51, CRUNCH
	db 58, THRASH
	db 0 ; no more level-up moves

GranbullEvosAttacks:
	db 0 ; no more evolutions
	db 5, CHARM
	db 7, BITE
	db 13, LICK
	db 19, HEADBUTT
	db 28, ROAR
	db 37, RAGE
	db 46, TAKE_DOWN
	db 49, CLOSE_COMBAT
	db 54, CRUNCH
	db 60, THRASH
	db 0 ; no more level-up moves

QwilfishEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPIKES
	db 1, POISON_STING
	db 7, HARDEN
	db 9, MINIMIZE
	db 15, WATER_GUN
	db 19, ROLLOUT
	db 25, DOUBLESLAP ; becomes Pin Missile
	db 29, CONFUSION ; becomes Revenge
	db 33, JET_STREAM
	db 38, TAKE_DOWN
	db 41, BUBBLE ; becomes Brine
	db 44, TOXIC
	db 49, VENOSHOCK
	db 54, AQUA_TAIL
	db 59, FELL_STINGER
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, MACH_PUNCH ; becomes Bullet Punch
	db 1, LEER
	db 5, FOCUS_ENERGY
	db 9, PURSUIT
	db 13, FALSE_SWIPE
	db 17, AGILITY
	db 21, METAL_CLAW
	db 25, SLASH
	db 29, BARRIER ; becomes Iron Defense
	db 33, X_SCISSOR
	db 37, DOUBLE_KICK
	db 41, DARK_PULSE ; becomes Iron Head
	db 45, SWORDS_DANCE
	db 0 ; no more level-up moves

ShuckleEvosAttacks: ; done
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, HARDEN
	db 5, ROLLOUT
	db 9, WRAP
	db 12, ENCORE
	db 16, SAFEGUARD
	db 23, ROCK_THROW
	db 27, LEAF_SHIELD
	db 30, DOUBLESLAP ; becomes Rock Blast
	db 37, REST
	db 42, BUG_BUZZ
	db 45, SKULL_BASH
	db 51, EARTHQUAKE
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, HORN_ATTACK
	db 8, HARDEN
	db 12, ENDURE
	db 15, LEECH_LIFE
	db 19, FURY_ATTACK
	db 23, COUNTER
	db 28, BRICK_BREAK
	db 31, DOUBLESLAP ; becomes Pin Missile
	db 34, TAKE_DOWN
	db 37, MEGAHORN
	db 43, CLOSE_COMBAT
	db 47, REVERSAL
	db 55, FELL_STINGER
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, LICK
	db 9, QUICK_ATTACK ; becomes Ice Shard
	db 13, MAKESHIFT
	db 17, SCREECH
	db 25, FAINT_ATTACK
	db 33, FURY_ATTACK
	db 41, AGILITY
	db 49, SLASH
	db 54, METAL_CLAW
	db 60, FELL_STINGER
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	db EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 5, LICK
	db 8, FURY_ATTACK
	db 12, CHARM
	db 15, FAINT_ATTACK
	db 18, LEAF_SHIELD
	db 23, SLASH
	db 29, REST
	db 33, SNORE
	db 38, THRASH
	db 45, BULK_UP
	db 51, HAMMER_ARM
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	db 0 ; no more evolutions
	db 15, FAINT_ATTACK
	db 18, LEAF_SHIELD
	db 23, SLASH
	db 29, REST
	db 34, SNORE
	db 40, THRASH
	db 48, BULK_UP
	db 56, HAMMER_ARM
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	db EVOLVE_LEVEL, 26, MAGCARGO
	db 0 ; no more evolutions
	db 1, POUND
	db 5, SMOG
	db 8, FIRE_PLAY ; becomes Kindle Clash
	db 10, ROCK_THROW
	db 13, HARDEN
	db 22, ANCIENTPOWER
	db 29, ROCK_SLIDE
	db 36, AMNESIA
	db 41, BODY_SLAM
	db 43, RECOVER
	db 44, FLAMETHROWER
	db 50, POWER_GEM
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	db 8, FIRE_PLAY ; becomes Kindle Clash
	db 10, ROCK_THROW
	db 13, HARDEN
	db 22, ANCIENTPOWER
	db 30, ROCK_SLIDE
	db 37, AMNESIA
	db 43, BODY_SLAM
	db 46, RECOVER
	db 48, FLAMETHROWER
	db 55, POWER_GEM
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	db EVOLVE_LEVEL, 26, PILOSWINE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, POWDER_SNOW
	db 7, DOUBLE_TEAM
	db 9, ICY_WIND
	db 12, SAND_ATTACK
	db 19, ENDURE	
	db 24, POWER_GEM
	db 26, TAKE_DOWN
	db 29, CONFUSION ; becomes Avalanche
	db 35, MIST
	db 37, EARTHQUAKE
	db 40, REVERSAL ; becomes Flail
	db 45, BLIZZARD
	db 49, AMNESIA
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	db 0 ; no more evolutions
	db 9, ICY_WIND
	db 12, SAND_ATTACK
	db 19, ENDURE	
	db 24, POWER_GEM
	db 28, TAKE_DOWN
	db 31, CONFUSION ; becomes Avalanche
	db 37, MIST
	db 41, EARTHQUAKE
	db 44, REVERSAL ; becomes Flail
	db 50, BLIZZARD
	db 56, AMNESIA
	db 61, THRASH
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 5, FIRE_PLAY ; becomes Tide Clash
	db 8, RECOVER
	db 10, SPIKE_CANNON
	db 16, BUBBLEBEAM
	db 20, ANCIENTPOWER
	db 25, BUBBLE ; becomes Brine
	db 29, ACID_ARMOR
	db 31, DOUBLESLAP ; becomes Rock Blast
	db 35, ENDURE
	db 38, JET_STREAM
	db 43, POWER_GEM
	db 45, MIRROR_COAT
	db 50, REVERSAL ; becomes Flail
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	db EVOLVE_LEVEL, 25, OCTILLERY
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 5, LOCK_ON
	db 12, PSYBEAM
	db 14, AURORA_BEAM
	db 18, BUBBLEBEAM
	db 22, FOCUS_ENERGY
	db 26, JET_STREAM
	db 30, SIGNAL_BEAM
	db 34, ICE_BEAM
	db 39, CHARGE_BEAM
	db 42, HYDRO_PUMP
	db 49, HYPER_BEAM
	db 0 ; no more level-up moves

OctilleryEvosAttacks:
	db 0 ; no more evolutions
	db 12, PSYBEAM
	db 14, AURORA_BEAM
	db 18, BUBBLEBEAM
	db 22, FOCUS_ENERGY
	db 24, OCTAZOOKA
	db 30, JET_STREAM
	db 34, SIGNAL_BEAM
	db 36, ICE_BEAM
	db 43, CHARGE_BEAM
	db 47, HYDRO_PUMP
	db 52, HYPER_BEAM
	db 0 ; no more level-up moves

DelibirdEvosAttacks:
	db 0 ; no more evolutions
	db 1, FIRE_PLAY ; becomes Flutter Clap
	db 1, SAND_ATTACK
	db 6, MIST	
	db 10, MIRROR_MOVE
	db 15, POWDER_SNOW
	db 19, AMNESIA
	db 22, ENCORE
	db 28, STEEL_WING
	db 35, REFLECT
	db 41, REST	
	db 44, ZEN_HEADBUTT
	db 49, BLIZZARD
	db 55, BELLY_DRUM
	db 0 ; no more level-up moves

MantineEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, BUBBLE
	db 8, SUPERSONIC
	db 11, FIRE_PLAY ; becomes Tide Clash
	db 14, WING_ATTACK
	db 16, HEADBUTT
	db 19, BUBBLEBEAM
	db 25, TAKE_DOWN
	db 29, JET_STREAM
	db 32, AGILITY
	db 36, SIGNAL_BEAM
	db 41, AIR_SLASH
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, PECK
	db 6, SAND_ATTACK
	db 9, METAL_CLAW
	db 12, WING_ATTACK
	db 17, FURY_ATTACK
	db 23, SWIFT
	db 28, SPIKES
	db 31, AGILITY
	db 34, STEEL_WING
	db 39, SLASH
	db 45, AIR_SLASH
	db 54, IRON_TAIL
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	db EVOLVE_LEVEL, 24, HOUNDOOM
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 4, SHARPEN
	db 8, SMOG
	db 12, ROAR
	db 15, BITE
	db 24, FAINT_ATTACK
	db 28, ABSORB ; becomes Fire Fang
	db 30, PURSUIT
	db 35, SHADOW_BALL
	db 41, FLAMETHROWER
	db 46, CRUNCH
	db 50, NASTY_PLOT
	db 54, INFERNO
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROAR
	db 1, BITE
	db 1, FAINT_ATTACK
	db 30, ABSORB ; becomes Fire Fang
	db 32, PURSUIT
	db 38, SHADOW_BALL
	db 45, FLAMETHROWER
	db 51, CRUNCH
	db 55, NASTY_PLOT
	db 60, INFERNO
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	db 1, ANCIENTPOWER
	db 1, OCTAZOOKA
	db 1, LEER
	db 32, TWISTER
	db 38, AGILITY
	db 41, DARK_PULSE ; becomes Waterfall
	db 44, AQUA_TAIL
	db 49, PRISM_LIGHT
	db 55, ICE_BEAM
	db 59, IRON_TAIL
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	db EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 9, DEFENSE_CURL
	db 10, ROLLOUT
	db 13, STOMP
	db 17, REVERSAL ; becomes Flail
	db 25, TAKE_DOWN
	db 30, CHARM
	db 38, RAPID_SPIN
	db 41, ENDURE
	db 44, DOUBLE_EDGE
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, GROWL
	db 9, DEFENSE_CURL
	db 17, REVERSAL ; becomes Flail
	db 24, STAMPEDE	
	db 26, FURY_ATTACK
	db 33, ROLLOUT
	db 41, RAPID_SPIN
	db 44, EARTHQUAKE
	db 47, ENDURE
	db 50, HYPER_BEAM
	db 56, SANDSTORM
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	db 0 ; no more evolutions
	db 1, CONVERSION2
	db 1, TACKLE
	db 1, CONVERSION
	db 7, SHARPEN
	db 8, PSYBEAM
	db 13, AGILITY
	db 19, RECOVER
	db 25, ZOOM_FLIGHT
	db 31, CHARGE_BEAM
	db 37, LOCK_ON
	db 43, TRI_ATTACK
	db 49, KINESIS
	db 55, ZAP_CANNON
	db 60, HYPER_BEAM
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 8, LEER
	db 10, HYPNOSIS
	db 12, CONFUSION
	db 15, STOMP
	db 20, STAMPEDE
	db 24, SAND_ATTACK
	db 27, GROWTH ; becomes Calm Mind
	db 29, ZEN_HEADBUTT
	db 34, TAKE_DOWN
	db 37, CONFUSE_RAY
	db 42, THRASH
	db 48, JUMP_KICK
	db 54, REVERSAL
	db 0 ; no more level-up moves

SmeargleEvosAttacks:
	db 0 ; no more evolutions
	db 1, SKETCH
	db 11, SKETCH
	db 21, SKETCH
	db 31, SKETCH
	db 41, SKETCH
	db 51, SKETCH
	db 61, SKETCH
	db 71, SKETCH
	db 81, SKETCH
	db 91, SKETCH
	db 0 ; no more level-up moves

TyrogueEvosAttacks:
	db EVOLVE_STAT, 16, ATK_LT_DEF, HITMONCHAN
	db EVOLVE_STAT, 16, ATK_GT_DEF, HITMONLEE
	db EVOLVE_STAT, 16, ATK_EQ_DEF, HITMONTOP
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, MACH_PUNCH
	db 9, FOCUS_ENERGY	
	db 14, BRICK_BREAK
	db 19, LOCK_ON
	db 24, VITAL_THROW
	db 28, BULK_UP
	db 34, SUBMISSION
	db 39, CROSS_CHOP
	db 42, MIMIC
	db 44, DYNAMICPUNCH
	db 48, CLOSE_COMBAT
	db 0 ; no more level-up moves

HitmontopEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROLLING_KICK
	db 6, FOCUS_ENERGY
	db 10, PURSUIT
	db 14, ROLLING_KICK
	db 19, QUICK_ATTACK
	db 25, RAPID_SPIN
	db 31, COUNTER
	db 37, AGILITY
	db 43, PROTECT
	db 49, TRIPLE_KICK
	db 55, CLOSE_COMBAT
	db 0 ; no more level-up moves

SmoochumEvosAttacks:
	db EVOLVE_LEVEL, 22, JYNX
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LICK
	db 9, SING
	db 10, POWDER_SNOW
	db 19, DOUBLESLAP
	db 23, ICE_PUNCH
	db 29, PSYWAVE
	db 30, WAKEUP_SLAP
	db 36, MEAN_LOOK
	db 38, CONFUSION ; becomes Avalanche
	db 41, BODY_SLAM
	db 45, PERISH_SONG
	db 51, BLIZZARD
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	db EVOLVE_LEVEL, 22, ELECTABUZZ
	db 0 ; no more evolutions
	db 1, LEER
	db 1, THUNDERSHOCK	
	db 8, QUICK_ATTACK
	db 13, LOW_KICK
	db 15, THUNDER_WAVE
	db 17, LIGHT_SCREEN
	db 21, WILD_STORM
	db 25, SWIFT
	db 29, THUNDERPUNCH
	db 33, SCREECH
	db 36, BRICK_BREAK ; unevolved move
	db 41, THUNDERBOLT
	db 47, THUNDER
	db 0 ; no more level-up moves

MagbyEvosAttacks:
	db EVOLVE_LEVEL, 22, MAGMAR
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 7, SMOG
	db 11, DOUBLESLAP
	db 15, FIRE_SPIN
	db 19, FIRE_PUNCH
	db 25, SMOKESCREEN	
	db 30, SUNNY_DAY
	db 33, FAINT_ATTACK ; unevolved move
	db 37, DIZZY_PUNCH
	db 41, CONFUSE_RAY 
	db 45, FLAMETHROWER	
	db 48, FIRE_BLAST
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, GROWL
	db 6, DEFENSE_CURL
	db 9, STOMP
	db 12, ROLLOUT
	db 18, HORN_ATTACK
	db 20, RECOVER
	db 24, BODY_SLAM
	db 29, ZEN_HEADBUTT
	db 32, STAMPEDE
	db 39, SAFEGUARD
	db 47, HEAL_BELL
	db 53, WAKEUP_SLAP
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 4, POUND
	db 6, DEFENSE_CURL
	db 9, TAIL_WHIP
	db 12, DOUBLESLAP
	db 17, RECOVER
	db 22, MINIMIZE
	db 28, TAKE_DOWN
	db 33, SING
	db 38, WAKEUP_SLAP
	db 45, EGG_BOMB
	db 51, LIGHT_SCREEN
	db 59, DOUBLE_EDGE
	db 65, BLIZZARD
	db 0 ; no more level-up moves

RaikouEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 6, THUNDERSHOCK
	db 10, ROAR
	db 12, CHARGE_BEAM
	db 16, MEAN_LOOK
	db 21, QUICK_ATTACK
	db 26, SPARK
	db 31, REFLECT
	db 37, CRUNCH
	db 40, PSYBEAM ; becomes Thunder Fang
	db 44, DARK_PULSE ; becomes Extrasensory
	db 47, GROWTH ; becomes Calm Mind
	db 53, RAIN_DANCE
	db 55, THUNDER
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 6, EMBER
	db 10, ROAR
	db 12, FIRE_SPIN
	db 16, MEAN_LOOK
	db 21, STOMP
	db 30, REFLECT
	db 35, MAGMA_STORM
	db 40, ABSORB ; becomes Fire Fang
	db 43, DARK_PULSE ; becomes Extrasensory
	db 48, GROWTH ; becomes Calm Mind
	db 52, SWAGGER
	db 55, FIRE_BLAST
	db 66, DOUBLE_EDGE ; Becomes Flare Blitz
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 6, WATER_GUN
	db 10, ROAR
	db 12, BUBBLEBEAM
	db 13, RAIN_DANCE	
	db 16, MEAN_LOOK
	db 20, GUST
	db 25, AURORA_BEAM
	db 29, MIST
	db 36, MIRROR_COAT
	db 39, EMBER ; becomes Ice Fang
	db 43, DARK_PULSE ; becomes Extrasensory
	db 47, GROWTH ; becomes Calm Mind
	db 54, HYDRO_PUMP
	db 66, HORN_DRILL ; becomes Sheer Cold
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	db EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 8, SANDSTORM
	db 14, SCREECH
	db 19, ROCK_SLIDE
	db 23, SCARY_FACE
	db 29, THRASH
	db 32, DARK_PULSE
	db 35, CROSS_CHOP ; changes to Stone Edge
	db 41, CRUNCH
	db 46, EARTHQUAKE
	db 55, HYPER_BEAM
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	db EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	db 29, THRASH
	db 34, DARK_PULSE
	db 37, CROSS_CHOP ; changes to Stone Edge
	db 44, CRUNCH
	db 49, EARTHQUAKE
	db 59, HYPER_BEAM
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions
	db 29, THRASH
	db 34, DARK_PULSE
	db 37, CROSS_CHOP ; changes to Stone Edge
	db 44, CRUNCH
	db 49, EARTHQUAKE
	db 54, SCARY_FACE
	db 60, HYPER_BEAM
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 1, WHIRLWIND
	db 10, RAIN_DANCE
	db 12, SAFEGUARD
	db 17, BUBBLE ; becomes Brine
	db 21, SWIFT
	db 25, RECOVER
	db 29, WILD_STORM
	db 34, DARK_PULSE ; becomes Extrasensory
	db 38, FLY
	db 44, ICY_WIND ; becomes Mega Splash
	db 49, ANCIENTPOWER
	db 54, FUTURE_SIGHT
	db 58, GROWTH ; becomes Calm Mind
	db 60, SKY_ATTACK
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 1, WHIRLWIND
	db 10, SUNNY_DAY
	db 12, SAFEGUARD
	db 19, SWIFT
	db 25, RECOVER
	db 29, DOUBLE_EDGE ; becomes Brave Bird
	db 34, DARK_PULSE ; becomes Extrasensory
	db 38, FLY
	db 44, SACRED_FIRE
	db 49, ANCIENTPOWER
	db 54, FUTURE_SIGHT
	db 58, GROWTH ; becomes Calm Mind
	db 60, SKY_ATTACK
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEECH_SEED
	db 1, CONFUSION
	db 5, HEAL_BELL
	db 10, SAFEGUARD
	db 13, DOUBLESLAP
	db 15, DOUBLE_TEAM
	db 16, SIGNAL_BEAM
	db 19, MAGICAL_LEAF
	db 22, RECOVER
	db 28, ANCIENTPOWER
	db 33, FUTURE_SIGHT
	db 40, BATON_PASS
	db 45, LEAF_STORM
	db 51, GROWTH ; becomes Calm Mind
	db 58, SHADOW_BALL ; becomes Energy Ball
	db 0 ; no more level-up moves
