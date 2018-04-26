NB. bezier

NB. =========================================================
NB. bezierarc
NB.
NB. original from Oleg Kobchenko
NB.
NB. y is:
NB.   xy center, radius, angle1, angle2 (degrees)
bezierarc=: 3 : 0
'x y h a b'=. y
off=. 90
t1=. rfd 360 | a - off
t2=. rfd 360 | b - off
th=. 6 %~ 2p1 | t2 - t1
'c c1 s s1'=. (cos , sin) th,t1
x0=. x1=. 1 [ y0=. 0
'x3 y3'=. c,s
x2=. 3%~ (8*cos-:th)-x0+x3+3*x1
y2=. y3-(-x2-x3)%-tan th
y1=. 3%~ (8*sin-:th)-y0+y3+3*y2
r=. (x0,x1,x2,x3),:y0,y1,y2,y3
r=. r +/ . *~ (c1,-s1),:s1,c1
r=. r (+/ . *)^:(i.6)~ (c,-s),:s,c
,@|:"2 (x,y)+"2 h*r
)
