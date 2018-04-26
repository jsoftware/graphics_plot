NB. marker test

len=. 100
x=. steps 0 3,len
y=. 1 2 3 4 5 6 7 8 +/ (len+1) $ 1
m=. 0, len $ _10 {. 1

pd 'reset'
pd 'type line'
pd x;y
pd 'type marker'
pd 'markersize 4'
pd (m#x);m #"1 y
pd 'show'
NB. pd 'pdf'

