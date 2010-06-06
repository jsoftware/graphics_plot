
require 'numeric trig'

dbg 1
dat=. sin steps 0 8 50

pd 'reset'
pd 'showboxes 1'
pd 'backcolor ANTIQUEWHITE'
pd 'type line'
pd 'pensize 2'
pd 'title sin x^2'
pd dat
pd dat + 2
pd 'type stick'
pd dat
pd 'show'

