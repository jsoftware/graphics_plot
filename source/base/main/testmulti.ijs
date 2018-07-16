
load '~addons/graphics/plot/jzplot.ijs'
load '~addons/graphics/plot/plot.ijs'

dat=: 'subtitle abc'&; each <"1 |:(i.6) ^/ 1 + 0.2 * i.6

NB. pd 'reset'
NB. pd 'multi 1 2,1 2 3'
NB. pd 'title MultiPlot with no Grouping'
NB. pd dat
NB. pd 'show'

dbg 0
dbstops 'makenew'

dat=: a: 2 4 } dat

pd 'reset'
pd 'multi 1 2,1 2 3'
pd 'title MultiPlot with no Grouping'
pd >dat
pd 'show'
