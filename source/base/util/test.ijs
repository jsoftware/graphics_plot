
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
NB. load '~Plot/base/util/test0.ijs'
load '~Plot/base/make/test0.ijs'
dbg 0
