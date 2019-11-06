mon_prob: MACRO
; percent, index
	db \1, \2 * 2
ENDM

GrassMonProbTable:
	mon_prob 24,  0 ; 24% chance
	mon_prob 49,  1 ; 24% chance
	mon_prob 71,  2 ; 23% chance
	mon_prob 82,  3 ; 11% chance
	mon_prob 93,  4 ; 11% chance
	mon_prob 97,  5 ;  4% chance
	mon_prob 100, 6 ;  3% chance
	
ShallowMonProbTable:
	mon_prob 30,  0 ; 30% chance
	mon_prob 60,  1 ; 30% chance
	mon_prob 75,  2 ; 15% chance
	mon_prob 90,  3 ; 15% chance
	mon_prob 96,  4 ; 6% chance
	mon_prob 100, 5 ; 4% chance

WaterMonProbTable:
	mon_prob 50,  0 ; 50% chance
	mon_prob 80,  1 ; 30% chance
	mon_prob 95,  2 ; 15% chance
	mon_prob 100, 3 ; 5% chance
