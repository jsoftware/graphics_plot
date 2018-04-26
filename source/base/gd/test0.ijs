wdpclose 'plot'
dbg 1
dbstops''


Plot_jwplot_=: i. 0 0

pd 'reset'
pd 'type bar'
pd 'barwidth 0.4'
pd 'color 128 192 255'
pd 'gdpen 2 0'
pd 'gdlines 0 4r 1000 4r'
pd 'gdend'
pd 'gdpen 5 0;gdpencolor 255 0 0'
pd 'gdlines 0 0 1000 800'
pd 'gdpen 1 0;gdpencolor 0 0 0;gdbrushcolor 0 128 0'
pd 'gdrect 0 0 2r 1r'
pd 5 2 7 3
pd 'show'
