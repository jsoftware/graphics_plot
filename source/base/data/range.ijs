NB. range

NB. =========================================================
NB. get data ranges
NB.
NB. these values may be updated by user-defined ranges
getdatarange=: 3 : 0

'types dat y2msk yaxes'=. y

min=. getmin "1 dat
max=. types & getmax "1 dat

y2min=. y2max=. zmin=. zmax=. 0

select. yaxes

case. 1 0 do.
  'xmin ymin zmin'=. <./ min
  'xmax ymax zmax'=. >./ max
case. 0 1 do.
  'xmin y2min zmin'=. <./ min
  'xmax y2max zmax'=. >./ max
  ymin=. y2min
  ymax=. y2max
case. 1 1 do.  NB. only 2D data
  lmsk=. -.y2msk
  rmsk=. y2msk

  'xln yln j'=. <./ lmsk # min
  'xlx ylx j'=. >./ lmsk # max
  'xrn yrn j'=. <./ rmsk # min
  'xrx yrx j'=. >./ rmsk # max

  xmin=. xln <. xrn
  xmax=. xlx >. xrx
  ymin=. yln
  ymax=. ylx
  y2min=. yrn
  y2max=. yrx
end.

NB. ---------------------------------------------------------
if. (<'radar') e. types do.
  ymin=. 0 <. ymin
  ymax=. 1 >. ymax
end.

if. (<'density') e. types do.
  'xmin xmax ymin ymax'=. (xmin,xmax,ymin,ymax)+4$0.5*_1 1
end.

NB. ---------------------------------------------------------
(xmin,xmax);(ymin,ymax);(y2min,y2max);zmin,zmax

)

