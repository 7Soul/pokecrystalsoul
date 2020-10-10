; move ids
; indexes for:
; - Moves (see data/moves/moves.asm)
; - MoveNames (see data/moves/names.asm)
; - MoveDescriptions (see data/moves/descriptions.asm)
; - BattleAnimations (see data/moves/animations.asm)
	const_def
	const NO_MOVE      ; 00
	const POUND        ; 01
	const GNAW         ; 02
	const DOUBLESLAP   ; 03
	const COMET_PUNCH  ; 04
	const MEGA_PUNCH   ; 05
	const HYPER_SONAR  ; 06
	const FIRE_PUNCH   ; 07
	const ICE_PUNCH    ; 08
	const THUNDERPUNCH ; 09
	const SCRATCH      ; 0a
	const VICEGRIP     ; 0b
	const ACUPRESSURE  ; 0c
	const CHARGE_BEAM  ; 0d
	const SWORDS_DANCE ; 0e
	const AQUA_TAIL    ; 0f
	const GUST         ; 10
	const WING_ATTACK  ; 11
	const WHIRLWIND    ; 12
	const FLY          ; 13
	const MAGICAL_LEAF ; 14
	const SLAM         ; 15
	const VINE_WHIP    ; 16
	const STOMP        ; 17
	const DOUBLE_KICK  ; 18
	const MEGA_KICK    ; 19
	const JUMP_KICK    ; 1a
	const ROLLING_KICK ; 1b
	const SAND_ATTACK  ; 1c
	const HEADBUTT     ; 1d
	const HORN_ATTACK  ; 1e
	const FURY_ATTACK  ; 1f
	const HORN_DRILL   ; 20
	const TACKLE       ; 21
	const BODY_SLAM    ; 22
	const WRAP         ; 23
	const TAKE_DOWN    ; 24
	const THRASH       ; 25
	const DOUBLE_EDGE  ; 26
	const TAIL_WHIP    ; 27
	const POISON_STING ; 28
	const TWINEEDLE    ; 29
	const GYRO_BALL    ; 2a
	const LEER         ; 2b
	const BITE         ; 2c
	const GROWL        ; 2d
	const ROAR         ; 2e
	const SING         ; 2f
	const SUPERSONIC   ; 30
	const SONICBOOM    ; 31
	const DISABLE      ; 32
	const ACID         ; 33
	const EMBER        ; 34
	const FLAMETHROWER ; 35
	const MIST         ; 36
	const WATER_GUN    ; 37
	const HYDRO_PUMP   ; 38
	const SURF         ; 39
	const ICE_BEAM     ; 3a
	const BLIZZARD     ; 3b
	const PSYBEAM      ; 3c
	const BUBBLEBEAM   ; 3d
	const AURORA_BEAM  ; 3e
	const HYPER_BEAM   ; 3f
	const PECK         ; 40
	const DRILL_PECK   ; 41
	const SUBMISSION   ; 42
	const LOW_KICK     ; 43
	const COUNTER      ; 44
	const SEISMIC_TOSS ; 45
	const NASTY_PLOT   ; 46
	const ABSORB       ; 47
	const MEGA_DRAIN   ; 48
	const LEECH_SEED   ; 49
	const GROWTH       ; 4a
	const RAZOR_LEAF   ; 4b
	const SOLARBEAM    ; 4c
	const POISONPOWDER ; 4d
	const STUN_SPORE   ; 4e
	const SLEEP_POWDER ; 4f
	const PETAL_DANCE  ; 50
	const STRING_SHOT  ; 51
	const X_SCISSOR    ; 52
	const FIRE_SPIN    ; 53
	const THUNDERSHOCK ; 54
	const THUNDERBOLT  ; 55
	const THUNDER_WAVE ; 56
	const THUNDER      ; 57
	const ROCK_THROW   ; 58
	const EARTHQUAKE   ; 59
	const SIGNAL_BEAM  ; 5a
	const DIG          ; 5b
	const TOXIC        ; 5c
	const CONFUSION    ; 5d
	const PSYCHIC_M    ; 5e
	const HYPNOSIS     ; 5f
	const MEDITATE     ; 60
	const AGILITY      ; 61
	const QUICK_ATTACK ; 62
	const RAGE         ; 63
	const TELEPORT     ; 64
	const NIGHT_SHADE  ; 65
	const MIMIC        ; 66
	const SCREECH      ; 67
	const DOUBLE_TEAM  ; 68
	const RECOVER      ; 69
	const HARDEN       ; 6a
	const MINIMIZE     ; 6b
	const SMOKESCREEN  ; 6c
	const CONFUSE_RAY  ; 6d
	const ROCK_TOMB    ; 6e
	const DEFENSE_CURL ; 6f
	const BARRIER      ; 70
	const LIGHT_SCREEN ; 71
	const HAZE         ; 72
	const REFLECT      ; 73
	const FOCUS_ENERGY ; 74
	const WILD_STORM   ; 75
	const METRONOME    ; 76
	const MIRROR_MOVE  ; 77
	const SELFDESTRUCT ; 78
	const EGG_BOMB     ; 79
	const LICK         ; 7a
	const SMOG         ; 7b
	const SLUDGE       ; 7c
	const MAKESHIFT    ; 7d
	const FIRE_BLAST   ; 7e
	const DARK_PULSE   ; 7f
	const CLAMP        ; 80
	const SWIFT        ; 81
	const SKULL_BASH   ; 82
	const SPIKE_CANNON ; 83
	const CONSTRICT    ; 84
	const AMNESIA      ; 85
	const KINESIS      ; 86
	const VENOSHOCK    ; 87
	const INFERNO      ; 88
	const GLARE        ; 89
	const DREAM_EATER  ; 8a
	const POISON_GAS   ; 8b
	const UNUSED_MOVE_2   ; 8c
	const LEECH_LIFE   ; 8d
	const STAMPEDE     ; 8e
	const SKY_ATTACK   ; 8f
	const TRANSFORM    ; 90
	const BUBBLE       ; 91
	const DIZZY_PUNCH  ; 92
	const SPORE        ; 93
	const MAGMA_STORM  ; 94
	const PSYWAVE      ; 95
	const AIR_SLASH    ; 96
	const ACID_ARMOR   ; 97
	const UNUSED_MOVE_3   ; 98
	const EXPLOSION    ; 99
	const JET_STREAM   ; 9a
	const FEATHERGALE  ; 9b
	const REST         ; 9c
	const ROCK_SLIDE   ; 9d
	const HYPER_FANG   ; 9e
	const SHARPEN      ; 9f
	const CONVERSION   ; a0
	const TRI_ATTACK   ; a1
	const SUPER_FANG   ; a2
	const SLASH        ; a3
	const SUBSTITUTE   ; a4
	const STRUGGLE     ; a5
	const SKETCH       ; a6
	const TRIPLE_KICK  ; a7
	const BULK_UP      ; a8
	const BUG_BUZZ     ; a9
	const FIRE_FLICK   ; aa
	const NIGHTMARE    ; ab
	const FLAME_WHEEL  ; ac
	const SNORE        ; ad
	const CURSE        ; ae
	const EERIEIMPULSE ; af
	const CONVERSION2  ; b0
	const LEAF_STORM   ; b1
	const COTTON_SPORE ; b2
	const REVERSAL     ; b3
	const SPITE        ; b4
	const POWDER_SNOW  ; b5
	const PROTECT      ; b6
	const MACH_PUNCH   ; b7
	const SCARY_FACE   ; b8
	const FAINT_ATTACK ; b9
	const SWEET_KISS   ; ba
	const BELLY_DRUM   ; bb
	const SLUDGE_BOMB  ; bc
	const MUD_BOMB     ; bd
	const OCTAZOOKA    ; be
	const SPIKES       ; bf
	const ZAP_CANNON   ; c0
	const PRISM_LIGHT  ; c1
	const WAKEUP_SLAP  ; c2
	const PERISH_SONG  ; c3
	const ICY_WIND     ; c4
	const BRICK_BREAK  ; c5
	const ZEN_HEADBUTT ; c6
	const LOCK_ON      ; c7
	const CLOSE_COMBAT ; c8
	const SANDSTORM    ; c9
	const GIGA_DRAIN   ; ca
	const ENDURE       ; cb
	const CHARM        ; cc
	const ROLLOUT      ; cd
	const FALSE_SWIPE  ; ce
	const SWAGGER      ; cf
	const FIRE_PLAY    ; d0
	const SPARK        ; d1
	const FURY_CUTTER  ; d2
	const STEEL_WING  ; d3
	const MEAN_LOOK    ; d4
	const ATTRACT      ; d5
	const SLEEP_TALK   ; d6
	const HEAL_BELL    ; d7
	const HARMONY      ; d8
	const HAMMER_ARM   ; d9
	const LEAF_SHIELD  ; da
	const SAFEGUARD    ; db
	const PAIN_SPLIT   ; dc
	const SACRED_FIRE  ; dd
	const MAGNITUDE    ; de
	const DYNAMICPUNCH ; df
	const MEGAHORN     ; e0
	const ZOOM_FLIGHT  ; e1
	const BATON_PASS   ; e2
	const ENCORE       ; e3
	const PURSUIT      ; e4
	const RAPID_SPIN   ; e5
	const FELL_STINGER ; e6
	const IRON_TAIL  ; e7
	const METAL_CLAW  ; e8
	const VITAL_THROW  ; e9
	const MORNING_SUN  ; ea
	const SYNTHESIS    ; eb
	const MOONLIGHT    ; ec
	const HIDDEN_POWER ; ed
	const CROSS_CHOP   ; ee
	const TWISTER      ; ef
	const RAIN_DANCE   ; f0
	const SUNNY_DAY    ; f1
	const CRUNCH       ; f2
	const MIRROR_COAT  ; f3
	const PSYCH_UP     ; f4
	const EXTREMESPEED ; f5
	const ANCIENTPOWER ; f6
	const SHADOW_BALL  ; f7
	const FUTURE_SIGHT ; f8
	const ROCK_SMASH   ; f9
	const WHIRLPOOL    ; fa
	const POWER_GEM    ; fb
	const GUNK_SHOT    ; fc
	const SILVER_WIND  ; fd
	const WILL_O_WISP  ; fe
NUM_ATTACKS EQU const_value + -1

; Battle animations use the same constants as the moves up to this point
	const ANIM_SWEET_SCENT_2     ; ff
	const ANIM_THROW_POKE_BALL   ; 100
	const ANIM_SEND_OUT_MON      ; 101
	const ANIM_RETURN_MON        ; 102
	const ANIM_CONFUSED          ; 103
	const ANIM_SLP               ; 104
	const ANIM_BRN               ; 105
	const ANIM_PSN               ; 106
	const ANIM_SAP               ; 107
	const ANIM_FRZ               ; 108
	const ANIM_PAR               ; 109
	const ANIM_IN_LOVE           ; 10a
	const ANIM_IN_SANDSTORM      ; 10b
	const ANIM_IN_NIGHTMARE      ; 10c
	const ANIM_IN_WHIRLPOOL      ; 10d
; battle anims
	const ANIM_MISS              ; 10e
	const ANIM_ENEMY_DAMAGE      ; 10f
	const ANIM_ENEMY_STAT_DOWN   ; 110
	const ANIM_PLAYER_STAT_DOWN  ; 111
	const ANIM_PLAYER_DAMAGE     ; 112
	const ANIM_WOBBLE            ; 113
	const ANIM_SHAKE             ; 114
	const ANIM_HIT_CONFUSION     ; 115

; wNumHits uses offsets from ANIM_MISS
	const_def
	const BATTLEANIM_NONE
	const BATTLEANIM_ENEMY_DAMAGE
	const BATTLEANIM_ENEMY_STAT_DOWN
	const BATTLEANIM_PLAYER_STAT_DOWN
	const BATTLEANIM_PLAYER_DAMAGE
	const BATTLEANIM_WOBBLE
	const BATTLEANIM_SHAKE
	const BATTLEANIM_HIT_CONFUSION

	const_def
	const BONE_RUSH       ; 00
	const PIN_MISSILE     ; 01
	const ROCK_BLAST      ; 02
	const ICICLE_SPEAR    ; 03
	const GATHER_SAND     ; 04
	const TIDE_CLASH      ; 05
	const FLUTTER_CLAP    ; 06
	const STONE_EDGE      ; 07
	const BRAVE_BIRD      ; 08
	const WOOD_HAMMER     ; 09
	const FLARE_BLITZ     ; 0a
	const ELECTRO_BALL    ; 0b
	const AURA_SPHERE     ; 0c
	const SMART_STRIKE    ; 0d
	const ICE_SHARD       ; 0e
	const ACCELEROCK_MOVE ; 0f
	const AQUA_JET        ; 10
	const BULLET_PUNCH    ; 11
	const NIGHT_SLASH     ; 12
	const LEAF_BLADE      ; 13
	const AIR_CUTTER      ; 14
	const CRABHAMMER      ; 15
	const KARATE_CHOP     ; 16
	const SEED_BOMB       ; 17
	const AERIAL_ACE      ; 18
	const FEATHERDANCE    ; 19
	const FISSURE         ; 1a
	const SHEER_COLD      ; 1b
	const GUILLOTINE      ; 1c
	const WITHDRAW        ; 1d
	const IRON_DEFENSE    ; 1e
	const BONEMERANG      ; 1f
	const ENERGY_BALL     ; 20
	const FLAIL           ; 21
	const MUD_SHOT        ; 22
	const MEGA_SPLASH     ; 23
	const SAND_DIVE       ; 24
	const HURRICANE       ; 25
	const RAZOR_SHELL     ; 26
	const SPIRAL_KICK     ; 27
	const POWER_WHIP      ; 28
	const ROCK_POLISH     ; 29
	const SHOCK_STING     ; 2a
	const PSYSHOCK        ; 2b
	const ROCK_TUMBLE     ; 2c
	const BRUTAL_VINE     ; 2d
	const DOUBLE_HIT      ; 2e
	const WATERFALL       ; 2f
	const IRON_HEAD       ; 30
	const EXTRASENSORY    ; 31
	const FIRE_FANG       ; 32
	const ICE_FANG        ; 33
	const THUNDER_FANG    ; 34
	const CALM_MIND       ; 35
	const COSMIC_POWER    ; 36
	const ROOST           ; 37
	const AVALANCHE       ; 38
	const REVENGE         ; 39
	const GUARD_CLAW      ; 3a
	const BRINE           ; 3b
	const POISON_FANG     ; 3c
	const WATER_PULSE     ; 3d
