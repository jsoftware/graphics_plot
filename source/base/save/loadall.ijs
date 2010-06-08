NB. load all PLT source files

require 'dates'

cocurrent 'jprojsave'

load '~Plot/base/save/files.ijs'

rel=. jpath '~Plot/release/'
files=. ((1: + i:&'/') }. ]) each SOURCEFILES
files=. (rel&, @ (,&'.ijs')) each files
load files

load '~addons/graphics/plot/plotdefs.ijs'
('jgl2';'z') copath 'jzplot'
(;: 'jzplot jafm jgl2 z') copath 'jwplot'
