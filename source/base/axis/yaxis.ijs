NB. yaxis  plot commands
NB.
NB. drawyaxis    draw y-axis
NB. drawygrid    draw y-grid
NB. drawylabs    draw y-labels
NB. drawylabs3d  draw y-labels 3d
NB. drawytics    draw y-tics
NB. drawytics3d  draw y-tics 3d

NB. =========================================================
NB. drawyaxis
drawyaxis=: 3 : 0
if. 0=1{AXES do. return. end.
if. FRAME *. XDiv e. 0 1 do. return. end.
x=. Gx + Gw * XDiv
pos=. x, Fy, x, Fy + Fh
drawline iYAXIS;AXISCOLOR;GUIDESIZE;pos
)

NB. =========================================================
NB. drawycaption
NB. draw ycaption
drawycaption=: 3 : 0
if. #YCAPTION do.
  x=. Yx + MYCaption
  y=. Yy + -: Yh
  if. 0~:{.0#CaptionFont do.
    font=. CaptionFont,' angle900'
  else.
    font=. 90 (3) } CaptionFont
  end.
  drawtext iYCAPTION;iCENTER;font;CAPTIONCOLOR;YCAPTION;x,y
end.
)

NB. =========================================================
NB. drawy2caption
NB. draw y2caption
drawy2caption=: 3 : 0
if. #Y2CAPTION do.
  x=. Y2x + Y2w - MYCaption
  y=. Y2y + -: Y2h
  if. 0~:{.0#CaptionFont do.
    font=. CaptionFont,' angle2700'
  else.
    font=. 270 (3) } CaptionFont
  end.
  drawtext iY2CAPTION;iCENTER;font;CAPTIONCOLOR;Y2CAPTION;x,y
end.
)

NB. =========================================================
NB. drawygrid
drawygrid=: 3 : 0
if. IfBar +. (0=1{GRIDS) +. 0=#XTics do. return. end.
xtics=. fitgrafx XTics
'py ps'=. Gy makegridpos Gh
len=. (#py) * #xtics
xtics=. (#py) # xtics
pos=. |: xtics,(len$py),xtics,:len$ps
drawline iYGRID;GRIDCOLOR;GUIDESIZE;pos
)

NB. =========================================================
NB. drawylabs
NB. draw y-labels
drawylabs=: 3 : 0

if. 0=1{LABELS do. return. end.
if. 0=#YLabel do. return. end.

ypos=. <. (fitgrafy YTics) + -: YLabelHeight

tout=. TICMAJOR * TicOut

if. FRAME +. IfBar do.
  pos=. (Fx - MYlabel + tout) ,. ypos
  drawtext iYLABEL;iRIGHT;LabelFont;LABELCOLOR;YLabel;pos
else.
  if. XDiv < MaxAxisInt do.
    pos=. ((fitgrafx XDiv) - MYlabel + tout),.ypos
    drawtext iYLABEL;iRIGHT;LabelFont;LABELCOLOR;YLabel;pos
  else.
    pos=. ((fitgrafx XDiv) + MYlabel + tout),.ypos
    drawtext iYLABEL;iLEFT;LabelFont;LABELCOLOR;YLabel;pos
  end.
end.
)

NB. =========================================================
NB. drawylabs
NB. draw y2-labels
drawy2labs=: 3 : 0
if. -. {:YAxes do. return. end.
if. (0=2{LABELS) +. 0=#Y2Label do. return. end.
ypos=. <. (fitgrafy Y2Tics) + -: YLabelHeight
pos=. (Fx + Fw + MYlabel) ,. ypos
drawtext iY2LABEL;iLEFT;LabelFont;LABELCOLOR;Y2Label;pos
)

NB. =========================================================
NB. drawylabs3d
NB. draw y-labels 3d
drawylabs3d=: 3 : 0

if. 0=1{LABELS do. '' return. end.
if. 0=#YLabel do. return. end.

ypos=. YTics
xpos=. -(TICMAJOR +1 + TicOut) % Gw

NB. which axis index?
ndx=. Box3dL firstin 1 8 3 10
if. ndx e. 8 10 do. xpos=. -<:xpos end.

pos=. xpos,.ypos,.ndx e. 3 10
pos=. fit3d pos

drawtext iYLABEL;iCENTER;LabelFont;LABELCOLOR;YLabel;pos
)

NB. =========================================================
NB. drawytics
NB. draw y-tics
drawytics=: 3 : 0

if. 0=1{TICS do. return. end.

NB. ---------------------------------------------------------
if. ({.YAxes) *. #YTics do.
  'ypos mark'=. gettics YTics;YMinor;YMax;YMin;YLOG
  mark=. <. mark * _1 ^ FRAME < TicOut +. XDiv >: MaxAxisInt
  if. FRAME +. IfBar do.
    w=. Fx - Gx
    pox=. ,&(0,w,0) "0 mark+w
    pos=. pox + fitgrafxy 0,.ypos,.0,.ypos
    if. FRAME > TicOut +. {:YAxes do.
      w=. (Fx + Fw) - Gx + Gw
      pox=. ,&(0,w,0) "0 w-mark
      pos=. pos,pox + fitgrafxy 1,.ypos,.1,.ypos
    end.
  else.
    pox=. 0,.0,.mark,.0
    pos=. pox + fitgrafxy XDiv,.ypos,.XDiv,.ypos
  end.

  drawline iYTICS;AXISCOLOR;GUIDESIZE;pos
end.

NB. ---------------------------------------------------------
if. ({:YAxes) *. #Y2Tics do.
  'ypos mark'=. gettics Y2Tics;YMinor;Y2Max;Y2Min;Y2LOG
  w=. Fx - Gx
  pox=. ,&(0,w,0) "0 mark+w
NB.   pos=. pos,(-pox) + fitgrafxy 1,.ypos,.1,.ypos
  pos=. (-pox) + fitgrafxy 1,.ypos,.1,.ypos
  drawline iYTICS;AXISCOLOR;GUIDESIZE;pos
end.

)

NB. =========================================================
NB. drawy2tics
NB. need this when y2tics don't match y1 tics
drawy2tics=: 3 : 0
EMPTY
)

NB. =========================================================
NB. drawytics3d
NB. draw y-tics 3d
drawytics3d=: 3 : 0

if. 0=1{TICS do. '' return. end.

step=. >:(>:YMinor)*<:#YLabel
mark=. step$(1,YMinor)#(TICMAJOR,TICMINOR)%Gh<.Gw
mark=. mark * _1 ^ TicOut
ypos=. int01 <: step
xpos=. ,0,.mark

NB. which axis index?
ndx=. Box3dL firstin 1 8 3 10
if. ndx e. 8 10 do. xpos=. -.xpos end.

pos=. (xpos),.(2#ypos),.ndx e. 3 10
pos=. fit3d pos
drawline iYTICS;AXISCOLOR;GUIDESIZE;_4[\,pos

)
