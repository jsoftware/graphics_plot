NB. density plot commands
NB.
NB. treated as a 2d plot, with 3d data

NB. =========================================================
plot_density=: 3 : 0

'x y z'=. y { Data

signal^:(2 ~: #$z) 'need data matrix for density plot'

j=. {(int01 #x);int01 #y
pos=. fitgrafxy ,/ ,"2 tiles >j

j=. (#BANDCOLOR) ncile ,z
clr=. j { BANDCOLOR
drawpoly iDATA;EDGECOLOR;(EDGESIZE*MESH);clr;pos
)
