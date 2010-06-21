NB. gtk draw

gtkline=: 'gllines' gtk_edge gpfliplast
gtkpie=: 'glpie' gtk_shape gpfliplast
gtkpoly=: 'glpolygon' gtk_shape gpfliplast

NB. =========================================================
gtkcircle=: 3 : 0
p=. _1 pick y
ctr=. gpflip 0 1 {"1 p
rad=. rndint 2 {"1 p
xy=. ctr - rad
wh=. +: rad ,. rad
p=. xy ,. wh
'glellipse' gtk_edge (<p) _1 } y
)

NB. =========================================================
gtkdot=: 3 : 0
'v s f e c p'=. y
p=. rndint p
select. v
case. 1 do.  NB. pixels
  p=. gpflip p
  'glpixel' gtk_edge 1;0;0;e;e;p
case. 2 do.  NB. 2x2 rectangles
  p=. gpflip p
  p=. (p-1) ,"1 [ 2 2
  'glrect' gtk_shape 1;0;0;e;e;p
case. 3 do.  NB. crosses
  p=. gpflip p
  h=. (p-"1[2 0) ,. p+"1[2 0
  v=. (p-"1[0 2) ,. p+"1[0 2
  e=. 2 # (#p) $ citemize e
  'gllines' gtk_edge 2;0;0;e;e;h,v
case. do.    NB. circles
  o=. >. -: v
  p=. p ,"1 v,.v
  gtkcircle 1;0;0;e;e;p
end.
)

NB. =========================================================
NB. set graph box clipping
gtkfxywh=: 3 : 0
p=. _1 pick y
if. #p do.
  'x y w h'=. p
  xy=. _1 + <. x,Ch-y+h
  wh=. 2 + >. w,h
  glclip xy,wh
else.
  glclipreset''
end.
)

NB. =========================================================
gtkmarker=: 3 : 0
's m f e c p'=. y
p=. gpflip p
1 glsetpen e
glsetbrush e
s ('gtkmark_',m)~ p
)

NB. =========================================================
gtkpie=: 3 : 0
p=. _1 pick y
ctr=. gpflip 0 1 {"1 p
rad=. 2 {"1 p
ang=. 3 4 {"1 p
xy=. ctr - rad
wh=. +: rad ,. rad
tx=. ({."1 ctr) + rad * sind ang
ty=. ({:"1 ctr) + rad * cosd ang
p=. rndint xy ,. wh ,. ,"2 tx ,"0 ty
'glpie' gtk_shape (<p) _1 } y
)

NB. =========================================================
NB. gtkpline - patterned line
gtkpline=: 3 : 0
's t f e c p'=. y
if. *./ t = 0 do.
  gtkline y return.
end.
p=. gpflip p
t=. t { PENPATTERN
if. (is1color e) *. 1 = #s do.
  s glsetpen e
  gllines t linepattern"0 1 p
else.
  rws=. #p
  e=. rws $ citemize e
  s=. rws $ s
  t=. rws $ t
  for_i. i.#p do.
    (i{s) glsetpen i{e
    gllines (i{t) linepattern i{p
  end.
end.
)

NB. =========================================================
NB. rect
gtkrect=: 3 : 0
p=. boxrs2wh gpflip citemize _1 pick y
'glrect' gtk_shape (<p) _1 } y
)

NB. =========================================================
NB. gtktext
NB. y is text;font;alignment;pencolor;n/a;position
NB.
NB. assumes single alignment, single font
gtktext=: 3 : 0
't f a e c p'=. y
p=. gpflip citemize p
t=. text2utf8 each boxopen t
t=. (#p) $ ,each t

glfontangle 3{f
glfont gtkfontdesc f

NB. ---------------------------------------------------------
NB. alignment
if. a e. iCENTER, iRIGHT do.
  off=. <. -: a * f pgetstringlen t
  select. 3{f
  case. 90 do.
    p=. p -"1 [ 0,.off
  case. 270 do.
    p=. p -"1 [ 0,.off
  case. do.
    p=. p -"1 off,.0
  end.
end.

NB. ---------------------------------------------------------
if. is1color e do.
  glrgb ,e
  gltextcolor ''
  for_i. i.#t do.
    txt=. >i{t
    gltextxy i{p
    gltext txt
  end.
else.
  for_i. i.#t do.
    glrgb i_index{e
    txt=. >i{t
    gltextcolor ''
    gltextxy i{p
    gltext txt
  end.
end.
)
