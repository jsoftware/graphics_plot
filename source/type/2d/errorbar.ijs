NB. errorbar  plot line commands
NB.
NB. plot_errorbar

NB. =========================================================
NB. data is 3 row citemize: hi,mid,lo
plot_errorbar=: 3 : 0

'x y'=. getgrafxy y
'r c'=. $y

if. r ~: 3 do.
  signal 'errorbar data should have 3 rows'
end.

'hi mid lo'=. y
j=. ,./x,."1 [ hi ,: lo
k=. _3 0 3 0 +"1 ,.~ _2[\,j
errorbar=. j,k

xm=. ,x,.mid

clr=. getitemcolor 1
drawline iDATA;clr;PENSIZE;xm
drawline iDATA;clr;PENSIZE;errorbar
)
