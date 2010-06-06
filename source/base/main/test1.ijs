NB. =========================================================
foo=: 3 : 0
a=: conew 'jzplot'
cocurrent a
x=. steps _3 2 100

pd 'reset'
pd 'frame 0'
pd 'title xy Plot'
pd 'xcaption X Caption stuff'
pd 'ycaption Y Caption stuff'
NB. pd 'grids 1 1'
NB. pd 'labelfont Arial 200'
pd 'backcolor white'
NB. pd 'xlabel one two three'
NB. pd 'backcolor antiquewhite'
pd 'pensize 2'
pd 'itemcolor red,blue'
pd 'key "5 * sin" "blue line"'
pd 'keystyle rb'
pd 'keypos ',y#'b'
pd x;(5*sin x),: _1 + (x+1)*(x+2)*(x-2)
pd 'show'
)

NB. NB. =========================================================
NB. foo=: 3 : 0
NB. cocurrent a=: conew 'jzplot'
NB.
NB. pd 'new'
NB. pd 'backcolor lightgray'
NB. pd 'textfont Arial 35 italic'
NB. pd 'textcolor blue'
NB. pd 'text 120 900 Elbow Room'
NB.
NB. pd 'new 0 0 500 800'
NB. pd 'clear 0'
NB. pd 'textfont Arial 25 italic'
NB. pd 'text 310 860 Population'
NB. pd 'color red,blue,green,yellow,teal'
NB. pd 'type pie'
NB. pd  25 1008 684 117 229
NB.
NB. pd 'new 470 200 500 800'
NB. pd 'clear 0'
NB. pd 'textfont Arial 25 italic'
NB. pd 'text 330 860 Land Area'
NB. pd 'color red,blue,green,yellow,teal'
NB. NB. pd 'key Canada china India Japan USA'
NB. NB. pd 'keystyle o'
NB. NB. pd 'keypos br'
NB. pd 'type pie'
NB. pd  9972 9587 3116 381 9160
NB.
NB. pd 'new'
NB. pd 'clear 0'
NB. pd 'color red,blue,green,yellow,teal'
NB. pd 'key Canada china India Japan USA'
NB. pd 'keystyle o'
NB. pd 'keypos br'
NB. pd 'show'
NB. )


