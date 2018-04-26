NB. tics

NB. =========================================================
NB. getticpos
NB. get tic positions for data (where not given)
NB.
NB. form: axis getticpos int;tic;min;max;log;cnt
NB. cnt is maximum number of tic subdivisions
NB.
NB. returns min;max;step;int;pos
getticpos=: 4 : 0

'int tic min max log cnt'=. y

if. log do. x gettplog y return. end.

NB. ---------------------------------------------------------
NB. nudge min, max in case near a nice boundary:
if. max ~: min do.
  nmm=. 10 ^ <. <: 10 ^. max - min
  min=. nmm rounddown min
  max=. nmm roundup max
end.

def=. cnt <. (DimType=3) { 10 6
step=. {.tic
wid=. max - min

NB. ---------------------------------------------------------
if. wid=0 do.
  if. #int do.
    if. int=min do.
      'min max'=. straddle min
    else.
      'min max'=. sort int, min
    end.
  else.
    'min max'=. straddle int=. min
  end.
end.

NB. ---------------------------------------------------------
if. #int do.
  max=. max >. int
  min=. min <. int
else.
  if. (min <: 0) *. max >: 0 do.
    int=. 0
  end.
end.

NB. ---------------------------------------------------------
if. step > 0 do.
  s=. step * 1 + i.10
else.
  s=. 1 2 5 10 20 50 100 * pow10 <: <. log10 max - min
end.

if. min < 0 do.
  x=. s roundup min
else.
  x=. s rounddown min
end.
if. max > 0 do.
  y=. s rounddown max
else.
  y=. s roundup max
end.

NB. ---------------------------------------------------------
c=. <. (y - x) % s
ndx=. (c <: def) i. 1
step=. ndx { s,0

if. (step=0) +. ndx = #x do.
  pos=. ''
else.
  pos=. (ndx{x) + step * i. 1 + ndx{c
  min=. min <. {. pos
  max=. max >. {: pos
end.

NB. ---------------------------------------------------------
if. 0=#int do.
  if. max > 0 do.
    int=. 0 >. min
  else.
    int=. max
  end.
end.

NB. ---------------------------------------------------------
step;min;max;int;pos
)

NB. =========================================================
NB. gettics
NB.
NB. return: tics;mark
NB.
NB. fills in minor tics

gettics=: 3 : 0
'tics minor max min log'=. y

NB. ---------------------------------------------------------
if. (minor=0) +. 1 >: #tics do.
  tics;(#tics)$TICMAJOR return.
end.

NB. ---------------------------------------------------------
if. log do.
  tics=. pow10 min + tics * max - min
  tmax=. pow10 max
  tmin=. pow10 min
  tics=. (tics - tmin) % tmax - tmin
  'pos mark'=. gettics tics;minor;0;0;0
  pos=. tmin + pos * tmax - tmin
  pos=. ((log10 pos) - min) % max - min
  pos;mark return.
end.

NB. ---------------------------------------------------------
bgn=. {. tics
end=. {: tics
dif=. end - bgn

step=. minor + 1
len=. ((}.-}:) tics) % step
pos=. bgn + 0, +/\ step # len

if. dif = 1 do.
  mark=. (#pos) $ (1,minor) # TICMAJOR,TICMINOR
else.
  pos=. (bgn - +/\. minor # {. len), pos, end + +/\ minor # {:len
  mark=. ($pos) $ (minor,1) # TICMINOR,TICMAJOR
  msk=. (pos >: 0) *. pos <: 1
  pos=. msk # pos
  mark=. msk # mark
end.

pos;mark
)

NB. =========================================================
NB. log tics
gettplog=: 4 : 0
'int tic lmin lmax log cnt'=. y
def=. cnt <. (DimType=3) { 8 6

NB. ---------------------------------------------------------
NB. if a large spread of values, use fixed size tics:
if. 2.9 < lmax-lmin do.
  max=. >.lmax
  min=. <.lmin
  step=. >.(max-min)%def
  if. 0=#int do.
    int=. min
  else.
    min=. min <. log10 int
  end.
  pos=. min+step*i.>:>.(max-min)%step
  step;min;max;int;pos return.
end.

NB. ---------------------------------------------------------
NB. otherwise, use fixed size steps:
min=. pow10 lmin
max=. pow10 lmax
if. max ~: min do.
  nmm=. 10 ^ <. <: 10 ^. max - min
  min=. nmm rounddown min
  max=. nmm roundup max
end.

step=. {.tic
wid=. max - min

NB. ---------------------------------------------------------
if. wid=0 do.
  if. #int do.
    if. int=min do.
      'min max'=. straddle min
    else.
      'min max'=. sort int, min
    end.
  else.
    'min max'=. straddle int=. min
  end.
end.

NB. ---------------------------------------------------------
if. #int do.
  max=. max >. int
  min=. min <. int
else.
  if. (min <: 0) *. max >: 0 do.
    int=. 0
  end.
end.

NB. ---------------------------------------------------------
if. step > 0 do.
  s=. step * 1 + i.10
else.
  s=. 1 2 5 10 20 50 100 * pow10 <: <. log10 max - min
end.

NB. ---------------------------------------------------------
x=. s rounddown min
y=. s rounddown max
c=. <. (y - x) % s
ndx=. (c <: def) i. 1
step=. ndx { s,0

if. (step=0) +. ndx = #x do.
  pos=. ''
else.
  pos=. (ndx{x) + step * i. 1 + ndx{c
  min=. min <. {. pos
  max=. max >. {: pos
end.

NB. ---------------------------------------------------------
if. 0=#int do.
  int=. min
end.

NB. ---------------------------------------------------------
if. min=0 do.
  pmin=. pow10 lmin
  min=. <. pmin
  if. min=0 do.
    p=. 10 ^ -i.15
    b=. 10 ^ - 1 i.~ pmin >: p
    min=. ({:p) >. b * <. pmin % b
  end.
  int=. int >. min
  pos=. pos >. min
end.

min=. log10 min
max=. log10 max
int=. log10 int
pos=. log10 pos

step;min;max;int;pos

)
