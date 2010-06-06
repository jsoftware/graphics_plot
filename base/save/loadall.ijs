NB. load all PLT source files

require 'dates'

cocurrent 'jprojsave'

load '~Source\plot\base\save\files.ijs'

rel=. jpath '~Source\plot\release\'
files=. ((1: + i:&'\') }. ]) each SOURCEFILES
files=. (rel&, @ (,&'.ijs')) each files
load files

load '~system\classes\plot\plotdefs.ijs'
('jgl2';'z') copath 'jzplot'
(;: 'jzplot jafm jgl2 z') copath 'jwplot'
