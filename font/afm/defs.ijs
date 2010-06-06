NB. defs

NB. =========================================================
NB. basic font names
NB. note the first 4 are the PostScript Type 1 fonts
NB. others are treated on an ad hoc basis.
NB. for the nonce, these are 2 chinese fonts
j=. 0 : 0
Helvetica
Courier
Times-Roman
Symbol
MSung-Light
STSong-Light
)

FONTNAMES=: <;._2 j
FONTNAMESLC=: <;._2 tolower j -. '-'
FONTNAMESNH=: <;._2 j -. '-'

NB. =========================================================
NB. PostScript Type 1 fonts:
j=. 0 : 0
Helvetica
Helvetica-Bold
Helvetica-Oblique
Helvetica-BoldOblique
Courier
Courier-Bold
Courier-Oblique
Courier-BoldOblique
Times-Roman
Times-Bold
Times-Italic
Times-BoldItalic
Symbol
ZapfDingbats
)

PSFONTNAMES=: <;._2 j
PSFONTNAMESLC=: <;._2 tolower j -. '-'
PSFONTNAMESNH=: <;._2 j -. '-'

NB. =========================================================
NB. table of other family names used for isigraph:

NB. separate unix/windows not needed...
NB. ms=. 0 : 0
NB. 0 Arial
NB. 0 Sans
NB. 1 Courier
NB. 1 Lucida Console
NB. 1 Mono
NB. 2 Times
NB. 2 Times New Roman
NB. 2 Serif
NB. 3 Symbol
NB. )
NB.
NB. ux=. 0 : 0
NB. 0 Sans
NB. 0 SansSerif
NB. 1 Monospace
NB. 2 Serif
NB. 2 Times
NB. 2 Times New Roman
NB. 3 SansSerif
NB. )
NB.
NB. fnt=. <;._2 IFUNIX pick ms;ux

fnt=. <;._2  (0 : 0)
0 Arial
0 Sans
0 SansSerif
1 Courier
1 Lucida Console
1 Mono
1 Monospace
2 Serif
2 Times
2 Times New Roman
2 Times New Roman
3 Symbol
)

ISIFONTNAMES=: 2 }. each fnt
ISIFONTNAMESLC=: tolower each ISIFONTNAMES
ISIFONTNAMESX=: 0 ". &> 2 {. each fnt
