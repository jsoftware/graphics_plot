
require 'numeric stats trig'

NB. =========================================================
NB. cubicspline        - calculate cubic spline
NB. y is a 2-row matrix x ,: f(x)
NB. result is x values;coefficient matrix,one row per interval.
cubicspline=: 3 : 0
diff=. }.-}:
'x y'=. y
h=. diff x
k=. diff y
w=. 3 * diff k % *: h
n=. +:(2}.x)-_2}.x
sm=. ,~_2+#x
m=. sm$}.,(sm+0 1){.(}:h),.n,.}.h
c=. 0,w %. m
a=. }:y
b=. (k%h) - h * ((+:c) + }.c,0) % 3
d=. (diff c,0) % 3 * h
(}:x);a,.b,.c,.d
)

NB. =========================================================
NB. interspline        - interpolate spline
NB. x is a result from cubicspline
NB. y is a set of x coordinates
NB. returns corresponding f(x) values
interspline=: 4 : 0
'i m'=. x
n=. <: +/ i <:/ y
(n{m) p. y-n{i
)

NB. =========================================================
NB. try changing y
y=. 3 2 5 7 6 5 7 4
x=. i.#y
dat=. x,:y
m=. cubicspline dat
x2=. steps 0,(<:#y),50
y2=. m interspline x2
y3=. (3 lsfit dat) p. x2
y4=. (5 lsfit dat) p. x2

pd 'reset'
pd 'title Spline ',((140+i.10) { a.),'vs Cubic vs Quintic'
pd 'backcolor lightgray'
pd 'type symbol'
NB. pd 'symbolfont symbol 40 bold'
pd x;y
pd 'type line'
pd x2;y2,y3,:y4
pd 'show'
