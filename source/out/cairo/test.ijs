
require 'debug'
cocurrent 'base'
dbg 1
dbstop''

NB. =========================================================
NB. load in all source files:
load '~Plot/base/save/build.ijs'
load '~addons/ide/jhs/core.ijs'
plotdef 'none';'plot';480 360;'cairo'

NB. =========================================================
NB. load specific test script:
load '~Plot/out/cairo/test0.ijs'

