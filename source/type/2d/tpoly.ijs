NB. poly test

reg=. +.@(_1:^2:*i.%])
triangulate=. [ (,"2) 2: ]\ ] , {.@]
det=. -/ . *
area=. det@border
border=. (,.%@!@{:@$)"2
treg=. 1r2 1r3 triangulate reg 4
dat=. ({."1;{:"1) treg

pd 'reset'
pd 'type poly'
pd 'frame 1'
pd 'backcolor lightgray'
pd 'itemcolor green, blue, red, yellow'
pd dat
pd 'show'
