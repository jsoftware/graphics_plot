NB. poly plot commands
NB.
NB. plot3d_poly

NB. =========================================================
plot3d_poly=: 3 : 0

'x y z'=. y { Data

dat=. x ,"0 1 y ,"0 z
vert=. 1{$dat
dat=. ($dat) $ , project ,/dat
dat=. dat #~ facing dat

dist=. {:"1 dat
dat=. }:"1 dat

near=. ~.(<.-:#,dist){.sort ,dist

ndx=. /: +/"1 dist e. near
dat=. ndx{dat
dist=. ndx{dist

ndx=. \:+/"1 dist
dist=. ndx{dist
dat=. ndx{dat

dat=. ,/ dat
dat=. fitgrafxy3d dat
dat=. (-vert),\ dat


clr=. getitemcolor blockcount dat
drawpoly iDATA;EDGECOLOR;EDGESIZE;clr;dat
)
