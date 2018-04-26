NB. android draw

androidarc=: 3 : '2001 android_gppline android_gpfliplast y'
androidline=: 3 : '2015 android_gppline android_gpfliplast y'
androidpie=: 3 : '2023 android_gppshape android_gpfliplast y'
androidpoly=: 3 : '2029 android_gppshape android_gpfliplast y'

NB. =========================================================
androidcircle=: 3 : 0
p=. _1 pick y
ctr=. android_gpflip 0 1 {"1 p
rad=. rndint 2 {"1 p
xy=. ctr - rad
wh=. +: rad ,. rad
p=. xy ,. wh
2008 android_gppshape (<p) _1 } y
)

NB. =========================================================
androiddot=: 3 : 0
'v s f e c p'=. y
select. v
case. 1 do.  NB. pixels
  android_gppixel y
case. 2 do.  NB. 2x2 rectangles
  p=. android_gpflip p
  p=. (p-1) ,"1 [ 2 2
  dat=. 1;0;0;e;e;p
  2031 android_gppshape dat
case. 3 do.  NB. crosses
  h=. (p-"1[1 0) ,. p+"1[2 0
  v=. (p-"1[0 1) ,. p+"1[0 2
  androidline 1;0;0;e;e;h,v
case. do.    NB. circles
  o=. >. -: v
  p=. p ,"1 v,.v
  androidcircle 1;0;0;e;e;p
end.
)

NB. =========================================================
NB. set graph box clipping
androidfxywh=: 3 : 0
p=. _1 pick y
if. #p do.
  'x y w h'=. p
  xy=. _1 + <. x,Ch-y+h
  wh=. 2 + >. w,h
  android_gpbuf 6 2078,xy,wh
else.
  android_gpbuf 2 2079
end.
)

NB. =========================================================
androidmarker=: 3 : 0
's m f e c p'=. y
p=. android_gpflip p
android_gpbuf android_gppenbrush1 e
s ('androidmark_',m)~ p
)

NB. =========================================================
androidpie=: 3 : 0
p=. _1 pick y
ctr=. android_gpflip 0 1 {"1 p
rad=. 2 {"1 p
ang=. 3 4 {"1 p
xy=. ctr - rad
wh=. +: rad ,. rad
tx=. ({."1 ctr) + rad * sind ang
ty=. ({:"1 ctr) + rad * cosd ang
p=. rndint xy ,. wh ,. ,"2 tx ,"0 ty
2023 android_gppshape (<p) _1 } y
)

NB. =========================================================
NB. androidpline - patterned line
androidpline=: 3 : 0
's t f e c p'=. y
if. *./ t = 0 do.
  androidline y return.
end.
p=. android_gpflip p
t=. t { PENPATTERN
if. (is1color e) *. 1 = #s do.
  android_gpbuf 5 2032,(,e),4 2022,s,PS_SOLID
  pos=. t linepattern"0 1 p
  android_gpbuf ,android_gpcount 2015,"1 pos
else.
  rws=. #p
  e=. rws $ citemize e
  s=. rws $ s
  t=. rws $ t
  pen=. e android_gppens s
  for_i. i.#p do.
    android_gpbuf i{pen
    pos=. (i{t) linepattern i{p
    android_gpbuf ,android_gpcount 2015,"1 pos
  end.
end.
)

NB. =========================================================
NB. rect
androidrect=: 3 : 0
p=. boxrs2wh^:1 android_gpflip _1 pick y
NB. fix java problem with 0 size edges
y=. (<p) _1 } y
2031 android_gppshape y
)

NB. =========================================================
NB. androidtext
NB. y is text;font;alignment;pencolor;n/a;position
NB.
NB. assumes single alignment, single font
androidtext=: 3 : 0
't f a e c p'=. y

degree0=. 3{f
f=. andfontdesc^:(0={.0#f) f
p=. android_gpflip p
t=. text2utf8 each boxopen t

NB. ---------------------------------------------------------
NB. alignment
if. a do.
  glfontextent f
  off=. <. -: a * {."1 wh=. glqextent &> t
  if. (90=degree0)+.(1 e. 'angle900' E. f) do.
    p=. p +"1 [ ({:wh),.off
  elseif. (270=degree0)+.(1 e. 'angle2700' E. f) do.
    p=. p -"1 [ ({:wh),.off
  elseif. do.
    p=. p -"1 off,. - {:"1 wh
  end.
end.

NB. ---------------------------------------------------------
NB. android_gpbuf android_gpcount 2012,alfndx,f
NB. pre-parse font for calling glfont2(2312)
'face size style degree'=. parseFontSpec f
android_gpbuf android_gpcount 2312,(<.size*10),style,(<.degree0*10),alfndx,face
if. is1color e do.
  android_gpbuf 5 2032,(,e),2 2040
  if. rank01 p do.
    android_gpbuf android_gpcount 2056,p
    android_gpbuf android_gpcount 2038,alfndx,>t
  else.
    t=. android_gpcount each 2038 ,each alfndx each t
    t=. (<"1 android_gpcount 2056 ,"1 p) ,each t
    android_gpbuf ; t
  end.
else.
  t=. android_gpcount each 2038 ,each alfndx each t
  t=. t ,each <"1 android_gpcount 2056 ,"1 p
  t=. (<"1 (5 2032 ,"1 e) ,"1 [ 2 2040) ,each t
  android_gpbuf ; t
end.

)

NB. definitions copied from gl2 canvas util

NB. =========================================================
parseFontname=: 3 : 0
font=. ' ',y
b=. (font=' ') > ~:/\font='"'
a: -.~ b <@(-.&'"');._1 font
)

NB.*FontStyle n Regular Bold Italic Underline Strikeout
NB.             0       1    2      4         8
FontStyle=: ;:'regular bold italic underline strikeout'

parseFontSpec=: 3 : 0
'ns styleangle'=. 2 split parseFontname y
'face size'=. ns
size=. 12". size
style=. FontStyle i. tolower each styleangle
style=. <.+/2^<:(style ((> 0) *. <) #FontStyle) # style
if. 1 e. an=. ('angle'-:5&{.)&> styleangle do.
  degree=. 10%~ 0". 5}.>(an i. 1){styleangle
else.
  degree=. 0
end.
face;size;style;degree
)
