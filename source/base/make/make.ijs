NB. make
NB.
NB. builds Plot matrix as:
NB.
NB. 0 Sequence number - for sorting
NB. 1 Type - eg. xaxis, xlabel
NB. 2 Item - eg. line, pie
NB. 3 Value
NB. 4 Style
NB. 5 Fit
NB. 6 Pen Color - line or edge
NB. 7 Brush Color - fill
NB. 8 Position

NB. =========================================================
make=: 3 : 0
'out xywh'=. y
setoutput out
setpxywh xywh
Plot=: i. 0 0
Ndx=: 1
cmd=. setoptions PCmd
makesub cmd
Plot=: Plot /: {."1 Plot
EMPTY
)
