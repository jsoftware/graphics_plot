NB. stick plot commands
NB.
NB. plot3d_stick

NB. =========================================================
plot3d_stick=: 3 : 0

'x y z'=. conform3d y { Data
dat=. x ,"0 1 y ,"0 z
minz=. ZInt <. <./ , {:"1 dat
bas=. minz 2}"1 dat
dat=. bas ,"1 dat
dat=. ,/ _3 [\"1 dat
dat=. project ,/dat
dat=. fitgrafxy3d }:"1 dat
dat=. _2 ,\ dat
drawline iDATA;(getitemcolor'');PENSIZE;dat
)
