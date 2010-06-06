NB. axis utils

NB. =========================================================
makegridpos=: 4 : 0
if. *./ 1 = GRIDPATTERN do.
  x;x+y return.
end.
step=. # GRIDPATTERN
len=. GRIDPATTERN i. 0
off=. - <. -: len
cnt=. >. y % step
px=. off + step * i.cnt
pr=. px + len
(x+0>.px);x+pr<.y
)
