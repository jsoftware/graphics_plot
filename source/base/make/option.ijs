NB. option

NB. =========================================================
setcolorrep=: 3 : 0
if. *./ 1 = DataRep do. return. end.
f=. 4 : 'y #~ 1 >. (#y) {. x'
COLOR=: DataRep f COLOR
BANDCOLOR=: DataRep f BANDCOLOR
ITEMCOLOR=: DataRep f ITEMCOLOR
)

NB. =========================================================
defineoptions=: 3 : 0
if. #y do.
  ({."1 y)=: {:"1 y
end.
)

NB. =========================================================
definecolor=: 3 : 0
if. #COLOR do.
  if. IfBand do.
    BANDCOLOR=: COLOR
  else.
    ITEMCOLOR=: COLOR
  end.
  COLOR=: ''
end.
if. #FRAMEBACKCOLOR do.
  FrameBackColor=: FRAMEBACKCOLOR
else.
  FrameBackColor=: BACKCOLOR
end.
if. #GRAPHBACKCOLOR do.
  GraphBackColor=: GRAPHBACKCOLOR
else.
  GraphBackColor=: FrameBackColor
end.
)

NB. =========================================================
NB. setoptions
NB.
NB. argument is a matrix of plot commands
NB.
NB. for defined options, updates matrix
NB. with names and values
setoptions=: 3 : 0

if. 0 e. $y do. i.0 0 return. end.

mat=. citemize y

opt=. toupper each {."1 mat
if. 0 e. opt e. DefOpts,PDDefs,PDGD do.
  j=. tolower 0 pick opt -. DefOpts,PDDefs,PDGD
  signal 'option not found: ', j
end.

arg=. {:"1 mat

ndx=. I. opt e. DefOpts
def=. ndx { opt

if. Y2Axis e. def do.
  ind=. I. ('Y' = {.&> def) > +./\. Y2Axis = def
  new=. (<'Y2') ,each }. each ind { def
  def=. new ind } def
end.

val=. {:"1 ndx { mat
ind=. DefOpts i. def
typ=. ind { DefOptx

for_i. i.#def do.

  dat=. i pick val
  select. i{typ
  case. 'A' do.
    dat=. boxarg dat
  case. 'B' do.
    dat=. boxarg tolower dat
  case. 'C' do.
  case. 'D' do.
    dat=. dat rplc '<br/>';LF
  case. 'F' do.
    dat=. getfont dat
  case. 'K' do.
    dat=. keyarg dat
  case. 'M' do.
    dat=. SEPARATOR mfv dat
  case. 'N' do.
    dat=. {. fix dat
  case. 'T' do.
    dat=. +/ ". &> 'i'&, each boxarg toupper comma2blank dat
  case. 'U' do.
    dat=. toupper {. dat
  case. 'V' do.
    dat=. fix dat
  case. 'X' do.
    dat=. ".toupper dat
  case. 'Y' do.
    dat=. _3[\, rndint ".toupper dat
  case. 'S' do.
    select. i pick def
    case. 'MARKERS' do.
      dat=. MarkerNames setfixx dat
    case. 'KEYMARKERS' do.
      dat=. KeyMarkerNames setfixx dat
    case. do.
      signal 'plot option not supported'
    end.
  case. do.
    signal 'plot option not supported'
  end.
  val=. (<dat) i } val
end.

mat=. (def,.val) ndx } mat
)

NB. =========================================================
NB. namelist setfixx indices or namelist
setfixx=: 4 : 0
if. *./ y e. '0123456789 ' do.
  fix y
else.
  y=. ',',tolower y
  x i. a: -.~ (y e. ', ') <;._1 y
end.
)
