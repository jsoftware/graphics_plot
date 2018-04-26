NB. scale
NB.
NB. fit3d
NB. fitarc
NB. fitframexy
NB. fitgrafx
NB. fitgrafxy
NB. fitgrafxy3d
NB. fitgrafxywh
NB. fitgrafy
NB.
NB. flipxy
NB. flipyarc
NB. flipyrect
NB.
NB. get01x
NB. get01y
NB. getgrafx
NB. getgrafy
NB.
NB. movepos       xy_positions movepos xy
NB. scalepos      xy_positions scalepos wh

NB. =========================================================
NB. fitframexy
NB.
NB. fitxy to Fxywh
fitframexy=: 3 : 0
s=. $y
(s $ Fx,Fy) + y * s $ Fw,Fh
)

NB. =========================================================
NB. fitgrafx
NB.
NB. fitx to Gxywh
fitgrafx=: 3 : 0
Gx + Gw * y
)

NB. =========================================================
NB. fitgrafxy
NB.
NB. fitxy to Gxywh
fitgrafxy=: 3 : 0
s=. $y
(s $ Gx,Gy) + y * s $ Gw,Gh
)

NB. =========================================================
fitgrafxywh=: 3 : 0
s=. $y
(s $ Gx,Gy,0 0) + y * s $ Gw,Gh
)

NB. =========================================================
NB. xywh fitgrafxy3d dat
fitgrafxy3d=: 3 : 0
Min3d=: Min3d <. <./y
Max3d=: Max3d >. >./y
fitgrafxy3d1 y
)

NB. =========================================================
NB. fitgrafy
fitgrafy=: 3 : 0
Gy + Gh * y
)

NB. =========================================================
fit3d=: 3 : 0
pos=. fitxyz y
pos=. }:"1 project pos
fitgrafxy3d1 pos
)

NB. =========================================================
fitgrafxy3d1=: 3 : 0
(Gx,Gy) +"1 (y -"1 Min3d)*"1 (Gw,Gh) % Max3d-Min3d
)

NB. =========================================================
flipyarc=: 3 : 0
y=. _8[\,y
c=. Ch - (+/"1 [ 1 3{"1 y) ,. 5 7{"1 y
($y) $ ,c 1 5 7}"1 y
)

NB. =========================================================
flipxy=: 3 : 0
s=. $y
(s $ 0, Ch) + y * s $ 1 _1
)

NB. =========================================================
flipyrect=: 3 : 0
y=. _4 [\, y
c=. Ch - +/"1 [ 1 3{"1 y
($y) $ ,c 1}"0 1 y
)

NB. =========================================================
get01x=: 3 : '(y - XMin) % XMax-XMin'
get01y=: 3 : '(y - YMin) % YMax-YMin'
getgrafx=: fitgrafx @ get01x
getgrafy=: fitgrafy @ get01y

NB. =========================================================
getgrafmat=: 3 : 0
'x y'=. 2 {. y { Data
,"2 (getgrafx x) ,."1 citemize getgrafy y
)

NB. =========================================================
getgrafxy=: 3 : 0
'x y'=. 2 {. y { Data
(getgrafx x) ; getgrafy y
)

NB. =========================================================
NB. movepos
NB. form: data movepos pos
movepos=: [ + $@[ $ ]

NB. =========================================================
NB. scalepos
NB. dat scalepos xy
scalepos=: [ * $@[ $ ]
