GROUP_N_A  EQU -1
MAP_N_A    EQU -1
GROUP_NONE EQU 0
MAP_NONE   EQU 0

; map struct members (see data/maps/maps.asm)
	const_def
	const MAP_MAPATTRIBUTES_BANK ; 0
	const MAP_TILESET            ; 1
	const MAP_ENVIRONMENT        ; 2
	const MAP_MAPATTRIBUTES      ; 3
	const MAP_MAPATTRIBUTES_HI   ; 4
	const MAP_LOCATION           ; 5
	const MAP_MUSIC              ; 6
	const MAP_PALETTE            ; 7
	const MAP_FISHGROUP          ; 8

; map environments (wEnvironment)
	const_def 1
	const TOWN
	const ROUTE
	const INDOOR
	const CAVE
	const ENVIRONMENT_5
	const GATE
	const DUNGEON

; map palettes (wEnvironment)
	const_def
	const PALETTE_AUTO
	const PALETTE_DAY
	const PALETTE_NITE
	const PALETTE_MORN
	const PALETTE_DARK

; FishGroups indexes (see data/wild/fish.asm)
	const_def
	const FISHGROUP_NONE
	const FISHGROUP_SHORE
	const FISHGROUP_OCEAN
	const FISHGROUP_LAKE
	const FISHGROUP_POND
	const FISHGROUP_DRATINI
	const FISHGROUP_QWILFISH_SWARM
	const FISHGROUP_REMORAID_SWARM
	const FISHGROUP_GYARADOS
	const FISHGROUP_DRATINI_2
	const FISHGROUP_WHIRL_ISLANDS
	const FISHGROUP_QWILFISH
	const FISHGROUP_REMORAID
	const FISHGROUP_QWILFISH_NO_SWARM

; connection directions (see data/maps/data.asm)
	const_def
	const EAST_F
	const WEST_F
	const SOUTH_F
	const NORTH_F

; wMapConnections
	const_def
	shift_const EAST
	shift_const WEST
	shift_const SOUTH
	shift_const NORTH

; SpawnPoints indexes (see data/maps/spawn_points.asm)
const_value = -1
	const SPAWN_N_A				; 0
	const SPAWN_HOME			; 1
	const SPAWN_DEBUG			; 2
; kanto
	const SPAWN_PALLET			; 3 
	const SPAWN_VIRIDIAN		; 4
	const SPAWN_PEWTER			; 5
	const SPAWN_CERULEAN		; 6
	const SPAWN_ROCK_TUNNEL		; 7
	const SPAWN_VERMILION		; 8
	const SPAWN_LAVENDER		; 9
	const SPAWN_SAFFRON			; a
	const SPAWN_CELADON			; b
	const SPAWN_FUCHSIA			; c
	const SPAWN_CINNABAR		; d
	const SPAWN_INDIGO			; e
; johto
	const SPAWN_NEW_BARK 		; f
	const SPAWN_CHERRYGROVE		; 10
	const SPAWN_VIOLET			; 11
	const SPAWN_UNION_CAVE		; 12
	const SPAWN_AZALEA			; 13
	const SPAWN_CIANWOOD		; 14
	const SPAWN_GOLDENROD		; 15
	const SPAWN_OLIVINE			; 16
	const SPAWN_ECRUTEAK		; 17
	const SPAWN_MAHOGANY		; 18
	const SPAWN_LAKE_OF_RAGE	; 19
	const SPAWN_BLACKTHORN		; 1a
	const SPAWN_MT_SILVER		; 1b
	const SPAWN_FAST_SHIP		; 1c
NUM_SPAWNS EQU const_value

; outdoor sprite limits (see engine/overworld/overworld.asm)
MAX_OUTDOOR_SPRITES EQU 23
SPRITE_GFX_LIST_CAPACITY EQU $20
