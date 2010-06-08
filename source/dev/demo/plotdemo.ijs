NB. plotdemo.ijs   - plot demos
NB.
NB. uses locale jdplot

IFJ7=: 700 < 0 ". ({. ~i.&'/') }.9!:14''
3 : 0''
if. IFJ7 do.
  require 'graphics/plot trig'
else.
  require 'dates files isigraph numeric graphics/plot trig'
end.
''
)

path=. jpath '~addons/graphics/plot/demo/'
files=. path&,@(,&'.ijs') each ;: 'plexam plotdwin pledit plview'
coclass 'jdplot'
coinsert 'jzplot';'jafm';'jgl2'
load files

plotdemo_run_jdplot_''
