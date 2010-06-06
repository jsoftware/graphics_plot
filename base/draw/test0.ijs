NB. test

require 'trig numeric'

x=. steps _1 2 50
pd 'reset'
pd 'key sin(x*20)*arctan(x),123,bleh'
NB. pd 'keystyle horiz'
pd 'keystyle tbho'
pd 'keypos outside'
pd x ; (sin x*20) * arctan x
pd 'show'
