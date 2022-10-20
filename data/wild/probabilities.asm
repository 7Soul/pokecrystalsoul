mon_prob: MACRO
; percent, index
	db \1, \2 * 2
ENDM

GrassMonProbTable:
	mon_prob 18,  0 ; 18% chance
	mon_prob 36,  1 ; 18% chance
	mon_prob 54,  2 ; 18% chance
	mon_prob 72,  3 ; 18% chance
	mon_prob 83,  4 ; 11% chance
	mon_prob 94,  5 ; 11% chance
	mon_prob 100, 6 ;  6% chance
	
ShallowMonProbTable:
	mon_prob 20,  0 ; 20% chance
	mon_prob 40,  1 ; 20% chance
	mon_prob 60,  2 ; 20% chance
	mon_prob 75,  3 ; 15% chance
	mon_prob 90,  4 ; 15% chance
	mon_prob 100, 5 ; 10% chance

WaterMonProbTable:
	mon_prob 35,  0 ; 35% chance
	mon_prob 70,  1 ; 35% chance
	mon_prob 90,  2 ; 20% chance
	mon_prob 100, 3 ; 10% chance
