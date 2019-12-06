	const_def
	const PAL_TOWNMAP_BORDER      ; 0
	const PAL_TOWNMAP_GRASS       ; 1
	const PAL_TOWNMAP_CITY        ; 2
	const PAL_TOWNMAP_DIRT        ; 3
	const PAL_TOWNMAP_WATER       ; 4
	const PAL_TOWNMAP_SHORE       ; 5

townmappals: MACRO
rept _NARG / 2
	dn PAL_TOWNMAP_\2, PAL_TOWNMAP_\1
	shift
	shift
endr
ENDM

; gfx/pokegear/town_map.png
	townmappals SHORE,    SHORE,    SHORE,    DIRT,     DIRT,     DIRT,     DIRT,     DIRT
	townmappals WATER,    WATER,    GRASS,    CITY,     GRASS,    GRASS,    SHORE,    SHORE

	townmappals SHORE,    SHORE,    SHORE,    GRASS,    GRASS,    DIRT,     DIRT,     DIRT
	townmappals SHORE,    SHORE,    WATER,    BORDER,   BORDER,   GRASS,    SHORE,    GRASS

	townmappals SHORE,    SHORE,    SHORE,    DIRT,     DIRT,     DIRT,     DIRT,     DIRT
	townmappals BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER

	townmappals BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER
	townmappals BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER

	townmappals BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER
	townmappals BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER

	townmappals BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER
	townmappals BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER

	townmappals GRASS,    GRASS,    GRASS,    GRASS,    GRASS,    GRASS,    GRASS,    DIRT
	townmappals DIRT,     WATER,    WATER,    CITY,     CITY,     CITY,     CITY,     CITY

	townmappals GRASS,    GRASS,    GRASS,    GRASS,    GRASS,    GRASS,    GRASS,    DIRT
	townmappals DIRT,     DIRT,     WATER,    CITY,     CITY,     CITY,     CITY,     BORDER
