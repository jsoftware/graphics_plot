NB. draw    plot draw utilities
NB.
NB. drawarc
NB. drawborder
NB. drawbox
NB. drawcircle
NB. drawdot
NB. drawframebox
NB. drawframebox3d
NB. drawline
NB. drawpie
NB. drawpixel
NB. drawpline
NB. drawpoly
NB. drawrect
NB. drawtext
NB. drawtitle
NB.
NB. dofirst
NB. dolast
NB. draw1d
NB. draw2d

NB. =========================================================
dofirst=: 1 : 0
Ndx=: Ndx-1
u y
Ndx=: Ndx+1
)

NB. =========================================================
dolast=: 1 : 0
Ndx=: Ndx+1
u y
Ndx=: Ndx-1
)

NB. =========================================================
NB. drawborder
drawborder=: 3 : 0
if. BORDER do.
  box=. PlotBox shrinkrect BORDERSIZE
  drawbox iBORDER;FORECOLOR;GUIDESIZE;box
end.
)

NB. =========================================================
NB. drawbox
NB.
NB. form: drawbox index;color;xywh
NB.
NB. xywh are pixel positions with 0,0 at bottom left
drawbox=: 3 : 0
'i c s p'=. y
'x y w h'=. p
xw=. x + w
yh=. y + h
drawline i;c;s;x,y,xw,y,xw,yh,x,yh,x,y
)

NB. =========================================================
NB. drawdot
NB.
NB. form: drawdot color;size;position
NB.
NB. nonce assumes one color, size
drawdot=: 3 : 0
'i c s p'=. y
setp 'dot';i;s;0;0;c;0;p
)

NB. =========================================================
NB. drawframebox
drawframebox=: 3 : 0
if. FRAME do.
  drawbox iBOX;AXISCOLOR;GUIDESIZE;Fxywh
end.
)

NB. =========================================================
NB. drawframebox3d
drawframebox3d=: 3 : 0
box=. (Box3d scalepos XYZDiff) movepos XYZMin
box=. project box
zbox=. {:"1 box
box=. }:"1 box
Box3dX=: /: _2 +/\ zbox NB. box axes order
j=. <Box3dX /: 3#1 0 0 1  NB. nearest, furthest to back
Box3dL=: j firstin &> 2 6 4 9 ;1 8 3 10 ;0 5 7 11
box=. fitgrafxy3d box
box=. 12 4$,box
box=. Box3dX{box
drawline iFRAME;AXISCOLOR;GUIDESIZE;box
drawline dolast iFRAME;AXISCOLOR;GUIDESIZE;3{.box
)

NB. =========================================================
NB. drawfxywh
NB.
NB. sets clipping rectangle
drawfxywh=: 3 : 0
setp 'fxywh';0;0;0;0;0;0;y#Fxywh
)

NB. =========================================================
NB. drawmarker
NB. y is item;size;color;marker;position
NB.
NB. assumes single color, single marker
drawmarker=: 3 : 0
'i s c m p'=. y
setp 'marker';i;s;m;0;c;0;p
)


NB. =========================================================
NB. drawpline v draw patterned lines
NB.
NB. form: drawline pattern;color;size;positions
NB.
NB. pattern is index into PENPATTERN
drawpline=: 3 : 0
'i t c s p'=. y
setp 'pline';i;s;t;0;c;0;p
)

NB. =========================================================
NB. drawtext
NB. y is item;alignment;font;color;text;position
NB.
NB. assumes single alignment, single font
drawtext=: 3 : 0
'i a f c t p'=. y
setp 'text';i;t;f;a;c;0;p
)

NB. =========================================================
NB. drawtitle
NB. draw title in top margin (on top of Fxywh)
drawtitle=: 3 : 0
if. 0=#TITLE do. '' return. end.
x=. Tx + -: Tw
if. LF e. TITLE do.
  tit=. <;._2 TITLE,LF
  h=. (Th - +:MTitle) % #tit
  y=. Ty + Th - MTitle
  for_t. tit do.
    drawtext iTITLE;iCENTER;TitleFont;TITLECOLOR;t,<x,y
    y=. y - h
  end.
else.
  y=. Ty + Th - MTitle
  drawtext iTITLE;iCENTER;TitleFont;TITLECOLOR;TITLE;x,y
end.
)

NB. =========================================================
NB. drawsubtitle
NB. draw subtitle in top margin (on top of Fxywh)
drawsubtitle=: 3 : 0
if. 0=#SUBTITLE do. '' return. end.
x=. Vx + -: Vw
if. LF e. SUBTITLE do.
  tit=. <;._2 SUBTITLE,LF
  h=. (Vh - +:MSubTitle) % #tit
  y=. Vy + Vh - MSubTitle
  for_t. tit do.
    drawtext iSUBTITLE;iCENTER;SubTitleFont;SUBTITLECOLOR;t,<x,y
    y=. y - h
  end.
else.
  y=. Vy + Vh - MSubTitle
  drawtext iSUBTITLE;iCENTER;SubTitleFont;SUBTITLECOLOR;SUBTITLE;x,y
end.
)

NB. =========================================================
NB. draw1d
NB. y is item;color;size;position
draw1d=: 4 : 0
'i c s p'=. y
setp x;i;s;0;0;c;0;p
)

NB. =========================================================
NB. draw2d
NB. y is item;edgecolor;edgesize;fillcolor;position
draw2d=: 4 : 0
'i e s c p'=. y
setp x;i;s;0;0;e;c;p
)

NB. =========================================================
drawarc=: 'arc' & draw1d
drawline=: 'line' & draw1d
drawpie=: 'pie' & draw2d
drawpoly=: 'poly' & draw2d
drawrect=: 'rect' & draw2d
drawcircle=: 'circle' & draw2d
