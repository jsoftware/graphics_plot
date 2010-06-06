NB. hilo  plot line commands
NB.
NB. plot_hilo

NB. =========================================================
plot_hilo=: 3 : 0
'x y'=. getgrafxy y
'r c'=. $y
ifclose=. 3=r
'hi lo close'=: 3$y
clr=. getitemcolor 2
hilo=. ,./x,."1 [ 2{.y
drawline iDATA;({.clr);PENSIZE;hilo
if. ifclose do.
  close=. ,x,.{:y
  drawline iDATA;({.clr);PENSIZE;close
end.
)

