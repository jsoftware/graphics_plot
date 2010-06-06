NB. marker
NB.
NB. 0=diamond
NB. 1=square
NB. 2=circle
NB. 3=triangle
NB. 4=plus (+)
NB. 5=times (x)
NB. line (for keys)

MarkerNames=: ;: 'diamond square circle triangle plus times'
KeyMarkerNames=: MarkerNames,<'line'

NB. =========================================================
plot_marker=: 3 : 0
dat=. getgrafmat y
clr=. getitemcolor #dat
if. #MARKERS do.
  nms=. MARKERS { MarkerNames
else.
  nms=. MarkerNames
end.
mrk=. ((#nms) | i. #dat) { nms
for_d. dat do.
  drawmarker iDATA;(MarkerScale*MARKERSIZE);(d_index{clr);(d_index{mrk),<_2 [\ d
end.
)
