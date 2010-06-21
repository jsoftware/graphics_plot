NB. markers

NB. =========================================================
gtkmark_circle=: 4 : 0
s=. rndint x * 3
p=. (y - s) ,"1 >: +: s,s
p=. p,"1 ] 10000 _1 10000 0
glarc p
)

NB. =========================================================
gtkmark_diamond=: 4 : 0
p=. 8 $"1 y
d=. rndint (4 * x) * _1 0 0 1 1 0 0 _1
p=. p +"1 d
glpolygon p
)

NB. =========================================================
NB. following only used for key markers, given singly
gtkmark_line=: 4 : 0
'x y'=. , y
p=. >.(x--:KeyLen),(y--:KeyPen),<:KeyLen,KeyPen
gllines p
)

NB. =========================================================
gtkmark_plus=: 4 : 0
s=. rndint 4 0 * x
p=. (y -"1 s) ,"1 y +"1 s
s=. |. s
p=. p , (y -"1 s) ,"1 y +"1 s
gllines p
)

NB. =========================================================
gtkmark_square=: 4 : 0
s=. rndint x * 3
p=. (y - s) ,"1 +: s,s
glrect p
)

NB. =========================================================
gtkmark_times=: 4 : 0
if. x = 1 do.
  p=. (y - 3) ,. y + 4
  q=. (y - "1 [ 3 _3) ,. y +"1 [ 4 _4
  p=. p, (p +"1 [ 0 1 _1 0), p + "1 [ 1 0 0 _1
  q=. q, (q +"1 [ 0 _1 _1 0), q +"1 [ 1 0 0 1
else.
  s=. rndint _1 + 3 * x
  n=. rndint 2 * x
  p=. (y - s) ,. y + s
  q=. (y - "1 s * 1 _1) ,. y +"1 s * 1 _1
end.
gllines p,q
)

NB. =========================================================
gtkmark_triangle=: 4 : 0
s=. rndint 2 * x
t=. rndint 4 * x
'x y'=. |: y
p=. rndint (x-t),.(y+s),.(x+t),.(y+s),.x,.y-t
glpolygon p
)
