NB. qt draw

qtarc=: 3 : '2001 qt_gppline qt_gpfliplast y'
qtline=: 3 : '2015 qt_gppline qt_gpfliplast y'
qtpie=: 3 : '2023 qt_gppshape qt_gpfliplast y'
qtpoly=: 3 : '2029 qt_gppshape qt_gpfliplast y'

NB. =========================================================
qtcircle=: 3 : 0
p=. _1 pick y
ctr=. qt_gpflip 0 1 {"1 p
rad=. rndint 2 {"1 p
xy=. ctr - rad
wh=. +: rad ,. rad
p=. xy ,. wh
2008 qt_gppshape (<p) _1 } y
)

NB. =========================================================
qtdot=: 3 : 0
'v s f e c p'=. y
select. v
case. 1 do.  NB. pixels
  qt_gppixel y
case. 2 do.  NB. 2x2 rectangles
  p=. qt_gpflip p
  p=. (p-1) ,"1 [ 2 2
  dat=. 1;0;0;e;e;p
  2031 qt_gppshape dat
case. 3 do.  NB. crosses
  h=. (p-"1[1 0) ,. p+"1[2 0
  v=. (p-"1[0 1) ,. p+"1[0 2
  qtline 1;0;0;e;e;h,v
case. do.    NB. circles
  o=. >. -: v
  p=. p ,"1 v,.v
  qtcircle 1;0;0;e;e;p
end.
)

NB. =========================================================
NB. set graph box clipping
qtfxywh=: 3 : 0
p=. _1 pick y
if. #p do.
  'x y w h'=. p
  xy=. _1 + <. x,Ch-y+h
  wh=. 2 + >. w,h
  qt_gpbuf 6 2078,xy,wh
else.
  qt_gpbuf 2 2079
end.
)

NB. =========================================================
qtmarker=: 3 : 0
's m f e c p'=. y
p=. qt_gpflip p
qt_gpbuf qt_gppenbrush1 e
s ('qtmark_',m)~ p
)

NB. =========================================================
qtpie=: 3 : 0
p=. _1 pick y
ctr=. qt_gpflip 0 1 {"1 p
rad=. 2 {"1 p
ang=. 3 4 {"1 p
xy=. ctr - rad
wh=. +: rad ,. rad
tx=. ({."1 ctr) + rad * sind ang
ty=. ({:"1 ctr) + rad * cosd ang
p=. rndint xy ,. wh ,. ,"2 tx ,"0 ty
2023 qt_gppshape (<p) _1 } y
)

NB. =========================================================
NB. qtpline - patterned line
qtpline=: 3 : 0
's t f e c p'=. y
if. *./ t = 0 do.
  qtline y return.
end.
p=. qt_gpflip p
t=. t { PENPATTERN
if. (is1color e) *. 1 = #s do.
  qt_gpbuf 5 2032,(,e),4 2022,s,PS_SOLID
  pos=. t linepattern"0 1 p
  qt_gpbuf ,qt_gpcount 2015,"1 pos
else.
  rws=. #p
  e=. rws $ citemize e
  s=. rws $ s
  t=. rws $ t
  pen=. e qt_gppens s
  for_i. i.#p do.
    qt_gpbuf i{pen
    pos=. (i{t) linepattern i{p
    qt_gpbuf ,qt_gpcount 2015,"1 pos
  end.
end.
)

NB. =========================================================
NB. rect
qtrect=: 3 : 0
p=. boxrs2wh^:1 qt_gpflip _1 pick y
NB. fix java problem with 0 size edges
y=. (<p) _1 } y
2031 qt_gppshape y
)

NB. =========================================================
NB. qttext
NB. y is text;font;alignment;pencolor;n/a;position
NB.
NB. assumes single alignment, single font
qttext=: 3 : 0

't f a e c p'=. y

degree0=. 3{f
f=. qtfontdesc^:(0={.0#f) f
p=. qt_gpflip p
t=. text2utf8 each boxopen t

NB. ---------------------------------------------------------
NB. alignment
if. a do.
  glfontextent`glfontextent_jglc_@.(Poutput=iQTC) f
  off=. <. -: a * {."1 wh=. glqextent`glqextent_jglc_@.(Poutput=iQTC) &> t
  if. (90=degree0)+.(1 e. 'angle900' E. f) do.
    p=. p + "1 <. (0.2*{:wh),.off
  elseif. (270=degree0)+.(1 e. 'angle2700' E. f) do.
    p=. p - "1 <. (0.2*{:wh),.off
  elseif. do.
    p=. p -"1 off,. 0
  end.
end.

NB. ---------------------------------------------------------
NB. qt_gpbuf qt_gpcount 2012,alfndx,f
NB. pre-parse font for calling glfont2 (2312)
'face size style degree'=. parseFontSpec f
qt_gpbuf qt_gpcount 2312,(<.size*10),style,(<.degree0*10),alfndx,face
if. is1color e do.
  qt_gpbuf 5 2032,(,e),2 2040
  if. rank01 p do.
    qt_gpbuf qt_gpcount 2056,p
    qt_gpbuf qt_gpcount 2038,alfndx,>t
  else.
    t=. qt_gpcount each 2038 ,each alfndx each t
    t=. (<"1 qt_gpcount 2056 ,"1 p) ,each t
    qt_gpbuf ; t
  end.
else.
  t=. qt_gpcount each 2038 ,each alfndx each t
  t=. t ,each <"1 qt_gpcount 2056 ,"1 p
  t=. (<"1 (5 2032 ,"1 e) ,"1 [ 2 2040) ,each t
  qt_gpbuf ; t
end.

)

NB. definitions copied from gl2 canvas util

NB. =========================================================
parseFontname=: 3 : 0
font=. ' ',y
b=. (font=' ') > ~:/\font='"'
a: -.~ b <@(-.&'"');._1 font
)

NB. =========================================================
NB.*FontStyle n Regular Bold Italic Underline Strikeout
NB.             0       1    2      4         8
FontStyle=: ;:'regular bold italic underline strikeout'

NB. =========================================================
parseFontSpec=: 3 : 0
'ns styleangle'=. 2 split parseFontname y
'face size'=. ns
size=. 12". size
style=. FontStyle i. tolower each styleangle
style=. <.+/2^<:style #~ style e. i.#FontStyle
if. 1 e. an=. ('angle'-:5&{.)&> styleangle do.
  degree=. 10%~ 0". 5}.>(an i. 1){styleangle
else.
  degree=. 0
end.
face;size;style;degree
)
