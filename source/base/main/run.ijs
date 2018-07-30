
require 'debug numeric trig'
cocurrent 'base'

wdpclose 'plot'
wdpclose 'plotdemo'

load '~addons/graphics/plot/jzplot.ijs'
load '~addons/graphics/plot/plot.ijs'

NB. load '~Plot/type/2d/test.ijs'

NB. test labels (left,center,right and vertically centered):
pd 'reset'
pd 2 3 7 5 4
pd 'text 2p 3p label1'
pd 'textc 1p 4.5p label2'
pd 'textr 3.5p 6p label3'
pd 'show'
pd 'pdf t1.pdf'
