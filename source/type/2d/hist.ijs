NB. hist  plot  commands
NB.
NB. plot_hist

NB. =========================================================
plot_hist=: 3 : 0
'x y'=. 2 {. y { Data
dat=. citemize y
'r c'=. $dat
if. r ~: 1 do.
  signal 'Histogram should have only one data set.'
end.
pos=. makehist dat
drawrect iDATA;EDGECOLOR;EDGESIZE;(ITEMCOLOR {~ 0 >, dat);pos
)

NB. =========================================================
NB. makehist
makehist=: 3 : 0
dat=. ,y
'r c'=. $y

NB. horizontal spacing
w=. Gw % c
x=. Gw * }: int01 c
x=. Gx + x

NB. ---------------------------------------------------------
if. YDiv=0 do.
  h=. (dat-YMin) % YMax-YMin
elseif. YDiv=1 do.
  h=. (dat-YMax) % YMax-YMin
elseif. do.
  h=. dat % (YMax%1-YDiv) >. |YMin%YDiv
end.
h=. Gh * h
y=. Gy + Gh * YDiv
x,.y,.(x+w),.y+h
)
