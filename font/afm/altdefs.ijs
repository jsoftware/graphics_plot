NB. altdefs

NB. =========================================================
NB. PostScript Type 1 alternative font names (no hyphen):
j=. <;._2 (0 : 0)
0 arial
0 arialmt
1 helveticabold
1 helvetica,bold
1 arialbold
1 arial,bold
1 arialboldmt
2 helveticaoblique
2 helveticaitalic
2 helvetica,italic
2 arialitalic
2 arial,italic
2 arialitalicmt
3 helveticaboldoblique
3 helveticabolditalic
3 helvetica,bolditalic
3 arialbolditalic
3 arial,bolditalic
3 arialbolditalicmt
4 courier
4 couriernew
4 couriernewpsmt
5 courierbold
5 courier,bold
5 couriernewbold
5 couriernew,bold
5 couriernewpsboldmt
6 courieroblique
6 courier,italic
6 couriernewitalic
6 couriernew,italic
6 couriernewpsitalicmt
7 courierboldoblique
7 courier,bolditalic
7 couriernewbolditalic
7 couriernew,bolditalic
7 couriernewpsbolditalicmt
8 timesnewroman
8 timesnewromanps
8 timesnewromanpsmt
9 timesbold
9 timesnewromanbold
9 timesnewroman,bold
9 timesnewromanpsbold
9 timesnewromanpsboldmt
10timesitalic
10timesnewromanitalic
10timesnewroman,italic
10timesnewromanpsitalic
10timesnewromanpsitalicmt
11timesbolditalic
11timesnewromanbolditalic
11timesnewroman,bolditalic
11timesnewromanpsbolditalic
11timesnewromanpsbolditalicmt
)

PSAFONTINDEX=: 0 ". 2 {. &> j
PSAFONTNAMES=: 2 }. each j
