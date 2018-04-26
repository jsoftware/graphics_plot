NB. markers

NB. =========================================================
androidmark_circle=: 4 : 0
s=. rndint x * 3
p=. (y - s) ,"1 >: +: s,s
android_gpbuf ,android_gpcount 2008 ,"1 p
)

NB. =========================================================
androidmark_diamond=: 4 : 0
s=. rndint x * 4
'x y'=. |: y
p=. (x-s),.y,.x,.(y+s),.(x+s),.y,.x,.y-s
android_gpbuf ,android_gpcount 2029 ,"1 p
)

NB. =========================================================
NB. following only used for key markers, given singly
androidmark_line=: 4 : 0
'x y'=. , y
p=. >.(x--:KeyLen),(y--:KeyPen),<:KeyLen,KeyPen
android_gpbuf ,android_gpcount 2031 ,p
)

NB. =========================================================
androidmark_plus=: 4 : 0
s=. rndint 4 1 * x
p=. (y -"1 s) ,"1 +: s
s=. |. s
p=. p , (y -"1 s) ,"1 +: s
android_gpbuf ,android_gpcount 2031 ,"1 p
)

NB. =========================================================
androidmark_square=: 4 : 0
s=. rndint x * 3
p=. (y - s) ,"1 +: s,s
android_gpbuf ,android_gpcount 2031 ,"1 p
)

NB. =========================================================
androidmark_times=: 4 : 0

NB. ---------------------------------------------------------
if. x = 1 do.
  p=. (y - 3) ,. y + 4
  q=. (y - "1 [ 3 _3) ,. y +"1 [ 4 _4
  p=. p, (p +"1 [ 0 1 _1 0), p + "1 [ 1 0 0 _1
  q=. q, (q +"1 [ 0 _1 _1 0), q +"1 [ 1 0 0 1
  android_gpbuf ,android_gpcount 2015 ,"1 p,q

NB. ---------------------------------------------------------
else.
  s=. rndint _1 + 3 * x
  n=. rndint 2 * x
  p=. (y - s) ,. y + s
  q=. (y - "1 s * 1 _1) ,. y +"1 s * 1 _1
  android_gpbuf 4 2022,n,PS_SOLID
  android_gpbuf ,android_gpcount 2015 ,"1 p,q
end.
)

NB. =========================================================
androidmark_triangle=: 4 : 0
s=. rndint 2 * x
t=. rndint 4 * x
'x y'=. |: y
p=. rndint (x-t),.(y+s),.(x+t),.(y+s),.x,.y-t
android_gpbuf ,android_gpcount 2029 ,"1 p
)

