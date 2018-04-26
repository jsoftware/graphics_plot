NB. piem - multi pie

NB. =========================================================
plot_piem=: 3 : 0

dat=. y

NB. ---------------------------------------------------------
if. #YCAPTION do.
  ycap=. boxarg YCAPTION
  if. 1=#ycap do.
    ycap=. (#dat) $ ycap
  else.
    if. (#dat) ~: #ycap do.
      info 'Y Captions do not match number of pie charts' return.
    end.
  end.
  'cw ch'=. CaptionFont pgetextent ycap
  cw=. >./cw
  ch=. ({.ch) + +: MSubTitle
else.
  cw=. ch=. 0
  ycap=. (#dat) # <''
end.

NB. ---------------------------------------------------------
NB. get tentative sizes:
len=. #dat
rws=. 1 + i. len
cls=. >. len % rws
msk=. cw <: Lw % cls
rws=. msk#rws
cls=. msk#cls
ndx=. (i.>./) (Lw%cls) <. Lh%rws
rws=. ndx{rws
cls=. ndx{cls
wid=. <. Lw % cls
hit=. <. Lh % rws

NB. ---------------------------------------------------------
OLxywh=: Lxywh
xy=. ((rws*cls)$Lx + wid*i.cls),.cls#Ly + hit*i.-rws
lxywh=. len {. xy,"1 wid,hit
lxywh=. lxywh shrinkrect"1 MPie

NB. ---------------------------------------------------------
if. PIEPERCENT < 0 = #XLABEL do.
  gxywh=. lxywh shrinkrect"1 [ 0 0 0,ch
else.
  setlxywh {. lxywh
  getpieframes''
  setgxywh Lxywh shrinkrect 0 0 0,ch
  r=. i. 0 4
  for_d. dat do.
    deg=. 360 | 90 - 0, 360 * (%{:) +/\ d
    if. PIEPERCENT do.
      XLabel=: getpiepercent d
    else.
      XLabel=: XLABEL
    end.
    makefitpie deg
    r=. r,Gxywh
  end.
  xy=. >./2 {."1 r
  off=. xy - 2 {. Lxywh
  wh=. (<./(2 {."1 r) + 2 }."1 r) - xy
  gxywh=. (off +"1 [ 2 {."1 lxywh) ,"1 wh
end.

NB. ---------------------------------------------------------
for_d. dat do.
  YCaption=: d_index pick ycap
  setlxywh d_index { lxywh
  getpieframes''
  setgxywh d_index { gxywh
NB.   drawbox iBOX;DARKGREEN;GUIDESIZE;Gxywh
  plot_pied d
NB.    drawbox iBOX;BLUE;GUIDESIZE;Gxywh
NB.   drawbox iBOX;RED;GUIDESIZE;Lxywh
end.

NB. ---------------------------------------------------------
Lxywh=: OLxywh
)
