NB. util

NB. =========================================================
NB. gdxy
NB. convert xy pairs into pixels
gdxy=: 3 : 0
xy=. _2 [\ <;._1 ' ',deb y
,('x' gdxy1 {."1 xy),.'y' gdxy1 {:"1 xy
)

NB. =========================================================
gdxy1=: 4 : 0
if. x='y' do.
  b=. Gy
  s=. Gh
  max=. YMax
  min=. YMin
else.
  b=. Gx
  s=. Gw
  max=. XMax+IfBar*1.5
  min=. XMin+IfBar*0.5
end.
np=. I. mp=. 'x' = {:&> y
nr=. I. mr=. 'r' = {:&> y
nm=. I. mm=. mr +: mp
y=. 0 ".&> (-mr+.mp) }. each y
y=. ((s%1000) * nm{y) nm}y
if. #np do.
  px=. np{y
  px=. (px<0) } px,:1 + s|px
  y=. px np}y
end.
if. #nr do.
  pr=. s * (max-min) %~ (nr{y) - min
  y=. pr nr}y
end.
b + rndint y
)

