Marts:
; entries correspond to MART_* constants
	dw MartTown0
	dw MartTown1
	dw MartTown2
	dw MartTown3
	dw MartTown4
	dw MartTown5
	dw MartTown6
	dw MartTown7
	dw MartTown8
	dw MartTown9
	dw MartCity0
	dw MartCity1
	dw MartCity2
	dw MartCity3
	dw MartCity4
	dw MartCity5
	dw MartCity6
	dw MartCity7
	dw MartCity8
	dw MartCity9
	dw MartDepartment2F0_A
	dw MartDepartment2F1_A
	dw MartDepartment2F2_A
	dw MartDepartment2F3_A
	dw MartDepartment2F4_A
	dw MartDepartment2F5_A
	dw MartDepartment2F6_A
	dw MartDepartment2F7_A
	dw MartDepartment2F8_A
	dw MartDepartment2F9_A
	dw MartDepartment2F0_B
	dw MartDepartment2F1_B
	dw MartDepartment2F2_B
	dw MartDepartment2F3_B
	dw MartDepartment2F4_B
	dw MartDepartment2F5_B
	dw MartDepartment2F6_B
	dw MartDepartment2F7_B
	dw MartDepartment2F8_B
	dw MartDepartment2F9_B
	dw MartGoldenrod5F1
	dw MartGoldenrod5F2
	dw MartGoldenrod5F3
	dw MartGoldenrod5F4
	dw MartCeladon3F
	dw MartCeladon4F
	dw MartDepartmentVitamins
	dw MartDepartmentXItems
	dw MartMahogany0_A
	dw MartMahogany0_B
	dw MartMahogany1_A
	dw MartMahogany1_B
	dw MartMahogany2_A
	dw MartMahogany2_B
	dw MartMtMoon
	dw MartUnderground
.End

MartTown0:
	db 5 ; # items
	db POKE_BALL
	db POTION
	db ANTIDOTE
	db AWAKENING
	db ESCAPE_ROPE
	db -1 ; end

MartTown1:
	db 9 ; # items
	db POKE_BALL
	db POTION
	db REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db -1 ; end

MartTown2:
MartTown3:
	db 11 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db -1 ; end

MartTown4:
	db 12 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db REPEL
	db SUPER_REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db -1 ; end

MartTown5:
MartTown6:
MartTown7:
MartTown8:
MartTown9:
	db 13 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db REPEL
	db SUPER_REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db REVIVE
	db -1 ; end

MartCity0:
	db 5 ; # items
	db POKE_BALL
	db POTION
	db ANTIDOTE
	db AWAKENING
	db ESCAPE_ROPE
	db -1 ; end

MartCity1:
	db 9 ; # items
	db POKE_BALL
	db POTION
	db REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db -1 ; end

MartCity2:
	db 11 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db -1 ; end

MartCity3:
MartCity4:
	db 13 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db REPEL
	db SUPER_REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db REVIVE
	db -1 ; end

MartCity5:
	db 13 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db REPEL
	db SUPER_REPEL
	db MAX_REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db REVIVE
	db -1 ; end

MartCity6:
MartCity7:
	db 11 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db SUPER_REPEL
	db MAX_REPEL
	db FULL_HEAL
	db ESCAPE_ROPE
	db REVIVE
	db -1 ; end

MartCity8:
	db 12 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db SUPER_REPEL
	db MAX_REPEL
	db FULL_HEAL
	db ESCAPE_ROPE
	db REVIVE
	db -1 ; end

MartCity9:
	db 8 ; # items
	db ULTRA_BALL
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db MAX_REPEL
	db FULL_HEAL
	db ESCAPE_ROPE
	db REVIVE
	db -1 ; end

MartDepartment2F0_A:
	db 3 ; # items
	db POTION
	db ANTIDOTE
	db AWAKENING
	db -1 ; end

MartDepartment2F1_A:
	db 6 ; # items
	db POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db -1 ; end

MartDepartment2F2_A:
MartDepartment2F3_A:
MartDepartment2F4_A:
	db 7 ; # items
	db POTION
	db SUPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db -1 ; end

MartDepartment2F5_A:
	db 8 ; # items
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db -1 ; end

MartDepartment2F6_A:
MartDepartment2F7_A:
	db 9 ; # items
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db -1 ; end

MartDepartment2F8_A:
MartDepartment2F9_A:
	db 6 ; # items
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db FULL_HEAL
	db -1 ; end

MartDepartment2F0_B:
	db 3 ; # items
	db POKE_BALL
	db ESCAPE_ROPE
	db REPEL
	db -1 ; end

MartDepartment2F1_B:
	db 4 ; # items
	db POKE_BALL
	db ESCAPE_ROPE
	db REPEL
	db POKE_DOLL
	db -1 ; end

MartDepartment2F2_B:
	db 5 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ESCAPE_ROPE
	db REPEL
	db POKE_DOLL
	db -1 ; end

MartDepartment2F3_B:
MartDepartment2F4_B:
	db 7 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db REVIVE
	db POKE_DOLL
	db -1 ; end

MartDepartment2F5_B:
	db 8 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db MAX_REPEL
	db REVIVE
	db POKE_DOLL
	db -1 ; end

MartDepartment2F6_B:
MartDepartment2F7_B:
MartDepartment2F8_B:
MartDepartment2F9_B:
	db 9 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db MAX_REPEL
	db REVIVE
	db POKE_DOLL
	db -1 ; end

MartGoldenrod5F1:
	db 3 ; # items
	db TM_THUNDERPUNCH
	db TM_FIRE_PUNCH
	db TM_ICE_PUNCH
	db -1 ; end

MartGoldenrod5F2:
	db 4 ; # items
	db TM_THUNDERPUNCH
	db TM_FIRE_PUNCH
	db TM_ICE_PUNCH
	db TM_HEADBUTT
	db -1 ; end

MartGoldenrod5F3:
	db 4 ; # items
	db TM_THUNDERPUNCH
	db TM_FIRE_PUNCH
	db TM_ICE_PUNCH
	db TM_ROCK_SMASH
	db -1 ; end

MartGoldenrod5F4:
	db 5 ; # items
	db TM_THUNDERPUNCH
	db TM_FIRE_PUNCH
	db TM_ICE_PUNCH
	db TM_HEADBUTT
	db TM_ROCK_SMASH
	db -1 ; end

MartCeladon3F:
	db 5 ; # items
	db TM_HIDDEN_POWER
	db TM_SUNNY_DAY
	db TM_PROTECT
	db TM_RAIN_DANCE
	db TM_SANDSTORM
	db -1 ; end

MartCeladon4F:
	db 3 ; # items
	db POKE_DOLL
	db LOVELY_MAIL
	db SURF_MAIL
	db -1 ; end

MartDepartmentVitamins:
	db 5 ; # items
	db HP_UP
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db -1 ; end

MartDepartmentXItems:
	db 7 ; # items
	db X_ACCURACY
	db GUARD_SPEC
	db DIRE_HIT
	db X_ATTACK
	db X_DEFEND
	db X_SPEED
	db X_SPECIAL
	db -1 ; end

MartMahogany0_A: ; 0 badges
	db 7 ; # items
	db TINYMUSHROOM
	db SLOWPOKETAIL
	db POKE_BALL
	db POTION
	db ANTIDOTE
	db AWAKENING
	db ESCAPE_ROPE
	db -1 ; end

MartMahogany0_B: ; 0 badges
	db 6 ; # items
	db RAGECANDYBAR
	db POKE_BALL
	db POTION
	db ANTIDOTE
	db AWAKENING
	db ESCAPE_ROPE
	db -1 ; end

MartMahogany1_A: ; 1 badge
	db 11 ; # items
	db TINYMUSHROOM
	db SLOWPOKETAIL
	db POKE_BALL
	db POTION
	db REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db -1 ; end

MartMahogany1_B: ; 1 badge
	db 10 ; # items
	db RAGECANDYBAR
	db POKE_BALL
	db POTION
	db REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db -1 ; end

MartMahogany2_A: ; 2 badges+
	db 13 ; # items
	db TINYMUSHROOM
	db SLOWPOKETAIL
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db -1 ; end

MartMahogany2_B: ; 2 badges+
	db 12 ; # items
	db RAGECANDYBAR
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db -1 ; end

MartMtMoon:
	db 6 ; # items
	db POKE_DOLL
	db FRESH_WATER
	db SODA_POP
	db LEMONADE
	db REPEL
	db PORTRAITMAIL
	db -1 ; end

MartUnderground:
	db 4 ; # items
	db ENERGYPOWDER
	db ENERGY_ROOT
	db HEAL_POWDER
	db REVIVAL_HERB
	db -1 ; end

DefaultMart:
	db 2 ; # items
	db POKE_BALL
	db POTION
	db -1 ; end
