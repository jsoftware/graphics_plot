NB. init

coclass 'jafm'
NB. init
NB.
NB. In Plot, fonts are stored internally as a five-element
NB. integer list.
NB.
NB.   0  - font family as index into font table
NB.   1  - style 0=normal,1=bold,2=italic,3=bolditalic
NB.   2  - size
NB.   3  - angle in degrees
NB.   4  - underline flag
NB.
NB. the 4 basic postscript families are included:
NB.
NB.   0 helvetica (windows: arial)
NB.   1 courier
NB.   2 times roman (windows: times new roman)
NB.   3 symbol/zapfdingbats
NB.
NB. e.g.
NB.
NB.   0 1 20 90 0 = helvetica-bold 20pt rotated 90 deg.

NB. =========================================================
NB. create 'font';'fontsize
NB.
NB. this initializes an afm font object
NB.
NB. font must be one of the standard names or index into same
NB.
NB. sizes are in 1000 points, except for Widths which
NB. are scaled to the font size
create=: 3 : 0
'font size'=. y
if. -. ischar font do.
  font=. font pick PSFONTNAMES
end.
fnt=. font -. '-'
Name=: font
Size=: size
Ascender=: 0
0!:100 (fnt,'_FontMetrics')~
mat=. (fnt,'_CharMetrics')~
Chars=: a. {~ 0 {"1 mat
Widths=: (1 {"1 mat) * Size % 1000
Boxes=: 2 }."1 mat
AscenderP=: Ascender * Size % 1000
NB. Widths and Boxes default to average for unknown Chars
Widths=: Widths, average Widths
Boxes=: Boxes, <. average Boxes
)

destroy=: codestroy
