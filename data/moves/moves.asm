; Characteristics of each move.

move: MACRO
	db \1 ; animation
	db \2 ; effect
	db \3 ; power
	db \4 | \5 ; type
	db \6 percent ; accuracy
	db \7 ; stamina cost
	db \8 percent ; effect chance
ENDM

Moves:
; entries correspond to constants/move_constants.asm
	move POUND,        EFFECT_NORMAL_HIT,         40, NORMAL,   PHYSICAL + CONTACT, 100, STA_HALF,   0
	move KARATE_CHOP,  EFFECT_NORMAL_HIT,         50, FIGHTING, PHYSICAL + CONTACT, 100, STA_BAR,   0
	move DOUBLESLAP,   EFFECT_MULTI_HIT,          15, NORMAL,   PHYSICAL + CONTACT,  85, STA_BAR,   0
	move COMET_PUNCH,  EFFECT_MULTI_HIT,          18, NORMAL,   PHYSICAL + CONTACT,  85, STA_BAR,   0
	move MEGA_PUNCH,   EFFECT_NORMAL_HIT,         80, NORMAL,   PHYSICAL + CONTACT,  85, STA_BAR,   0
	move HYPER_SONAR,  EFFECT_ACCURACY_UP_HIT,   100, NORMAL,   PHYSICAL,            90, STA_BAR, 100
	move FIRE_PUNCH,   EFFECT_BURN_HIT,           75, FIRE,     PHYSICAL + CONTACT, 100, STA_BAR,  10
	move ICE_PUNCH,    EFFECT_FREEZE_HIT,         75, ICE,      PHYSICAL + CONTACT, 100, STA_BAR,  10
	move THUNDERPUNCH, EFFECT_PARALYZE_HIT,       75, ELECTRIC, PHYSICAL + CONTACT, 100, STA_BAR,  10
	move SCRATCH,      EFFECT_NORMAL_HIT,         40, NORMAL,   PHYSICAL + CONTACT, 100, STA_HALF,   0
	move VICEGRIP,     EFFECT_NORMAL_HIT,         55, NORMAL,   PHYSICAL + CONTACT, 100, STA_BAR,   0
	move ACUPRESSURE,  EFFECT_ACUPRESSURE,         0, FLYING,   STATUS,             100, 0,         0
	move CHARGE_BEAM,  EFFECT_SP_ATK_UP_HIT,      50, ELECTRIC, SPECIAL,             90, STA_BAR,  70
	move SWORDS_DANCE, EFFECT_ATTACK_UP_2,         0, NORMAL,   STATUS,             100, STA_HALF,  0
	move AQUA_TAIL,    EFFECT_NORMAL_HIT,         90, WATER,    PHYSICAL + CONTACT,  90, STA_BAR,   0
	move GUST,         EFFECT_GUST,               40, FLYING,   SPECIAL,            100, STA_BAR,   0
	move WING_ATTACK,  EFFECT_NORMAL_HIT,         60, FLYING,   PHYSICAL,           100, STA_BAR,   0
	move WHIRLWIND,    EFFECT_FORCE_SWITCH,        0, NORMAL,   STATUS,             100, STA_HALF,  0
	move FLY,          EFFECT_FLY,                70, FLYING,   PHYSICAL + CONTACT,  85, STA_BAR,   0
	move MAGICAL_LEAF, EFFECT_ALWAYS_HIT,         60, GRASS,    SPECIAL,            100, STA_BAR,   0
	move SLAM,         EFFECT_NORMAL_HIT,         80, NORMAL,   PHYSICAL + CONTACT,  75, STA_BAR,   0
	move VINE_WHIP,    EFFECT_NORMAL_HIT,         35, GRASS,    PHYSICAL,           100, STA_HALF,   0
	move STOMP,        EFFECT_STOMP,              65, NORMAL,   PHYSICAL + CONTACT, 100, STA_BAR,  30
	move DOUBLE_KICK,  EFFECT_DOUBLE_HIT,         30, FIGHTING, PHYSICAL + CONTACT, 100, STA_BAR,   0
	move MEGA_KICK,    EFFECT_NORMAL_HIT,        120, NORMAL,   PHYSICAL + CONTACT,  75, STA_BAR,   0
	move JUMP_KICK,    EFFECT_JUMP_KICK,         110, FIGHTING, PHYSICAL + CONTACT,  90, STA_BAR,   0
	move ROLLING_KICK, EFFECT_FLINCH_HIT,         60, FIGHTING, PHYSICAL + CONTACT,  85, STA_BAR,  30
	move SAND_ATTACK,  EFFECT_ACCURACY_DOWN,       0, GROUND,   STATUS,             100, 0,         0
	move HEADBUTT,     EFFECT_FLINCH_HIT,         70, NORMAL,   PHYSICAL + CONTACT, 100, STA_BAR,  30
	move HORN_ATTACK,  EFFECT_NORMAL_HIT,         65, NORMAL,   PHYSICAL + CONTACT, 100, STA_BAR,   0
	move FURY_ATTACK,  EFFECT_MULTI_HIT,          15, NORMAL,   PHYSICAL + CONTACT,  85, STA_BAR,   0
	move HORN_DRILL,   EFFECT_OHKO,                1, NORMAL,   PHYSICAL + CONTACT,  30, STA_BAR * 2,   0
	move TACKLE,       EFFECT_NORMAL_HIT,         40, NORMAL,   PHYSICAL + CONTACT, 100, STA_HALF,  0
	move BODY_SLAM,    EFFECT_PARALYZE_HIT,       85, NORMAL,   PHYSICAL + CONTACT, 100, STA_BAR,  30
	move WRAP,         EFFECT_TRAP_TARGET,        15, NORMAL,   PHYSICAL + CONTACT,  85, STA_BAR,   0
	move TAKE_DOWN,    EFFECT_RECOIL_HIT,         90, NORMAL,   PHYSICAL + CONTACT,  85, STA_BAR,   0
	move THRASH,       EFFECT_RAMPAGE,            90, NORMAL,   PHYSICAL + CONTACT, 100, STA_BAR,   0
	move DOUBLE_EDGE,  EFFECT_RECOIL_HIT,        120, NORMAL,   PHYSICAL + CONTACT, 100, STA_BAR * 2 + 1,   0
	move TAIL_WHIP,    EFFECT_DEFENSE_DOWN,        0, NORMAL,   STATUS,             100, 0,         0
	move POISON_STING, EFFECT_POISON_HIT,         15, POISON,   PHYSICAL,           100, STA_BAR,  30
	move TWINEEDLE,    EFFECT_POISON_MULTI_HIT,   30, BUG,      PHYSICAL,           100, STA_BAR,  30
	move GYRO_BALL,    EFFECT_SLOW_HIT,            1, STEEL,    PHYSICAL + CONTACT, 100, STA_BAR * 2 + 1,   0
	move LEER,         EFFECT_DEFENSE_DOWN,        0, NORMAL,   STATUS,             100, 0,         0
	move BITE,         EFFECT_FLINCH_HIT,         60, DARK,     PHYSICAL + CONTACT, 100, STA_BAR,  30
	move GROWL,        EFFECT_ATTACK_DOWN,         0, NORMAL,   STATUS,             100, 0,         0
	move ROAR,         EFFECT_FORCE_SWITCH,        0, NORMAL,   STATUS,             100, 0,         0
	move SING,         EFFECT_SLEEP,               0, NORMAL,   STATUS,              55, 0,         0
	move SUPERSONIC,   EFFECT_CONFUSE,             0, NORMAL,   STATUS,              55, 0,         0
	move SONICBOOM,    EFFECT_STATIC_DAMAGE,      20, NORMAL,   SPECIAL,             90, STA_HALF,  0
	move DISABLE,      EFFECT_DISABLE,             0, NORMAL,   STATUS,              55, 0,         0
	move ACID,         EFFECT_DEFENSE_DOWN_HIT,   40, POISON,   SPECIAL,            100, STA_BAR,  30
	move EMBER,        EFFECT_BURN_HIT,           40, FIRE,     SPECIAL,            100, STA_HALF, 10
	move FLAMETHROWER, EFFECT_BURN_HIT,           95, FIRE,     SPECIAL,            100, STA_BAR,  10
	move MIST,         EFFECT_MIST,                0, ICE,      STATUS,             100, 0,         0
	move WATER_GUN,    EFFECT_NORMAL_HIT,         40, WATER,    SPECIAL,            100, STA_HALF,  0
	move HYDRO_PUMP,   EFFECT_NORMAL_HIT,        120, WATER,    SPECIAL,             80, STA_BAR,   0
	move SURF,         EFFECT_NORMAL_HIT,         95, WATER,    SPECIAL,            100, STA_BAR,   0
	move ICE_BEAM,     EFFECT_FREEZE_HIT,         95, ICE,      SPECIAL,            100, STA_BAR,  10
	move BLIZZARD,     EFFECT_FREEZE_HIT,        120, ICE,      SPECIAL,             70, STA_BAR * 3,  10
	move PSYBEAM,      EFFECT_CONFUSE_HIT,        65, PSYCHIC,  SPECIAL,            100, STA_BAR,  10
	move BUBBLEBEAM,   EFFECT_SPEED_DOWN_HIT,     65, WATER,    SPECIAL,            100, STA_BAR,  10
	move AURORA_BEAM,  EFFECT_ATTACK_DOWN_HIT,    65, ICE,      SPECIAL,            100, STA_BAR,  10
	move HYPER_BEAM,   EFFECT_HYPER_BEAM,        150, NORMAL,   SPECIAL,             90, STA_BAR,   0
	move PECK,         EFFECT_NORMAL_HIT,         35, FLYING,   PHYSICAL + CONTACT, 100, STA_HALF,  0
	move DRILL_PECK,   EFFECT_NORMAL_HIT,         80, FLYING,   PHYSICAL + CONTACT, 100, STA_BAR,   0
	move SUBMISSION,   EFFECT_RECOIL_HIT,         80, FIGHTING, PHYSICAL + CONTACT,  80, STA_BAR,   0
	move LOW_KICK,     EFFECT_WEIGHT_DAMAGE,       0, FIGHTING, PHYSICAL + CONTACT, 100, STA_BAR,   0
	move COUNTER,      EFFECT_COUNTER,             1, FIGHTING, PHYSICAL + CONTACT, 100, STA_BAR,   0
	move SEISMIC_TOSS, EFFECT_LEVEL_DAMAGE,        1, FIGHTING, PHYSICAL + CONTACT, 100, STA_BAR,   0
	move NASTY_PLOT,   EFFECT_SP_ATK_UP_2,        80, DARK,     STATUS,             100, 0,         0
	move ABSORB,       EFFECT_LEECH_HIT,          20, GRASS,    SPECIAL,            100, STA_HALF,  0
	move MEGA_DRAIN,   EFFECT_LEECH_HIT,          40, GRASS,    SPECIAL,            100, STA_BAR,   0
	move LEECH_SEED,   EFFECT_LEECH_SEED,          0, GRASS,    STATUS,              90, STA_HALF,  0
	move GROWTH,       EFFECT_SP_ATK_UP,           0, NORMAL,   STATUS,             100, 0,         0
	move RAZOR_LEAF,   EFFECT_NORMAL_HIT,         55, GRASS,    PHYSICAL,            95, STA_BAR,   0
	move SOLARBEAM,    EFFECT_SOLARBEAM,         120, GRASS,    SPECIAL,            100, STA_BAR,   0
	move POISONPOWDER, EFFECT_POISON,              0, POISON,   STATUS,              75, STA_HALF,  0
	move STUN_SPORE,   EFFECT_PARALYZE,            0, GRASS,    STATUS,              75, STA_HALF,  0
	move SLEEP_POWDER, EFFECT_SLEEP,               0, GRASS,    STATUS,              75, STA_BAR + 1, 0
	move PETAL_DANCE,  EFFECT_RAMPAGE,            80, GRASS,    SPECIAL,            100, STA_BAR + 1, 0
	move STRING_SHOT,  EFFECT_SPEED_DOWN,          0, BUG,      STATUS,              95, 0,         0
	move X_SCISSOR,    EFFECT_NORMAL_HIT,         80, BUG,      PHYSICAL + CONTACT, 100, STA_BAR,   0
	move FIRE_SPIN,    EFFECT_TRAP_TARGET,        35, FIRE,     SPECIAL,             70, STA_BAR,   0
	move THUNDERSHOCK, EFFECT_PARALYZE_HIT,       40, ELECTRIC, SPECIAL,            100, STA_HALF,  10
	move THUNDERBOLT,  EFFECT_PARALYZE_HIT,       95, ELECTRIC, SPECIAL,            100, STA_BAR,  10
	move THUNDER_WAVE, EFFECT_PARALYZE,            0, ELECTRIC, STATUS,             100, STA_HALF,  0
	move THUNDER,      EFFECT_THUNDER,           120, ELECTRIC, SPECIAL,             70, STA_BAR * 3 - 1,  30
	move ROCK_THROW,   EFFECT_NORMAL_HIT,         50, ROCK,     PHYSICAL,            90, STA_BAR,   0
	move EARTHQUAKE,   EFFECT_EARTHQUAKE,        100, GROUND,   PHYSICAL,           100, STA_BAR * 3,   0
	move SIGNAL_BEAM,  EFFECT_CONFUSE_HIT,        75, BUG,      SPECIAL,            100, STA_BAR + 1,  10
	move DIG,          EFFECT_FLY,                60, GROUND,   PHYSICAL + CONTACT, 100, STA_BAR + 1,   0
	move TOXIC,        EFFECT_TOXIC,               0, POISON,   STATUS,              85, STA_BAR,   0
	move CONFUSION,    EFFECT_CONFUSE_HIT,        50, PSYCHIC,  SPECIAL,            100, STA_BAR,  10
	move PSYCHIC_M,    EFFECT_SP_DEF_DOWN_HIT,    90, PSYCHIC,  SPECIAL,            100, STA_BAR,  10
	move HYPNOSIS,     EFFECT_SLEEP,               0, PSYCHIC,  STATUS,              60, STA_BAR,  0
	move MEDITATE,     EFFECT_ATTACK_UP,           0, PSYCHIC,  STATUS,             100, 0,         0
	move AGILITY,      EFFECT_SPEED_UP_2,          0, PSYCHIC,  STATUS,             100, STA_HALF,  0
	move QUICK_ATTACK, EFFECT_PRIORITY_HIT,       40, NORMAL,   PHYSICAL + CONTACT, 100, STA_BAR,   0
	move RAGE,         EFFECT_RAGE,               20, NORMAL,   PHYSICAL + CONTACT, 100, STA_BAR,   0
	move TELEPORT,     EFFECT_TELEPORT,            0, PSYCHIC,  STATUS,             100, 0,         0
	move NIGHT_SHADE,  EFFECT_LEVEL_DAMAGE,        1, DARK,     SPECIAL,            100, STA_BAR,   0
	move MIMIC,        EFFECT_MIMIC,               0, NORMAL,   STATUS,             100, 0,         0
	move SCREECH,      EFFECT_DEFENSE_DOWN_2,      0, NORMAL,   STATUS,              85, STA_HALF,  0
	move DOUBLE_TEAM,  EFFECT_EVASION_UP,          0, NORMAL,   STATUS,             100, STA_HALF,  0
	move RECOVER,      EFFECT_HEAL,                0, NORMAL,   STATUS,             100, STA_BAR * 2,   0
	move HARDEN,       EFFECT_DEFENSE_UP,          0, NORMAL,   STATUS,             100, 0,         0
	move MINIMIZE,     EFFECT_EVASION_UP,          0, NORMAL,   STATUS,             100, 0,         0
	move SMOKESCREEN,  EFFECT_ACCURACY_DOWN,       0, NORMAL,   STATUS,             100, 0,         0
	move CONFUSE_RAY,  EFFECT_CONFUSE,             0, DARK,     STATUS,             100, 0,         0
	move ROCK_TOMB,    EFFECT_SPEED_DOWN_HIT,     60, ROCK,     PHYSICAL,            95, STA_BAR + 1, 100
	move DEFENSE_CURL, EFFECT_DEFENSE_CURL,        0, NORMAL,   STATUS,             100, 0,         0
	move BARRIER,      EFFECT_DEFENSE_UP_2,        0, PSYCHIC,  STATUS,             100, STA_HALF,  0
	move LIGHT_SCREEN, EFFECT_LIGHT_SCREEN,        0, PSYCHIC,  STATUS,             100, 0,         0
	move HAZE,         EFFECT_RESET_STATS,         0, ICE,      STATUS,             100, 0,         0
	move REFLECT,      EFFECT_REFLECT,             0, PSYCHIC,  STATUS,             100, 0,         0
	move FOCUS_ENERGY, EFFECT_FOCUS_ENERGY,        0, NORMAL,   STATUS,             100, 0,         0
	move WILD_STORM,   EFFECT_WILD_STORM,          1, ELECTRIC, SPECIAL,            100, STA_BAR + 1,   0
	move METRONOME,    EFFECT_METRONOME,           0, NORMAL,   STATUS,             100, 0,         0
	move MIRROR_MOVE,  EFFECT_MIRROR_MOVE,         0, FLYING,   STATUS,             100, 0,         0
	move SELFDESTRUCT, EFFECT_SELFDESTRUCT,      200, NORMAL,   PHYSICAL,           100, STA_BAR,   0
	move EGG_BOMB,     EFFECT_NORMAL_HIT,        100, NORMAL,   PHYSICAL,            75, STA_BAR * 2,   0
	move LICK,         EFFECT_PARALYZE_HIT,       20, DARK,     PHYSICAL + CONTACT, 100, STA_HALF,  30
	move SMOG,         EFFECT_POISON_HIT,         20, POISON,   SPECIAL,             70, STA_HALF,  40
	move SLUDGE,       EFFECT_POISON_HIT,         65, POISON,   SPECIAL,            100, STA_BAR,  30
	move MAKESHIFT,    EFFECT_ATTACK_UP_HIT,      50, NORMAL,   PHYSICAL,            70, STA_BAR, 100
	move FIRE_BLAST,   EFFECT_BURN_HIT,          120, FIRE,     SPECIAL,             85, STA_BAR * 3,  10
	move DARK_PULSE,   EFFECT_FLINCH_HIT,         80, DARK,     SPECIAL,            100, STA_BAR * 2,  30
	move CLAMP,        EFFECT_TRAP_TARGET,        35, WATER,    PHYSICAL + CONTACT,  85, STA_BAR,   0
	move SWIFT,        EFFECT_ALWAYS_HIT,         60, NORMAL,   SPECIAL,            100, STA_BAR + 1,   0
	move SKULL_BASH,   EFFECT_SKULL_BASH,        100, NORMAL,   PHYSICAL + CONTACT, 100, STA_BAR * 2,   0
	move SPIKE_CANNON, EFFECT_MULTI_HIT,          20, NORMAL,   PHYSICAL,           100, STA_HALF,   0
	move CONSTRICT,    EFFECT_SPEED_DOWN_HIT,     50, NORMAL,   PHYSICAL + CONTACT, 100, STA_HALF,  30
	move AMNESIA,      EFFECT_SP_DEF_UP_2,         0, PSYCHIC,  STATUS,             100, STA_HALF,  0
	move KINESIS,      EFFECT_ACCURACY_DOWN,       0, PSYCHIC,  STATUS,              80, 0,         0
	move VENOSHOCK,    EFFECT_VENOSHOCK,          65, POISON,   SPECIAL,            100, STA_BAR + 1,   0
	move INFERNO,      EFFECT_BURN_HIT,           85, FIRE,     SPECIAL,             50, STA_BAR * 2, 100
	move GLARE,        EFFECT_PARALYZE,            0, NORMAL,   STATUS,              75, STA_HALF,  0
	move DREAM_EATER,  EFFECT_DREAM_EATER,       100, PSYCHIC,  SPECIAL,            100, STA_BAR + 1,   0
	move POISON_GAS,   EFFECT_POISON,              0, POISON,   STATUS,              55, 0,         0
	move UNUSED_MOVE_2,EFFECT_MULTI_HIT,          25, ROCK,     PHYSICAL,            85, STA_BAR,   0
	move LEECH_LIFE,   EFFECT_LEECH_HIT,          40, BUG,      PHYSICAL + CONTACT, 100, STA_BAR,   0
	move STAMPEDE,     EFFECT_STAMPEDE,			  80, NORMAL,   PHYSICAL + CONTACT,  75, STA_BAR, 100
	move SKY_ATTACK,   EFFECT_SKY_ATTACK,        140, FLYING,   PHYSICAL + CONTACT,  90, STA_BAR * 3,   0
	move TRANSFORM,    EFFECT_TRANSFORM,           0, NORMAL,   STATUS,             100, 0,         0
	move BUBBLE,       EFFECT_SPEED_DOWN_HIT,     20, WATER,    SPECIAL,            100, 0,        10
	move DIZZY_PUNCH,  EFFECT_CONFUSE_HIT,        70, NORMAL,   PHYSICAL + CONTACT, 100, STA_BAR,  20
	move SPORE,        EFFECT_SLEEP,               0, GRASS,    STATUS,             100, STA_HALF,  0
	move MAGMA_STORM,  EFFECT_TRAP_TARGET,        70, FIRE,     STATUS,              75, STA_HALF,  0
	move PSYWAVE,      EFFECT_PSYWAVE,             1, PSYCHIC,  SPECIAL,            100, STA_BAR,   0
	move AIR_SLASH,    EFFECT_FLINCH_HIT,         75, FLYING,   SPECIAL,             95, STA_BAR + 1,  30
	move ACID_ARMOR,   EFFECT_DEFENSE_UP_2,        0, DARK,     STATUS,             100, STA_HALF,  0
	move CRABHAMMER,   EFFECT_NORMAL_HIT,         90, WATER,    PHYSICAL + CONTACT,  85, STA_BAR * 2,   0
	move EXPLOSION,    EFFECT_SELFDESTRUCT,      250, NORMAL,   PHYSICAL,           100, STA_BAR,   0
	move JET_STREAM,   EFFECT_JET_STREAM,         60, WATER,    SPECIAL,            100, STA_BAR,   0
	move FEATHERGALE,  EFFECT_DOUBLE_HIT,         50, FLYING,   PHYSICAL,            90, STA_BAR,   0
	move REST,         EFFECT_HEAL,                0, PSYCHIC,  STATUS,             100, STA_BAR,   0
	move ROCK_SLIDE,   EFFECT_FLINCH_HIT,         75, ROCK,     PHYSICAL,            90, STA_BAR * 2,  30
	move HYPER_FANG,   EFFECT_FLINCH_HIT,         80, NORMAL,   PHYSICAL + CONTACT,  90, STA_BAR * 2,  10
	move SHARPEN,      EFFECT_ATTACK_UP,           0, NORMAL,   STATUS,             100, 0,         0
	move CONVERSION,   EFFECT_CONVERSION,          0, NORMAL,   STATUS,             100, 0,         0
	move TRI_ATTACK,   EFFECT_TRI_ATTACK,         80, NORMAL,   SPECIAL,            100, STA_BAR * 2,  20
	move SUPER_FANG,   EFFECT_SUPER_FANG,          1, NORMAL,   PHYSICAL + CONTACT,  90, STA_BAR + 1,   0
	move SLASH,        EFFECT_NORMAL_HIT,         70, NORMAL,   PHYSICAL + CONTACT, 100, STA_BAR + 1,   0
	move SUBSTITUTE,   EFFECT_SUBSTITUTE,          0, NORMAL,   STATUS,             100, STA_HALF,  0
	move STRUGGLE,     EFFECT_NORMAL_HIT,         40, NORMAL,   PHYSICAL + CONTACT, 100, STA_BAR,   0
	move SKETCH,       EFFECT_SKETCH,              0, NORMAL,   STATUS,             100, 0,         0
	move TRIPLE_KICK,  EFFECT_TRIPLE_KICK,        10, FIGHTING, PHYSICAL + CONTACT,  90, STA_BAR,   0
	move BULK_UP,      EFFECT_ATK_DEF_UP,          0, FIGHTING, STATUS,             100, STA_HALF,  0
	move BUG_BUZZ,     EFFECT_SP_DEF_DOWN_HIT,    90, BUG,      SPECIAL,            100, STA_BAR * 2 + 1,  10
	move FIRE_FLICK,   EFFECT_FIRE_FLICK,         50, FIRE,     SPECIAL,            100, STA_BAR + 1,   0
	move NIGHTMARE,    EFFECT_NIGHTMARE,           0, DARK,     STATUS,             100, STA_BAR,   0
	move FLAME_WHEEL,  EFFECT_FLAME_WHEEL,        60, FIRE,     PHYSICAL + CONTACT, 100, STA_BAR,  10
	move SNORE,        EFFECT_SNORE,              40, NORMAL,   SPECIAL,            100, STA_BAR,  30
	move CURSE,        EFFECT_CURSE,               0, DARK,     STATUS,             100, STA_HALF,  0
	move EERIEIMPULSE, EFFECT_SP_ATK_DOWN_2,       0, ELECTRIC, STATUS,             100, STA_HALF,  0
	move CONVERSION2,  EFFECT_CONVERSION2,         0, NORMAL,   STATUS,             100, STA_HALF,  0
	move LEAF_STORM,   EFFECT_SELFSPATK_DOWN_HIT,130, GRASS,    SPECIAL,             90, STA_BAR * 3, 100
	move COTTON_SPORE, EFFECT_SPEED_DOWN_2,        0, GRASS,    STATUS,              85, STA_HALF,  0
	move REVERSAL,     EFFECT_REVERSAL,            1, FIGHTING, PHYSICAL + CONTACT, 100, STA_BAR + 1,   0
	move SPITE,        EFFECT_SPITE,               0, DARK,     STATUS,             100, STA_BAR,   0
	move POWDER_SNOW,  EFFECT_FREEZE_HIT,         40, ICE,      SPECIAL,            100, STA_BAR,  10
	move PROTECT,      EFFECT_PROTECT,             0, NORMAL,   STATUS,             100, STA_HALF,  0
	move MACH_PUNCH,   EFFECT_PRIORITY_HIT,       40, FIGHTING, PHYSICAL + CONTACT, 100, STA_BAR + 1,   0
	move SCARY_FACE,   EFFECT_SPEED_DOWN_2,        0, NORMAL,   STATUS,              90, STA_HALF,  0
	move FAINT_ATTACK, EFFECT_ALWAYS_HIT,         60, DARK,     PHYSICAL + CONTACT, 100, STA_BAR + 1,   0
	move SWEET_KISS,   EFFECT_CONFUSE,             0, NORMAL,   STATUS,              75, 0,         0
	move BELLY_DRUM,   EFFECT_BELLY_DRUM,          0, NORMAL,   STATUS,             100, STA_BAR * 2,   0
	move SLUDGE_BOMB,  EFFECT_POISON_HIT,         90, POISON,   SPECIAL,            100, STA_BAR * 2,  30
	move MUD_BOMB,     EFFECT_ACCURACY_DOWN_HIT,  65, GROUND,   SPECIAL,             85, STA_BAR + 1,  30
	move OCTAZOOKA,    EFFECT_ACCURACY_DOWN_HIT,  65, WATER,    SPECIAL,             95, STA_BAR * 2,  30
	move SPIKES,       EFFECT_SPIKES,              0, GROUND,   STATUS,             100, STA_BAR * 2,   0
	move ZAP_CANNON,   EFFECT_PARALYZE_HIT,      100, ELECTRIC, SPECIAL,             50, STA_BAR * 2, 100
	move PRISM_LIGHT,  EFFECT_PRISM_LIGHT,         0, NORMAL,   STATUS,             100, 0,         0
	move WAKEUP_SLAP,  EFFECT_WAKEUP_SLAP,        60, FIGHTING, PHYSICAL + CONTACT, 100, STA_BAR,   0
	move PERISH_SONG,  EFFECT_PERISH_SONG,         0, NORMAL,   STATUS,             100, STA_BAR,   0
	move ICY_WIND,     EFFECT_SPEED_DOWN_HIT,     55, ICE,      SPECIAL,             95, STA_BAR + 1, 100
	move BRICK_BREAK,  EFFECT_BRICK_BREAK,        75, FIGHTING, PHYSICAL + CONTACT, 100, STA_BAR + 1,   0
	move ZEN_HEADBUTT, EFFECT_FLINCH_HIT,         80, PSYCHIC,  PHYSICAL + CONTACT,  90, STA_BAR + 1,  20
	move LOCK_ON,      EFFECT_LOCK_ON,             0, NORMAL,   STATUS,             100, 0,         0
	move CLOSE_COMBAT, EFFECT_CLOSE_COMBAT,      120, FIGHTING, PHYSICAL + CONTACT, 100, STA_BAR * 3, 100
	move SANDSTORM,    EFFECT_SANDSTORM,           0, ROCK,     STATUS,             100, STA_HALF,  0
	move GIGA_DRAIN,   EFFECT_LEECH_HIT,          75, GRASS,    SPECIAL,            100, STA_BAR * 3,   0
	move ENDURE,       EFFECT_ENDURE,              0, NORMAL,   STATUS,             100, 0,         0
	move CHARM,        EFFECT_ATTACK_DOWN_2,       0, NORMAL,   STATUS,             100, STA_HALF,  0
	move ROLLOUT,      EFFECT_ROLLOUT,            30, ROCK,     PHYSICAL + CONTACT,  90, STA_BAR,   0
	move FALSE_SWIPE,  EFFECT_FALSE_SWIPE,        40, NORMAL,   PHYSICAL + CONTACT, 100, STA_BAR,   0
	move SWAGGER,      EFFECT_SWAGGER,             0, NORMAL,   STATUS,              90, STA_HALF, 100
	move FIRE_PLAY,    EFFECT_FIRE_PLAY,          50, FIRE,     PHYSICAL + CONTACT, 100, STA_BAR,   0
	move SPARK,        EFFECT_PARALYZE_HIT,       65, ELECTRIC, PHYSICAL,           100, STA_BAR,  30
	move FURY_CUTTER,  EFFECT_FURY_CUTTER,        10, BUG,      PHYSICAL + CONTACT,  95, STA_BAR,   0
	move STEEL_WING,   EFFECT_DEFENSE_UP_HIT,     70, STEEL,    PHYSICAL + CONTACT,  90, STA_BAR * 2,  10
	move MEAN_LOOK,    EFFECT_MEAN_LOOK,           0, NORMAL,   STATUS,             100, 0,         0
	move ATTRACT,      EFFECT_ATTRACT,             0, NORMAL,   STATUS,             100, 0,         0
	move SLEEP_TALK,   EFFECT_SLEEP_TALK,          0, NORMAL,   STATUS,             100, 0,         0
	move HEAL_BELL,    EFFECT_HEAL_BELL,           0, NORMAL,   STATUS,             100, STA_HALF,  0
	move HARMONY,      EFFECT_MOD_TYPE,            0, NORMAL,   STATUS,             100, 0,         0
	move HAMMER_ARM,   EFFECT_SELFSPEED_DOWN_HIT,100, FIGHTING, PHYSICAL + CONTACT,  90, STA_BAR * 2,   0
	move LEAF_SHIELD,  EFFECT_LEAF_SHIELD,         1, GRASS,    STATUS,             100, 0,         0
	move SAFEGUARD,    EFFECT_SAFEGUARD,           0, NORMAL,   STATUS,             100, 0,         0
	move PAIN_SPLIT,   EFFECT_PAIN_SPLIT,          0, NORMAL,   STATUS,             100, 0,         0
	move SACRED_FIRE,  EFFECT_SACRED_FIRE,       100, FIRE,     PHYSICAL,            95, STA_BAR * 3,  50
	move MAGNITUDE,    EFFECT_MAGNITUDE,           1, GROUND,   PHYSICAL,           100, STA_BAR,   0
	move DYNAMICPUNCH, EFFECT_CONFUSE_HIT,        70, FIGHTING, PHYSICAL + CONTACT,  85, STA_BAR, 100
	move MEGAHORN,     EFFECT_NORMAL_HIT,        100, BUG,      PHYSICAL + CONTACT,  85, STA_BAR * 3,   0
	move ZOOM_FLIGHT,  EFFECT_CONFUSE_HIT,        60, BUG,      PHYSICAL + CONTACT, 100, STA_BAR + 1,  30
	move BATON_PASS,   EFFECT_BATON_PASS,          0, NORMAL,   STATUS,             100, STA_BAR * 3,   0
	move ENCORE,       EFFECT_ENCORE,              0, NORMAL,   STATUS,             100, 0,         0
	move PURSUIT,      EFFECT_PURSUIT,            40, DARK,     PHYSICAL + CONTACT, 100, STA_BAR,   0
	move RAPID_SPIN,   EFFECT_RAPID_SPIN,         20, NORMAL,   PHYSICAL + CONTACT, 100, STA_BAR,   0
	move FELL_STINGER, EFFECT_FELL_STINGER,       50, BUG,      PHYSICAL + CONTACT, 100, STA_BAR,   0
	move IRON_TAIL,    EFFECT_DEFENSE_DOWN_HIT,  100, STEEL,    PHYSICAL + CONTACT,  75, STA_BAR * 2 + 1, 30
	move METAL_CLAW,   EFFECT_ATTACK_UP_HIT,      50, STEEL,    PHYSICAL + CONTACT,  95, STA_BAR + 1,  10
	move VITAL_THROW,  EFFECT_ALWAYS_HIT,         70, FIGHTING, PHYSICAL + CONTACT, 100, STA_BAR + 1,   0
	move MORNING_SUN,  EFFECT_MORNING_SUN,         0, NORMAL,   STATUS,             100, STA_BAR,   0
	move SYNTHESIS,    EFFECT_SYNTHESIS,           0, GRASS,    STATUS,             100, STA_BAR,   0
	move MOONLIGHT,    EFFECT_MOONLIGHT,           0, NORMAL,   STATUS,             100, STA_BAR,   0
	move HIDDEN_POWER, EFFECT_HIDDEN_POWER,        1, NORMAL,   SPECIAL,            100, STA_BAR,   0
	move CROSS_CHOP,   EFFECT_NORMAL_HIT,        100, FIGHTING, PHYSICAL + CONTACT,  80, STA_BAR * 2,   0
	move TWISTER,      EFFECT_TWISTER,            40, WATER,    SPECIAL,            100, STA_BAR,  20
	move RAIN_DANCE,   EFFECT_RAIN_DANCE,          0, WATER,    STATUS,              90, STA_HALF,  0
	move SUNNY_DAY,    EFFECT_SUNNY_DAY,           0, FIRE,     STATUS,              90, STA_HALF,  0
	move CRUNCH,       EFFECT_SP_DEF_DOWN_HIT,    80, DARK,     PHYSICAL + CONTACT, 100, STA_BAR + 1,  20
	move MIRROR_COAT,  EFFECT_MIRROR_COAT,         1, PSYCHIC,  SPECIAL,            100, STA_BAR,   0
	move PSYCH_UP,     EFFECT_PSYCH_UP,            0, NORMAL,   STATUS,             100, 0,         0
	move EXTREMESPEED, EFFECT_PRIORITY_HIT,       80, NORMAL,   PHYSICAL + CONTACT, 100, STA_BAR,   0
	move ANCIENTPOWER, EFFECT_ALL_UP_HIT,         60, ROCK,     SPECIAL,            100, STA_BAR,  10
	move SHADOW_BALL,  EFFECT_SP_DEF_DOWN_HIT,    80, DARK,     SPECIAL,            100, STA_BAR * 2,  20
	move FUTURE_SIGHT, EFFECT_FUTURE_SIGHT,       80, PSYCHIC,  SPECIAL,             90, STA_BAR * 2,   0
	move ROCK_SMASH,   EFFECT_DEFENSE_DOWN_HIT,   40, FIGHTING, PHYSICAL,           100, STA_BAR + 1,  50
	move WHIRLPOOL,    EFFECT_TRAP_TARGET,        15, WATER,    SPECIAL,             70, STA_BAR,   0
	move POWER_GEM,    EFFECT_NORMAL_HIT,         80, ROCK,     SPECIAL,            100, STA_BAR * 2,   0
	move GUNK_SHOT,    EFFECT_POISON_HIT,        120, POISON,   PHYSICAL,            80, STA_BAR * 3,  30
	move SILVER_WIND,  EFFECT_ALL_UP_HIT,         60, BUG,      SPECIAL,            100, STA_BAR,  10
	move WILL_O_WISP,  EFFECT_BURN,                0, FIRE,     STATUS,             100, 0,         0

VarMoves::
	move DOUBLESLAP,   EFFECT_MULTI_HIT,          25, GROUND,   PHYSICAL,            90, STA_HALF,  0 ; BONE_RUSH
	move DOUBLESLAP,   EFFECT_MULTI_HIT,          15, BUG,      PHYSICAL,            85, STA_HALF,  0 ; PIN_MISSILE
	move DOUBLESLAP,   EFFECT_MULTI_HIT,          25, ROCK,     PHYSICAL,            85, STA_HALF,  0 ; ROCK_BLAST
	move DOUBLESLAP,   EFFECT_MULTI_HIT,          25, ICE,      PHYSICAL,            85, STA_HALF,  0 ; ICICLE_SPEAR
	move ACUPRESSURE,  EFFECT_ACUPRESSURE,         0, GROUND,   STATUS,             100, STA_HALF,  0 ; GATHER_SAND
	move FIRE_PLAY,    EFFECT_FIRE_PLAY,          50, WATER,    PHYSICAL,           100, STA_BAR,   0 ; TIDE_CLASH
	move FIRE_PLAY,    EFFECT_FIRE_PLAY,          50, FLYING,   PHYSICAL + CONTACT, 100, STA_BAR,   0 ; FLUTTER_CLAP
	move CROSS_CHOP,   EFFECT_NORMAL_HIT,        100, ROCK,     PHYSICAL,            80, STA_BAR * 2,   0 ; STONE_EDGE
	move DOUBLE_EDGE,  EFFECT_RECOIL_HIT,        120, FLYING,   PHYSICAL + CONTACT, 100, STA_BAR * 2 + 1,   0 ; BRAVE_BIRD
	move DOUBLE_EDGE,  EFFECT_RECOIL_HIT,        120, GRASS,    PHYSICAL + CONTACT, 100, STA_BAR * 2 + 1,   0 ; WOOD_HAMMER
	move DOUBLE_EDGE,  EFFECT_RECOIL_HIT_BURN,   120, FIRE,     PHYSICAL + CONTACT, 100, STA_BAR * 2 + 1,  10 ; FLARE_BLITZ
	move PECK,         EFFECT_SLOW_HIT,            1, ELECTRIC, SPECIAL,            100, STA_BAR * 2, 0 ; ELECTRO_BALL
	move PECK,         EFFECT_ALWAYS_HIT,         80, FIGHTING, SPECIAL,            100, STA_BAR + 1, 0 ; AURA_SPHERE
	move PECK,         EFFECT_ALWAYS_HIT,         70, STEEL,    PHYSICAL,           100, STA_BAR + 1, 0 ; SMART_STRIKE
	move QUICK_ATTACK, EFFECT_PRIORITY_HIT,       40, ICE,      PHYSICAL,           100, STA_BAR,   0 ; ICE_SHARD
	move QUICK_ATTACK, EFFECT_PRIORITY_HIT,       40, ROCK,     PHYSICAL + CONTACT, 100, STA_BAR,   0 ; ACCELEROCK
	move QUICK_ATTACK, EFFECT_PRIORITY_HIT,       40, WATER,    SPECIAL,            100, STA_BAR,   0 ; AQUA_JET
	move MACH_PUNCH,   EFFECT_PRIORITY_HIT,       40, STEEL,    PHYSICAL + CONTACT, 100, STA_BAR,   0 ; BULLET_PUNCH
	move SLASH,        EFFECT_NORMAL_HIT,         70, DARK,     PHYSICAL + CONTACT, 100, STA_BAR + 1,   0 ; NIGHT_SLASH
	move SLASH,        EFFECT_NORMAL_HIT,         90, GRASS,    PHYSICAL + CONTACT, 100, STA_BAR + 1,   0 ; LEAF_BLADE
	move SLASH,        EFFECT_NORMAL_HIT,         60, FLYING,   SPECIAL,            100, STA_BAR,   0 ; AIR_CUTTER
	move DRILL_PECK,   EFFECT_NORMAL_HIT,         80, GRASS,    PHYSICAL,           100, STA_BAR,   0 ; SEED_BOMB
	move FAINT_ATTACK, EFFECT_ALWAYS_HIT,         60, FLYING,   PHYSICAL + CONTACT, 100, STA_BAR,   0 ; AERIAL_ACE
	move SCREECH,      EFFECT_ATTACK_DOWN_2,       0, FLYING,   STATUS,              85, STA_HALF,  0 ; FEATHERDANCE
	move HORN_DRILL,   EFFECT_OHKO,                1, GROUND,   PHYSICAL,            30, STA_BAR * 2,   0 ; FISSURE
	move HORN_DRILL,   EFFECT_OHKO,                1, ICE,      PHYSICAL,            30, STA_BAR * 2,   0 ; SHEER_COLD
	move HORN_DRILL,   EFFECT_OHKO,                1, DARK,     PHYSICAL + CONTACT,  30, STA_BAR * 2,   0 ; GUILLOTINE
	move HARDEN,       EFFECT_DEFENSE_UP,          0, WATER,    STATUS,             100, 0,         0 ; WITHDRAW
	move BARRIER,      EFFECT_DEFENSE_UP_2,        0, STEEL,    STATUS,             100, STA_HALF,  0 ; IRON_DEFENSE
	move FEATHERGALE,  EFFECT_DOUBLE_HIT,         50, GROUND,   PHYSICAL,            90, STA_BAR,   0 ; BONEMERANG
	move SHADOW_BALL,  EFFECT_SP_DEF_DOWN_HIT,    90, GRASS,    SPECIAL,            100, STA_BAR * 2,  10 ; ENERGY_BALL
	move REVERSAL,     EFFECT_REVERSAL,            1, NORMAL,   PHYSICAL + CONTACT, 100, STA_BAR,   0 ; FLAIL
	move REVERSAL,     EFFECT_REVERSAL,            1, ELECTRIC, SPECIAL,            100, STA_BAR * 3,  20 ; THUNDER_BLOW
	move ICY_WIND,     EFFECT_SPEED_DOWN_HIT,     55, GROUND,   SPECIAL,             95, STA_BAR, 100 ; MUD_SHOT
	move ICY_WIND,     EFFECT_SPEED_DOWN_HIT,    110, WATER,    SPECIAL,             95, STA_BAR * 3,  10 ; MEGA_SPLASH
	move JUMP_KICK,    EFFECT_JUMP_KICK,         110, GROUND,   PHYSICAL,            95, STA_BAR * 3,   0 ; SAND_DIVE
	move JUMP_KICK,    EFFECT_JUMP_KICK,         100, FIRE,     PHYSICAL,            90, STA_BAR + 1,   0 ; FLAME_STOMP
	move DIZZY_PUNCH,  EFFECT_CONFUSE_HIT,       110, FLYING,   SPECIAL,             70, STA_BAR * 3,  30 ; HURRICANE
	move IRON_TAIL,    EFFECT_DEFENSE_DOWN_HIT,   75, WATER,    PHYSICAL + CONTACT,  95, STA_BAR + 1,  50 ; RAZOR_SHELL
	move IRON_TAIL,    EFFECT_DEFENSE_DOWN_HIT,   75, FIGHTING, PHYSICAL + CONTACT, 100, STA_BAR + 1,  30 ; SPIRAL_KICK
	move CONSTRICT,    EFFECT_NORMAL_HIT,        120, GRASS,    PHYSICAL,            95, STA_BAR * 3,   0 ; POWER_WHIP
	move AGILITY,      EFFECT_SPEED_UP_2,          0, ROCK,     STATUS,             100, STA_HALF,  0 ; ROCK_POLISH
	move LICK,         EFFECT_PARALYZE_HIT,       70, ELECTRIC, PHYSICAL + CONTACT, 100, STA_BAR * 2,  30 ; SHOCK_STING
	move LICK,         EFFECT_PARALYZE_HIT,       40, PSYCHIC,  SPECIAL,            100, STA_BAR, 20 ; PSYSHOCK
	move SEISMIC_TOSS, EFFECT_LEVEL_DAMAGE,        1, ROCK,     PHYSICAL,           100, STA_BAR, 0 ; ROCK_TUMBLE
	move SKULL_BASH,   EFFECT_SKULL_BASH,        120, GRASS,    PHYSICAL,           100, STA_BAR * 2 + 1,   0 ; BRUTAL_VINE
	move DOUBLE_KICK,  EFFECT_DOUBLE_HIT,         35, NORMAL,   PHYSICAL + CONTACT, 100, STA_BAR + 1,   0 ; DOUBLE_HIT
	move DARK_PULSE,   EFFECT_FLINCH_HIT,         80, WATER,    PHYSICAL,           100, STA_BAR * 2,  20 ; WATERFALL
	move DARK_PULSE,   EFFECT_FLINCH_HIT,         80, STEEL,    PHYSICAL + CONTACT, 100, STA_BAR * 2,  20 ; IRON_HEAD
	move DARK_PULSE,   EFFECT_FLINCH_HIT,         80, PSYCHIC,  PHYSICAL,           100, STA_BAR,      10 ; EXTRASENSORY
	move ABSORB,       EFFECT_FLINCH_HIT,         65, FIRE,     PHYSICAL,           100, STA_BAR,      10 ; FIRE_FANG
	move EMBER,        EFFECT_FLINCH_HIT,         65, ICE,      PHYSICAL,           100, STA_BAR,      10 ; ICE_FANG
	move PSYBEAM,      EFFECT_FLINCH_HIT,         65, ELECTRIC, PHYSICAL,           100, STA_BAR,      10 ; THUNDER_FANG
	move GROWTH,       EFFECT_SP_ATK_SP_DEF_UP,    0, PSYCHIC,  STATUS,             100, STA_BAR,       0 ; CALM_MIND
	move GROWTH,       EFFECT_DEF_SP_DEF_UP,       0, NORMAL,   STATUS,             100, STA_BAR,       0 ; COSMIC_POWER
	move RECOVER,      EFFECT_HEAL,                0, FLYING,   STATUS,             100, STA_BAR * 2,   0 ; ROOST
	move CONFUSION,    EFFECT_LOW_PRIORITY,       60, ICE,      PHYSICAL,           100, STA_BAR * 2,   0 ; AVALANCHE
	move CONFUSION,    EFFECT_LOW_PRIORITY,       60, FIGHTING, PHYSICAL + CONTACT, 100, STA_BAR * 2,   0 ; REVENGE
	move BUBBLE,       EFFECT_DEFENSE_UP_HIT,     50, STEEL,    PHYSICAL + CONTACT, 100, STA_BAR + 1,  10 ; GUARD_CLAW
	move BUBBLE,       EFFECT_NORMAL_HIT,         65, WATER,    SPECIAL,            100, STA_BAR + 1,  10 ; BRINE
	move CHARGE_BEAM,  EFFECT_TOXIC,              50, POISON,   PHYSICAL + CONTACT, 100, STA_BAR + 1,  50 ; POISON_FANG
	move SIGNAL_BEAM,  EFFECT_CONFUSE_HIT,        60, WATER,    SPECIAL,            100, STA_BAR + 1,  20 ; WATER_PULSE
