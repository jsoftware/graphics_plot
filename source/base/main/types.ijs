NB. plot types
NB.
NB. PlotTypes2d are plots with 2d output
NB. PlotData2d are plots with 2d data
NB. etc.

TextTypes=: ;: 'text textc textr'

NB. =========================================================
NB. 2d output types:
PlotTypes2d=: <;._2 (0 : 0)
area
bar
contour
density
dot
errorbar
fbar
fbarv
hilo
hist
line
marker
pie
poly
point
radar
sbar
sbarv
stick
symbol
)

NB. =========================================================
NB. 3d output types:
PlotTypes3d=: <;._2 (0 : 0)
dot
line
poly
stick
surface
wire
)

NB. =========================================================
NB. data types:
j=. ;: 'contour density'
PlotData2d=: PlotTypes2d -. j
PlotData3d=: PlotTypes3d, j

NB. =========================================================
NB. plot types

NB. The 'v' versions of fbar and sbar are
NB. show in reverse order

PlotTypes=: ~. PlotTypes2d,PlotTypes3d

LineTypes=: ;:'dot errorbar hist line marker point poly radar stick symbol'
BarTypes=: ;:'bar fbar fbarv hist sbar sbarv'
PieTypes=: 'pie';'radar'
FrameTypes=: 'contour';'density'

BandTypes=: 'density';'surface';'wire'

NB. types whose range is determined by summation:
SumXTypes=: ''
SumYTypes=: ;: 'fbar fbarv sbar sbarv'
SumZTypes=: ''
