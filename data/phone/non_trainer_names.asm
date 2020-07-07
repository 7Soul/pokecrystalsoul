NonTrainerCallerNames:
; entries correspond to PHONECONTACT_* constants
	dw .none
	dw .mom
	dw .bikeshop
	dw .bill
	dw .elm
	dw .buena
	dw .league

.none:     db "----------@"
.mom:      db "Mom:@"
.bill:     db "Bill:@"
.elm:      db "Prof. Elm:@"
.bikeshop: db "Bike Shop:@"
.buena:    db "Buena:<LF>   DJ@"
.league:   db "<PK><MN> League:@"
