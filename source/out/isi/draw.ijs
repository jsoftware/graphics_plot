NB. isi draw

isiarc=: 3 : '2001 gppline gpfliplast y'
isiline=: 3 : '2015 gppline gpfliplast y'
isipie=: 3 : '2023 gppshape gpfliplast y'
isipoly=: 3 : '2029 gppshape gpfliplast y'

NB. =========================================================
isicircle=: 3 : 0
p=. _1 pick y
ctr=. gpflip 0 1 {"1 p
rad=. rndint 2 {"1 p
xy=. ctr - rad
wh=. +: rad ,. rad
p=. xy ,. wh
2008 gppshape (<p) _1 } y
)

NB. =========================================================
isidot=: 3 : 0
'v s f e c p'=. y
select. v
case. 1 do.  NB. pixels
  gppixel y
case. 2 do.  NB. 2x2 rectangles
  p=. gpflip p
  p=. (p-1) ,"1 [ 2 2
  dat=. 1;0;0;e;e;p
  2031 gppshape dat
case. 3 do.  NB. crosses
  h=. (p-"1[1 0) ,. p+"1[2 0
  v=. (p-"1[0 1) ,. p+"1[0 2
  isiline 1;0;0;e;e;h,v
case. do.    NB. circles
  o=. >. -: v
  p=. p ,"1 v,.v
  isicircle 1;0;0;e;e;p
end.
)

NB. =========================================================
NB. set graph box clipping
isifxywh=: 3 : 0
p=. _1 pick y
if. #p do.
  'x y w h'=. p
  xy=. _1 + <. x,Ch-y+h
  wh=. 2 + >. w,h
  gpbuf 6 2078,xy,wh
else.
  gpbuf 2 2079
end.
)

NB. =========================================================
isimarker=: 3 : 0
's m f e c p'=. y
p=. gpflip p
gpbuf gppenbrush1 e
s ('isimark_',m)~ p
)

NB. =========================================================
isipie=: 3 : 0
p=. _1 pick y
ctr=. gpflip 0 1 {"1 p
rad=. 2 {"1 p
ang=. 3 4 {"1 p
xy=. ctr - rad
wh=. +: rad ,. rad
tx=. ({."1 ctr) + rad * sind ang
ty=. ({:"1 ctr) + rad * cosd ang
p=. rndint xy ,. wh ,. ,"2 tx ,"0 ty
2023 gppshape (<p) _1 } y
)

NB. =========================================================
NB. isipline - patterned line
isipline=: 3 : 0
's t f e c p'=. y
if. *./ t = 0 do.
  isiline y return.
end.
p=. gpflip p
t=. t { PENPATTERN
if. (is1color e) *. 1 = #s do.
  gpbuf 5 2032,(,e),4 2022,s,PS_SOLID
  pos=. t linepattern"0 1 p
  gpbuf ,gpcount 2015,"1 pos
else.
  rws=. #p
  e=. rws $ citemize e
  s=. rws $ s
  t=. rws $ t
  pen=. e gppens s
  for_i. i.#p do.
    gpbuf i{pen
    pos=. (i{t) linepattern i{p
    gpbuf ,gpcount 2015,"1 pos
  end.
end.
)

NB. =========================================================
NB. rect
isirect=: 3 : 0
p=. boxrs2wh gpflip _1 pick y
NB. fix java problem with 0 size edges
if. IFJAVA do.
  if. 0 = 1 pick y do.
    p=. 1 1 _2 _2 +"1 p
  end.
end.
y=. (<p) _1 } y
2031 gppshape y
)

NB. =========================================================
NB. isitext
NB. y is text;font;alignment;pencolor;n/a;position
NB.
NB. assumes single alignment, single font
isitext=: 3 : 0
't f a e c p'=. y

p=. gpflip p
t=. text2utf8 each boxopen t

NB. ---------------------------------------------------------
NB. alignment
if. a do.
  glfont f
  off=. <. -: a * {."1 glqextent &> t
  if. 1 e. 'angle900' E. f do.
    p=. p +"1 [ 0,.off
  elseif. 1 e. 'angle2700' E. f do.
    p=. p -"1 [ 0,.off
  elseif. do.
    p=. p -"1 off,.0
  end.
end.

NB. ---------------------------------------------------------
gpbuf gpcount 2012,alfndx,f
if. is1color e do.
  gpbuf 5 2032,(,e),2 2040
  if. rank01 p do.
    gpbuf gpcount 2056,p
    gpbuf gpcount 2038,alfndx,>t
  else.
    t=. gpcount each 2038 ,each alfndx each t
    t=. (<"1 gpcount 2056 ,"1 p) ,each t
    gpbuf ; t
  end.
else.
  t=. gpcount each 2038 ,each alfndx each t
  t=. t ,each <"1 gpcount 2056 ,"1 p
  t=. (<"1 (5 2032 ,"1 e) ,"1 [ 2 2040) ,each t
  gpbuf ; t
end.
)
