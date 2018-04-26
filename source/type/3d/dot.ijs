NB. dot (=point) plot commands
NB.
NB. plot3d_dot

NB. =========================================================
plot3d_dot=: 3 : 0

'x y z'=. y { Data

dat=. 1 |: (x ,: y),"2 1 citemize z
dat=. }:"1 project dat
dat=. ,"2 dat

rws=. #dat
cls=. {:$dat
clr=. getitemcolor #dat

rws=. 1

while. #dat do.
  drawcircle iDATA;({.clr);4;({.clr);1;_2[\{.dat
  dat=. }.dat
  clr=. 1|.clr
end.
)

plot3d_point=: plot3d_dot
