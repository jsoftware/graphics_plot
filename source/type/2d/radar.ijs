NB. radar plot commands
NB.
NB. y:  m x n matrix of m variables, each with n observations
NB. x:  ignored
NB.
NB. if YRANGE not given, the range is:
NB.     ((0 <. min) , (1 >. max)) y
NB.
NB. 0{.TICS    if tics
NB. 0{.GRIDS   if grids
NB. RTIC       (# of major tics), # of minor tics
NB.            (note this not the same as XTIC, which
NB.             is (major step, # of minor tics)

NB. =========================================================
plot_radar=: 3 : 0

dat=. 1 pick y { Data
dat=. YRANGE fit01"1 dat

rad=. -: Gw <. Gh
org=. (Gx,Gy) + -: Gw,Gh

RTIC=: 2{. RTIC,(#RTIC)}.3 1

if. {.GRIDS do.
  grd=. org ,"1 0 [ rad * }. int01 {.RTIC
  drawcircle iXGRID;GRIDCOLOR;EDGESIZE;'';grd
end.

if. {.AXES do.
  pts=. fitgrafxy makeradaraxes dat
  drawline iXAXIS;FORECOLOR;EDGESIZE;pts
end.

pts=. fitgrafxy makeradar dat
clr=. getitemcolor #pts
sty=. PENSTYLE $~ #pts
drawpline iDATA;sty;clr;PENSIZE;pts
)

NB. =========================================================
makeradar=: 3 : 0
dat=. |:y
xy=. cleanz (cos ,. sin) +: o. int01 #dat
r=. ,"2 [ 0 1 |: xy */"1 dat, {. dat
0.5 * 1 + r
)

NB. =========================================================
makeradaraxes=: 3 : 0
if. {.TICS do.
  'maj min'=. RTIC
  len=. maj * >: min
  pos=. }.int01 len
  tic=. TICMINOR,(0={.GRIDS)*TICMAJOR
  mark=. len$(min,1)#500 %~ tic
  pts=. 0 0 0 1, 0 ,. pos ,. mark,. pos
else.
  pts=. ,:0 0 0 1
end.
f=. ((cos,sin),:-@sin,cos)"0
s=. f o. +: }:int01 {:$y
pts=. ,/ ,"2 [ 1 |: s mp 0 1 |: _2 [\"1 pts
pts=. 0.5 * 1 + pts
)
