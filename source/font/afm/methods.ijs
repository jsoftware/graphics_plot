NB. methods
NB.
NB. following are available to an afm object

NB. =========================================================
NB. get bounding box of character or string
getbbox=: 3 : 0
(Chars i. y) { Boxes
)

NB. =========================================================
NB. getcellwid v cell width of boxed table
NB.
NB. y is boxed table
getcellwid=: 3 : 0
vec=. , y
len=. >./ # &> vec
txt=. > len {.!.({.a.) each vec
wid=. +/"1 (Chars i. txt) { Widths
($y) $ wid
)

NB. =========================================================
NB. getcolwid v column width of boxed tables
NB.
NB. y is boxed table
getcolwid=: 3 : 0
rws=. # &> y
mat=. ; y
vec=. , mat
len=. >./ # &> vec
txt=. > len {.!.({.a.) each vec
wid=. +/"1 (Chars i. txt) { Widths
wid=. ($mat) $ wid
max=. >./ wid
tab=. (; rws {.each 1) <;.1 wid
tab;max
)

NB. =========================================================
NB. getcharlen length of character
getcharlen=: 3 : 0
(Chars i. y) { Widths
)

NB. =========================================================
NB. getstrlen v length of string
getstrlen=: 3 : 0
+/ (Chars i. y) { Widths
)

NB. =========================================================
NB. getstrwid v maximum length of LF-delimited string
getstrwid=: 3 : 0
>./ getstrlen &> <;._1 LF,y
)

NB. =========================================================
NB. getstrlens cumulative lengths of string
getstrlens=: 3 : 0
+/\ (Chars i. y) { Widths
)
