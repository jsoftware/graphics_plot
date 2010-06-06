NB. line plot commands
NB.
NB. plot3d_line

NB. =========================================================
NB. plot3d_line
NB.
NB. draws within Gxywh

plot3d_line=: 3 : 0

'x y z'=. y { Data

dat=. 1 |: (x ,: y),"2 1 citemize z
shape=. $dat
dat=. shape $ , project ,/dat
dat=. _2[\ ,}:"1 dat
dat=. fitgrafxy3d dat
dat=. (-+:1{shape) [\ ,dat

clr=. getitemcolor #dat

if. *./ PENSTYLE=0 do.
  drawline iDATA;clr;PENSIZE;dat
else.
  sty=. PENSTYLE $~ #dat
  drawpline iDATA;sty;clr;PENSIZE;dat
end.
)

