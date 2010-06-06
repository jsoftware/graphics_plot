NB. xaxis plot commands
NB.
NB. drawxaxis      draw x-axis
NB. drawxgrid      draw x-grid
NB. drawxlabs      draw x-labs
NB. drawxtics      draw x-tics
NB. drawxtics3d    draw x-tics3d
NB. drawxlabs3d    draw x-labs3d

NB. =========================================================
NB. drawxaxis
drawxaxis=: 3 : 0
if. 0={.AXES do. return. end.
if. FRAME *. YDiv e. 0 1 do. return. end.
y=. Gy + Gh * YDiv
pos=. Fx, y, (Fx + Fw), y
drawline iXAXIS;AXISCOLOR;GUIDESIZE;pos
)

NB. =========================================================
NB. drawxcaption
NB. draw xcaption
drawxcaption=: 3 : 0
if. #XCAPTION do.
  x=. Xx + -: Xw
  y=. Xy + Xh - MXCaption
  drawtext iXCAPTION;iCENTER;CaptionFont;CAPTIONCOLOR;XCAPTION;x,y
end.
)

NB. =========================================================
NB. drawxgrid
drawxgrid=: 3 : 0
if. 0={.GRIDS do. return. end.
if. {.YAxes do.
  ytics=. YTics
else.
  ytics=. Y2Tics
end.
if. #ytics do.
  ytics=. fitgrafy ytics
  'px pr'=. Gx makegridpos Gw
  len=. (#px) * #ytics
  ytics=. (#px) # ytics
  pos=. |: (len$px),ytics,(len$pr),:ytics
  drawline iXGRID;GRIDCOLOR;GUIDESIZE;pos
end.
)

NB. =========================================================
NB. drawxlabs
NB. draw x-labels
drawxlabs=: 3 : 0
if. 0={.LABELS do. return. end.
if. 0=#XLabel do. return. end.
if. IfBar do.
  xpos=. fitgrafx }: (0.5&% + int01) # XLabel
  ypos=. (fitgrafy 0) - MXlabel + TICMAJOR
else.
  xpos=. fitgrafx XTics
  ypos=. (fitgrafy YDiv) - MXlabel
end.
if. FRAME do.
  ypos=. Fy - MXlabel + TICMAJOR * TicOut +. IfBar
end.
pos=. xpos,.ypos
drawtext iXLABEL;iCENTER;LabelFont;LABELCOLOR;XLabel;pos
)

NB. =========================================================
NB. drawxlabs3d
NB. draw x-labs 3d
drawxlabs3d=: 3 : 0
if. 0={.LABELS do. return. end.
if. 0=#XLabel do. return. end.

xpos=. XTics
ypos=. - (TICMAJOR * 1 + TicOut) % Gh

NB. which axis index?
ndx=. Box3dL firstin 2 6 4 9
if. ndx e. 6 9 do. ypos=. -<:ypos end.

pos=. xpos,"0 1 ypos,ndx e. 4 9
pos=. fit3d pos
drawtext iXLABEL;iCENTER;LabelFont;LABELCOLOR;XLabel;pos
)

NB. =========================================================
NB. drawxtics
NB. draw x-tics
drawxtics=: 3 : 0

if. (0={.TICS) +. 0=#XTics do. return. end.

NB. ---------------------------------------------------------
if. IfBar do.
  xpos=. }: (0.5&% + int01) # XLabel
  mark=. -TICMAJOR
  yint=. 0
else.
  'xpos mark'=. gettics XTics;XMinor;XMax;XMin;XLOG
  mark=. mark * _1 ^ TicOut +. (FRAME=0) *. YDiv >: MaxAxisInt
  yint=. YDiv
end.

if. FRAME do.
  h=. Fy - Gy
  pox=. (0,.h+mark),"1 [ 0,h
  pos=. pox +"1 fitgrafxy xpos,.0,.xpos,.0
  if. -. TicOut +. IfBar do.
    h=. (Gy + Gh) - Fy + Fh
    pox=. (0,.h+mark),"1 [ 0,h
    pos=. pos,(-pox) +"1 fitgrafxy xpos,.1,.xpos,.1
  end.
else.
  pox=. 0 0 0&, "0 +mark
  pos=. pox +"1 fitgrafxy xpos,.yint,.xpos,.yint
end.

drawline iXTICS;AXISCOLOR;GUIDESIZE;pos

)

NB. =========================================================
NB. drawxtics3d
NB. draw x-tics 3d
drawxtics3d=: 3 : 0

if. 0={.TICS do. '' return. end.

step=. >:(>:XMinor)*<:#XLabel

mark=. step$(1,XMinor)#(TICMAJOR,TICMINOR)%Gh<.Gw
mark=. mark * _1 ^ TicOut
xpos=. int01 <: step
ypos=. ,0,.mark

NB. which axis index?
ndx=. Box3dL firstin 2 4 6 9
if. ndx e. 6 9 do. ypos=. -.ypos end.

pos=. (2#xpos),.ypos,.ndx e. 4 9
pos=. fit3d pos

drawline iXTICS;AXISCOLOR;GUIDESIZE;_4[\,pos
)
