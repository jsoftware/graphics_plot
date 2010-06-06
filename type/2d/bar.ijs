NB. bar  plot barchart commands
NB.
NB. plot_bar

NB. =========================================================
plot_bar=: 3 : 0
'x y'=. 2 {. y { Data
dat=. citemize y
pos=. makebar dat
pos makedrawbar dat
)

NB. =========================================================
plot_fbar=: 3 : 0
'x y'=. 2 {. y { Data
dat=. citemize y
pos=. makestackbar dat
pos=. ({:$dat) }. pos
dat=. }. dat
pos makedrawbar dat
)

NB. =========================================================
plot_fbarv=: 3 : 0
'x y'=. 2 {. y { Data
dat=. citemize y
pos=. makestackbar |. dat
pos=. ({:$dat) }. pos
dat=. }. dat
pos makedrawbarv dat
)

NB. =========================================================
plot_sbar=: 3 : 0
'x y'=. 2 {. y { Data
dat=. citemize y
pos=. makestackbar dat
pos makedrawbar dat
)

NB. =========================================================
plot_sbarv=: 3 : 0
'x y'=. 2 {. y { Data
dat=. citemize y
pos=. makestackbar |.dat
pos makedrawbarv dat
)

NB. =========================================================
makedrawbar=: 4 : 0
pos=. x
dat=. y
'r c'=. $dat
if. r=1 do.
  drawrect iDATA;EDGECOLOR;EDGESIZE;(ITEMCOLOR {~ 0 >, dat);pos
else.
  clr=. r $ ITEMCOLOR
  pos=. (-c) ,\ pos
  for_p. pos do.
    drawrect iDATA;EDGECOLOR;EDGESIZE;(p_index{clr);_4 [\ p
  end.
end.
)

NB. =========================================================
makedrawbarv=: 4 : 0
pos=. x
dat=. y
'r c'=. $dat
if. r=1 do.
  drawrect iDATA;EDGECOLOR;EDGESIZE;(|.ITEMCOLOR {~ 0 >, dat);pos
else.
  clr=. |. r $ ITEMCOLOR
  pos=. (-c) ,\ pos
  for_p. pos do.
    drawrect iDATA;EDGECOLOR;EDGESIZE;(p_index{clr);_4 [\ p
  end.
end.
)

NB. =========================================================
NB. makebar
makebar=: 3 : 0
dat=. ,y
'r c'=. $y

NB. horizontal spacing
w=. Gw * BARWIDTH % r * c
t=. Gw * -: (-.BARWIDTH) % c

NB. ---------------------------------------------------------
if. r=1 do.
  x=. Gw * }: int01 c
else.
  x=. ,(w * i.r) +/ Gw * }: int01 c
end.
x=. Gx + x + t

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

NB. =========================================================
NB. makestackbar
NB. each column represents one data set
NB. the first (lowest) item is in the first row
NB. y=data
makestackbar=: 3 : 0
dat=. ,y
if. 1 e. 0 > dat do.
  signal 'stackbar values should not be negative'
end.
'r c'=. $y
wid=. BARWIDTH
w=. Gw * wid % c
t=. Gw * -: (-.wid) % c NB. offset
h=. Gh * y % YMax
y=. Gy + ,+/\ h
x=. Gx + ($y) $ t + Gw * }: int01 c
x,.y,.(x+w),.y-,h
)
