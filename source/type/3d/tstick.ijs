
require 'numeric trig'

u=. steps 0 6.5 150
r=. sin steps (o. (,-.)0.1), <:#u
x=. r*cos u
y=. r*(sin*cos) u
z=. 0.1*u

pd 'reset'
pd 'new'
pd 'type stick'
pd 'backcolor lightgray'
pd 'color darkblue'
pd 'viewpoint _1 2 1'
pd 'viewsize 1 1 0.75'
pd x;y;z
pd 'show'
