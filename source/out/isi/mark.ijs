NB. markers

NB. =========================================================
isimark_circle=: 4 : 0
s=. rndint x * 3
p=. (y - s) ,"1 >: +: s,s
gpbuf ,gpcount 2008 ,"1 p
)

NB. =========================================================
isimark_diamond=: 4 : 0
s=. rndint x * 4
'x y'=. |: y
p=. (x-s),.y,.x,.(y+s),.(x+s),.y,.x,.y-s
gpbuf ,gpcount 2029 ,"1 p
)

NB. =========================================================
NB. following only used for key markers, given singly
isimark_line=: 4 : 0
'x y'=. , y
p=. >.(x--:KeyLen),(y--:KeyPen),<:KeyLen,KeyPen
gpbuf ,gpcount 2031 ,p
)

NB. =========================================================
isimark_plus=: 4 : 0
s=. rndint 4 1 * x
p=. (y -"1 s) ,"1 +: s
s=. |. s
p=. p , (y -"1 s) ,"1 +: s
gpbuf ,gpcount 2031 ,"1 p
)

NB. =========================================================
isimark_square=: 4 : 0
s=. rndint x * 3
p=. (y - s) ,"1 +: s,s
gpbuf ,gpcount 2031 ,"1 p
)

NB. =========================================================
isimark_times=: 4 : 0

NB. ---------------------------------------------------------
if. x = 1 do.
  p=. (y - 3) ,. y + 4
  q=. (y - "1 [ 3 _3) ,. y +"1 [ 4 _4
  p=. p, (p +"1 [ 0 1 _1 0), p + "1 [ 1 0 0 _1
  q=. q, (q +"1 [ 0 _1 _1 0), q +"1 [ 1 0 0 1
  gpbuf ,gpcount 2015 ,"1 p,q

NB. ---------------------------------------------------------
else.
  s=. rndint _1 + 3 * x
  n=. rndint 2 * x
  p=. (y - s) ,. y + s
  q=. (y - "1 s * 1 _1) ,. y +"1 s * 1 _1
  gpbuf 4 2022,n,PS_SOLID
  gpbuf ,gpcount 2015 ,"1 p,q
end.
)

NB. =========================================================
isimark_triangle=: 4 : 0
s=. rndint 2 * x
t=. rndint 4 * x
'x y'=. |: y
p=. rndint (x-t),.(y+s),.(x+t),.(y+s),.x,.y-t
gpbuf ,gpcount 2029 ,"1 p
)

