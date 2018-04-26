NB. util

AxisIn=: ;: 'INT LABEL LOG Min Max RANGE TIC TICPOS'
AxisOut=: ;: 'Div Int Label Min Minor Max Step Tics TicPos'

NB. =========================================================
getaxes=: 3 : 0
if. IfPie do. return. end.
getaxis 'X'
getaxis 'Y'
if. {:YAxes do.
  getaxis 'Y2'
else.
  Y2Tics=: ''
  if. DimType=3 do.
    getaxis 'Z'
  end.
end.
)

NB. =========================================================
NB. get nouns for given axis
getaxis=: 3 : 0
pm=. y
wid=. ('Y'={.pm) { Lw,Lh
dat=. ". each (<pm) ,each AxisIn
dat=. dat,pm;wid;IfBar
((<pm) ,each AxisOut)=: getaxis1 dat
)

NB. =========================================================
getaxis1=: 3 : 0
nms=. AxisIn,;:'pm wid ifbar'
(nms)=. y

NB. ---------------------------------------------------------
Div=. 0
Tics=. $0
Int=. INT
Label=. LABEL
TicPos=. TICPOS
'Step Minor'=. TIC

NB. ---------------------------------------------------------
NB. max tic count:
wid=. wid - getplotfontsize LabelFontX
mtc=. <. wid % MinTic

if. #RANGE do.
  Min=. {.RANGE
  Max=. 1{RANGE,Max
end.

if. #Int do.
  Min=. Min <. Int
  Max=. Max >. Int
end.

if. #Label do.
  if. #TicPos do.
    if. (#TicPos) ~: #Label do.
      signal 'Number of labels and tic positions should be the same'
    end.
  else.
    TicPos=. Label getaxis_tics pm
  end.
end.

if. #TicPos do.
  Min=. Min <. <./TicPos
  Max=. Max >. >./TicPos
end.

NB. X barchart ---------------------------------------
if. ifbar *. pm = 'X' do.

  if. 0=#Label do.
    if. #TicPos do.
      Label=. ": each TicPos
    else.
      steps=. >./ # &> {."1 Data
      Label=. ": each >:i.steps
    end.
  end.

  if. 0 = #TicPos do.
    steps=. >./ # &> {."1 Data
    TicPos=. Min + (Max-Min)*int01 <: steps
  end.

  Div=. 0
  Int=. Min

NB. not X barchart -----------------------------------
else.

  if. ifbar do.
    select. 0 <: Min, Max
    case. 1 1 do.
      Min=. 0
    case. 0 0 do.
      Max=. 0
    end.
  end.

  if. #TicPos do.
    'Min Max Int'=. pm getminmax Int;TIC;TicPos;Min;Max;LOG
  else.
    'Step Min Max Int TicPos'=. pm getticpos Int;TIC;Min;Max;LOG;mtc
  end.
  Div=. zero (Int-Min)%Max-Min

end.

NB.  -----------------------------------
Tics=. 2 }. fit01 Min,Max,TicPos
Range=. Min,Max

NB.  -----------------------------------
if. Minor = _1 do.
  if. (0=#TICPOS) *. (Step > 0) *. 1 < #TicPos do.
    Minor=. Step getminor <. wid % MinMTic * <: #TicPos
  else.
    Minor=. 0
  end.

end.

NB. ---------------------------------------------------------
". each AxisOut
)

NB. =========================================================
NB. getaxis_tics
NB.
NB. can improve this by looking at all data
getaxis_tics=: 4 : 0
labs=. x
select. {. y
case. 'X' do.
  dim0 (<0 0) pick Data
case. 'Y' do.
  dim1 (<0 1) pick Data
case. 'Y2' do.
  dim1 (<(PSDataY2 i.1);1) pick Data
case. 'Z' do.
  zdata=. ; ,each 2 {"1 Data
  n=. <./zdata
  x=. >./zdata
  steps n,x, <:#labs
end.
)
