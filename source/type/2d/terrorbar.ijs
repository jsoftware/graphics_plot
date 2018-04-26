
require 'numeric trig'

x=. }. }: steps 0 4 40
r=. |:_3[\?(3*#x)#10
s=. 0.25

mid=. _5 + (10*sin x) + 0{r
hi=. mid+0.5+s*1{r
lo=. mid-0.5+s*2{r

pd 'reset'
pd 'frame 1'
pd 'title Error Bar'
pd 'titlefont arial 25 italic'
pd 'backcolor lightgray'
pd 'color blue'
pd 'type errorbar'
pd x;hi,mid,:lo
pd 'show'
