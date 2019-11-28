; VariableMovesNames:
; 	db FIRE_PLAY, FIRE, .FirePlayName
; 	db FIRE_PLAY, WATER, .WaterPlayName
; 	db FIRE_PLAY, FLYING, .FlyingPlayName
; 	db FIRE_PLAY, $ff
; 	db -2

; .FirePlayName:
; 	db "Kindle Clash@"

; .WaterPlayName:
; 	db "Tide Clash@"

; .FlyingPlayName:
; 	db "Flutter Clap@"

; .CrossChop:
; 	db "Cross Chop@"

; .StoneEdge:
; 	db "Stone Edge@"

; .DoubleEdge:
; 	db "Double Edge@"

; .BraveBird:
; 	db "Brave Bird@"

; .WoodHammer:
; 	db "Wood Hammer@"

; .QuickAttack:
; 	db "Quick Attack@"

; .IceShard:
; 	db "Ice Shard@"

; .Slash:
; 	db "Slash@"

; .NightSlash:
; 	db "Night Slash@"

; .LeafBlade:
; 	db "Leaf Blade@"

; .Screech:
; 	db "Screech@"

; .FeatherDance:
; 	db "Feather Dance@"

.FirePlayDesc:
	db   "Recoil if foe has"
	next "raised stats.@"

.WaterPlayDesc:
	db   "Recoil if foe has"
	next "raised stats.@"

.FlyingPlayDesc:
	db   "Raises SPD if foe"
	next "has raised stats.@"
