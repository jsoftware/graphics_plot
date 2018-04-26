NB. user functions
NB.

NB. =========================================================
NB. [options] plot data
NB. first option may be a type
NB. e.g. 'bar;title My chart' plot 1 2 3 4
plot=: 3 : 0
'' plot y
:
opt=. x
dat=. y

NB. check for type:
if. #opt do.
  ndx=. opt i.';'
  first=. deb ndx{.opt
  ind=. <./ first i.', '
  if. (<ind {. first) e. PlotTypes do.
    opt=. 'type ',opt
  end.
end.

pd 'reset'
pd boxcmd opt

NB. ---------------------------------------------------------
NB. treat doubly nested array as array of plots:
if. 1 < L. dat do.
  txy=. 1000 * > { int01 each |. $dat
  rec=. rndint (_1 _1 }. txy) ,"1 [ 1 1 }. txy
  rec=. ": ,/ |. 0 2 |: rec
  dat=. ,dat
  for_d. dat do.
    pd 'use ',d_index { rec
    pd > d
  end.
NB. ---------------------------------------------------------
NB. treat 3D array as list of 2D data items
elseif. 3 = #$dat do.
  for_d. dat do.
    pd d
  end.
NB. ---------------------------------------------------------
elseif. do.
  pd dat
end.

pd 'show'
EMPTY
)
