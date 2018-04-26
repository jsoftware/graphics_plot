NB. maketype
NB.
NB. following commands process a type block.

NB. =========================================================
maketype=: 3 : 0

'y2 ndx opt type'=. y

defineoptions opt
definecolor''

if. #type do.
  DataNdx=: 0
  TYPE=: type
end.

NB. ---------------------------------------------------------
if. y2 do.
  sety2vals''
end.

NB. ---------------------------------------------------------
p=. (DimType=3) { 'plot_';'plot3d_'
fns=. p ,each TYPE
for_f. fns do.
  (>f)~ndx
end.

NB. ---------------------------------------------------------
NB. update color/style index:
if. 1 e. TYPE e. 'errorbar';'hilo' do.
  DataNdx=: DataNdx + 1
else.
  DataNdx=: DataNdx + # citemize (<ndx;1) pick Data
end.
)

NB. =========================================================
sety2vals=: 3 : 0
((<'Y') ,each AxisOut)=: ". each (<'Y2') ,each AxisOut
)
