NB. 3d line

require 'numeric trig'

u=. 0.5 * steps 0 50p1 500
r=. sin steps (o. (,-.)0.1), 500
x=. r*sin u
y=. r*cos u
z=. 0.1*u
pd 'reset'
pd 'backcolor lightgray'
pd 'color red'
pd 'viewpoint 1.3 0.9 0.25'
pd 'viewsize 1'
pd x;y;z
pd 'show'
