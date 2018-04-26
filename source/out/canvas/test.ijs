
require 'debug'
cocurrent 'base'
dbg 1
dbstop''

IFTESTPLOTJHS_z_=: 1

NB. =========================================================
NB. load in all source files:
load '~Plot/base/save/build.ijs'
load '~addons/ide/jhs/core.ijs'
plotdef 'none';'plot';480 360;'canvas'

NB. =========================================================
NB. load specific test script:
load '~Plot/out/canvas/test0.ijs'

