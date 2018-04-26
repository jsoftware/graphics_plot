
require 'debug numeric trig'
cocurrent 'base'

load '~addons/graphics/plot/jzplot.ijs'
load '~addons/graphics/plot/plot.ijs'

pd 'reset'
pd 'textfont arial 26 bold italic'
pd 'textcolor darkslateblue'
pd 'textc 500 _20x J Plot'
pd 'new 40x 20x -40x -70x'
pd 'title sin(exp) vs cos(exp)'
pd 'color red,green'
pd 'key sin(exp),cos(exp)'
x=. steps _1 2 100
pd x;sin ^x
pd x;cos ^x
pd 'show'



Note''
pd 'reset'
pd 'textfont arial 26 bold italic'
pd 'textcolor darkslateblue'
pd 'title x * cos x'
pd 'color red,green'
x=. _400 + 3 * i.120
pd x;(*cos)x
pd 'show'
)
