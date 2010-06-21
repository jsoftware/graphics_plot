NB. plotdemos
NB.
NB. run plot demos in session

IFJ7_z_=: 700 < 0 ". ({. ~i.&'/') }.9!:14''
3 : 0''
if. IFJ7 do.
  require 'graphics/plot trig'
else.
  require 'dates files isigraph numeric graphics/plot trig'
end.
''
)

load '~addons/graphics/plot/demo/plexam.ijs'

coinsert_jdplot_ 'jzplot'

NB. =========================================================
plotdemos_z_=: 3 : 0
cocurrent 'jdplot'
sel=. {.y,0
sel=. 0 >. sel <. <:#PLOTNAMES
cmd=. ". 'D',sel pick PLOTNAMES
0!:100 'pd ''reset''',LF,cmd,LF,'pd ''show'''
)
