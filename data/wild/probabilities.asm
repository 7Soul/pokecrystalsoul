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

WaterMonProbTable:
	mon_prob 40,  0 ; 40% chance
	mon_prob 80,  1 ; 30% chance
	mon_prob 100, 2 ; 20% chance
