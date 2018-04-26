NB. eps draw

NB. =========================================================
epscircle=: 3 : 0
'v s f e c p'=. y
if. isempty c do.
  txt=. (pfmt p ,"1[ 0 360) ,"1 ' arc stroke'
  if. is1color e do.
    pbuf e eps_pen v
    pbuf txt
  else.
    pbuf (e eps_pens v) ,. txt
  end.
else.
  p=. citemize p
  c=. p cmatch c
  e=. p cmatch e
  v=. p cmatch v
  for_i. i.#p do.
    pbuf (pfmt (i{p) ,"1[ 0 360) ,"1 ' arc'
    pbuf 'gsave ',(eps_color i{c),' fill grestore'
    pbuf ((i{e) eps_pen i{v),' stroke'
  end.
end.
)

NB. =========================================================
NB. epsdot
epsdot=: 3 : 0
'v s f e c p'=. y
p=. citemize p
v=. v * EPS_PENSCALE
if. is1color e do.
  pbuf eps_color e
  pbuf (pfmt p,.v) ,"1 ' 0 360 arc fill'
else.
  e=. p cmatch e
  for_c. p do.
    pbuf eps_color c_index { e
    pbuf (pfmt c,.v) ,"1 ' 0 360 arc fill'
  end.
end.
)

NB. =========================================================
NB. set graph box clipping
epsfxywh=: 3 : 0
p=. _1 pick y
if. #p do.
  CLIP=: >: CLIP
  'x y w h'=. p
  rect=. eps_makerect x,y,(x+w),y+h
  pbuf 'gsave ',rect,' clip newpath'
else.
  if. CLIP do.
    CLIP=: <: CLIP
    pbuf 'grestore'
  end.
end.
)

NB. =========================================================
NB. epsline
epsline=: 3 : 0
'v s f e c p'=. y
if. (is1color e) *. 1 = #s do.
  pbuf e eps_pen v
  pbuf eps_lines p
else.
  rws=. #p
  e=. rws $ citemize e
  v=. rws $ v
  for_i. i. rws do.
    pbuf (i{e) eps_pen i{v
    pbuf eps_lines i{p
  end.
end.
)

NB. =========================================================
epsmarker=: 3 : 0
('epsmark_',1 pick y)~ y
)

NB. =========================================================
NB. epspie
NB.
NB. assume single line width and color
epspie=: 3 : 0
'v s f e c p'=. y
pen=. e eps_pen v
p=. citemize p
ctr=. 0 1 {"1 p
rad=. 2 {"1 p
ang=. 360 + _90 + 3 4 {"1 p
clr=. cmatch c
for_i. i.#p do.
  pbuf 'newpath'
  pbuf (pfmt i { ctr),' moveto'
  pbuf (pfmt (i { ctr),(i{rad),i{ang),' arc closepath'
  pbuf 'gsave ',(eps_color i{clr),' fill grestore'
  pbuf pen,' stroke'
end.
)

NB. =========================================================
NB. epsline - patterned line
epspline=: 3 : 0
'v s f e c p'=. y
if. *./ s = 0 do.
  epsline y return.
end.
s=. s { PENPATTERN
if. (is1color e) *. 1 = #v do.
  pos=. s linepattern"0 1 p
  epsline (<pos) _1 } y
else.
  rws=. #p
  e=. rws $ citemize e
  v=. rws $ v
  s=. rws $ s
  for_i. i.#p do.
NB.     pbuf e eps_pens v
    pos=. (i{s) linepattern i{p
    epsline (i{v);0;0;(i{e);0;pos
  end.
end.
)

NB. =========================================================
epspoly=: 3 : 0
'v s f e c p'=. y
p=. citemize p
if. v=0 do. e=. c end.
c=. p cmatch c
e=. p cmatch e
if. +/v do.
  v=. p cmatch v
  for_i. i.#p do.
    pbuf eps_makelines i{p
    pbuf 'gsave ',(eps_color i{c),' fill grestore'
    pbuf ((i{e) eps_pen i{v),' stroke'
  end.
else.
  for_i. i.#p do.
    pbuf eps_makelines i{p
    pbuf (eps_color i{c),' fill'
  end.
end.
)

NB. =========================================================
epsrect=: 3 : 0
'v s f e c p'=. y
p=. citemize p
if. v=0 do. e=. c end.
c=. p cmatch c
e=. p cmatch e
if. +/v do.
  v=. p cmatch v
  for_i. i.#p do.
    pbuf eps_makerect i{p
    pbuf 'gsave ',(eps_color i{c),' fill grestore'
    pbuf ((i{e) eps_pen i{v),' stroke'
  end.
else.
  for_i. i.#p do.
    pbuf eps_makerect i{p
    pbuf (eps_color i{c),' fill'
  end.
end.
)

NB. =========================================================
NB. epstext
NB. y is text;font;alignment;pencolor;n/a;position
NB.
NB. assumes single alignment, single font
epstext=: 3 : 0
't f a e c p'=. y

NB. ---------------------------------------------------------
NB. set up fonts
'fnx fst fsz fan und'=. f
rot=. 3 | 0 90 270 i. fan
asc=. pgetascender f
fnm=. getfntname fnx,fst
pbuf '/',fnm,' findfont'
pbuf (": getplotfontsize f),' scalefont setfont'

NB. ---------------------------------------------------------
NB. adjust position to EPS baseline
select. rot
case. 0 do. p=. 0 >. p -"1 [ 0, asc
case. 1 do. p=. p +"1 asc, 0
case. 2 do. p=. p -"1 asc, 0
end.

NB. ---------------------------------------------------------
if. is1color e do.
  pbuf eps_color e
  pbuf eps_text f;t;p;a;rot;und
else.
  for_i. i.#e do.
    pbuf eps_color i{e
    pbuf eps_text f;(i{t);(i{p);a;rot;und
  end.
end.
)
