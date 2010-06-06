NB. test hilo

require 'files'

DATHILO=: }. 'm' fread jpath '~system/examples/data/dm0396.txt'

dat=. (-200 <.#DATHILO) {. DATHILO
dat=. ',' cutopen"1 dat
dat=. 2 3 4{"1 dat
dat=. |: ". &> dat
pd 'reset'
pd 'type hilo'
pd 'itemcolor darkblue'
pd 'grids 1'
pd 'title March 1996 Deutsche Mark Future'
pd 'titlefont arial 25'
pd dat
pd 'show'

