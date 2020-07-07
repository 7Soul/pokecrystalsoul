HealingHPAmounts:
	dbw FRESH_WATER,   50
	dbw SODA_POP,      60
	dbw LEMONADE,      80
	dbw HYPER_POTION, 120
	dbw SUPER_POTION,  60
	dbw POTION,        20
	dbw MAX_POTION,   MAX_STAT_VALUE
	dbw FULL_RESTORE, MAX_STAT_VALUE
	dbw MOOMOO_MILK,  100
	dbw BERRY,         10
	dbw GOLD_BERRY,    30
	dbw ENERGYPOWDER,  50
	dbw ENERGY_ROOT,  200
	dbw RAGECANDYBAR,  20
	dbw BERRY_JUICE,   20
	dbw -1, 0 ; end

HealingStaminaAmounts:
	dbw FRESH_WATER,   0
	dbw SODA_POP,      0
	dbw LEMONADE,      0
	dbw HYPER_POTION,  4
	dbw SUPER_POTION,  3
	dbw POTION,        2
	dbw MAX_POTION,    5
	dbw FULL_RESTORE,  0
	dbw MOOMOO_MILK,   0
	dbw BERRY,         1
	dbw GOLD_BERRY,    2
	dbw ENERGYPOWDER,  0
	dbw ENERGY_ROOT,   0
	dbw RAGECANDYBAR,  1
	dbw BERRY_JUICE,   3
	dbw -1, 0 ; end

HealingStaminaOverTime:
	dbw FRESH_WATER,   %0011 ; 1 stamina for 3 turns
	dbw SODA_POP,      %0100 ; 1 stamina for 4 turns
	dbw LEMONADE,      %0101 ; 1 stamina for 5 turns
	dbw HYPER_POTION,  0
	dbw SUPER_POTION,  0
	dbw POTION,        0
	dbw MAX_POTION,    0
	dbw FULL_RESTORE,  %1111 ; 2 stamina for 7 turns
	dbw MOOMOO_MILK,   %1011 ; 2 stamina for 3 turns
	dbw BERRY,         0
	dbw GOLD_BERRY,    0
	dbw ENERGYPOWDER,  0
	dbw ENERGY_ROOT,   0
	dbw RAGECANDYBAR,  %0001 ; 1 stamina for 1 turns
	dbw BERRY_JUICE,   0
	dbw -1, 0 ; end
