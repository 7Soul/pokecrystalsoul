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
	db 46, SOLARBEAM
	db 52, LEAF_STORM
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 15, POISONPOWDER
	db 15, SLEEP_POWDER
	db 22, RAZOR_LEAF
	db 28, LEAF_SHIELD
	db 31, GROWTH
	db 36, DOUBLE_EDGE
	db 43, SYNTHESIS
	db 50, SOLARBEAM
	db 54, LEAF_STORM
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	db 0 ; no more evolutions
	db 15, POISONPOWDER
	db 15, SLEEP_POWDER
	db 22, RAZOR_LEAF
	db 28, LEAF_SHIELD
	db 31, PETAL_DANCE
	db 35, GROWTH
	db 40, DOUBLE_EDGE
	db 47, SYNTHESIS
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
	db 22, RAGE
	db 27, SCARY_FACE
	db 29, FIRE_SPIN
	db 34, SLASH
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
	db 22, RAPID_SPIN
	db 26, PROTECT
	db 31, AQUA_TAIL
	db 37, SKULL_BASH
	db 40, RAIN_DANCE
	db 45, VITAL_THROW
	db 50, HYDRO_PUMP
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
	db 28, PROTECT
	db 32, AQUA_TAIL
	db 40, SKULL_BASH
	db 43, RAIN_DANCE
	db 49, VITAL_THROW
	db 56, HYDRO_PUMP
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	db 0 ; no more evolutions
	db 19, BITE
	db 21, RAPID_SPIN
	db 28, PROTECT
	db 32, AQUA_TAIL
	db 43, SKULL_BASH
	db 46, RAIN_DANCE
	db 54, VITAL_THROW
	db 60, HYDRO_PUMP
	db 0 ; no more level-up moves

CaterpieEvosAttacks:
	db EVOLVE_LEVEL, 7, METAPOD
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, STRING_SHOT
	db 5, PIN_MISSILE
	db 10, LEECH_LIFE
	db 14, NASTY_PLOT
	db 19, PURSUIT
	db 22, TWINEEDLE
	db 32, BULK_UP
	db 41, FELL_STINGER
	db 50, MEGAHORN
	db 0 ; no more level-up moves

MetapodEvosAttacks:
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0 ; no more evolutions
	db 1, HARDEN
	db 5, PIN_MISSILE
	db 6, HARDEN
	db 9, LEECH_LIFE
	db 14, NASTY_PLOT
	db 20, PURSUIT
	db 23, TWINEEDLE
	db 33, MOONLIGHT
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
	db 32, CHARM
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
	db 34, CHARM
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
	db 35, PIN_MISSILE
	db 41, AGILITY
	db 44, FELL_STINGER
	db 51, SKY_ATTACK
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, SAND_ATTACK
	db 5, GUST
	db 11, QUICK_ATTACK
	db 15, WING_ATTACK
	db 18, WHIRLWIND
	db 23, AGILITY
	db 26, AIR_SLASH
	db 33, SWORDS_DANCE
	db 46, MIRROR_MOVE
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	db EVOLVE_LEVEL, 36, PIDGEOT
	db 0 ; no more evolutions
	db 1, GUST
	db 5, SAND_ATTACK
	db 9, GUST
	db 15, QUICK_ATTACK
	db 23, WHIRLWIND
	db 33, WING_ATTACK
	db 43, AGILITY
	db 55, MIRROR_MOVE
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	db 9, GUST
	db 15, QUICK_ATTACK
	db 23, WHIRLWIND
	db 33, WING_ATTACK
	db 46, AGILITY
	db 61, MIRROR_MOVE
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
	db 30, CRUNCH
	db 34, FOCUS_ENERGY
	db 40, SUPER_FANG
	db 47, DOUBLE_EDGE
	db 51, REVERSAL
	db 0 ; no more level-up moves

SpearowEvosAttacks:
	db EVOLVE_LEVEL, 20, FEAROW
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 4, LEER
	db 8, PURSUIT
	db 11, FURY_ATTACK
	db 25, PURSUIT
	db 31, MIRROR_MOVE
	db 32, RECOVER
	db 37, DRILL_PECK
	db 43, AGILITY
	db 0 ; no more level-up moves

FearowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 1, LEER
	db 1, FURY_ATTACK
	db 13, FURY_ATTACK
	db 26, PURSUIT
	db 32, MIRROR_MOVE
	db 40, DRILL_PECK
	db 47, AGILITY
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
	db 28, VENOSHOCK
	db 36, MUD_BOMB	
	db 41, HAZE
	db 44, ACID_ARMOR
	db 49, GUNK_SHOT
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	db 12, GLARE	
	db 17, SCREECH
	db 20, ACID
	db 21, CRUNCH
	db 31, VENOSHOCK
	db 39, MUD_BOMB	
	db 43, HAZE
	db 49, ACID_ARMOR
	db 52, GUNK_SHOT
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
	db 26, THUNDERBOLT
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
	db 1, SAND_ATTACK
	db 5, POISON_STING
	db 13, RAPID_SPIN
	db 16, ROLLOUT
	db 20, SWIFT
	db 23, SLASH
	db 30, DIG
	db 34, SHARPEN
	db 37, FURY_ATTACK
	db 45, SANDSTORM
	db 52, EARTHQUAKE
	db 0 ; no more level-up moves

SandslashEvosAttacks:
	db 0 ; no more evolutions
	db 5, POISON_STING
	db 13, RAPID_SPIN
	db 16, ROLLOUT
	db 20, SWIFT
	db 26, SLASH
	db 33, DIG
	db 37, SHARPEN
	db 40, FURY_ATTACK
	db 48, SANDSTORM
	db 55, EARTHQUAKE
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, TACKLE
	db 8, SCRATCH
	db 12, DOUBLE_KICK
	db 17, POISON_STING
	db 23, TAIL_WHIP
	db 30, BITE
	db 38, FURY_ATTACK
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, TACKLE
	db 8, SCRATCH
	db 12, DOUBLE_KICK
	db 19, POISON_STING
	db 27, TAIL_WHIP
	db 36, BITE
	db 46, FURY_ATTACK
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCRATCH
	db 1, DOUBLE_KICK
	db 1, TAIL_WHIP
	db 23, BODY_SLAM
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	db 1, LEER
	db 1, TACKLE
	db 8, HORN_ATTACK
	db 12, DOUBLE_KICK
	db 17, POISON_STING
	db 23, FOCUS_ENERGY
	db 30, FURY_ATTACK
	db 38, HORN_DRILL
	db 28, BRICK_BREAK
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	db 1, LEER
	db 1, TACKLE
	db 8, HORN_ATTACK
	db 12, DOUBLE_KICK
	db 19, POISON_STING
	db 27, FOCUS_ENERGY
	db 36, FURY_ATTACK
	db 46, HORN_DRILL
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HORN_ATTACK
	db 1, DOUBLE_KICK
	db 1, POISON_STING
	db 23, THRASH
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
	db 26, DEFENSE_CURL
	db 29, METRONOME
	db 37, FIRE_FLICK
	db 41, MOONLIGHT
	db 53, LIGHT_SCREEN
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	db 1, SING
	db 1, DOUBLESLAP
	db 1, METRONOME
	db 1, MOONLIGHT
	db 42, FIRE_FLICK
	db 49, MOONLIGHT
	db 55, LIGHT_SCREEN
	db 59, BODY_SLAM
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, NINETALES
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, TAIL_WHIP
	db 1, QUICK_ATTACK
	db 7, ROAR
	db 12, CONFUSE_RAY
	db 15, FIRE_SPIN
	db 20, WILL_O_WISP
	db 25, SAFEGUARD
	db 31, FLAMETHROWER
	db 40, FIRE_BLAST
	db 50, INFERNO
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, QUICK_ATTACK
	db 1, CONFUSE_RAY
	db 1, SAFEGUARD	
	db 24, WILL_O_WISP
	db 29, SAFEGUARD
	db 35, FLAMETHROWER
	db 44, FIRE_BLAST
	db 53, INFERNO
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	db 0 ; no more evolutions
	db 1, SING
	db 4, DEFENSE_CURL
	db 9, POUND
	db 14, DISABLE
	db 19, ROLLOUT
	db 24, DOUBLESLAP
	db 29, REST
	db 34, BODY_SLAM
	db 39, DOUBLE_EDGE
	db 43, FIRE_FLICK
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db 0 ; no more evolutions
	db 1, SING
	db 1, DISABLE
	db 1, DEFENSE_CURL
	db 1, DOUBLESLAP
	db 37, BODY_SLAM
	db 41, DOUBLE_EDGE
	db 46, FIRE_FLICK
	db 50, SKULL_BASH	
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	db 1, LEECH_LIFE
	db 1, SCREECH
	db 6, SUPERSONIC
	db 12, BITE
	db 19, CONFUSE_RAY
	db 23, SWIFT
	db 27, WING_ATTACK	
	db 35, MEAN_LOOK
	db 37, VENOSHOCK
	db 41, CRUNCH
	db 45, HAZE
	db 49, AIR_SLASH
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	db 0 ; no more evolutions	
	db 1, LEECH_LIFE
	db 6, SUPERSONIC
	db 12, BITE
	db 19, CONFUSE_RAY
	db 24, SWIFT
	db 29, WING_ATTACK	
	db 37, MEAN_LOOK
	db 40, VENOSHOCK
	db 45, CRUNCH
	db 49, HAZE
	db 53, AIR_SLASH
	db 0 ; no more level-up moves

OddishEvosAttacks:
	db EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWTH
	db 1, LEAF_SHIELD
	db 9, ACID
	db 13, POISONPOWDER
	db 14, STUN_SPORE
	db 15, SLEEP_POWDER
	db 19, MEGA_DRAIN
	db 23, ACID
	db 28, MOONLIGHT
	db 31, HEADBUTT
	db 35, TOXIC
	db 39, PETAL_DANCE
	db 43, LEAF_STORM
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
	db 29, MOONLIGHT
	db 32, HEADBUTT
	db 36, TOXIC
	db 41, PETAL_DANCE
	db 46, LEAF_STORM
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	db 28, ACID
	db 32, MOONLIGHT
	db 35, HEADBUTT
	db 40, TOXIC
	db 45, PETAL_DANCE
	db 51, LEAF_STORM
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
	db 1, FORESIGHT
	db 9, SUPERSONIC
	db 13, POISONPOWDER
	db 17, NIGHT_SHADE
	db 22, LEECH_LIFE
	db 25, STUN_SPORE
	db 26, SLEEP_POWDER
	db 31, SHADOW_BALL
	db 37, ZEN_HEADBUTT
	db 43, PSYCHIC_M
	db 55, BUG_BUZZ
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	db 1, FORESIGHT
	db 9, SUPERSONIC
	db 13, POISONPOWDER
	db 17, NIGHT_SHADE
	db 25, LEECH_LIFE
	db 26, GUST
	db 28, STUN_SPORE
	db 29, SLEEP_POWDER
	db 36, SHADOW_BALL
	db 41, ZEN_HEADBUTT
	db 47, PSYCHIC_M
	db 59, BUG_BUZZ
	db 0 ; no more level-up moves

DiglettEvosAttacks:
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, SAND_ATTACK
	db 4, GROWL
	db 13, MAGNITUDE
	db 17, DIG
	db 25, MUD_BOMB
	db 31, POWER_GEM
	db 35, SLASH
	db 40, EARTHQUAKE
	db 44, FISSURE
	db 0 ; no more level-up moves

DugtrioEvosAttacks:
	db 0 ; no more evolutions
	db 4, GROWL
	db 13, MAGNITUDE
	db 17, DIG
	db 25, TRI_ATTACK
	db 27, STAMPEDE
	db 35, POWER_GEM
	db 40, SLASH
	db 44, EARTHQUAKE
	db 51, FISSURE
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 11, BITE
	db 20, PAY_DAY
	db 28, FAINT_ATTACK
	db 33, SLASH
	db 35, SCREECH
	db 38, NASTY_PLOT
	db 41, FURY_ATTACK
	db 45, SWIFT
	db 49, TAKE_DOWN
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 11, BITE
	db 20, PAY_DAY
	db 27, POWER_GEM
	db 29, FAINT_ATTACK
	db 34, SLASH
	db 38, SCREECH
	db 41, NASTY_PLOT
	db 46, FURY_ATTACK
	db 48, SWIFT
	db 52, TAKE_DOWN
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	db EVOLVE_LEVEL, 33, GOLDUCK
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 5, TAIL_WHIP
	db 7, WATER_GUN
	db 10, CONFUSION
	db 13, FURY_ATTACK	
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
	db 19, DISABLE
	db 22, SCREECH
	db 25, ZEN_HEADBUTT
	db 30, AQUA_TAIL
	db 33, PSYCH_UP
	db 40, AMNESIA
	db 43, HYDRO_PUMP
	db 47, PSYBEAM
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
	db 44, SCREECH
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
	db 47, SCREECH
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
	db 21, AGILITY
	db 25, INFERNO
	db 28, CRUNCH
	db 31, THRASH
	db 38, FLAMETHROWER
	db 45, BODY_SLAM
	db 49, SACRED_FIRE
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 24, AGILITY
	db 28, INFERNO
	db 32, CRUNCH
	db 36, THRASH
	db 44, FLAMETHROWER
	db 52, BODY_SLAM
	db 57, SACRED_FIRE
	db 62, EXTREMESPEED
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 7, HYPNOSIS
	db 13, WATER_GUN
	db 19, DOUBLESLAP
	db 25, RAIN_DANCE
	db 31, BODY_SLAM
	db 37, BELLY_DRUM
	db 43, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, POLIWRATH
	db EVOLVE_ITEM, SUN_STONE, POLITOED
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 7, HYPNOSIS
	db 13, WATER_GUN
	db 19, DOUBLESLAP
	db 27, RAIN_DANCE
	db 35, BODY_SLAM		
	db 43, BELLY_DRUM
	db 51, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, HYPNOSIS
	db 1, DOUBLESLAP
	db 24, SUBMISSION
	db 31, RAIN_DANCE
	db 39, BODY_SLAM
	db 42, BULK_UP
	db 47, BELLY_DRUM
	db 51, LOCK_ON
	db 56, HYDRO_PUMP
	db 0 ; no more level-up moves

AbraEvosAttacks:
	db EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	db EVOLVE_LEVEL, 32, ALAKAZAM
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 15, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 26, RECOVER
	db 31, FUTURE_SIGHT
	db 38, PSYCHIC_M
	db 45, REFLECT
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 1, KINESIS
	db 1, CONFUSION
	db 16, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 26, RECOVER
	db 31, FUTURE_SIGHT
	db 38, PSYCHIC_M
	db 45, REFLECT
	db 0 ; no more level-up moves

MachopEvosAttacks:
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, LEER
	db 5, KARATE_CHOP
	db 7, FOCUS_ENERGY	
	db 15, SEISMIC_TOSS
	db 21, FORESIGHT
	db 25, VITAL_THROW
	db 33, SUBMISSION
	db 37, BULK_UP
	db 39, CROSS_CHOP
	db 43, SCARY_FACE	
	db 45, DYNAMICPUNCH
	db 55, CLOSE_COMBAT
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	db EVOLVE_LEVEL, 42, MACHAMP
	db 0 ; no more evolutions
	db 7, FOCUS_ENERGY	
	db 15, SEISMIC_TOSS
	db 21, FORESIGHT
	db 26, VITAL_THROW
	db 36, SUBMISSION
	db 39, BULK_UP
	db 41, CROSS_CHOP
	db 47, SCARY_FACE	
	db 51, DYNAMICPUNCH
	db 58, CLOSE_COMBAT
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	db 21, FORESIGHT
	db 25, VITAL_THROW
	db 33, SUBMISSION
	db 41, STRENGTH
	db 43, BULK_UP
	db 47, CROSS_CHOP
	db 53, SCARY_FACE	
	db 57, DYNAMICPUNCH
	db 62, CLOSE_COMBAT
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 6, GROWTH
	db 11, WRAP
	db 15, SLEEP_POWDER
	db 17, POISONPOWDER
	db 19, STUN_SPORE
	db 23, ACID
	db 34, ACID_ARMOR
	db 37, RAZOR_LEAF
	db 45, SLAM
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 1, GROWTH
	db 1, WRAP
	db 6, GROWTH
	db 11, WRAP
	db 15, SLEEP_POWDER
	db 17, POISONPOWDER
	db 19, STUN_SPORE
	db 24, ACID
	db 38, ACID_ARMOR
	db 42, RAZOR_LEAF
	db 46, LEAF_STORM
	db 54, SLAM
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 1, GROWTH
	db 1, WRAP
	db 6, GROWTH
	db 11, WRAP
	db 20, SLEEP_POWDER
	db 21, POISONPOWDER
	db 22, STUN_SPORE
	db 27, ACID
	db 41, ACID_ARMOR
	db 44, RAZOR_LEAF
	db 47, LEAF_STORM
	db 57, SLAM
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, CONSTRICT
	db 6, SUPERSONIC
	db 10, ACID
	db 12, CONSTRICT
	db 18, WRAP
	db 22, OCTAZOOKA
	db 25, BUBBLEBEAM
	db 28, BARRIER
	db 31, VENOSHOCK
	db 37, SCREECH
	db 43, SLUDGE
	db 46, HYDRO_PUMP
	db 55, MINIMIZE
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, SUPERSONIC
	db 1, CONSTRICT
	db 6, SUPERSONIC
	db 10, ACID
	db 12, CONSTRICT
	db 18, WRAP
	db 22, OCTAZOOKA
	db 25, BUBBLEBEAM
	db 28, BARRIER
	db 32, VENOSHOCK
	db 39, SCREECH
	db 46, SLUDGE
	db 52, HYDRO_PUMP
	db 56, MINIMIZE
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
	db 29, ROCK_BLAST
	db 34, EARTHQUAKE
	db 41, EXPLOSION
	db 40, DOUBLE_EDGE
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	db EVOLVE_LEVEL, 37, GOLEM
	db 0 ; no more evolutions
	db 5, ROLLOUT
	db 11, ROCK_THROW
	db 16, MAGNITUDE
	db 24, SELFDESTRUCT
	db 27, HARDEN
	db 31, ROCK_BLAST
	db 36, EARTHQUAKE
	db 44, EXPLOSION
	db 45, DOUBLE_EDGE
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db 0 ; no more evolutions
	db 24, SELFDESTRUCT
	db 27, HARDEN
	db 31, ROCK_BLAST
	db 36, EARTHQUAKE
	db 46, EXPLOSION
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	db EVOLVE_LEVEL, 40, RAPIDASH
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
	db 43, AGILITY
	db 53, FIRE_BLAST
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, TAIL_WHIP
	db 1, EMBER
	db 4, TAIL_WHIP	
	db 9, EMBER	
	db 13, FLAME_WHEEL
	db 17, STOMP
	db 25, FIRE_SPIN
	db 29, TAKE_DOWN
	db 33, INFERNO
	db 39, STAMPEDE
	db 43, AGILITY
	db 53, FIRE_BLAST
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, SLOWKING
	db EVOLVE_LEVEL, 37, SLOWBRO
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 6, GROWL
	db 15, WATER_GUN
	db 20, CONFUSION
	db 29, DISABLE
	db 34, HEADBUTT
	db 43, AMNESIA
	db 48, PSYCHIC_M
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 1, GROWL
	db 1, WATER_GUN
	db 6, GROWL
	db 15, WATER_GUN
	db 20, CONFUSION
	db 29, DISABLE
	db 34, HEADBUTT
	db 36, HARDEN
	db 46, AMNESIA
	db 54, PSYCHIC_M
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 6, THUNDERSHOCK
	db 11, SUPERSONIC
	db 16, SONICBOOM
	db 20, THUNDER_WAVE
	db 23, CHARGE_BEAM
	db 27, LOCK_ON
	db 33, SWIFT
	db 39, SCREECH
	db 45, ZAP_CANNON
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	db 0 ; no more evolutions
	db 20, THUNDER_WAVE
	db 23, CHARGE_BEAM
	db 27, LOCK_ON
	db 29, TRI_ATTACK
	db 43, SCREECH
	db 53, ZAP_CANNON
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, POISON_STING
	db 7, SAND_ATTACK
	db 13, LEER
	db 19, FURY_ATTACK
	db 25, SWORDS_DANCE
	db 31, AGILITY
	db 37, SLASH
	db 44, FALSE_SWIPE
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	db EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 5, QUICK_ATTACK
	db 8, RAGE
	db 12, FURY_ATTACK
	db 15, PURSUIT
	db 25, AGILITY
	db 36, SWORDS_DANCE
	db 40, JUMP_KICK
	db 43, DRILL_PECK
	db 50, THRASH
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	db 12, FURY_ATTACK
	db 15, PURSUIT
	db 25, AGILITY
	db 30, TRI_ATTACK
	db 38, SWORDS_DANCE
	db 43, JUMP_KICK
	db 47, DRILL_PECK
	db 52, STAMPEDE
	db 56, THRASH
	db 0 ; no more level-up moves

SeelEvosAttacks:
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 5, GROWL
	db 11, ICY_WIND
	db 13, ENCORE
	db 18, AURORA_BEAM
	db 21, REST
	db 32, TAKE_DOWN
	db 37, ICE_BEAM
	db 43, AQUA_TAIL
	db 48, SAFEGUARD
	db 53, BLIZZARD
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	db 0 ; no more evolutions
	db 18, AURORA_BEAM
	db 21, REST
	db 32, TAKE_DOWN
	db 33, FISSURE
	db 38, ICE_BEAM
	db 49, AQUA_TAIL
	db 52, SAFEGUARD
	db 58, BLIZZARD
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
	db 1, WATER_GUN
	db 3, HARDEN
	db 9, POWDER_SNOW
	db 14, SUPERSONIC
	db 18, JET_STREAM
	db 22, CLAMP
	db 27, AURORA_BEAM
	db 31, PROTECT
	db 36, ICE_BEAM
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	db 1, POWDER_SNOW
	db 20, JET_STREAM
	db 24, CLAMP
	db 30, AURORA_BEAM
	db 35, PROTECT
	db 41, ICE_BEAM
	db 48, SPIKES
	db 53, HYDRO_PUMP
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 8, SPITE
	db 13, MEAN_LOOK
	db 16, CURSE
	db 21, NIGHT_SHADE
	db 28, CONFUSE_RAY
	db 33, DREAM_EATER
	db 39, NIGHTMARE
	db 45, DESTINY_BOND
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	db EVOLVE_LEVEL, 37, GENGAR
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 1, SPITE
	db 8, SPITE
	db 13, MEAN_LOOK
	db 16, CURSE
	db 21, NIGHT_SHADE
	db 31, CONFUSE_RAY
	db 39, DREAM_EATER
	db 42, NIGHTMARE
	db 48, DESTINY_BOND
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 1, SPITE
	db 8, SPITE
	db 13, MEAN_LOOK
	db 16, CURSE
	db 21, NIGHT_SHADE
	db 31, CONFUSE_RAY
	db 40, DREAM_EATER
	db 45, NIGHTMARE
	db 50, DESTINY_BOND
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
	db 28, RAGE
	db 33, STAMPEDE
	db 36, SANDSTORM
	db 40, SLAM
	db 52, EARTHQUAKE
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	db EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	db 1, POUND
	db 1, HYPNOSIS
	db 5, DISABLE
	db 9, CONFUSION
	db 13, HEADBUTT
	db 17, POISON_GAS
	db 21, MEDITATE
	db 25, PSYBEAM
	db 33, PSYCH_UP
	db 41, ZEN_HEADBUTT
	db 45, SWAGGER
	db 49, PSYCHIC_M
	db 53, NASTY_PLOT
	db 61, FUTURE_SIGHT	
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, HYPNOSIS
	db 5, DISABLE
	db 9, CONFUSION
	db 13, HEADBUTT
	db 17, POISON_GAS
	db 21, MEDITATE
	db 25, PSYBEAM
	db 33, PSYCH_UP
	db 41, ZEN_HEADBUTT
	db 45, SWAGGER
	db 49, PSYCHIC_M
	db 53, NASTY_PLOT
	db 61, FUTURE_SIGHT	
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	db EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 5, LEER
	db 10, VICEGRIP
	db 14, HARDEN
	db 16, BUBBLEBEAM
	db 22, DIG
	db 26, STOMP
	db 30, PROTECT
	db 34, SLAM
	db 37, CRABHAMMER
	db 42, GUILLOTINE
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	db 0 ; no more evolutions
	db 14, HARDEN
	db 16, BUBBLEBEAM
	db 22, DIG
	db 26, STOMP
	db 32, PROTECT
	db 37, SLAM
	db 41, CRABHAMMER
	db 48, GUILLOTINE
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	db 1, SONICBOOM
	db 8, EERIEIMPULSE
	db 10, SPARK
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
	db 46, SOLARBEAM
	db 52, PSYBEAM
	db 59, SYNTHESIS
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, LEER
	db 1, BONE_CLUB
	db 11, HEADBUTT
	db 17, FOCUS_ENERGY
	db 22, LEAF_SHIELD
	db 25, BONEMERANG
	db 29, RAGE
	db 33, FALSE_SWIPE
	db 37, THRASH
	db 43, DOUBLE_EDGE
	db 48, EARTHQUAKE
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, LEER
	db 1, BONE_CLUB
	db 11, HEADBUTT
	db 17, FOCUS_ENERGY
	db 22, LEAF_SHIELD
	db 25, BONEMERANG
	db 32, RAGE
	db 36, FALSE_SWIPE
	db 42, THRASH
	db 49, DOUBLE_EDGE
	db 55, EARTHQUAKE
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_KICK
	db 6, MEDITATE
	db 11, ROLLING_KICK
	db 14, JUMP_KICK
	db 17, BRICK_BREAK
	db 21, FOCUS_ENERGY
	db 24, BULK_UP
	db 31, LOCK_ON
	db 36, FORESIGHT
	db 41, ENDURE
	db 46, MEGA_KICK
	db 51, REVERSAL
	db 57, CLOSE_COMBAT
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	db 1, COMET_PUNCH
	db 7, AGILITY
	db 13, PURSUIT
	db 22, BULK_UP
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
	db 13, DEFENSE_CURL
	db 19, STOMP
	db 25, WRAP
	db 31, DISABLE
	db 37, SLAM
	db 43, BODY_SLAM
	db 44, SCREECH
	db 53, DOUBLE_EDGE
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	db 1, MUD_BOMB
	db 1, TACKLE
	db 1, EMBER
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
	db 35, HAZE
	db 37, ROLLOUT
	db 43, EXPLOSION
	db 48, SUNNY_DAY
	db 54, FIRE_FLICK
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	db EVOLVE_LEVEL, 42, RHYDON
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, TAIL_WHIP
	db 12, ROCK_TOMB
	db 19, FURY_ATTACK
	db 24, ROCK_BLAST
	db 28, BRICK_BREAK
	db 31, SCARY_FACE
	db 34, STAMPEDE
	db 38, HORN_DRILL
	db 43, TAKE_DOWN
	db 45, SANDSTORM
	db 51, EARTHQUAKE
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	db 0 ; no more evolutions
	db 28, BRICK_BREAK
	db 31, SCARY_FACE
	db 34, STAMPEDE
	db 38, HORN_DRILL
	db 45, TAKE_DOWN
	db 49, SANDSTORM
	db 55, EARTHQUAKE
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
	db 0 ; no more evolutions
	db 1, POUND
	db 4, DEFENSE_CURL
	db 5, GROWL
	db 9, TAIL_WHIP
	db 12, DOUBLESLAP
	db 16, MILK_DRINK
	db 20, MINIMIZE
	db 25, TAKE_DOWN
	db 30, SING
	db 35, EGG_BOMB
	db 40, LIGHT_SCREEN
	db 45, DOUBLE_EDGE
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 4, SLEEP_POWDER
	db 10, ABSORB
	db 13, POISONPOWDER
	db 19, VINE_WHIP
	db 25, WRAP
	db 31, MEGA_DRAIN
	db 34, STUN_SPORE
	db 40, SLAM
	db 46, GROWTH
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	db 1, COMET_PUNCH
	db 7, LEER
	db 13, BITE
	db 19, DOUBLESLAP
	db 25, MEGA_PUNCH
	db 31, RAGE
	db 34, DIZZY_PUNCH
	db 37, CRUNCH
	db 43, ENDURE	
	db 46, THRASH
	db 50, REVERSAL
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	db EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 6, SMOKESCREEN
	db 9, WATER_GUN
	db 15, LEER
	db 18, BUBBLEBEAM
	db 21, OCTAZOOKA
	db 26, FOCUS_ENERGY
	db 29, TWISTER
	db 33, AGILITY
	db 43, HYDRO_PUMP
	db 48, EXTREMESPEED
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, KINGDRA
	db 0 ; no more evolutions
	db 1, LEER
	db 1, BUBBLEBEAM
	db 1, OCTAZOOKA
	db 1, FOCUS_ENERGY
	db 32, TWISTER
	db 39, AGILITY
	db 46, HYDRO_PUMP
	db 55, SPARK
	db 59, EXTREMESPEED
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	db EVOLVE_LEVEL, 33, SEAKING
	db 0 ; no more evolutions
	db 1, PECK
	db 1, TAIL_WHIP
	db 10, SUPERSONIC
	db 15, HORN_ATTACK
	db 24, REVERSAL
	db 29, FURY_ATTACK	
	db 33, AQUA_TAIL
	db 38, TWISTER
	db 43, HORN_DRILL
	db 52, AGILITY
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, TAIL_WHIP
	db 1, TAIL_WHIP
	db 10, SUPERSONIC
	db 15, HORN_ATTACK
	db 24, REVERSAL
	db 29, FURY_ATTACK
	db 33, AQUA_TAIL
	db 41, TWISTER
	db 49, HORN_DRILL
	db 54, MEGAHORN
	db 61, AGILITY
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 7, WATER_GUN
	db 13, RAPID_SPIN
	db 19, RECOVER
	db 25, SWIFT
	db 31, BUBBLEBEAM
	db 37, MINIMIZE
	db 43, LIGHT_SCREEN
	db 46, POWER_GEM
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 10, WATER_GUN
	db 17, RAPID_SPIN
	db 23, RECOVER
	db 29, SWIFT
	db 35, BUBBLEBEAM
	db 41, MINIMIZE
	db 47, LIGHT_SCREEN
	db 50, POWER_GEM
	db 54, HYDRO_PUMP
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRIER
	db 1, POUND
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
	db EVOLVE_LEVEL, 26, SCIZOR
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
	db 1, POUND
	db 1, LICK
	db 1, POWDER_SNOW
	db 13, POWDER_SNOW
	db 21, DOUBLESLAP
	db 25, ICE_PUNCH
	db 35, MEAN_LOOK
	db 41, BODY_SLAM
	db 51, PERISH_SONG
	db 57, BLIZZARD
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 1, THUNDERSHOCK
	db 8, LOW_KICK
	db 12, SWIFT
	db 15, THUNDER_WAVE
	db 20, CHARGE_BEAM
	db 26, LIGHT_SCREEN
	db 29, THUNDERPUNCH
	db 42, SCREECH
	db 49, THUNDERBOLT
	db 55, THUNDER
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, LEER
	db 1, SMOG
	db 7, LEER
	db 13, SMOG
	db 15, FIRE_SPIN
	db 19, FIRE_PUNCH
	db 25, SMOKESCREEN
	db 46, MAGMA_STORM
	db 42, SUNNY_DAY
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
	db 22, DOUBLESLAP
	db 26, BRICK_BREAK
	db 29, X_SCISSOR	
	db 33, SUBMISSION
	db 40, SWORDS_DANCE
	db 43, THRASH
	db 50, GUILLOTINE
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
	db 15, TACKLE
	db 30, REVERSAL
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
	db 54, FROZEN_TAIL
	db 59, RAIN_DANCE
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, GROWL
	db 1, SING
	db 8, MIST
	db 15, BODY_SLAM
	db 22, CONFUSE_RAY
	db 29, PERISH_SONG
	db 36, ICE_BEAM
	db 43, RAIN_DANCE
	db 50, SAFEGUARD
	db 57, HYDRO_PUMP
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
	db 1, WATER_GUN
	db 13, QUICK_ATTACK
	db 18, JET_STREAM
	db 21, AURORA_BEAM
	db 30, BITE
	db 42, HAZE
	db 47, ACID_ARMOR
	db 54, HYDRO_PUMP
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, SAND_ATTACK
	db 1, THUNDERSHOCK
	db 13, QUICK_ATTACK
	db 19, SHARPEN
	db 23, QUICK_ATTACK
	db 30, DOUBLE_KICK
	db 36, PIN_MISSILE
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
	db 29, CHARGE_BEAM
	db 34, LOCK_ON
	db 40, TRI_ATTACK
	db 45, KINESIS
	db 50, ZAP_CANNON
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	db EVOLVE_LEVEL, 40, OMASTAR
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, HARDEN
	db 1, BITE
	db 11, BITE
	db 13, ROLLOUT
	db 16, WATER_GUN
	db 28, LEER
	db 31, PROTECT
	db 34, ANCIENTPOWER
	db 46, ROCK_BLAST
	db 52, HYDRO_PUMP
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, HARDEN
	db 1, BITE
	db 13, BITE
	db 16, ROLLOUT
	db 19, WATER_GUN
	db 31, LEER
	db 34, PROTECT
	db 37, ANCIENTPOWER
	db 39, SPIKE_CANNON	
	db 52, ROCK_BLAST
	db 58, HYDRO_PUMP
	db 0 ; no more level-up moves

KabutoEvosAttacks:
	db EVOLVE_LEVEL, 40, KABUTOPS
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, HARDEN
	db 10, ABSORB
	db 19, LEER
	db 24, BUBBLEBEAM
	db 28, SAND_ATTACK
	db 37, ENDURE
	db 40, ANCIENTPOWER
	db 46, MEGA_DRAIN
	db 50, ROCK_SLIDE
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, HARDEN
	db 1, ABSORB
	db 10, ABSORB
	db 19, LEER
	db 24, BUBBLEBEAM
	db 28, SAND_ATTACK	
	db 37, ENDURE
	db 39, SLASH
	db 43, ANCIENTPOWER
	db 51, MEGA_DRAIN
	db 55, ROCK_SLIDE
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 8, AGILITY
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
	db 8, AMNESIA
	db 15, DEFENSE_CURL
	db 22, BELLY_DRUM
	db 29, HEADBUTT
	db 36, SNORE
	db 36, REST
	db 43, BODY_SLAM
	db 50, ROLLOUT
	db 57, HYPER_BEAM
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 1, POWDER_SNOW
	db 13, MIST
	db 25, AGILITY
	db 37, LOCK_ON
	db 49, ICE_BEAM
	db 61, REFLECT
	db 65, BLIZZARD
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, THUNDERSHOCK
	db 13, THUNDER_WAVE
	db 25, AGILITY
	db 37, PROTECT
	db 49, DRILL_PECK
	db 61, LIGHT_SCREEN
	db 65, THUNDER
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 1, EMBER
	db 13, FIRE_SPIN
	db 25, AGILITY
	db 37, ENDURE
	db 40, MAGMA_STORM
	db 49, FLAMETHROWER
	db 61, SAFEGUARD
	db 65, SKY_ATTACK
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	db EVOLVE_LEVEL, 25, DRAGONAIR
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 1, BUBBLE
	db 8, THUNDER_WAVE
	db 15, TWISTER	
	db 25, AGILITY
	db 29, SLAM
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
	db 24, AGILITY
	db 29, SLAM
	db 36, AQUA_TAIL
	db 47, SAFEGUARD
	db 52, THRASH
	db 59, HYPER_BEAM
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	db 15, TWISTER
	db 25, AGILITY
	db 31, SLAM
	db 37, AQUA_TAIL
	db 39, WING_ATTACK
	db 47, SAFEGUARD
	db 52, HYDRO_PUMP
	db 55, THRASH
	db 62, HYPER_BEAM
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, DISABLE
	db 11, BARRIER
	db 22, SWIFT
	db 33, PSYCH_UP
	db 44, FUTURE_SIGHT
	db 55, MIST
	db 66, PSYCHIC_M
	db 77, AMNESIA
	db 88, RECOVER
	db 99, SAFEGUARD
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, TRANSFORM
	db 10, MEGA_PUNCH
	db 20, METRONOME
	db 30, PSYCHIC_M
	db 40, BARRIER
	db 50, ANCIENTPOWER
	db 60, NASTY_PLOT
	db 70, BATON_PASS
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
	db EVOLVE_LEVEL, 32, MEGANIUM
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
	db EVOLVE_LEVEL, 16, QUILAVA
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
	db 1, TACKLE
	db 1, LEER
	db 6, SMOKESCREEN
	db 10, EMBER
	db 13, QUICK_ATTACK
	db 20, FLAME_WHEEL
	db 21, POWER_GEM
	db 21, SANDSTORM
	db 21, LEAF_SHIELD
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
	db EVOLVE_LEVEL, 16, CROCONAW
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 6, WATER_GUN
	db 8, RAGE
	db 16, BITE
	db 15, SCARY_FACE
	db 20, FROZEN_CLAW
	db 22, REVERSAL
	db 27, CRUNCH
	db 34, SLASH
	db 36, SCREECH
	db 41, THRASH
	db 43, AQUA_TAIL
	db 48, HAMMER_ARM
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

CroconawEvosAttacks:
	db EVOLVE_LEVEL, 30, FERALIGATR
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, WATER_GUN
	db 8, RAGE
	db 16, BITE
	db 15, SCARY_FACE
	db 21, FROZEN_CLAW
	db 24, REVERSAL
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
	db 21, FROZEN_CLAW
	db 24, REVERSAL
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
	db 1, FORESIGHT
	db 4, DEFENSE_CURL
	db 7, QUICK_ATTACK
	db 12, LEAF_SHIELD
	db 17, FURY_ATTACK
	db 19, CHARM
	db 25, SLAM
	db 33, REST
	db 39, BATON_PASS
	db 41, SWORDS_DANCE
	db 0 ; no more level-up moves

FurretEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, FORESIGHT
	db 4, DEFENSE_CURL
	db 7, QUICK_ATTACK
	db 12, LEAF_SHIELD
	db 14, AGILITY
	db 19, FURY_ATTACK
	db 21, CHARM
	db 27, SLAM
	db 35, REST
	db 41, BATON_PASS
	db 43, SWORDS_DANCE
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	db EVOLVE_LEVEL, 20, NOCTOWL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 6, FORESIGHT
	db 11, PECK
	db 16, HYPNOSIS
	db 22, REFLECT
	db 28, TAKE_DOWN
	db 34, CONFUSION
	db 45, MOONLIGHT
	db 48, DREAM_EATER
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, FORESIGHT
	db 1, PECK
	db 6, FORESIGHT
	db 11, PECK
	db 16, HYPNOSIS
	db 21, FAINT_ATTACK
	db 25, REFLECT
	db 33, TAKE_DOWN
	db 41, CONFUSION
	db 49, MOONLIGHT
	db 57, DREAM_EATER
	db 0 ; no more level-up moves

LedybaEvosAttacks:
	db EVOLVE_LEVEL, 20, LEDIAN
	db 0 ; no more evolutions
	db 1, TACKLE
	db 8, SUPERSONIC
	db 12, LIGHT_SCREEN
	db 12, SAFEGUARD
	db 12, REFLECT
	db 15, MACH_PUNCH
	db 19, SILVER_WIND
	db 22, COMET_PUNCH	
	db 26, BATON_PASS
	db 28, ZOOM_FLIGHT
	db 31, AGILITY
	db 36, SWIFT
	db 42, DOUBLE_EDGE
	db 46, BUG_BUZZ
	db 0 ; no more level-up moves

LedianEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SUPERSONIC
	db 12, LIGHT_SCREEN
	db 12, SAFEGUARD
	db 12, REFLECT
	db 15, MACH_PUNCH
	db 20, SILVER_WIND
	db 25, COMET_PUNCH	
	db 29, BATON_PASS
	db 31, ZOOM_FLIGHT
	db 34, AGILITY
	db 39, SWIFT
	db 45, DOUBLE_EDGE
	db 50, BUG_BUZZ
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
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 1, SCARY_FACE
	db 1, CONSTRICT
	db 6, SCARY_FACE
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
	db 1, LEECH_LIFE
	db 6, SUPERSONIC
	db 12, BITE
	db 19, CONFUSE_RAY
	db 24, SWIFT
	db 29, WING_ATTACK	
	db 37, MEAN_LOOK
	db 40, VENOSHOCK
	db 45, CRUNCH
	db 49, MIRROR_MOVE
	db 53, EXTREMESPEED
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
	db 23, SPARK
	db 31, REVERSAL
	db 39, TAKE_DOWN
	db 42, AQUA_TAIL
	db 45, HYDRO_PUMP
	db 50, THUNDER
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	db 10, EERIEIMPULSE
	db 12, WATER_GUN
	db 17, CONFUSE_RAY
	db 23, SPARK
	db 33, REVERSAL
	db 43, TAKE_DOWN
	db 47, AQUA_TAIL
	db 52, HYDRO_PUMP
	db 58, THUNDER
	db 0 ; no more level-up moves

PichuEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, PIKACHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, CHARM
	db 6, TAIL_WHIP
	db 8, THUNDER_WAVE
	db 11, SWEET_KISS
	db 0 ; no more level-up moves

CleffaEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CLEFAIRY
	db 0 ; no more evolutions
	db 1, POUND
	db 1, CHARM
	db 4, ENCORE
	db 8, SING
	db 13, SWEET_KISS
	db 0 ; no more level-up moves

IgglybuffEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, JIGGLYPUFF
	db 0 ; no more evolutions
	db 1, SING
	db 1, CHARM
	db 4, DEFENSE_CURL
	db 9, POUND
	db 14, SWEET_KISS
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
	db 37, SAFEGUARD
	db 40, DOUBLE_EDGE
	db 46, EGG_BOMB
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CHARM
	db 7, METRONOME
	db 18, SWEET_KISS
	db 21, DOUBLESLAP
	db 25, ENCORE
	db 33, ANCIENTPOWER
	db 37, SAFEGUARD
	db 40, DOUBLE_EDGE	
	db 46, EGG_BOMB
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
	db 45, LIGHT_SCREEN
	db 50, THUNDER
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	db 18, TAKE_DOWN
	db 22, CHARGE_BEAM
	db 25, CONFUSE_RAY
	db 29, THUNDERPUNCH
	db 34, POWER_GEM
	db 42, BARRIER
	db 48, LIGHT_SCREEN
	db 56, THUNDER
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, STUN_SPORE
	db 1, PETAL_DANCE
	db 1, MAGICAL_LEAF
	db 24, GIGA_DRAIN
	db 38, PETAL_DANCE
	db 44, SAFEGUARD
	db 50, SOLARBEAM
	db 55, SUNNY_DAY
	db 61, LEAF_STORM
	db 0 ; no more level-up moves

MarillEvosAttacks:
	db EVOLVE_LEVEL, 18, AZUMARILL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, DEFENSE_CURL
	db 6, TAIL_WHIP
	db 10, WATER_GUN
	db 15, ROLLOUT
	db 21, BUBBLEBEAM
	db 28, DOUBLE_EDGE
	db 36, RAIN_DANCE
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 1, TAIL_WHIP
	db 1, WATER_GUN
	db 3, DEFENSE_CURL
	db 6, TAIL_WHIP
	db 10, WATER_GUN
	db 15, ROLLOUT
	db 25, BUBBLEBEAM
	db 36, DOUBLE_EDGE
	db 48, RAIN_DANCE
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	db 1, SLAM
	db 1, ROCK_THROW
	db 1, MIMIC
	db 10, REVERSAL
	db 19, LOW_KICK
	db 26, ROCK_TOMB
	db 29, DEFENSE_CURL
	db 33, ROCK_SLIDE
	db 37, FAINT_ATTACK
	db 43, DOUBLE_EDGE
	db 46, SLAM
	db 50, HAMMER_ARM
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, HYPNOSIS
	db 1, DOUBLESLAP
	db 1, PERISH_SONG
	db 32, BUBBLEBEAM
	db 35, PERISH_SONG
	db 40, TWISTER
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
	db 19, FURY_ATTACK
	db 27, SWIFT
	db 36, SCREECH
	db 39, NASTY_PLOT
	db 46, AGILITY
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
	db 30, SOLARBEAM
	db 35, SUNNY_DAY	
	db 39, ANCIENTPOWER
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
	db 34, SOLARBEAM
	db 39, SUNNY_DAY	
	db 44, ANCIENTPOWER
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, FORESIGHT
	db 7, QUICK_ATTACK
	db 9, TWINEEDLE
	db 13, DOUBLE_TEAM
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
	db 10, SLAM
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
	db 10, SLAM
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
	db 11, PURSUIT
	db 16, HAZE
	db 20, WING_ATTACK
	db 26, NIGHT_SHADE
	db 31, FAINT_ATTACK
	db 33, WHIRLWIND
	db 41, MEAN_LOOK
	db 44, SWORDS_DANCE
	db 50, SLAM
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 6, GROWL
	db 9, WATER_GUN
	db 14, CONFUSION
	db 23, HEADBUTT
	db 29, DISABLE
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
	db 1, COUNTER
	db 1, MIRROR_COAT
	db 1, SAFEGUARD
	db 1, DESTINY_BOND
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CONFUSION
	db 1, STOMP
	db 7, CONFUSION	
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
	db 29, BIDE
	db 32, ZOOM_FLIGHT
	db 36, EXPLOSION
	db 43, SPIKES
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, PROTECT
	db 1, SELFDESTRUCT
	db 1, LEECH_LIFE
	db 8, SELFDESTRUCT
	db 15, TAKE_DOWN
	db 22, RAPID_SPIN
	db 29, BIDE
	db 32, ZOOM_FLIGHT
	db 39, EXPLOSION
	db 49, SPIKES
	db 59, DOUBLE_EDGE
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
	db 30, SCREECH
	db 33, DIG
	db 38, TAKE_DOWN
	db 46, REVERSAL
	db 52, ROCK_SLIDE
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
	db 54, GUILLOTINE
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
	db 39, FROZEN_TAIL
	db 41, SANDSTORM
	db 44, SLAM
	db 52, CRUNCH
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
	db 1, CHARM
	db 1, BITE
	db 1, LICK
	db 1, HEADBUTT
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
	db 9, HARDEN
	db 10, MINIMIZE
	db 18, WATER_GUN
	db 19, ROLLOUT
	db 25, PIN_MISSILE
	db 29, REVERSAL
	db 33, JET_STREAM
	db 38, TAKE_DOWN
	db 44, AQUA_TAIL
	db 49, VENOSHOCK
	db 54, HYDRO_PUMP
	db 60, FELL_STINGER
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 6, FOCUS_ENERGY
	db 12, PURSUIT
	db 18, FALSE_SWIPE
	db 24, AGILITY
	db 30, FROZEN_CLAW
	db 36, SLASH
	db 38, X_SCISSOR
	db 42, SWORDS_DANCE
	db 48, DOUBLE_TEAM
	db 0 ; no more level-up moves

ShuckleEvosAttacks: ; done
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, HARDEN
	db 4, ROLLOUT
	db 9, WRAP
	db 12, ENCORE
	db 16, SAFEGUARD
	db 23, ROCK_THROW
	db 27, LEAF_SHIELD
	db 30, ROCK_BLAST
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
	db 20, COUNTER
	db 23, STOMP
	db 28, BRICK_BREAK
	db 31, PIN_MISSILE
	db 34, TAKE_DOWN
	db 37, MEGAHORN
	db 43, CLOSE_COMBAT
	db 46, REVERSAL
	db 50, FELL_STINGER
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, LICK
	db 9, QUICK_ATTACK
	db 17, SCREECH
	db 25, FAINT_ATTACK
	db 33, FURY_ATTACK
	db 41, AGILITY
	db 49, SLASH
	db 54, FROZEN_CLAW
	db 60, FELL_STINGER
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	db EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, LICK
	db 8, FURY_ATTACK
	db 15, FAINT_ATTACK
	db 22, LEAF_SHIELD
	db 29, SLASH
	db 36, CHARM
	db 41, REST
	db 43, SNORE
	db 50, THRASH
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, LICK
	db 1, FURY_ATTACK
	db 15, FAINT_ATTACK
	db 22, LEAF_SHIELD
	db 29, SLASH
	db 38, SCARY_FACE
	db 46, REST
	db 47, SNORE
	db 53, THRASH
	db 59, BULK_UP
	db 67, HAMMER_ARM
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	db EVOLVE_LEVEL, 38, MAGCARGO
	db 0 ; no more evolutions
	db 1, SMOG
	db 8, EMBER
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
	db 1, SMOG
	db 1, EMBER
	db 1, ROCK_THROW
	db 8, EMBER
	db 10, ROCK_THROW
	db 13, HARDEN
	db 22, ANCIENTPOWER
	db 29, ROCK_SLIDE
	db 36, AMNESIA
	db 43, BODY_SLAM
	db 45, RECOVER
	db 47, FLAMETHROWER
	db 53, POWER_GEM
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	db EVOLVE_LEVEL, 33, PILOSWINE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 10, POWDER_SNOW
	db 17, ENDURE
	db 21, ICY_WIND
	db 24, POWER_GEM
	db 28, TAKE_DOWN
	db 35, MIST
	db 37, EARTHQUAKE
	db 44, BLIZZARD
	db 48, AMNESIA
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, TACKLE
	db 1, POWDER_SNOW
	db 17, ENDURE
	db 21, ICY_WIND
	db 24, POWER_GEM
	db 28, TAKE_DOWN
	db 33, FURY_ATTACK
	db 37, MIST
	db 41, THRASH
	db 46, EARTHQUAKE
	db 52, BLIZZARD
	db 58, AMNESIA
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 4, BUBBLE
	db 8, RECOVER
	db 10, BUBBLEBEAM
	db 17, ANCIENTPOWER
	db 20, SPIKE_CANNON
	db 29, ACID_ARMOR
	db 31, ROCK_BLAST
	db 35, ENDURE
	db 38, JET_STREAM
	db 43, POWER_GEM
	db 45, MIRROR_COAT
	db 50, REVERSAL
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	db EVOLVE_LEVEL, 25, OCTILLERY
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, CONSTRICT
	db 22, PSYBEAM
	db 22, AURORA_BEAM
	db 22, BUBBLEBEAM
	db 22, FOCUS_ENERGY
	db 35, ICE_BEAM
	db 47, HYDRO_PUMP
	db 51, HYPER_BEAM
	db 0 ; no more level-up moves

OctilleryEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYBEAM
	db 1, AURORA_BEAM
	db 1, BUBBLEBEAM
	db 24, OCTAZOOKA
	db 22, FOCUS_ENERGY
	db 28, PSYBEAM
	db 32, BODY_SLAM
	db 40, ICE_BEAM
	db 52, HYDRO_PUMP
	db 58, HYPER_BEAM
	db 0 ; no more level-up moves

DelibirdEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 1, SAND_ATTACK
	db 1, MIST
	db 10, MIRROR_MOVE
	db 15, POWDER_SNOW
	db 19, AMNESIA
	db 22, ENCORE
	db 28, ICICLE_WING
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
	db 9, SUPERSONIC
	db 14, WING_ATTACK
	db 16, HEADBUTT
	db 19, BUBBLEBEAM
	db 25, TAKE_DOWN
	db 29, JET_STREAM
	db 32, AGILITY
	db 36, SILVER_WIND
	db 41, AIR_SLASH
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, PECK
	db 6, SAND_ATTACK
	db 9, FROZEN_CLAW
	db 12, WING_ATTACK
	db 17, FURY_ATTACK
	db 23, SWIFT
	db 28, SPIKES
	db 31, AGILITY
	db 34, ICICLE_WING
	db 39, SLASH
	db 45, AIR_SLASH
	db 54, FROZEN_TAIL
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	db EVOLVE_LEVEL, 24, HOUNDOOM
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 1, SHARPEN
	db 7, ROAR
	db 13, SMOG
	db 20, BITE
	db 24, SMOKESCREEN
	db 27, FAINT_ATTACK
	db 35, FLAMETHROWER
	db 43, CRUNCH
	db 52, NASTY_PLOT
	db 59, SKULL_BASH
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 7, ROAR
	db 13, SMOG
	db 20, BITE
	db 24, SMOKESCREEN
	db 27, FAINT_ATTACK
	db 35, FLAMETHROWER
	db 43, CRUNCH
	db 52, NASTY_PLOT
	db 59, SKULL_BASH
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	db 1, ANCIENTPOWER
	db 1, OCTAZOOKA
	db 1, LEER
	db 32, TWISTER
	db 39, AGILITY
	db 46, AQUA_TAIL
	db 55, ICE_BEAM
	db 59, FROZEN_TAIL
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	db EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 9, DEFENSE_CURL
	db 10, ROLLOUT
	db 13, STOMP
	db 17, REVERSAL
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
	db 17, REVERSAL
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
	db EVOLVE_STAT, 15, ATK_LT_DEF, HITMONCHAN
	db EVOLVE_STAT, 15, ATK_GT_DEF, HITMONLEE
	db EVOLVE_STAT, 15, ATK_EQ_DEF, HITMONTOP
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

HitmontopEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROLLING_KICK
	db 7, FOCUS_ENERGY
	db 13, PURSUIT
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
	db EVOLVE_LEVEL, 30, JYNX
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LICK
	db 13, POWDER_SNOW
	db 21, CONFUSION
	db 25, SING
	db 33, MEAN_LOOK
	db 37, PSYCHIC_M
	db 45, PERISH_SONG
	db 49, BLIZZARD
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 9, THUNDERPUNCH
	db 17, LIGHT_SCREEN
	db 25, SWIFT
	db 33, SCREECH
	db 41, THUNDERBOLT
	db 49, THUNDER
	db 0 ; no more level-up moves

MagbyEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGMAR
	db 0 ; no more evolutions
	db 1, EMBER
	db 7, LEER
	db 13, SMOG
	db 19, FIRE_PUNCH
	db 25, SMOKESCREEN
	db 31, SUNNY_DAY
	db 37, FLAMETHROWER
	db 43, CONFUSE_RAY
	db 49, FIRE_BLAST
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWL
	db 8, DEFENSE_CURL
	db 13, STOMP
	db 19, MILK_DRINK
	db 26, BIDE
	db 34, ROLLOUT
	db 43, BODY_SLAM
	db 53, HEAL_BELL
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 4, DEFENSE_CURL
	db 5, GROWL
	db 10, TAIL_WHIP
	db 14, DOUBLESLAP
	db 18, MILK_DRINK
	db 23, MINIMIZE
	db 28, TAKE_DOWN
	db 34, SING
	db 39, EGG_BOMB
	db 45, LIGHT_SCREEN
	db 51, DOUBLE_EDGE
	db 0 ; no more level-up moves

RaikouEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 11, THUNDERSHOCK
	db 15, CHARGE_BEAM
	db 21, ROAR
	db 31, QUICK_ATTACK
	db 41, SPARK
	db 51, REFLECT
	db 61, CRUNCH
	db 71, THUNDER
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 11, EMBER
	db 15, ROAR
	db 22, FIRE_SPIN
	db 30, STOMP
	db 36, SWAGGER
	db 42, MAGMA_STORM
	db 48, FLAMETHROWER
	db 59, SWAGGER
	db 64, FIRE_BLAST
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 11, BUBBLEBEAM
	db 21, RAIN_DANCE
	db 31, GUST
	db 41, AURORA_BEAM
	db 51, MIST
	db 61, MIRROR_COAT
	db 71, HYDRO_PUMP
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
	db 41, CRUNCH
	db 46, EARTHQUAKE
	db 55, HYPER_BEAM
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	db EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	db 29, THRASH
	db 34, DARK_PULSE
	db 44, CRUNCH
	db 50, EARTHQUAKE
	db 60, HYPER_BEAM
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions
	db 29, THRASH
	db 34, SCARY_FACE
	db 44, CRUNCH
	db 50, EARTHQUAKE
	db 62, HYPER_BEAM
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	db 1, FLY
	db 11, SAFEGUARD
	db 22, GUST
	db 33, RECOVER
	db 44, HYDRO_PUMP
	db 55, RAIN_DANCE
	db 66, SWIFT
	db 77, WHIRLWIND
	db 88, ANCIENTPOWER
	db 99, FUTURE_SIGHT
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	db 1, SACRED_FIRE
	db 11, SAFEGUARD
	db 22, GUST
	db 29, SUNNY_DAY
	db 33, RECOVER
	db 37, FIRE_BLAST
	db 43, MAGMA_STORM
	db 57, ANCIENTPOWER
	db 66, SWIFT
	db 72, WHIRLWIND
	db 79, FUTURE_SIGHT
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEECH_SEED
	db 1, CONFUSION
	db 1, HEAL_BELL
	db 10, SAFEGUARD
	db 19, MAGICAL_LEAF
	db 22, RECOVER
	db 28, ANCIENTPOWER
	db 33, FUTURE_SIGHT
	db 40, BATON_PASS
	db 56, LEAF_STORM
	db 0 ; no more level-up moves
