NB. mouse

MOUSEIGNORE=: 0

NB. =========================================================
NB. mousepos v mouse position
mousepos=: 3 : 0
'x y w h'=. 4 {. 0 ". sysdata
x, h - y
)

NB. =========================================================
NB. test rectangles for hit
NB. form: rects testrect pos
NB. returns hit index, or _1 if none
NB. returns mask of hits
hitrect=: 4 : 0
if. 0 = # x do. '' return. end.
'px py'=. y NB. WINORG + y
'x y w h'=. |: x
(px >: x) *. (px <: x + w) *. (py >: y) *. (py <: y + h)
)

mmove=: ]

