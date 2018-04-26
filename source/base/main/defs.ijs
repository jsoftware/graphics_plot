NB. defs

IFJNET=: (IFJNET"_)^:(0=4!:0<'IFJNET')0

NB. =========================================================
FontScale=: 1    NB. always 1 for isigraph, FONTSCALE for other
FontSizeMin=: 0  NB. FONTSIZEMIN for canvas, always 0 for other
MaxAxisInt=: 0.9
MaxData=: _
PCmd=: ''
Data=: ''
PForm=: 'plot'
Ch=: Cw=: 0      NB. child size
PId=: 'gs'
PIdhwnd=: 0
Plot=: i. 0 0
PFormhwnd=: 0['' NB. will break isi code
Poutput=: _1     NB. output
Printer=: 0      NB. if plot to printer
PReset=: 0       NB. if plot locale is initialized
PText=: ''
PTop=: 0
PShow=: 0        NB. if a pshow command has been done
Pxywh=: ''       NB. plot drawing area
PStyle=: ''
TypeRest=: ''    NB. if more than one type given at once

NB. =========================================================
NB. indices:

NB. alignment
('i',each ;: 'LEFT CENTER RIGHT')=: i. 3

NB. output
j=. ;: ' EPS PDF CANVAS CAIRO ANDROID QT QTC ISI'
('i' ,each j)=: i.#j

NB. =========================================================
NB. item nouns
j=. 'i' ,each cutopen toupper 0 : 0
background
border
box
frame
gd
key
rule
subtitle
text
title
xaxis
xcaption
xgrid
xlabel
xtics
yaxis
ycaption
ygrid
ylabel
ytics
y2caption
y2label
y2tics
zaxis
zcaption
zgrid
zlabel
ztics
data
)

ItemNames=: j
(ItemNames)=: i.#ItemNames

NB. =========================================================
readplotdefaults=: 3 : 0
MyPlotDefaults=: flread :: (''"_) jpath '~config/plotdefs.ijs'
)

NB. =========================================================
NB. setplotdefaults - for each new Graf
NB.
NB. argument is empty or character graf positions
NB.
NB. set defaults - for each plot
setplotdefaults=: 3 : 0
select. y
fcase. 'plot' do.
  COLOR=: ''
  IfBar=: IfPie=: 0
  Ndx=: 1
  PCmd=: i.0 0
  PForm=: 'plot'
  Pxywh=: ''
  Types=: ''
fcase. 'new' do.
  IfInit=: 0
  IfMulti=: 0
  0!:100 PlotDefaults
  0!:100 MyPlotDefaults
  ((<'Y2') ,each AxisOpts)=: ". each 'Y' ,each AxisOpts
fcase. do.
  CLEAR=: 1
  BrushColor=: 255 255 255
  Data=: Frame=: Rule=: Text=: ''
  DataRep=: 1
  DimType=: 2
  Gcmd0=: i.0 0
  Gcmd1=: i.0 0
  Opts=: <i.0 0
  Pen=: 1 0
  PenColor=: 0 0 0
  PText=: i. 0 0
  XDiv=: YDiv=: Y2Div=: ZDiv=: 0
  XMax=: YMax=: Y2Max=: ZMax=: Max3d=: __
  XMin=: YMin=: Y2Min=: ZMin=: Min3d=: _
end.
if. -. IFTESTPLOTJHS +. IFJHS +. IFQT +. IFJA +. ('jwin32';'jjava') e.~ < (11!:0) ::0: 'qwd' do.
  if. IFQT do.
    r=. 'OUTPUT=: ''qt'''
  elseif. IFJA do.
    r=. 'OUTPUT=: ''android'''
  elseif. ('jwin32';'jjava') e.~ < (11!:0) ::0: 'qwd' do.
    r=. 'OUTPUT=: ''isi'''
  elseif. ('cairo' -: CONSOLEOUTPUT) do.
    r=. 'OUTPUT=: ''cairo'''
  elseif. do.
    r=. 'OUTPUT=: ''pdf'''
  end.
end.
EMPTY
)
