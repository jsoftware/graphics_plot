
buildproject_jproject_ 1

require 'debug'
cocurrent 'base'
dbg 1
dbstop''
wdpclose 'plot'
wdpclose 'plotdemo'

NB. =========================================================
NB. load in all source files:
load '~Plot/base/save/loadall.ijs'

NB. =========================================================
NB. load specific test script:
load '~Plot/base/main/test0.ijs'
dbg 0
