NB. dot (=point)

NB. =========================================================
plot_dot=: 3 : 0
dat=. getgrafmat y
clr=. getitemcolor #dat
for_d. dat do.
  drawdot iDATA;(d_index{clr);PENSIZE;_2[\d
end.
)

plot_point=: plot_dot
