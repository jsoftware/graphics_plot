NB. util

Y2Axis=: <'Y2AXIS'

NB. plot objects
j=. 'xint xmin xmax yint ymin ymax y2int y2min y2max zint zmin zmax'
SubCmds=: ;:'axes frame labels ',j

NB. =========================================================
NB. drawbackground
NB.
NB. this done only if CLEAR flag is set
drawbackground=: 3 : 0
if. CLEAR do.
  drawrect iBACKGROUND;BACKCOLOR;1;BACKCOLOR;boxwh2rs Dxywh
  if. #FRAMEBACKCOLOR do.
    drawrect iBACKGROUND;FrameBackColor;1;FrameBackColor;boxwh2rs Fxywh
  end.
  if. #GRAPHBACKCOLOR do.
    drawrect iBACKGROUND;GraphBackColor;1;GraphBackColor;boxwh2rs Gxywh
  end.
  CLEAR=: 0
end.
)

NB. =========================================================
getdeftype=: 3 : 0
t=. 0
if. (3 = #y) *. L. y do.
  t=. (ifplotf y) +. 2 = #$_1 pick y
end.
t { 'line';'surface'
)

NB. =========================================================
NB. determine whether 2d or 3d
NB.
NB. either a 3d plot is explicity defined (e.g. type surface),
NB. or 3d data is given; otherwise 2d
getdims=: 3 : 0
'data types'=. y
if. 1 e. types e. PlotData3d -. PlotData2d do.
  dd=. 3
elseif. 1 e. types e. PlotData2d -. PlotData3d do.
  dd=. 2
elseif. do.
  dd=. >./ 2, getdim &> {:"1 data
end.
if. 1 e. types e. PlotTypes3d -. PlotTypes2d do.
  dt=. 3
elseif. 1 e. types e. PlotTypes2d -. PlotTypes3d do.
  dt=. 2
elseif. do.
  dt=. dd
end.

dd,dt
)

getdim=: [: # $^:(0 = L.)

NB. =========================================================
NB. convert multi data to cmd format
getmulticmd=: 3 : 0
res=. i. 0 2
if. 0 e. $y do. return. end.
mat=. citemize y
for_m. mat do.
  'cmd dat'=. m
  'hdr cmd'=. pdcmdhdr boxcmd cmd
  cmd=. (1 + # &> hdr) }. each cmd
  cmd=. setoptions hdr,.cmd
  res=. res, cmd,'data';<dat
end.
)

NB. =========================================================
NB. this used when plots are drawn dependently
getsubcmds=: 3 : 0
if. isboxed 0 pick y do.
  ;getsubcmds each y
else.
  'cmd dat'=. y
  if. #cmd do.
    cmd=. boxcmd cmd
    msk=. -. ({."1 cmd) e. SubCmds
    (msk # cmd), 'data';<dat
  else.
    ,:'data';<dat
  end.
end.
)

NB. =========================================================
NB. makepos_xy
NB.
NB. this calculates a text position within the draw box
makepos_xy=: 3 : 0
'x y'=. y
if. 'p' e. x do.
  'x y'=. makepos_coords x;y
end.
tx=. (Dx,Dw) makepos1 x
ty=. (Dy,Dh) makepos1 y
tx,ty
)

NB. =========================================================
NB. makepos_from x, y coordinates
NB. the y coord is vertically centered
makepos_coords=: 3 : 0
'x y'=. y
x=. roundint getgrafx 0 ". x -. 'p'
y=. getgrafy 0 ". y -. 'p'
y=. roundint y + -: {: (maketextfont TEXTFONT) pgetextent 'X'
(": each x,y) ,each 'x'
)

NB. =========================================================
NB. makepos_xywh
NB.
NB. this calculates a rectangle within the x box
makepos_xywh=: 4 : 0

if. 0 = #y do. x return. end.

'Bx By Bw Bh'=. x

NB. ---------------------------------------------------------
if. ischar y do.
  'x y r s'=. <;._1 ' ',deb y
  tx=. (Bx,Bw) makepos1 x
  tr=. (Bx,Bw) makepos1 r
  ty=. (By,Bh) makepos1 y
  ts=. (By,Bh) makepos1 s
  tx,ty,(tr-tx),ts-ty

NB. ---------------------------------------------------------
else.
  (4 $ Bw,Bh) * (boxrs2wh y) % 1000
end.
)

NB. =========================================================
makepos1=: 4 : 0
'b w'=. x
t=. 0 ". y -. 'x'
select. (0 > t), 'x' e. y
case. 0 0 do.
  b + w * t % 1000
case. 0 1 do.
  b + t
case. 1 0 do.
  b + w * (1 + 1000 | t) % 1000
case. 1 1 do.
  b + 1 + w | t
end.
)

NB. =========================================================
settypeflags=: 3 : 0
types=. y
IfBar=: 1 e. types e. BarTypes
IfFrame=: 1 e. types e. FrameTypes
IfBand=: 1 e. types e. BandTypes
IfPie=: 1 e. types e. PieTypes
)
