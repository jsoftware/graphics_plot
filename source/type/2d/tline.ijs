
require 'numeric trig'

dat=. sin steps 0 8 50

pd 'reset'
pd 'frame 1'
pd 'showboxes 0'
pd 'backcolor ANTIQUEWHITE'
pd 'type line'
pd 'pensize 2'
pd 'guidesize 1'
pd 'title sin x^2'
pd 'xcaption foo'
pd dat
NB. pd dat + 0.5
NB. pd 'type stick'
NB. pd dat
pd 'show'

