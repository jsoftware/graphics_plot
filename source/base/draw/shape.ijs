NB. shape.ijs
NB.
NB. platonic solids are centred at origin with a maximum vertex radius of 1:
NB.   cube
NB.   dodecahedron
NB.   icosahedron
NB.   octahedron
NB.   tetrahedron

NB. =========================================================
cube=: 3 : 0
v=. normalize 2 2 2#: i.8
ndx=. 0 2 6 4, 4 6 7 5, 1 5 7 3, 0 1 3 2, 2 3 7 6,: 0 4 5 1
ndx{v
)

NB. =========================================================
NB. dodecahedron (12 faces)
dodecahedron=: 3 : 0
x=. 2 o. 1r5p1
y=. % <: +: x
a=. |: 2 1 o./ o. (+:i.5)%5
b=. |: 2 1 o./ o. (>:+:i.5)%5
v=. normalize (a,.0),((+:a*x),.1),((+:b*x),.y),b,.>:y
ndx=. 0 4 3 2 1, 0 1 6 10 5, 1 2 7 11 6, 2 3 8 12 7, 3 4 9 13 8
ndx=. ndx, 4 0 5 14 9, 5 10 15 19 14, 6 11 16 15 10, 7 12 17 16 11
ndx=. _5[\ ndx, 8 13 18 17 12, 9 14 19 18 13, 15 16 17 18 19
ndx{v
)

NB. =========================================================
NB. icosahedron (20 faces)
icosahedron=: 3 : 0
's c'=. 1 2 o. 1r5p1
x=. %: -. % 4 * *: s
y=. %: (1++:c) % 2++:c
a=. |: (2 1 o./ o. (+:i.5)%5) % +:s
b=. |: (2 1 o./ o. (>:+:i.5)%5) % +:s
v=. normalize 0,(a,.x),(b,.x+y),0 0,y++:x
ndx=. 0 2 1, 0 3 2, 0 4 3, 0 5 4, 0 1 5, 1 2 6, 2 3 7, 3 4 8
ndx=. ndx, 4 5 9, 5 1 10, 1 6 10, 2 7 6, 3 8 7, 4 9 8, 5 10 9
ndx=. _3[\ndx, 11 6 7, 11 7 8, 11 8 9, 11 9 10, 11 10 6
ndx{v
)

NB. =========================================================
NB. octahedron
octahedron=: 3 : 0
v=. normalize 0 0 1, 1 0 0, 0 1 0, _1 0 0, 0 _1 0 ,: 0 0 _1
ndx=. 0 1 2, 0 2 3, 0 3 4, 0 4 1, 5 2 1, 5 3 2, 5 4 3,: 5 1 4
ndx{v
)

NB. =========================================================
NB. tetrahedron
tetrahedron=: 3 : 0
r3=. -%%:3
r2=. %:2
r23=. %:2r3
v=. normalize (0,0,%:3), (0, (+:r23),r3), ((-r2),(-r23),r3),: r2,(-r23),r3
ndx=. 0 1 2, 0 2 3, 0 3 1,: 1 3 2
ndx{v
)

NB. =========================================================
NB. normalize
NB. normalize vertices to centered at origin and max unit radius.
normalize=: 3 : 0
v=. (-"1 +/ % #) y
cleanz v % >./ dist"1 v
)
