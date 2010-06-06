NB. surface plot commands
NB.
NB. plot3d_surface   plot surface
NB. conform3d        conform 3d
NB. cfserr           conform error msg

NB. =========================================================
plot3d_surface=: 3 : 0

NB. check data conforms:
'x y z'=. conform3d y { Data

NB. build xyz positions:
pos=. x ,"0 1 y ,"0 z

NB. project:
pos=. ($pos) $ ,project ,/ pos

NB. z values for rectangles:
zpos=. ,tilesum z

NB. d values for rectangles:
dpos=. ,tilesum {:"1 pos
ndx=. \:dpos

NB. create tiles:
pos=. ,/,/ tiles }:"1 pos
pos=. fitgrafxy3d pos
pos=. _8[\,pos
pos=. ndx{pos

j=. ndx { (#BANDCOLOR) ncile zpos
clr=. j { BANDCOLOR

drawpoly iDATA;EDGECOLOR;(MESH*EDGESIZE);clr;pos
)

