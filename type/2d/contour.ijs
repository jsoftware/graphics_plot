NB. contour plot commands
NB.
NB. plot_contour

CONTRI=: 0 1 4, 0 2 4, 1 4 3,: 2 4 3
CONPTS=: 0 0 1 0 0.5 0.5, 0 0 0 1 0.5 0.5, 1 0 0.5 0.5 1 1,: 0 1 0.5 0.5 1 1

NB. =========================================================
plot_contour=: 3 : 0

'x y z'=. y { Data

signal^:(2 ~: #$z) 'need data matrix for contour plot'

dat=. |: z
'rws cls'=. shape=. $dat
dat=. ,dat
min=. <./dat
max=. >./dat
dat=. (CONTOURLEVELS + 1) * (dat - min) % max - min

NB. ---------------------------------------------------------
NB. build table of triangles
ndx=. ,/ 2 2 ,;._3 i. shape
dat=. |: ndx { dat
lvl=. *./ dat ="1 <.{. dat
dat=. dat, (lvl * 0.001) + 0.25 * +/ dat
dat=. ,/ 0 1 |: CONTRI { dat
xy=. 4 # ((#ndx) $ (i.cls-1)),.(cls-1) # i.rws-1
txy=. xy,.(#dat) $ 0 1 2 3
msk=. +./"1 (~:{."1) <. dat
txy=. msk # txy
dat=. msk # dat
mat=. (<.dat),.dat,.txy

NB. ---------------------------------------------------------
res=. i.0 0
for_m. mat do.
  res=. res, contri m
end.

NB. ---------------------------------------------------------
lvl=. {."1 res
pos=. }."1 res
pos=. pos % ($pos) $ <: |. shape
pos=. fitgrafxy pos
clr=. getbandcolor lvl
drawline iDATA;clr;PENSIZE;pos
)

NB. =========================================================
contri=: 3 : 0
'l0 l1 l2 v0 v1 v2 x y i'=. y
pts=. i { CONPTS
min=. <./ l0,l1,l2
max=. >./ l0,l1,l2
lvl=. min + 1 + i. max-min    NB. all except least
ndx=. (#. lvl >:/ v0,v1,v2) { 0 0 1 2 2 1 0 3
res=. i.0 5
for_lv. lvl do.
  select. lv_index { ndx
  case. 0 do.
    res=. res, contri1 lv,v0,v1,v2,pts
  case. 1 do.
    res=. res, contri1 lv,v0,v2,v1,0 1 4 5 2 3 { pts
  case. 2 do.
    res=. res, contri1 lv,v1,v2,v0,2 3 4 5 0 1 { pts
  case. 3 do.
  end.
end.
res + 0 ,. (0 _1 + $res) $ x,y
)

NB. =========================================================
contri1=: 3 : 0
'lvl v0 v1 v2 x0 y0 x1 y1 x2 y2'=. y
p=. (lvl - v0) % v2 - v0
q=. (lvl - v1) % v2 - v1
lvl, ((p * x2,y2) + (-.p) * x0,y0), (q * x2,y2) + (-.q) * x1,y1
)
