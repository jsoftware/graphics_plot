NB. get pdef

NB. =========================================================
getpdef=: 4 : 0

(PDefNames)=. x

cmd=. y
hdr=. {."1 cmd

NB. ---------------------------------------------------------
NB. get gl2 commands:
msk=. hdr e. PDgd
if. 1 e. msk do.
  gl2=. msk#cmd
  ndx=. ({."1 gl2) i. <'gdend'
  Gcmd0=. ndx {. gl2
  Gcmd1=. (ndx+1) }. gl2
  cmd=. (-.msk) # cmd
  hdr=. {."1 cmd
end.

NB. ---------------------------------------------------------
NB. get rule commands:
msk=. (4 {.each hdr) e. 'rule';'RULE'
if. 1 e. msk do.
  Rule=. msk#cmd
  cmd=. (-.msk) # cmd
  hdr=. {."1 cmd
end.

NB. ---------------------------------------------------------
NB. get text commands:
msk=. (4 {.each hdr) e. 'text';'TEXT'
if. 1 e. msk do.
  Text=. msk#cmd
  cmd=. (-.msk) # cmd
  hdr=. {."1 cmd
end.

NB. ---------------------------------------------------------
if. -. (<'data') e. hdr do.
  (hdr)=. {:"1 cmd
  Opts=. < cmd #~ -. hdr e. PDefNames
  ". each PDefNames return.
end.

NB. ---------------------------------------------------------
NB. get first type
if. (<'TYPE') e. hdr do.
  type=. 1 pick (hdr i. <'TYPE') { cmd
else.
  if. #TYPE do.
    type=. TYPE
  else.
    type=. getdeftype 1 pick (hdr i. <'data') { cmd
  end.
end.

NB. ---------------------------------------------------------
msk=. hdr e. DefOpts
def=. msk # cmd
({."1 def)=. {:"1 def

NB. ---------------------------------------------------------
NB. set globals required by plotsubd
PlotfDefs=: ". each PlotfNames

NB. ---------------------------------------------------------
NB. make cmd/data blocks:
msk=. hdr = <'data'
dat=. msk ((}:;{:@{:));.2 cmd
'dat rep'=. getverbres dat
DataRep=. rep

NB. ---------------------------------------------------------
opts=. {."1 dat
hdrs=. {."1 each opts
dats=. {:"1 dat

NB. ---------------------------------------------------------
NB. get options not in PDefNames
hdrmsk=. -. each hdrs e. each <PDefNames
Opts=. hdrmsk #each opts

NB. ---------------------------------------------------------
NB. get types
Types=. (<'TYPE')&dictget &> opts
if. 0 = # 0 pick Types do.
  Types=. (<type) 0 } Types
end.

NB. ---------------------------------------------------------
'DimData DimType'=. getdims dats;<type

Data=. DimData getdata &> dats

if. 0 = +/ # &> {."1 Data do.
  Data=. 0 # Data
end.

if. POLAR *. DimType=2 do.
  Data=. getpolar "1 Data
end.

NB. ---------------------------------------------------------
ndx=. i.#Data
ind=. (Y2Axis & e. &> hdrs) i. 1
Y2Msk=. ndx >: ind
if. (1 e. Y2Msk) *. DimData = 3 do.
  signal 'Two Y axes are not supported for 3D data.'
end.
YAxes=. (ind > {.ndx), ind <: {:ndx

NB. ---------------------------------------------------------
if. (1 e. type e. FrameTypes) +. {:YAxes do.
  FRAME=. 1
end.

NB. ---------------------------------------------------------
NB. get default data ranges, then override with any user-defined:
'XRANGE YRANGE Y2RANGE ZRANGE'=. getdatarange (;Types);Data;Y2Msk;YAxes
({."1 def)=. {:"1 def

NB. ---------------------------------------------------------
NB. apply any logs
if. XLOG do.
  Data=. (log10 each 0 {"1 Data) 0 }"0 1 Data
  XINT=. log10 XINT
  XRANGE=. log10 XRANGE
end.
if. YLOG do.
  ndx=. I. -. Y2Msk
  Data=. (log10 each (<ndx;1) { Data) (<ndx;1) } Data
  YINT=. log10 YINT
  YRANGE=. log10 YRANGE
end.
if. Y2LOG do.
  ndx=. I. Y2Msk
  Data=. (log10 each (<ndx;1) { Data) (<ndx;1) } Data
  Y2INT=. log10 Y2INT
  Y2RANGE=. log10 Y2RANGE
end.
if. ZLOG do.
  Data=. (log10 each 2 {"1 Data) 2 }"0 1 Data
  ZINT=. log10 ZINT
  ZRANGE=. log10 ZRANGE
end.

NB. ---------------------------------------------------------
AXES=. 3$AXES
LABELS=. 3$LABELS
GRIDS=. 3$GRIDS
TICS=. 3$TICS

if. Y2Msk do.
  AXES=. 0 (1)} AXES
  GRIDS=. 0 (1)} GRIDS
  TICS=. 0 (1)} TICS
end.

XTIC=. XTIC,(#XTIC)}._1 _1
YTIC=. YTIC,(#YTIC)}._1 _1
Y2TIC=. Y2TIC,(#Y2TIC)}._1 _1
ZTIC=. ZTIC,(#ZTIC)}._1 _1

NB. ---------------------------------------------------------
". each PDefNames
)

NB. =========================================================
NB. apply any verb
getverbres=: 3 : 0
r=. i. 0 2
s=. ''
for_d. y do.
  v=. _1 pick d
  if. 0 = #v do.
    r=. r,d
  elseif. ifplotf v do.
    v=. plotsubd v
    s=. s, # &> v
    r=. r,({.d),.<"1 ;v
  elseif. do.
    r=. r,d
    s=. s,1
  end.
end.
r;s
)

