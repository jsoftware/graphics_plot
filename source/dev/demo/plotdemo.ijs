NB. plotdemo.ijs   - plot demos
NB.
NB. uses locale jdplot

NB. require 'dates files isigraph numeric plot trig'
require 'plot trig'

NB. path=. jpath '~system/examples/graphics/plot/'
path=. jpath '~addons/graphics/plot/demo/'
files=. path&,@(,&'.ijs') each ;: 'plexam plotdwin pledit plview'
coclass 'jdplot'
coinsert 'jzplot';'jafm';'jgl2'
load files

plotdemo_run_jdplot_''
