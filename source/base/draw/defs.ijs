NB. utilities:
NB.   Box3d           3d box
NB.   Markers         point markers

Box3d=: _3[\,".;._2 (0 : 0)
0 0 0 0 0 1
0 0 0 0 1 0
0 0 0 1 0 0
0 0 1 0 1 1
0 0 1 1 0 1
0 1 0 0 1 1
0 1 0 1 1 0
1 0 0 1 0 1
1 0 0 1 1 0
0 1 1 1 1 1
1 0 1 1 1 1
1 1 0 1 1 1
)

NB. Markers:
NB. Cross,Plus,Diamond,Delta,Del,Dsolid,Square
NB. Markers=: (5&*)@".;._2 (0 : 0)
NB. _1 1 1 _1 0 0 _1 _1 1 1
NB. _1 0 1 0 0 0 0 1 0 _1
NB. 0 1 1 0 0 _1 _1 0 0 1
NB. 0 1.5 1.25 _0.5 _1.25 _0.5 0 1.5 0 1.5
NB. 0 _1.5 1.25 0.5 _1.25 0.5 0 _1.5 0 _1.5
NB. 1.5*0 1 1 0 0 _1 _1 0 0 1
NB. 1 _1 1 _1 1 1 _1 1 _1 _1
NB. )
