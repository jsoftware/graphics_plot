NB. pie    pie commands
NB.
NB. main functiond:
NB.   plot_pied  single pie
NB.   plot_piem  multiple pies

NB. =========================================================
NB. plot_pie
plot_pie=: 3 : 0
YCaption=: ; YCAPTION NB. used as subtitle
'x y'=. 2 {. y { Data
if. 1 = #y do.
  plot_pied y
else.
  plot_piem y
end.
)

NB. =========================================================
plot_pied=: 3 : 0

NB. express data in degrees, 0 is south and 90 is east:
dat=. 360 | 90 - 0, 360 * (%{:) +/\ , y

NB. ---------------------------------------------------------
if. PIEPERCENT *. 0=#XLABEL do.
  XLabel=: getpiepercent ,y
else.
  XLabel=: XLABEL
end.

NB. ---------------------------------------------------------
if. #YCaption do.
  'w h'=. CaptionFont pgetextent1 YCaption
  cx=. Lx + -: Lw - w
  cy=. Ly + Lh - MSubTitle
  setgxywh Gxywh shrinkrect 0 0 0,h+3*MSubTitle
end.

NB. ---------------------------------------------------------
if. #XLabel do.
  'pxy tic'=. makefitpie dat
  drawtext iXLABEL;iLEFT;LabelFont;BLACK;XLabel;pxy
  drawline iXTICS;BLACK;GUIDESIZE;tic
end.

NB. ---------------------------------------------------------
rad=. -: Gw <. Gh
org=. (Gx,Gy) + -: Gw,Gh
dat=. (org, rad),"1 [ 2 |.\ dat
clr=. getitemcolor #dat
drawpie iDATA;EDGECOLOR;EDGESIZE;clr;dat

NB. ---------------------------------------------------------
if. #YCaption do.
  xlab=. (0<#XLabel) * MSubTitle + {: LabelFont pgetextent1 'X'
  xcap=. {: CaptionFont pgetextent1 'X'
  cy=. cy <. ({:org) + rad + MPie + xlab + xcap
  drawtext iYCAPTION;iLEFT;CaptionFont;BLACK;YCaption;cx,cy
end.
)

NB. =========================================================
NB. makefitpie
NB.
NB. iterates over labels and data until pie fits (if possible)
NB.
NB. also defines boxes and draws labels
NB.
makefitpie=: 3 : 0
dat=. rfd y
'lw lh'=. LabelFont pgetextent XLabel
lh=. {.lh

NB. ---------------------------------------------------------
NB. rw is horizontal, increasing to right
NB. rh is vertical, increasing to top
bgn=. }: dat
end=. }. dat
mid=. -: bgn + end - 2p1 * end > bgn
rhw=. |."1 +. r. mid
'rw rh'=. 1 _1 * |: rhw

NB. ---------------------------------------------------------
NB. iterate to determine pie size and label positions:
pos=. 2 {."1 fitpie lw;lh;rw;rh;mid

NB. ---------------------------------------------------------
tic=. drawpietics rw,.rh

NB. ---------------------------------------------------------
pos;tic
)

NB. =========================================================
NB. fitpie
fitpie=: 3 : 0

'lw lh rw rh mid'=. y

NB. ---------------------------------------------------------
NB. iterate to get Gxywh and initial label positions:
while. 1 do.

NB. calculate positions relative to pie center:
  rad=. <. -: <./ _2 {. Gxywh
  pad=. rad + MPie

  msk=. MPie <: (-:lh) + | pad * -. cos mid
  int=. lw * (-:-.msk) + msk * (mid<0) +. mid>1p1

NB. bottom left of labels:
  px=. (Gx+-:Gw) + (rw * pad) - int
  py=. (Gy+-:Gh) + (rh * pad) - -:lh
  pos=. px,.py,.lw,.lh

NB. ---------------------------------------------------------
NB. check labels fit in Lxywh, reducing Gywh if need be:
  if. 1 = fitpielabels pos do. continue. end.

NB. ---------------------------------------------------------
  'rc pos'=. movepielabels pos
  if. rc do.
    if. 1 = fitpielabels pos do. continue. end.
  end.
  break.
end.

NB. ---------------------------------------------------------
NB. adjust labels to top left;
(0,lh,0 0) +"1 pos
)

NB. =========================================================
NB. fitpielabels
NB.
NB. ensure pie labels fit in Lxywh, otherwise reduce Gxyxh
NB.
NB. return 1 if any change
NB.
NB. won't reduce Gxywh below minimum size
NB.
NB. argument is current label positions
fitpielabels=: 3 : 0
'x y w h'=. |: y

bx=. 0 >. Lx - <./x
ex=. 0 >. (>./x+w) - Lx + Lw
by=. 0 >. Ly - <./y
ey=. 0 >. (>./y+h) - Ly + Lh

be=. bx,by,ex,ey
if. 0 = +/be do. 0 return. end.

mw=. 0 >. Gw - MinPie
if. mw < bx + ex do.
  'bx ex'=. (bx,ex) * mw % bx + ex
end.

mh=. 0 >. Gh - MinPie
if. mh < by + ey do.
  'by ey'=. (by,ey) * mh % by + ey
end.

be=. bx,by,ex,ey
if. 0 = +/be do. 0 return. end.

setgxywh Gxywh shrinkrect >. be

1
)

NB. =========================================================
getpiepercent=: 3 : 0
dat=. 100 * y % +/y
val=. 1 rounddist dat
txt=. (":each val) ,each '%'
)
