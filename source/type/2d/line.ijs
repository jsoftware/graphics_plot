NB. line plot commands
NB.
NB. plot_line

NB. =========================================================
NB. plot_line
NB.
NB. draws within Gxywh
plot_line=: 3 : 0
dat=. getgrafmat y
clr=. getitemcolor #dat
if. *./ PENSTYLE=0 do.
  drawline iDATA;clr;PENSIZE;dat
else.
  sty=. PENSTYLE $~ #dat
  drawpline iDATA;sty;clr;PENSIZE;dat
end.
)
