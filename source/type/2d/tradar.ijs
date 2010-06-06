NB. radar test

dat=. ". ;._2 (0 : 0)
0.4 0.6   1
0.5 0.6 0.8
0.5 0.6 0.6
0.6 0.5 0.3
0.4 0.9 0.8
)

pd 'reset'
pd 'new'
pd 'type radar'
pd 'pensize 2'
pd 'title Radar Plot'
pd 'titlefont arial 25 italic'

NB. pd 'backcolor lightgray'
NB. pd 'gridcolor gray'
NB. pd 'forecolor gray'
NB. pd 'itemcolor red,blue,green'
NB. pd 'grids 1'
NB. NB. pd dat

pd 3 10 ?@$ 10  NB. 3 lines with 10 points

dbg 1
dbstop''
dbstop'plot_radar'
pd 'show'
NB. pd 'pdf'

