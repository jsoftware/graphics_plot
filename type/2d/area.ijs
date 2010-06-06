NB. area plot commands
NB.
NB. plot_area
NB. makearea

NB. =========================================================
NB. plot_area

plot_area=: 3 : 0

'x y'=. 2 {. y { Data

if. 1 e. 0 > ,y do.
  signal 'area plot y-values should not be negative'
end.

x=. get01x x
y=. get01y y
clr=. getitemcolor #y

for_d. y do.
  pts=. fitgrafxy x makearea d
  drawpoly iDATA;EDGECOLOR;EDGESIZE;(d_index{clr);,pts
end.

)

NB. =========================================================
NB. rectangle size 1, bottom left at 0 0
NB. x=xaxis, y=data
makearea=: 4 : 0
(x ,. y),1 0,0 0,:0,{.y
)

