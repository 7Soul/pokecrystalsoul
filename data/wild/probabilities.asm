mon_prob: MACRO
; percent, index
	db \1, \2 * 2
ENDM

GrassMonProbTable:
	mon_prob 24,  0 ; 24% chance
	mon_prob 49,  1 ; 24% chance
	mon_prob 71,  2 ; 23% chance
	mon_prob 81,  3 ; 10% chance
	mon_prob 91,  4 ; 10% chance
	mon_prob 98,  5 ;  7% chance
	mon_prob 100, 6 ;  2% chance

WaterMonProbTable:
	mon_prob 40,  0 ; 40% chance
	mon_prob 80,  1 ; 30% chance
	mon_prob 100, 2 ; 20% chance
