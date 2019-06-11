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
	db VENOSHOCK
	db -1 ; end

NidoranMEggMoves:
	db SUPERSONIC
	db DISABLE
	db TAKE_DOWN
	db CONFUSION
	db AMNESIA
	db COUNTER
	db VENOSHOCK
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
	db CURSE
	db GUST
	db ZEN_HEADBUTT
	db WHIRLWIND
	db -1 ; end

OddishEggMoves:
	db SWORDS_DANCE
	db RAZOR_LEAF
	db REVERSAL
	db SYNTHESIS
	db CHARM
	db HARMONY
	db -1 ; end

ParasEggMoves:
	db FALSE_SWIPE
	db SCREECH
	db COUNTER
	db PSYBEAM
	db REVERSAL
	db LIGHT_SCREEN
	db PURSUIT
	db LEECH_SEED
	db DIG
	db -1 ; end

VenonatEggMoves:
	db BATON_PASS
	db SCREECH
	db GIGA_DRAIN
	db TOXIC
	db WHIRLWIND
	db SUPER_FANG
	db AGILITY
	db NIGHTMARE
	db -1 ; end

DiglettEggMoves:
	db FAINT_ATTACK
	db SCREECH
	db ANCIENTPOWER
	db PURSUIT
	db ENDURE
	db STAMPEDE
	db -1 ; end

MeowthEggMoves:
	db SPITE
	db LICK
	db CHARM
	db HYPNOSIS
	db AMNESIA
	db DOUBLE_KICK
	db MIMIC
	db -1 ; end

PsyduckEggMoves:
	db MUD_BOMB
	db HYPNOSIS
	db ICE_BEAM
	db PSYBEAM
	db LIGHT_SCREEN
	db FUTURE_SIGHT
	db PSYCHIC_M
	db CROSS_CHOP
	db SLEEP_TALK
	db -1 ; end

MankeyEggMoves:
	db ROCK_SLIDE
	db MEDITATE
	db COUNTER
	db REVERSAL
	db ENCORE
	db SLEEP_TALK
	db -1 ; end

GrowlitheEggMoves:
	db SAFEGUARD
	db FIRE_SPIN
	db ROCK_SMASH
	db DOUBLE_EDGE
	db MORNING_SUN
	db -1 ; end

PoliwagEggMoves:
	db MIST
	db HAZE
	db LOCK_ON
	db HARMONY
	db AURORA_BEAM
	db ENCORE
	db -1 ; end

AbraEggMoves:
	db LIGHT_SCREEN
	db ENCORE
	db BARRIER
	db ZEN_HEADBUTT
	db ICE_PUNCH
	db FIRE_PUNCH
	db THUNDERPUNCH
	db FIRE_PLAY
	db -1 ; end

MachopEggMoves:
	db LIGHT_SCREEN
	db MEDITATE
	db ROLLING_KICK
	db ENCORE
	db ICE_PUNCH
	db FIRE_PUNCH
	db THUNDERPUNCH
	db -1 ; end

BellsproutEggMoves:
	db SWORDS_DANCE
	db ENCORE
	db REFLECT
	db SYNTHESIS
	db LEECH_LIFE
	db GIGA_DRAIN
	db MAGICAL_LEAF
	db -1 ; end

TentacoolEggMoves:
	db MUD_BOMB
	db RAPID_SPIN
	db MIRROR_COAT
	db AURORA_BEAM
	db HAZE
	db CONFUSE_RAY
	db SAFEGUARD
	db PRISM_LIGHT
	db -1 ; end

GeodudeEggMoves:
	db MEGA_PUNCH
	db ROCK_SLIDE
	db HAMMER_ARM
	db CURSE
	db ICE_PUNCH
	db FIRE_PUNCH
	db THUNDERPUNCH
	db -1 ; end

PonytaEggMoves:
	db THRASH
	db DOUBLE_KICK
	db HYPNOSIS
	db CHARM
	db LOW_KICK
	db QUICK_ATTACK
	db MORNING_SUN
	db -1 ; end

SlowpokeEggMoves:
	db SAFEGUARD
	db BELLY_DRUM
	db FUTURE_SIGHT
	db STOMP
	db MUD_BOMB
	db BUBBLEBEAM
	db -1 ; end

MagnemiteEggMoves:
	db PRISM_LIGHT
	db MIRROR_MOVE
	db RAPID_SPIN
	db WILD_STORM
	db SPARK
	db BUG_BUZZ
	db EXTREMESPEED
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
	db FEATHERGALE
	db FAINT_ATTACK
	db REVERSAL
	db DOUBLE_KICK
	db -1 ; end

SeelEggMoves:
	db LICK
	db PERISH_SONG
	db DISABLE
	db PECK
	db SLAM
	db ENCORE
	db HORN_DRILL
	db JET_STREAM
	db FIRE_PLAY
	db -1 ; end

GrimerEggMoves:
	db HAZE
	db ABSORB
	db MEGA_DRAIN
	db MEAN_LOOK
	db LICK
	db CURSE
	db VENOSHOCK
	db -1 ; end

ShellderEggMoves:
	db BUBBLEBEAM
	db TAKE_DOWN
	db BARRIER
	db RAPID_SPIN
	db SCREECH
	db MUD_BOMB
	db ROCK_BLAST
	db -1 ; end

GastlyEggMoves:
	db PSYWAVE
	db PERISH_SONG
	db HAZE
	db WILL_O_WISP
	db DISABLE
	db ICE_PUNCH
	db -1 ; end

OnixEggMoves:
	db ROCK_SLIDE
	db REVERSAL
	db ROLLOUT
	db FISSURE
	db SAND_ATTACK
	db AQUA_TAIL
	db SKULL_BASH
	db -1 ; end

DrowzeeEggMoves:
	db LIGHT_SCREEN
	db BARRIER
	db ICE_PUNCH
	db FIRE_PUNCH
	db THUNDERPUNCH
	db -1 ; end

KrabbyEggMoves:
	db HAZE
	db AMNESIA
	db REVERSAL
	db AGILITY
	db ENDURE
	db STAMPEDE
	db SPIKE_CANNON
	db -1 ; end

VoltorbEggMoves:
	db WILD_STORM
	db DEFENSE_CURL
	db FOCUS_ENERGY
	db SCARY_FACE
	db RAPID_SPIN
	db AGILITY
	db -1 ; end

ExeggcuteEggMoves:
	db MOONLIGHT
	db REFLECT
	db MEGA_DRAIN
	db GIGA_DRAIN
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
	db COMET_PUNCH
	db BELLY_DRUM
	db MAGNITUDE
	db HAMMER_ARM
	db SWAGGER
	db CHARM
	db BATON_PASS
	db -1 ; end

KoffingEggMoves:
	db SCREECH
	db PSYWAVE
	db ROCK_SLIDE
	db PSYBEAM
	db PAIN_SPLIT
	db SPITE
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
	db SEISMIC_TOSS
	db WAKEUP_SLAP
	db FIRE_FLICK
	db -1 ; end

TangelaEggMoves:
	db REVERSAL
	db CONFUSION
	db GIGA_DRAIN
	db REFLECT
	db AMNESIA
	db HYPNOSIS
	db -1 ; end

KangaskhanEggMoves:
	db STOMP
	db FOCUS_ENERGY
	db SAFEGUARD
	db DISABLE
	db HAMMER_ARM
	db FIRE_PUNCH
	db -1 ; end

HorseaEggMoves:
	db REVERSAL
	db AURORA_BEAM
	db DISABLE
	db SILVER_WIND
	db SLUDGE
	db -1 ; end

GoldeenEggMoves:
	db PSYBEAM
	db HAZE
	db SLEEP_TALK
	db BODY_SLAM
	db HYDRO_PUMP
	db -1 ; end

StaryuEggMoves:
	db AURORA_BEAM
	db BARRIER
	db SUPERSONIC
	db EERIEIMPULSE
	db EXTREMESPEED
	db AMNESIA
	db -1 ; end

MrMimeEggMoves:
	db FUTURE_SIGHT
	db HYPNOSIS
	db MIMIC
	db CHARM
	db NASTY_PLOT
	db ICY_WIND
	db WAKEUP_SLAP
	db -1 ; end

ScytherEggMoves:
	db COUNTER
	db SAFEGUARD
	db BUG_BUZZ
	db REVERSAL
	db LIGHT_SCREEN
	db AIR_SLASH
	db -1 ; end

PinsirEggMoves:
	db FURY_ATTACK
	db REVERSAL
	db CLOSE_COMBAT
	db LEECH_LIFE
	db PURSUIT
	db -1 ; end

TaurosEggMoves:
	db DOUBLE_KICK
	db BARRIER
	db BRICK_BREAK
	db ENDURE
	db VINE_WHIP
	db HYPER_BEAM
	db -1 ; end

MagikarpEggMoves:
	db QUICK_ATTACK
	db TWISTER
	db SURF
	db SLAM
	db REST
	db -1 ; end

LaprasEggMoves:
	db AURORA_BEAM
	db CURSE
	db FISSURE
	db HARMONY
	db HORN_DRILL
	db WHIRLPOOL
	db -1 ; end

EeveeEggMoves:
	db REVERSAL
	db CHARM
	db ENDURE
	db MIMIC
	db FIRE_PLAY
	db HYPER_FANG
	db -1 ; end

PorygonEggMoves:
	db MINIMIZE
	db WATER_GUN
	db BARRIER
	db WILD_STORM
	db DARK_PULSE
	db SILVER_WIND
	db SOLARBEAM
	db -1 ; end

OmanyteEggMoves:
	db BUBBLEBEAM
	db AURORA_BEAM
	db SLAM
	db SUPERSONIC
	db HAZE
	db MEGAHORN
	db -1 ; end

KabutoEggMoves:
	db AURORA_BEAM
	db RAPID_SPIN
	db DIG
	db REVERSAL
	db X_SCISSOR
	db GIGA_DRAIN
	db -1 ; end

AerodactylEggMoves:
	db WHIRLWIND
	db PURSUIT
	db ICICLE_WING
	db CURSE
	db AIR_SLASH
	db -1 ; end

SnorlaxEggMoves:
	db LICK
	db CHARM
	db FISSURE
	db DOUBLE_EDGE
	db ZEN_HEADBUTT
	db -1 ; end

DratiniEggMoves:
	db LIGHT_SCREEN
	db MIST
	db HAZE
	db EXTREMESPEED
	db SUPERSONIC
	db JET_STREAM
	db CHARGE_BEAM
	db FLAME_WHEEL
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
	db REVERSAL
	db THRASH
	db SUBMISSION
	db DOUBLE_KICK
	db -1 ; end

TotodileEggMoves:
	db ANCIENTPOWER
	db ROCK_SLIDE
	db ICE_PUNCH
	db SEISMIC_TOSS
	db FAINT_ATTACK
	db FIRE_PLAY
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
	db NIGHT_SHADE
	db WING_ATTACK
	db WHIRLWIND
	db SKY_ATTACK
	db -1 ; end

LedybaEggMoves:
	db DOUBLE_TEAM
	db PSYBEAM
	db FEATHERGALE
	db COUNTER
	db SCREECH
	db -1 ; end

SpinarakEggMoves:
	db PSYBEAM
	db DISABLE
	db SONICBOOM
	db BATON_PASS
	db PURSUIT
	db SPARK
	db TWINEEDLE
	db -1 ; end

ChinchouEggMoves:
	db REVERSAL
	db SUPERSONIC
	db SCREECH
	db AGILITY
	db WHIRLPOOL
	db AMNESIA
	db -1 ; end

PichuEggMoves:
	db REVERSAL
	db ENCORE
	db DOUBLESLAP
	db THUNDERPUNCH
	db -1 ; end

CleffaEggMoves:
	db AMNESIA
	db BELLY_DRUM
	db MIMIC
	db METRONOME
	db -1 ; end

IgglybuffEggMoves:
	db PERISH_SONG
	db FAINT_ATTACK
	db SLEEP_TALK
	db HYPER_SONAR
	db -1 ; end

TogepiEggMoves:
	db MIRROR_MOVE
	db PECK
	db FUTURE_SIGHT
	db FEATHERGALE
	db KINESIS
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
	db ENDURE
	db ROLLOUT
	db CURSE
	db -1 ; end

HoppipEggMoves:
	db CONFUSION
	db GROWL
	db ENCORE
	db DOUBLE_EDGE
	db REFLECT
	db AMNESIA
	db -1 ; end

AipomEggMoves:
	db COUNTER
	db PURSUIT
	db SPITE
	db SLAM
	db DOUBLESLAP
	db PETAL_DANCE
	db -1 ; end

SunkernEggMoves:
	db COTTON_SPORE
	db POISON_GAS
	db PROTECT
	db DIG
	db -1 ; end

YanmaEggMoves:
	db WHIRLWIND
	db REVERSAL
	db LEECH_LIFE
	db PURSUIT
	db SILVER_WIND
	db -1 ; end

WooperEggMoves:
	db BODY_SLAM
	db ANCIENTPOWER
	db SAFEGUARD
	db FIRE_PLAY
	db -1 ; end

MurkrowEggMoves:
	db MIRROR_MOVE
	db QUICK_ATTACK
	db DRILL_PECK
	db WING_ATTACK
	db SKY_ATTACK
	db -1 ; end

MisdreavusEggMoves:
	db SCREECH
	db CURSE
	db HARMONY
	db -1 ; end

WobbuffetEggMoves:
	db CONFUSION
	db CONFUSION
	db -1 ; end

GirafarigEggMoves:
	db TAKE_DOWN
	db AMNESIA
	db FUTURE_SIGHT
	db DOUBLE_KICK
	db MIRROR_COAT
	db -1 ; end

PinecoEggMoves:
	db REFLECT
	db PIN_MISSILE
	db REVERSAL
	db SWIFT
	db ENDURE
	db -1 ; end

DunsparceEggMoves:
	db BITE
	db HEADBUTT
	db SLEEP_TALK
	db SKULL_BASH
	db -1 ; end

GligarEggMoves:
	db FROZEN_CLAW
	db WING_ATTACK
	db COUNTER
	db ROLLOUT
	db -1 ; end

SnubbullEggMoves:
	db METRONOME
	db FAINT_ATTACK
	db REFLECT
	db HEAL_BELL
	db LEER
	db -1 ; end

QwilfishEggMoves:
	db HAZE
	db BUBBLEBEAM
	db SUPERSONIC
	db SILVER_WIND
	db -1 ; end

ShuckleEggMoves:
	db FELL_STINGER
	db MINIMIZE
	db ACID
	db HARMONY
	db -1 ; end

HeracrossEggMoves:
	db FELL_STINGER
	db HARDEN
	db SEISMIC_TOSS
	db THUNDERPUNCH
	db -1 ; end

SneaselEggMoves:
	db COUNTER
	db SPITE
	db REFLECT
	db BITE
	db ICE_PUNCH
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
	db ROLLOUT
	db INFERNO
	db CURSE
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
	db PRISM_LIGHT
	db AMNESIA
	db HARMONY
	db -1 ; end

RemoraidEggMoves:
	db OCTAZOOKA
	db SUPERSONIC
	db HAZE
	db SCREECH
	db SWIFT
	db REVERSAL
	db -1 ; end

DelibirdEggMoves:
	db AURORA_BEAM
	db QUICK_ATTACK
	db FUTURE_SIGHT
	db RAPID_SPIN
	db ICE_PUNCH
	db SPIKES
	db -1 ; end

MantineEggMoves:
	db TWISTER
	db AMNESIA
	db HAZE
	db SLAM
	db SKY_ATTACK
	db -1 ; end

SkarmoryEggMoves:
	db DRILL_PECK
	db PURSUIT
	db WHIRLWIND
	db SKY_ATTACK
	db WILD_STORM
	db CURSE
	db -1 ; end

HoundourEggMoves:
	db FIRE_SPIN
	db RAGE
	db COUNTER
	db SPITE
	db REVERSAL
	db -1 ; end

PhanpyEggMoves:
	db FOCUS_ENERGY
	db BODY_SLAM
	db ANCIENTPOWER
	db WATER_GUN
	db FISSURE
	db -1 ; end

StantlerEggMoves:
	db REFLECT
	db SPITE
	db DISABLE
	db LIGHT_SCREEN
	db BITE
	db MEGAHORN
	db -1 ; end

TyrogueEggMoves:
	db RAPID_SPIN
	db JUMP_KICK
	db MACH_PUNCH
	db FIRE_PUNCH
	db ICE_PUNCH
	db THUNDERPUNCH
	db -1 ; end

SmoochumEggMoves:
	db MEDITATE
	db ICE_PUNCH
	db NASTY_PLOT
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
	db THUNDERPUNCH
	db -1 ; end

MiltankEggMoves:
	db REVERSAL
	db SEISMIC_TOSS
	db HAMMER_ARM
	db -1 ; end

LarvitarEggMoves:
	db PURSUIT
	db STOMP
	db FOCUS_ENERGY
	db ANCIENTPOWER
	db -1 ; end

NoEggMoves:
	db -1 ; end
