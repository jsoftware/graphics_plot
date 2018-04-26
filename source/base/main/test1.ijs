NB. examples of multiplots

require 'graphics/plot'

NB. =========================================================
NB. simple subplot example (not multiplot)
splot1=: 3 : 0
pd 'reset'
X=. i.6
d=. |: X ^/ 1 + 0.2 * i.6
pd 'sub 1 2,1 2 3'
for_i. i.6 do.
  pd 'new'
  pd i{d
end.
pd 'show'
)

NB. =========================================================
NB. simple multiplot example, no grouping
mplot1=: 3 : 0
pd 'reset'
X=. i.6
p=. '';"1 |:X ^/ 1 + 0.2 * i.6
pd 'multi 1 2,1 2 3'
pd 'title MultiPlot with no Grouping'
pd p
pd 'show'
)

NB. =========================================================
NB. multiplot example
mplot2=: 3 : 0
pd 'reset'
X=. i.6
p=. '';"1 |:X ^/ 1 + 0.2 * i.6
pd 'multi 1 2,1 2 3'
pd 'title MultiPlot with Y Grouping'
pd 'ygroup 0 1'
pd p
pd 'show'
)

NB. =========================================================
NB. multiplot with each row and each column grouped
mplot3=: 3 : 0
pd 'reset'
X=. i. each 6 + i.9
Y=. X ^ each 1 + 0.3 * i.9
p=. (<'type line'),. <"1 X,.Y
pd 'multi 2 3 2,2 3 3'
pd 'title Grouped MultiPlot'
pd 'captionfont arial bold 20'
pd 'xcaption "col 1" "col 2" "col 3"'
pd 'ycaption "row 1" "row 2" "row 3"'
pd 'xgroup 0 1 2'
pd 'ygroup 0 3 6'
pd p
pd 'show'
)

NB. =========================================================
NB. multiplot with various groupings
mplot4=: 3 : 0
pd 'reset'
X=. i.6
p=. <"1 'type line';"1 |:X ^/ 1 + 0.2 * i.9
m=. 'type pie;keypos obr;keystyle of;key apple plum cherry pecan';p:i.4
n=. (4{p) , <'type line';<(p:i.8)
n=. (4 pick p) ,: 'type line,stick;color red';<(p:i.8)
s=. 'noaxes;textfont arial 25 bold;textcolor blue;textc 500 600 Grouped Plots';''
p=. (m;n;<s) 4 5 8 } p
pd 'multi 2 3 2,2 3 2'
pd 'title Grouped MultiPlot'
pd 'captionfont arial bold 20'
pd 'xcaption "col 1" "col 2" "col 3"'
pd 'ycaption "row 1" "row 2" "row 3"'
pd 'xgroup 0 1 2 0 3 2 0 1 4'
pd 'ygroup 0 0 0 1 3 1 2 2 4'
pd p
pd 'show'
)

smoutput 0 : 0
Try:
   splot1''
   mplot1''
   mplot2''
   mplot3''
   mplot4''

Running:

   mplot4''
)

mplot4''
