NB. z axis
NB.
NB. drawzaxis3d
NB. drawztics3d

NB. =========================================================
NB. drawzlabs3d
NB. draw z-labs 3d
drawzlabs3d=: 3 : 0

if. 0=2{LABELS do. '' return. end.
if. 0=#ZLabel do. return. end.

zpos=. ZTics
xpos=. - (TICMAJOR + 1 + TicOut) % Gh NB. <. Gw

NB. which axis index?
ndx=. Box3dL firstin 0 5 7 11
if. ndx e. 7 11 do. xpos=. -<:xpos end.

end=. ndx e. 5 11
aln=. end { iRIGHT,iLEFT
pos=. xpos,.end,.zpos
pos=. fit3d pos
drawtext iZLABEL;aln;LabelFont;LABELCOLOR;ZLabel;pos
)

NB. =========================================================
NB. drawztics3d
NB. draw z-tics 3d

drawztics3d=: 3 : 0

if. 0=2{TICS do. '' return. end.

step=. >: (>:ZMinor) * <:#ZLabel
mark=. step$(1,ZMinor)#(TICMAJOR,TICMINOR) % Gh <. Gw
mark=. mark * _1 ^ TicOut

zpos=. int01 <: step
xpos=. ,0,.mark

NB. which axis index?
ndx=. Box3dL firstin 0 5 7 11
if. ndx e. 7 11 do. xpos=. -. xpos end.

pos=. xpos,.(ndx e. 5 11),.2#zpos
pos=. fit3d pos
drawline iZTICS;AXISCOLOR;GUIDESIZE;_4[\,pos
)

