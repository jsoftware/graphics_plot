NB. plotdemo.ijs   - plot demos
NB.
NB. uses locale jdplot

require ' graphics/plot'

path=. jpath '~addons/demos/wdplot/'
files=. path&,@(,&'.ijs') each ;: 'plexam plotdwin pledit plview'
coclass 'jdplot'
coinsert 'jzplot jafm jgl2'

load files

plotdemo_run_jdplot_ 'jdplot'
