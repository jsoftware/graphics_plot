NB. frame
NB.
NB. getframebox

NB. =========================================================
NB. getframebox
NB.
NB. defines frame box
getframebox=: 3 : 0

NB. ---------------------------------------------------------
NB. external (1) or internal (0) frame:
if. 0 = #FRAMESTYLE do.
  FrameX=: -. IfBar
else.
  FrameX=: 'o' e. FRAMESTYLE
end.

NB. ---------------------------------------------------------
if. #Frame do.
  'Fx Fy Fw Fh'=: Fxywh=: Frame return.
end.

if. 0 = #Data do. return. end.

x=. y=. r=. t=. 0

NB. ---------------------------------------------------------
NB. flip YAxes if need be:
if. (YAxes -: 1 0) *. XDiv >: MaxAxisInt do.
  YAxes=: 0 1
  Y2Label=: YLabel
  Y2Tics=: YTics
  YTics=: YLabel=: ''
end.

NB. ---------------------------------------------------------
NB. label widths and heights:
if. #;XLabel do.
  mxlab=. MXlabel
  'xlw xlh'=. LabelFont pgetextent XLabel
  lx=. >.-:{.xlw
  lr=. 0 >. >.-:{:xlw
else.
  xlw=. xlh=. mxlab=. lx=. lr=. 0
end.

NB. ---------------------------------------------------------
if. #;YLabel do.
  mylab=. MYlabel
  'ylw ylh'=. LabelFont pgetextent YLabel
  ly=. MGxy + (TICMAJOR * FrameX=0) + >.-:{.ylh
  lt=. 0 >. >.-:{:ylh
else.
  ylw=. ylh=. mylab=. ly=. lt=. 0
end.
YLabelHeight=: {. ylh

NB. ---------------------------------------------------------
if. {:YAxes do.
  if. #;Y2Label do.
    mylab=. MYlabel
    'yrw yrh'=. LabelFont pgetextent Y2Label
    lr=. lr >. mylab + (>./ yrw)
    lt=. lt >. >.-:{:yrh
  else.
    ylw=. ylh=. mylab=. ly=. lt=. 0
  end.
end.

NB. ---------------------------------------------------------
if. DimType=3 do.
  if. #;ZLabel do.
    'zlw zlh'=. LabelFont pgetextent ZLabel
    lx=. >./lx,zlw
    ly=. >./xlh,ylh,zlh
  end.
end.

NB. ---------------------------------------------------------
NB. if there are y labels to left of grafbox:
if. FRAME +. XDiv=0 do.
  x=. lx >. mylab + >./ylw
else.
  x=. lx
end.

NB. ---------------------------------------------------------
NB. if there are x labels under grafbox:
if. FRAME +. IfBar +. YDiv=0 do.
  y=. ly >. mxlab + {. >./xlh
else.
  y=. ly
end.

NB. ---------------------------------------------------------
NB. make room for any outer tics
if. TicOut do.
  x=. x + TICMAJOR
  y=. y + TICMAJOR
  lr=. lr + TICMAJOR * {:YAxes
elseif. IfBar do.
  y=. y + TICMAJOR
end.

NB. ---------------------------------------------------------
mrg=. rndint x,y,lr,lt
if. DimType=3 do.
  mrg=. 4 $ >./ mrg
end.
Fxywh=: Lxywh shrinkrect mrg
'Fx Fy Fw Fh'=: Fxywh
)
