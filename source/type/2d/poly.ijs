NB. poly plot commands
NB.
NB. plot_poly

plot_poly=: 3 : 0
dat=. getgrafmat y
clr=. getitemcolor #dat
drawpoly iDATA;EDGECOLOR;EDGESIZE;clr;dat
)

