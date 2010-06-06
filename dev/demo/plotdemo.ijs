NB. plotdemo.ijs   - plot demos
NB.
NB. uses locale jdplot

require 'dates files isigraph numeric plot trig'

path=. jpath '~system/examples/graphics/plot/'
files=. path&,@(,&'.ijs') each ;: 'plexam plotdwin pledit plview'
coclass 'jdplot'
coinsert 'jzplot';'jafm';'jgl2'
load files

plotdemo_run_jdplot_''
