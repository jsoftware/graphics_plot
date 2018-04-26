NB. contour tests

require 'graphics/gnuplot'

t0=: 3 : 0
x=. i.8
y=. i.12
DAT=: x;y;Z=: +/\+/\x+/y
LVL=: 30
)

NB. =========================================================
t1=. 3 : 0
DAT=: (];];sin */ sin) steps _3 3 50
LVL=: 20
)

NB. =========================================================
t2=. 3 : 0
x=. y=. i:2j40
Z=: x j./ y
DAT=: x;y;4 <. {."1 *. ^. Z
LVL=: 30
)

NB. =========================================================
t3=: 3 : 0
x=. range 0.4 1.6 0.025
DAT=: x;x;+/~*:<:*:x
LVL=: 10
)

NB. =========================================================
t4=: 3 : 0
x=. steps _4p1 4p1 27
r=. %:+/~*:x
f=. 2 NB. 0-4 etc.
DAT=: (cos *:r)*^-r%f
)

t4''

gset 'parametric;contour;cntrparam levels ',":LVL
gset 'view 0,0,1;nosurface'
'with lines' gsplot DAT

pd 'reset'
pd 'sub 1 2'
pd 'type contour'
pd 'aspect 1'
NB. pd 'bandcolor bgrclr'
pd 'contourlevels ',":LVL
pd DAT
pd 'new'
pd 'type density'
NB. pd 'bandcolor bgrclr'
pd 'aspect 1'
pd DAT
pd 'show'

