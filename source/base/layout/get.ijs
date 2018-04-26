NB. get

NB. =========================================================
NB. getminor
NB. forms: step getminor max
NB. get minor tics
NB. returns 3 (if step 1/2) or 4 if (step 5)
getminor=: 4 : 0
(y > 2) * 3 + 2 = (pow10 >. log10 x) % x
)

NB. =========================================================
NB. getminmax
NB. get min,max,int (where ticpos is given)
NB.
NB. form: axis minmax int;tic;ticpos;min;max;log
NB.
NB. returns min,max,int
getminmax=: 4 : 0

'int tic ticpos min max log'=. y

NB. ---------------------------------------------------------
if. log=1 do.
  dat=. (pow10 int);tic;(pow10 ticpos);(pow10 min);(pow10 max);2
  log10 each x getminmax dat return.
end.

NB. ---------------------------------------------------------
NB. nudge min, max in case near a nice boundary:
min=. (10 ^ <. _2.9 + 10 ^. | min) rounddown min
max=. (10 ^ <. _2.9 + 10 ^. | max) roundup max

NB. ---------------------------------------------------------
if. 0=#int do.
  if. max > 0 do.
    int=. 0 >. min
  else.
    int=. max
  end.
end.

NB. ---------------------------------------------------------
min,max,int
)

NB. =========================================================
NB. gettfm
NB. defines: ViewDist, Tfm, XYZMin, XYZDiff, fitxyz
gettfm=: 3 : 0
view=. VIEWPOINT-VIEWCENTER
ViewDist=: dist view
n=. view % ViewDist
v=. unitvec VIEWUP - n * n mp VIEWUP
t=. (v cross n),.v,.n
r=. -VIEWCENTER mp t
tfm=. (t,.0),r,1
XYZMin=: XMin,YMin,ZMin
XYZDiff=: (XMax,YMax,ZMax)-XYZMin
fitxyz=: [: movepos & XYZMin scalepos & XYZDiff
fit=. ((VIEWSIZE*=i.3)%XYZDiff),(-0.5+XYZMin%XYZDiff),1
Tfm=: fit mp tfm
)

