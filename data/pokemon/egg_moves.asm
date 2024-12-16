INCLUDE "constants.asm"


SECTION "Egg Moves", ROMX

INCLUDE "data/pokemon/egg_move_pointers.asm"

BulbasaurEggMoves:
	db FIRE_SPIN    ; min level 10 ; becomes Ingrain
	db AMNESIA      ; min level 15
	db SLUDGE       ; min level 20
	db MAGICAL_LEAF ; min level 25
	db SKULL_BASH   ; min level 30
	db ANCIENTPOWER ; min level 35
	db PETAL_DANCE  ; min level 40
	db -1 ; end

CharmanderEggMoves:
	db BITE        ; min level 10
	db FIRE_FLICK  ; min level 15
	db ABSORB      ; min level 20 ; becomes Fire Fang
	db CRUNCH      ; min level 25
	db ROCK_SLIDE  ; min level 30
	db THRASH      ; min level 35
	db BELLY_DRUM  ; min level 40
	db -1 ; end

SquirtleEggMoves:
	db MIRROR_COAT ; min level 10
	db FIRE_SPIN   ; min level 15 ; becomes Aqua Ring
	db CONFUSION   ; min level 20 
	db JET_STREAM  ; min level 25 
	db PECK        ; min level 30 ; becomes Aura Sphere
	db REVERSAL    ; min level 35
	db MUD_BOMB    ; min level 40
	db ZAP_CANNON  ; min level 45
	db -1 ; end

CaterpieEggMoves:
	db SPIKES       ; min level 10 ; becomes Sticky Web
	db FAINT_ATTACK ; min level 15
	db SUPERSONIC   ; min level 20
	db BUG_BUZZ     ; min level 25 
	db GIGA_DRAIN   ; min level 30
	db -1 ; end

WeedleEggMoves:
	db PURSUIT
	db DOUBLESLAP ; becomes Pin Missile
	db FAINT_ATTACK
	db SLASH ; becomes Night Slash
	db AGILITY
	db ASSURANCE 
	db -1 ; end
	
PidgeyEggMoves:
	db FIRE_PLAY ; becomes Flutter Clap
	db AIR_SLASH
	db DOUBLE_EDGE ; becomes Brave Bird
	db JUMP_KICK ; becomes Sand Dive
	db -1 ; end

RattataEggMoves:
	db SCREECH
	db GNAW
	db FLAME_WHEEL
	db FURY_ATTACK
	db MAKESHIFT
	db SWAGGER
	db -1 ; end

SpearowEggMoves:
	db FALSE_SWIPE  ; level 10 
	db SONICBOOM    ; level 15 
	db SCARY_FACE   ; level 20 
	db QUICK_ATTACK ; level 25 
	db TRI_ATTACK   ; level 30 
	db FIRE_PLAY    ; level 35 ; becomes Flutter Clap
	db SCREECH      ; level 40 ; becomes Feather Dance
	db -1 ; end

EkansEggMoves:
	db SLAM      ; level 10
	db PURSUIT   ; level 15
	db CRUNCH    ; level 20
	db AQUA_TAIL ; level 25
	db ABSORB    ; level 30 ; becomes Fire Fang
	db EMBER     ; level 35 ; becomes Ice Fang
	db PSYBEAM   ; level 40 ; becomes Thunder Fang
	db -1 ; end

SandshrewEggMoves:
	db REVERSAL
	db SAFEGUARD
	db MACH_PUNCH ; becomes Smart Strike
	db COUNTER
	db METAL_CLAW
	db ICY_WIND ; becomes Mud Shot
	db -1 ; end

NidoranFEggMoves:
	db CHARM
	db SUPERSONIC
	db PECK ; becomes Lovely Kiss
	db TAKE_DOWN
	db FOCUS_ENERGY
	db COUNTER
	db VENOSHOCK
	db -1 ; end

NidoranMEggMoves:
	db SUPERSONIC
	db CONFUSION
	db AMNESIA
	db COUNTER
	db VENOSHOCK
	db MACH_PUNCH ; becomes Smart Strike
	db -1 ; end

VulpixEggMoves:
	db GNAW
	db HYPNOSIS
	db REVERSAL
	db SPITE
	db DISABLE
	db DOUBLE_EDGE ; becomes Flare Blitz
	db -1 ; end

ZubatEggMoves:
	db QUICK_ATTACK
	db ZEN_HEADBUTT
	db STEEL_WING
	db CURSE
	db REVERSAL ; becomes Flail
	db DOUBLE_EDGE ; becomes Brave Bird
	db -1 ; end

OddishEggMoves:
	db REVERSAL
	db RAZOR_LEAF
	db HARMONY
	db SWORDS_DANCE
	db TOXIC
	db SOLARBEAM
	db -1 ; end

ParasEggMoves:
	db LIGHT_SCREEN
	db LEECH_SEED
	db SCREECH
	db METAL_CLAW
	db COUNTER
	db PSYBEAM
	db -1 ; end

VenonatEggMoves:
	db BATON_PASS
	db GNAW
	db AGILITY
	db GIGA_DRAIN
	db TOXIC
	db SUPER_FANG
	db -1 ; end

DiglettEggMoves:
	db FAINT_ATTACK
	db HEADBUTT
	db SCREECH
	db ROCK_SLIDE
	db STAMPEDE
	db -1 ; end

MeowthEggMoves:
	db SPITE
	db AMNESIA
	db DOUBLE_KICK
	db HYPNOSIS
	db MIMIC
	db NASTY_PLOT
	db PETAL_DANCE
	db -1 ; end

PsyduckEggMoves:
	db HYPNOSIS
	db MUD_BOMB
	db PSYBEAM
	db PSYCHIC_M
	db ICE_BEAM
	db PETAL_DANCE
	db TRI_ATTACK
	db -1 ; end

MankeyEggMoves:
	db ROCK_SLIDE
	db REVERSAL
	db ENCORE
	db SLEEP_TALK
	db ZEN_HEADBUTT
	db -1 ; end

GrowlitheEggMoves:
	db FIRE_SPIN
	db ROCK_SMASH
	db MORNING_SUN
	db DOUBLE_KICK
	db IRON_TAIL
	db CLOSE_COMBAT
	db -1 ; end

PoliwagEggMoves:
	db LOCK_ON
	db HARMONY
	db AURORA_BEAM
	db ENCORE
	db SIGNAL_BEAM ; becomes Water Pulse
	db PECK ; becomes Lovely Kiss
	db -1 ; end

AbraEggMoves:
	db ENCORE
	db ICE_PUNCH
	db FIRE_PUNCH
	db THUNDERPUNCH
	db -1 ; end

MachopEggMoves:
	db LIGHT_SCREEN
	db ROLLING_KICK
	db BITE ; becomes Bullet Punch
	db ICE_PUNCH
	db FIRE_PUNCH
	db THUNDERPUNCH
	db -1 ; end

BellsproutEggMoves:
	db ENCORE
	db REFLECT
	db SWORDS_DANCE
	db MAGICAL_LEAF
	db DRILL_PECK ; becomes Seed Bomb
	db -1 ; end

TentacoolEggMoves:
	db MUD_BOMB
	db RAPID_SPIN
	db MIRROR_COAT
	db AURORA_BEAM
	db CONFUSE_RAY
	db PRISM_LIGHT
	db -1 ; end

GeodudeEggMoves:
	db MEGA_PUNCH
	db HAMMER_ARM
	db CURSE
	db BITE ; becomes Bullet Punch
	db ICE_PUNCH
	db FIRE_PUNCH
	db THUNDERPUNCH
	db -1 ; end

PonytaEggMoves:
	db DOUBLE_KICK
	db MACH_PUNCH ; becomes Smart Strike
	db QUICK_ATTACK
	db LOW_KICK
	db THRASH
	db HYPNOSIS
	db GROWTH ; becomes Calm Mind
	db -1 ; end

SlowpokeEggMoves:
	db BELLY_DRUM
	db FUTURE_SIGHT
	db STOMP
	db MUD_BOMB
	db BUBBLEBEAM
	db -1 ; end

MagnemiteEggMoves:
	db SPARK
	db PRISM_LIGHT
	db MIRROR_MOVE
	db RAPID_SPIN
	db WILD_STORM
	db BUG_BUZZ
	db -1 ; end

FarfetchDEggMoves:
	db GUST
	db MIRROR_MOVE
	db REVERSAL
	db SCREECH ; becomes Feather Dance
	db CONFUSION ; becomes Revenge
	db RECOVER ; becomes Roost
	db -1 ; end

DoduoEggMoves:
	db SUPERSONIC
	db HAZE
	db FEATHERGALE
	db FAINT_ATTACK
	db REVERSAL
	db RECOVER ; becomes Roost
	db -1 ; end

SeelEggMoves:
	db LICK
	db PERISH_SONG
	db DISABLE
	db SLAM
	db HORN_DRILL
	db JET_STREAM
	db FIRE_PLAY ; becomes Tide Clash
	db MACH_PUNCH ; becomes Smart Strike
	db -1 ; end

GrimerEggMoves:
	db HAZE
	db MEGA_DRAIN
	db MEAN_LOOK
	db LICK
	db CURSE
	db VENOSHOCK
	db OCTAZOOKA
	db -1 ; end

ShellderEggMoves:
	db BUBBLEBEAM
	db TAKE_DOWN
	db RAPID_SPIN
	db SCREECH
	db MUD_BOMB
	db DOUBLESLAP ; becomes Rock Blast
	db ICY_WIND ; becomes Mud Shot
	db CONFUSION ; becomes Avalanche
	db -1 ; end

GastlyEggMoves:
	db PSYWAVE
	db PERISH_SONG
	db WILL_O_WISP
	db GNAW
	db ICE_PUNCH
	db -1 ; end

OnixEggMoves:
	db REVERSAL     ; min level 6 
	db QUICK_ATTACK ; min level 12 ; becomes Accelerock
	db HORN_DRILL   ; min level 18
	db AQUA_TAIL    ; min level 24
	db ABSORB       ; min level 30 ; Fire Fang
	db EMBER        ; min level 36 ; Ice Fang
	db PSYBEAM      ; min level 42 ; becomes Thunder Fang
	db -1 ; end

DrowzeeEggMoves:
	db STOMP
	db DIZZY_PUNCH
	db ICE_PUNCH
	db FIRE_PUNCH
	db THUNDERPUNCH
	db MEGA_KICK
	db BELLY_DRUM
	db -1 ; end

KrabbyEggMoves:
	db AMNESIA
	db AGILITY
	db ENDURE
	db STAMPEDE
	db SPIKE_CANNON
	db -1 ; end

VoltorbEggMoves:
	db DEFENSE_CURL
	db FOCUS_ENERGY
	db SCARY_FACE
	db RAPID_SPIN
	db WILD_STORM
	db -1 ; end

ExeggcuteEggMoves:
	db MEGA_DRAIN
	db MOONLIGHT
	db REFLECT
	db ANCIENTPOWER
	db -1 ; end

CuboneEggMoves:
	db ROCK_SLIDE
	db SCREECH
	db BELLY_DRUM
	db PERISH_SONG
	db SWORDS_DANCE
	db -1 ; end

LickitungEggMoves:
	db COMET_PUNCH
	db HEAL_BELL
	db BELLY_DRUM
	db MAGNITUDE
	db HAMMER_ARM
	db SWAGGER
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
	db COUNTER
	db MACH_PUNCH ; becomes Smart Strike
	db REVERSAL
	db ABSORB ; becomes Fire Fang
	db EMBER ; becomes Ice Fang
	db PSYBEAM ; becomes Thunder Fang
	db CRUNCH
	db THRASH
	db -1 ; end

ChanseyEggMoves:
	db METRONOME
	db HEAL_BELL
	db SEISMIC_TOSS
	db FIRE_FLICK
	db -1 ; end

TangelaEggMoves:
	db REVERSAL
	db CONFUSION
	db REFLECT
	db AMNESIA
	db HYPNOSIS
	db WAKEUP_SLAP
	db -1 ; end

KangaskhanEggMoves:
	db STOMP
	db FOCUS_ENERGY
	db DISABLE
	db SUBSTITUTE
	db HAMMER_ARM
	db FIRE_PUNCH
	db -1 ; end

HorseaEggMoves:
	db REVERSAL
	db AURORA_BEAM
	db DISABLE
	db SILVER_WIND
	db SIGNAL_BEAM ; becomes Water Pulse
	db SLUDGE_BOMB
	db -1 ; end

GoldeenEggMoves:
	db SLEEP_TALK
	db BODY_SLAM
	db PSYBEAM
	db ICY_WIND ; becomes Mud Shot
	db SKULL_BASH
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
	db CHARM
	db NASTY_PLOT
	db ICY_WIND
	db WAKEUP_SLAP
	db GROWTH ; becomes Calm Mind
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
	db BUG_BUZZ
	db ROCK_THROW
	db -1 ; end

TaurosEggMoves:
	db DOUBLE_KICK
	db BARRIER
	db BRICK_BREAK
	db ENDURE
	db VINE_WHIP
	db CONFUSION ; becomes Revenge
	db MACH_PUNCH ; becomes Smart Strike
	db HYPER_BEAM
	db -1 ; end

MagikarpEggMoves:
	db QUICK_ATTACK
	db TWISTER
	db SURF
	db SLAM
	db REST
	db CONFUSION ; becomes Avalanche
	db -1 ; end

LaprasEggMoves:
	db AURORA_BEAM
	db CURSE
	db HARMONY
	db WHIRLPOOL
	db CONFUSION ; becomes Avalanche
	db MACH_PUNCH ; becomes Smart Strike
	db BITE
	db -1 ; end

EeveeEggMoves:
	db GNAW
	db REVERSAL
	db ENDURE
	db MIMIC
	db CURSE
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
	db MEGAHORN
	db FIRE_PLAY ; becomes Tide Clash
	db ROCK_THROW
	db -1 ; end

KabutoEggMoves:
	db AURORA_BEAM
	db RAPID_SPIN
	db DIG
	db REVERSAL
	db X_SCISSOR
	db GIGA_DRAIN
	db ROCK_THROW
	db -1 ; end

AerodactylEggMoves:
	db CURSE
	db AIR_SLASH
	db RECOVER ; becomes Roost
	db STEEL_WING
	db ABSORB ; becomes Fire Fang
	db EMBER ; becomes Ice Fang
	db PSYBEAM ; becomes Thunder Fang
	db -1 ; end

SnorlaxEggMoves:
	db AMNESIA
	db ZEN_HEADBUTT
	db HORN_DRILL ; becomes Fissure
	db DOUBLE_EDGE
	db PECK ; becomes Lovely Kiss
	db -1 ; end

ArticunoEggMoves:
ZapdosEggMoves:
MoltresEggMoves:
	db HEAL_BELL
	db MIMIC
	db SLASH ; becomes Air Cutter
	db SIGNAL_BEAM
	db ICY_WIND ; becomes Mud Shot
	db DIZZY_PUNCH ; becomes Hurricane
	db -1 ; end

DratiniEggMoves:
	db SUPERSONIC
	db JET_STREAM
	db FIRE_SPIN ; becomes Aqua Ring
	db EXTREMESPEED
	db CHARGE_BEAM
	db FLAME_WHEEL
	db -1 ; end

MewtwoEggMoves:
MewEggMoves:
	db METRONOME
	db PECK ; becomes Electro Ball
	db FIRE_PUNCH
	db THUNDERPUNCH
	db ICE_PUNCH
	db SELFDESTRUCT
	db -1 ; end

ChikoritaEggMoves:
	db COUNTER
	db ANCIENTPOWER
	db HEAL_BELL ; becomes Aromatherapy
	db REVERSAL
	db SWORDS_DANCE
	db PETAL_DANCE
	db -1 ; end

CyndaquilEggMoves:
	db MEDITATE ; becomes Howl
	db FURY_ATTACK
	db DOUBLE_KICK
	db REVERSAL
	db HAZE ; becomes Clear Smog
	db SUBMISSION
	db THRASH
	db -1 ; end

TotodileEggMoves:
	db FIRE_PLAY ; becomes Tide Clash
	db FAINT_ATTACK
	db ANCIENTPOWER
	db ROCK_SLIDE
	db ICE_PUNCH
	db SUBMISSION
	db -1 ; end

SentretEggMoves:
	db PURSUIT
	db FOCUS_ENERGY
	db DIZZY_PUNCH
	db DOUBLE_EDGE
	db SLASH
	db REVERSAL
	db -1 ; end

HoothootEggMoves:
	db MIRROR_MOVE
	db SUPERSONIC
	db ICY_WIND
	db NIGHT_SHADE
	db DIZZY_PUNCH ; becomes Hurricane
	db SKY_ATTACK
	db SCREECH ; becomes Feather Dance
	db -1 ; end

LedybaEggMoves:
	db FEATHERGALE
	db BARRIER
	db DOUBLE_TEAM
	db SIGNAL_BEAM
	db IRON_TAIL ; becomes Spiral Kick
	db PECK ; becomes Aura Sphere
	db -1 ; end

SpinarakEggMoves:
	db PSYBEAM
	db DISABLE
	db SONICBOOM
	db BATON_PASS
	db SPARK
	db MACH_PUNCH ; becomes Smart Strike
	db -1 ; end

ChinchouEggMoves:
	db SCREECH
	db AGILITY
	db PRISM_LIGHT
	db PSYBEAM
	db EMBER ; becomes Brine
	db AMNESIA
	db AURORA_BEAM
	db -1 ; end

PichuEggMoves:
	db DIZZY_PUNCH
	db REVERSAL
	db ENCORE
	db U_TURN ; becomes Volt Switch
	db THUNDERPUNCH
	db GNAW
	db PETAL_DANCE
	db -1 ; end

CleffaEggMoves:
	db DIZZY_PUNCH
	db AMNESIA
	db BELLY_DRUM
	db MIMIC
	db FIRE_PUNCH
	db PETAL_DANCE
	db -1 ; end

IgglybuffEggMoves:
	db DIZZY_PUNCH
	db PERISH_SONG
	db FAINT_ATTACK
	db SLEEP_TALK
	db HYPER_SONAR
	db PETAL_DANCE
	db -1 ; end

TogepiEggMoves:
	db MIRROR_MOVE
	db PECK
	db FUTURE_SIGHT
	db FEATHERGALE
	db KINESIS
	db FIRE_PLAY ; becomes Flutter Clap
	db -1 ; end

NatuEggMoves:
	db QUICK_ATTACK
	db RECOVER ; becomes Roost
	db GROWTH ; becomes Cosmic Power
	db SCREECH ; becomes Feather Dance
	db DRILL_PECK
	db -1 ; end

MareepEggMoves:
	db SAND_ATTACK
	db THUNDERBOLT
	db BODY_SLAM
	db SCREECH
	db REFLECT
	db -1 ; end

MarillEggMoves:
	db AMNESIA
	db FUTURE_SIGHT
	db BODY_SLAM
	db BELLY_DRUM
	db PERISH_SONG
	db SUPERSONIC
	db -1 ; end

SudowoodoEggMoves:
	db HEADBUTT
	db ENDURE
	db CURSE
	db PSYCH_UP ; becomes Cycle Foe
	db SELFDESTRUCT
	db -1 ; end

HoppipEggMoves:
	db CONFUSION
	db AMNESIA
	db DRILL_PECK ; becomes Seed Bomb
	db HEAL_BELL ; becomes Aromatherapy
	db DOUBLE_EDGE
	db ENCORE
	db REFLECT
	db -1 ; end

AipomEggMoves:
	db PURSUIT
	db SPITE
	db SLAM
	db DOUBLESLAP
	db CONFUSION ; becomes Revenge
	db -1 ; end

SunkernEggMoves:
	db COTTON_SPORE
	db POISONPOWDER
	db PROTECT
	db DIG
	db SPORE
	db OCTAZOOKA
	db -1 ; end

YanmaEggMoves:
	db REVERSAL
	db LEECH_LIFE
	db SIGNAL_BEAM
	db ZOOM_FLIGHT
	db HURRICANE
	db AGILITY
	db STEEL_WING
	db -1 ; end

WooperEggMoves:
	db BODY_SLAM
	db ANCIENTPOWER
	db FIRE_PLAY ; becomes Tide Clash
	db BELLY_DRUM
	db -1 ; end

MurkrowEggMoves:
	db MIRROR_MOVE
	db QUICK_ATTACK
	db DRILL_PECK
	db WING_ATTACK
	db SKY_ATTACK
	db SCREECH ; becomes Feather Dance
	db RECOVER ; becomes Roost
	db -1 ; end

MisdreavusEggMoves:
	db SCREECH
	db CURSE
	db HARMONY
	db CONFUSION ; becomes Avalanche
	db FIRE_FLICK
	db -1 ; end

UnownEggMoves:
	db SPIKES
	db -1 ; end

WobbuffetEggMoves:
	db CONFUSION
	db CURSE
	db MIRROR_MOVE
	db -1 ; end

GirafarigEggMoves:
	db TAKE_DOWN
	db AMNESIA
	db FUTURE_SIGHT
	db DOUBLE_KICK
	db MIRROR_COAT
	db -1 ; end

PinecoEggMoves:
	db ENDURE     ; can always learn
	db DARK_PULSE ; min level 5 ; becomes Iron Head 
	db REVERSAL   ; min level 10
	db SWIFT      ; min level 15
	db ROLLOUT    ; min level 20
	db CONFUSION  ; min level 25 ; becomes Revenge
	db ROCK_SLIDE ; min level 30
	db -1 ; end

DunsparceEggMoves:
	db BITE
	db HEADBUTT
	db SLEEP_TALK
	db SKULL_BASH
	db HORN_DRILL
	db -1 ; end

GligarEggMoves:
	db METAL_CLAW
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
	db ABSORB ; becomes Fire Fang
	db EMBER ; becomes Ice Fang
	db PSYBEAM ; becomes Thunder Fang
	db -1 ; end

QwilfishEggMoves:
	db SPIKE_CANNON
	db HAZE
	db BUBBLEBEAM
	db SUPERSONIC
	db SILVER_WIND
	db OCTAZOOKA
	db -1 ; end

ShuckleEggMoves:
	db FELL_STINGER
	db MINIMIZE
	db ACID
	db SPIKES ; becomes Sticky Web
	db EMBER ; becomes Brine
	db TOXIC 
	db -1 ; end

HeracrossEggMoves:
	db HARDEN
	db SEISMIC_TOSS
	db THUNDERPUNCH
	db CONFUSION ; becomes Revenge
	db MACH_PUNCH ; becomes Smart Strike
	db -1 ; end

SneaselEggMoves:
	db COUNTER
	db SPITE
	db REFLECT
	db BITE
	db ICE_PUNCH
	db CONFUSION ; becomes Avalanche
	db -1 ; end

TeddiursaEggMoves:
	db CRUNCH
	db TAKE_DOWN
	db SEISMIC_TOSS
	db FOCUS_ENERGY
	db COUNTER
	db METAL_CLAW
	db -1 ; end

SlugmaEggMoves:
	db ACID_ARMOR
	db ROLLOUT
	db INFERNO
	db CURSE
	db DARK_PULSE
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
	db SIGNAL_BEAM ; becomes Water Pulse
	db -1 ; end

RemoraidEggMoves:
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
	db RECOVER ; becomes Roost
	db -1 ; end

SkarmoryEggMoves:
	db DRILL_PECK
	db PURSUIT
	db WHIRLWIND
	db SKY_ATTACK
	db WILD_STORM
	db CURSE
	db RECOVER ; becomes Roost
	db -1 ; end

HoundourEggMoves:
	db FIRE_SPIN
	db RAGE
	db COUNTER
	db SPITE
	db REVERSAL
	db -1 ; end

PhanpyEggMoves:
	db ABSORB
	db FOCUS_ENERGY
	db BODY_SLAM
	db ANCIENTPOWER
	db WATER_GUN
	db HORN_DRILL
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
	db DIZZY_PUNCH
	db RAPID_SPIN
	db JUMP_KICK
	db MACH_PUNCH
	db FIRE_PUNCH
	db ICE_PUNCH
	db THUNDERPUNCH
	db CONFUSION ; becomes Revenge
	db -1 ; end

SmoochumEggMoves:
	db DIZZY_PUNCH
	db PECK ; becomes Lovely Kiss
	db MEDITATE
	db NASTY_PLOT
	db BARRIER
	db PETAL_DANCE
	db METRONOME
	db -1 ; end

ElekidEggMoves:
	db DIZZY_PUNCH
	db SLASH ; becomes Karate Chop
	db BARRIER
	db ROLLING_KICK
	db MEDITATE
	db HAMMER_ARM
	db CROSS_CHOP
	db -1 ; end

MagbyEggMoves:
	db DIZZY_PUNCH
	db SLASH ; becomes Karate Chop
	db MEGA_PUNCH
	db BARRIER
	db SCREECH
	db CROSS_CHOP
	db THUNDERPUNCH
	db FIRE_PLAY
	db -1 ; end

MiltankEggMoves:
	db REVERSAL
	db SEISMIC_TOSS
	db HAMMER_ARM
	db MEGA_KICK
	db -1 ; end

LarvitarEggMoves:
	db PURSUIT
	db STOMP
	db FOCUS_ENERGY
	db ANCIENTPOWER
	db -1 ; end

LugiaEggMoves:
	db SLASH ; becomes Air Cutter
	db STOMP
	db FOCUS_ENERGY
	db ANCIENTPOWER
	db -1 ; end
	
HoOhEggMoves:
	db SLASH ; becomes Air Cutter
	db STOMP
	db FOCUS_ENERGY
	db ANCIENTPOWER
	db -1 ; end

CelebiEggMoves:
	db SLASH ; becomes Air Cutter
	db STOMP
	db FOCUS_ENERGY
	db ANCIENTPOWER
	db -1 ; end

NoEggMoves:
	db -1 ; end

CommonEggMovesByType::
	db NORMAL,   CHARM, COUNTER, LIGHT_SCREEN, SAFEGUARD, -1
	db FIGHTING, COUNTER, MEDITATE, ROLLING_KICK, PSYCH_UP, FOCUS_ENERGY, -1 ; PSYCH_UP becomes Cycle Foe
	db FLYING,   PURSUIT, FAINT_ATTACK, DOUBLE_TEAM, EXTREMESPEED, SWORDS_DANCE, WHIRLWIND, STEEL_WING, -1
	db POISON,   DISABLE, PURSUIT, ENCORE, HAZE, SLUDGE_BOMB, NASTY_PLOT, GIGA_DRAIN, -1
	db GROUND,   PURSUIT, ENDURE, ANCIENTPOWER, SANDSTORM, FOCUS_ENERGY, MAGNITUDE, -1
	db ROCK,     DEFENSE_CURL, ROLLOUT, ROCK_SLIDE, IRON_DEFENSE, SANDSTORM, -1
	db STEEL,    IRON_DEFENSE, RAPID_SPIN, SANDSTORM, REFLECT, -1
	db BUG,      GNAW, FAINT_ATTACK, PURSUIT, AGILITY, COTTON_SPORE, FOCUS_ENERGY, U_TURN, -1 ; BUG
	db FIRE,     CHARM, FAINT_ATTACK, SUNNY_DAY, MORNING_SUN, LIGHT_SCREEN, SAFEGUARD, -1 
	db WATER,    CHARM, HAZE, MIST, RAIN_DANCE, FIRE_SPIN, LIGHT_SCREEN, SAFEGUARD, -1 ; FIRE_SPIN becomes Aqua Ring
	db GRASS,    CHARM, LEECH_SEED, SUNNY_DAY, FIRE_SPIN, SYNTHESIS, GIGA_DRAIN, LIGHT_SCREEN, SAFEGUARD, -1; FIRE_SPIN becomes Ingrain
	db ELECTRIC, CHARM, EERIEIMPULSE, LIGHT_SCREEN, SAFEGUARD, AGILITY, EXTREMESPEED, U_TURN, -1
	db PSYCHIC,  DISABLE, LIGHT_SCREEN, SAFEGUARD, BARRIER, AMNESIA, ZEN_HEADBUTT, ANCIENTPOWER, HAZE, -1
	db ICE,      CHARM, HAZE, MIST, RAIN_DANCE, FIRE_SPIN, LIGHT_SCREEN, SAFEGUARD, -1
	db DARK,     DISABLE, FAINT_ATTACK, SWORDS_DANCE, LIGHT_SCREEN, SAFEGUARD, FOCUS_ENERGY, NASTY_PLOT, -1
	db -2

; BulbasaurAffinityMoves:
; 	db  9 << 4 | GROUND,   SPIKES
; 	db 11 << 4 | WATER,    OCTAZOOKA
; 	db 11 << 4 | BUG,      SIGNAL_BEAM
