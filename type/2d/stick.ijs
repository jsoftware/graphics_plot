NB. stick plot commands
NB.
NB. plot_stick

NB. =========================================================
plot_stick=: 3 : 0
dat=. getgrafmat y
dat=. _2 (4&$)\ ,dat
ydiv=. fitgrafy YDiv
dat=. ydiv 3 }"1 dat
NB. O'Byrne Jforum 3Mar06
NB. drawline iDATA;(getitemcolor'');PENSIZE;dat
drawline iDATA;(getitemcolor #dat);PENSIZE;dat
)
