INCLUDE "constants.asm"


SECTION "Egg Moves", ROMX

; All instances of Charm, Steel Wing, Sweet Scent, and Lovely Kiss were
; removed from egg move lists in Crystal.
; Sweet Scent and Steel Wing were redundant since they're TMs, and
; Charm and Lovely Kiss were unobtainable.

; Staryu's egg moves were removed in Crystal, because Staryu is genderless
; and can only breed with Ditto.

INCLUDE "data/pokemon/egg_move_pointers.asm"

BulbasaurEggMoves:
	db LIGHT_SCREEN
	db SKULL_BASH
	db SAFEGUARD
	db PETAL_DANCE
	db AMNESIA
	db CHARM
	db MAGICAL_LEAF
	db SLUDGE
	db -1 ; end

CharmanderEggMoves:
	db BELLY_DRUM
	db ANCIENTPOWER
	db ROCK_SLIDE
	db BITE
	db THRASH
	db FIRE_FLICK
	db -1 ; end

SquirtleEggMoves:
	db MIRROR_COAT
	db HAZE
	db MIST
	db CONFUSION
	db JET_STREAM
	db REVERSAL
	db MUD_BOMB
	db -1 ; end

CaterpieEggMoves:
	db FAINT_ATTACK
	db GIGA_DRAIN	
	db -1 ; end

WeedleEggMoves:
	db PURSUIT
	db FAINT_ATTACK
	db AIR_SLASH
	db ICICLE_WING
	db -1 ; end
	
PidgeyEggMoves:
	db PURSUIT
	db FAINT_ATTACK
	db AIR_SLASH
	db ICICLE_WING
	db -1 ; end

RattataEggMoves:
	db SCREECH
	db BITE
	db FLAME_WHEEL
	db FURY_ATTACK
	db MAKESHIFT
	db COUNTER
	db REVERSAL
	db -1 ; end

SpearowEggMoves:
	db FAINT_ATTACK
	db FALSE_SWIPE
	db SCARY_FACE
	db QUICK_ATTACK
	db TRI_ATTACK
	db -1 ; end

EkansEggMoves:
	db PURSUIT
	db SLAM
	db SPITE
	db CRUNCH
	db -1 ; end

SandshrewEggMoves:
	db REVERSAL
	db SAFEGUARD
	db COUNTER
	db RAPID_SPIN
	db FROZEN_CLAW
	db -1 ; end

NidoranFEggMoves:
	db SUPERSONIC
	db DISABLE
	db TAKE_DOWN
	db FOCUS_ENERGY
	db CHARM
	db COUNTER
	db -1 ; end

NidoranMEggMoves:
	db SUPERSONIC
	db DISABLE
	db TAKE_DOWN
	db CONFUSION
	db AMNESIA
	db COUNTER
	db -1 ; end

VulpixEggMoves:
	db FAINT_ATTACK
	db HYPNOSIS
	db REVERSAL
	db SPITE
	db DISABLE
	db -1 ; end

ZubatEggMoves:
	db QUICK_ATTACK
	db PURSUIT
	db FAINT_ATTACK
	db GUST
	db WHIRLWIND
	db -1 ; end

OddishEggMoves:
	db SWORDS_DANCE
	db RAZOR_LEAF
	db REVERSAL
	db SYNTHESIS
	db CHARM
	db -1 ; end

ParasEggMoves:
	db FALSE_SWIPE
	db SCREECH
	db COUNTER
	db PSYBEAM
	db REVERSAL
	db LIGHT_SCREEN
	db PURSUIT
	db -1 ; end

VenonatEggMoves:
	db BATON_PASS
	db SCREECH
	db GIGA_DRAIN
	db -1 ; end

DiglettEggMoves:
	db FAINT_ATTACK
	db SCREECH
	db ANCIENTPOWER
	db PURSUIT
	db -1 ; end

MeowthEggMoves:
	db SPITE
	db CHARM
	db HYPNOSIS
	db AMNESIA
	db -1 ; end

PsyduckEggMoves:
	db ICE_BEAM
	db HYPNOSIS
	db PSYBEAM
	db LIGHT_SCREEN
	db FUTURE_SIGHT
	db PSYCHIC_M
	db CROSS_CHOP
	db -1 ; end

MankeyEggMoves:
	db ROCK_SLIDE
	db MEDITATE
	db COUNTER
	db REVERSAL
	db -1 ; end

GrowlitheEggMoves:
	db BODY_SLAM
	db SAFEGUARD
	db CRUNCH
	db THRASH
	db FIRE_SPIN
	db -1 ; end

PoliwagEggMoves:
	db MIST
	db BUBBLEBEAM
	db HAZE
	db LOCK_ON
	db -1 ; end

AbraEggMoves:
	db LIGHT_SCREEN
	db ENCORE
	db BARRIER
	db -1 ; end

MachopEggMoves:
	db LIGHT_SCREEN
	db MEDITATE
	db ROLLING_KICK
	db ENCORE
	db -1 ; end

BellsproutEggMoves:
	db SWORDS_DANCE
	db ENCORE
	db REFLECT
	db SYNTHESIS
	db LEECH_LIFE
	db -1 ; end

TentacoolEggMoves:
	db AURORA_BEAM
	db MIRROR_COAT
	db RAPID_SPIN
	db HAZE
	db SAFEGUARD
	db -1 ; end

GeodudeEggMoves:
	db MEGA_PUNCH
	db ROCK_SLIDE
	db HAMMER_ARM
	db -1 ; end

PonytaEggMoves:
	db FLAME_WHEEL
	db THRASH
	db DOUBLE_KICK
	db HYPNOSIS
	db CHARM
	db QUICK_ATTACK
	db -1 ; end

MagnemiteEggMoves:
	db WILD_STORM
	db -1 ; end

SlowpokeEggMoves:
	db SAFEGUARD
	db BELLY_DRUM
	db FUTURE_SIGHT
	db STOMP
	db -1 ; end

FarfetchDEggMoves:
	db GUST
	db QUICK_ATTACK
	db ICICLE_WING
	db MIRROR_MOVE
	db REVERSAL
	db -1 ; end

DoduoEggMoves:
	db QUICK_ATTACK
	db SUPERSONIC
	db HAZE
	db FAINT_ATTACK
	db REVERSAL
	db -1 ; end

SeelEggMoves:
	db LICK
	db PERISH_SONG
	db DISABLE
	db PECK
	db SLAM
	db ENCORE
	db -1 ; end

GrimerEggMoves:
	db HAZE
	db MEAN_LOOK
	db LICK
	db -1 ; end

ShellderEggMoves:
	db BUBBLEBEAM
	db TAKE_DOWN
	db BARRIER
	db RAPID_SPIN
	db SCREECH
	db -1 ; end

GastlyEggMoves:
	db PSYWAVE
	db PERISH_SONG
	db HAZE
	db WILL_O_WISP
	db -1 ; end

OnixEggMoves:
	db ROCK_SLIDE
	db REVERSAL
	db -1 ; end

DrowzeeEggMoves:
	db LIGHT_SCREEN
	db BARRIER
	db -1 ; end

KrabbyEggMoves:
	db DIG
	db HAZE
	db AMNESIA
	db REVERSAL
	db SLAM
	db -1 ; end

VoltorbEggMoves:
	db WILD_STORM
	db -1 ; end

ExeggcuteEggMoves:
	db SYNTHESIS
	db MOONLIGHT
	db REFLECT
	db MEGA_DRAIN
	db ANCIENTPOWER
	db -1 ; end

CuboneEggMoves:
	db ROCK_SLIDE
	db ANCIENTPOWER
	db BELLY_DRUM
	db SCREECH
	db SKULL_BASH
	db PERISH_SONG
	db SWORDS_DANCE
	db -1 ; end

LickitungEggMoves:
	db BELLY_DRUM
	db MAGNITUDE
	db BODY_SLAM
	db HAMMER_ARM
	db -1 ; end

KoffingEggMoves:
	db SCREECH
	db PSYWAVE
	db PSYBEAM
	db PAIN_SPLIT
	db -1 ; end

RhyhornEggMoves:
	db CRUNCH
	db REVERSAL
	db ROCK_SLIDE
	db THRASH
	db PURSUIT
	db COUNTER
	db MAGNITUDE
	db -1 ; end

ChanseyEggMoves:
	db METRONOME
	db HEAL_BELL
	db -1 ; end

TangelaEggMoves:
	db REVERSAL
	db CONFUSION
	db MEGA_DRAIN
	db REFLECT
	db AMNESIA
	db -1 ; end

KangaskhanEggMoves:
	db STOMP
	db FOCUS_ENERGY
	db SAFEGUARD
	db DISABLE
	db HAMMER_ARM
	db -1 ; end

HorseaEggMoves:
	db REVERSAL
	db AURORA_BEAM
	db OCTAZOOKA
	db DISABLE
	db -1 ; end

GoldeenEggMoves:
	db PSYBEAM
	db HAZE
	db HYDRO_PUMP
	db -1 ; end

StaryuEggMoves:
	db AURORA_BEAM
	db BARRIER
	db SUPERSONIC
	db -1 ; end

MrMimeEggMoves:
	db FUTURE_SIGHT
	db HYPNOSIS
	db MIMIC
	db -1 ; end

ScytherEggMoves:
	db COUNTER
	db SAFEGUARD
	db BATON_PASS
	db REVERSAL
	db LIGHT_SCREEN
	db -1 ; end

PinsirEggMoves:
	db FURY_ATTACK
	db REVERSAL
	db -1 ; end

TaurosEggMoves:
	; ?
	db -1 ; end

MagikarpEggMoves:
	; ?
	db -1 ; end

LaprasEggMoves:
	db AURORA_BEAM
	db -1 ; end

EeveeEggMoves:
	db REVERSAL
	db CHARM
	db -1 ; end

PorygonEggMoves:
	; ?
	db -1 ; end

OmanyteEggMoves:
	db BUBBLEBEAM
	db AURORA_BEAM
	db SLAM
	db SUPERSONIC
	db HAZE
	db -1 ; end

KabutoEggMoves:
	db BUBBLEBEAM
	db AURORA_BEAM
	db RAPID_SPIN
	db DIG
	db REVERSAL
	db -1 ; end

AerodactylEggMoves:
	db WHIRLWIND
	db PURSUIT
	db ICICLE_WING
	db -1 ; end

SnorlaxEggMoves:
	db LICK
	db CHARM
	db -1 ; end

DratiniEggMoves:
	db LIGHT_SCREEN
	db MIST
	db HAZE
	db SUPERSONIC
	db -1 ; end

ChikoritaEggMoves:
	db VINE_WHIP
	db LEECH_SEED
	db COUNTER
	db ANCIENTPOWER
	db REVERSAL
	db SWORDS_DANCE
	db -1 ; end

CyndaquilEggMoves:
	db FURY_ATTACK
	db QUICK_ATTACK
	db REVERSAL
	db THRASH
	db SUBMISSION
	db -1 ; end

TotodileEggMoves:
	db CRUNCH
	db THRASH
	db HYDRO_PUMP
	db ANCIENTPOWER
	db ROCK_SLIDE
	db -1 ; end

SentretEggMoves:
	db DOUBLE_EDGE
	db PURSUIT
	db SLASH
	db FOCUS_ENERGY
	db REVERSAL
	db -1 ; end

HoothootEggMoves:
	db MIRROR_MOVE
	db SUPERSONIC
	db FAINT_ATTACK
	db WING_ATTACK
	db WHIRLWIND
	db SKY_ATTACK
	db -1 ; end

LedybaEggMoves:
	db PSYBEAM
	db LIGHT_SCREEN
	db -1 ; end

SpinarakEggMoves:
	db PSYBEAM
	db DISABLE
	db SONICBOOM
	db BATON_PASS
	db PURSUIT
	db -1 ; end

ChinchouEggMoves:
	db REVERSAL
	db SUPERSONIC
	db SCREECH
	db -1 ; end

PichuEggMoves:
	db REVERSAL
	db ENCORE
	db DOUBLESLAP
	db -1 ; end

CleffaEggMoves:
	db METRONOME
	db AMNESIA
	db BELLY_DRUM
	db MIMIC
	db -1 ; end

IgglybuffEggMoves:
	db PERISH_SONG
	db FAINT_ATTACK
	db -1 ; end

TogepiEggMoves:
	db MIRROR_MOVE
	db PECK
	db FUTURE_SIGHT
	db -1 ; end

NatuEggMoves:
	db HAZE
	db DRILL_PECK
	db QUICK_ATTACK
	db FAINT_ATTACK
	db ICICLE_WING
	db -1 ; end

MareepEggMoves:
	db THUNDERBOLT
	db TAKE_DOWN
	db BODY_SLAM
	db SAFEGUARD
	db SCREECH
	db REFLECT
	db -1 ; end

MarillEggMoves:
	db LIGHT_SCREEN
	db AMNESIA
	db FUTURE_SIGHT
	db BELLY_DRUM
	db PERISH_SONG
	db SUPERSONIC
	db -1 ; end

SudowoodoEggMoves:
	db SELFDESTRUCT
	db -1 ; end

HoppipEggMoves:
	db CONFUSION
	db GROWL
	db ENCORE
	db DOUBLE_EDGE
	db REFLECT
	db AMNESIA
	db PAY_DAY
	db -1 ; end

AipomEggMoves:
	db COUNTER
	db SCREECH
	db PURSUIT
	db AGILITY
	db SPITE
	db SLAM
	db DOUBLESLAP
	db -1 ; end

SunkernEggMoves:
	;?
	db -1 ; end

YanmaEggMoves:
	db WHIRLWIND
	db REVERSAL
	db LEECH_LIFE
	db -1 ; end

WooperEggMoves:
	db BODY_SLAM
	db ANCIENTPOWER
	db SAFEGUARD
	db -1 ; end

MurkrowEggMoves:
	db WHIRLWIND
	db DRILL_PECK
	db QUICK_ATTACK
	db MIRROR_MOVE
	db WING_ATTACK
	db SKY_ATTACK
	db -1 ; end

MisdreavusEggMoves:
	db SCREECH
	db -1 ; end

WobbuffetEggMoves:
	; ?
	db -1 ; end

GirafarigEggMoves:
	db TAKE_DOWN
	db AMNESIA
	db FUTURE_SIGHT
	db -1 ; end

PinecoEggMoves:
	db REFLECT
	db PIN_MISSILE
	db REVERSAL
	db SWIFT
	db -1 ; end

DunsparceEggMoves:
	db ANCIENTPOWER
	db ROCK_SLIDE
	db BITE
	db RAGE
	db -1 ; end

GligarEggMoves:
	db FROZEN_CLAW
	db WING_ATTACK
	db COUNTER
	db -1 ; end

SnubbullEggMoves:
	db METRONOME
	db FAINT_ATTACK
	db REFLECT
	db CRUNCH
	db HEAL_BELL
	db LICK
	db LEER
	db -1 ; end

QwilfishEggMoves:
	db REVERSAL
	db HAZE
	db BUBBLEBEAM
	db SUPERSONIC
	db -1 ; end

ShuckleEggMoves:
	db FELL_STINGER
	db -1 ; end

HeracrossEggMoves:
	db HARDEN
	db REVERSAL
	db -1 ; end

SneaselEggMoves:
	db COUNTER
	db SPITE
	db REFLECT
	db BITE
	db -1 ; end

TeddiursaEggMoves:
	db CRUNCH
	db TAKE_DOWN
	db SEISMIC_TOSS
	db FOCUS_ENERGY
	db COUNTER
	db FROZEN_CLAW
	db -1 ; end

SlugmaEggMoves:
	db ACID_ARMOR
	db -1 ; end

SwinubEggMoves:
	db TAKE_DOWN
	db BITE
	db BODY_SLAM
	db ROCK_SLIDE
	db ANCIENTPOWER
	db -1 ; end

CorsolaEggMoves:
	db ROCK_SLIDE
	db SAFEGUARD
	db SCREECH
	db MIST
	db AMNESIA
	db -1 ; end

RemoraidEggMoves:
	db AURORA_BEAM
	db OCTAZOOKA
	db SUPERSONIC
	db HAZE
	db SCREECH
	db -1 ; end

DelibirdEggMoves:
	db AURORA_BEAM
	db QUICK_ATTACK
	db FUTURE_SIGHT
	db RAPID_SPIN
	db -1 ; end

MantineEggMoves:
	db TWISTER
	db HYDRO_PUMP
	db HAZE
	db SLAM
	db -1 ; end

SkarmoryEggMoves:
	db DRILL_PECK
	db PURSUIT
	db WHIRLWIND
	db SKY_ATTACK
	db -1 ; end

HoundourEggMoves:
	db FIRE_SPIN
	db RAGE
	db PURSUIT
	db COUNTER
	db SPITE
	db REVERSAL
	db -1 ; end

PhanpyEggMoves:
	db FOCUS_ENERGY
	db BODY_SLAM
	db ANCIENTPOWER
	db WATER_GUN
	db -1 ; end

StantlerEggMoves:
	db REFLECT
	db SPITE
	db DISABLE
	db LIGHT_SCREEN
	db BITE
	db -1 ; end

TyrogueEggMoves:
	db RAPID_SPIN
	db JUMP_KICK
	db MACH_PUNCH
	db LOCK_ON
	db -1 ; end

SmoochumEggMoves:
	db MEDITATE
	db -1 ; end

ElekidEggMoves:
	db KARATE_CHOP
	db BARRIER
	db ROLLING_KICK
	db MEDITATE
	db HAMMER_ARM
	db CROSS_CHOP
	db -1 ; end

MagbyEggMoves:
	db KARATE_CHOP
	db MEGA_PUNCH
	db BARRIER
	db SCREECH
	db CROSS_CHOP
	db -1 ; end

MiltankEggMoves:
	db REVERSAL
	db SEISMIC_TOSS
	db HAMMER_ARM
	db -1 ; end

LarvitarEggMoves:
	db PURSUIT
	db STOMP
	db THRASH
	db FOCUS_ENERGY
	db ANCIENTPOWER
	db -1 ; end

NoEggMoves:
	db -1 ; end
