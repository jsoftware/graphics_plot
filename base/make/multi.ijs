NB. makemulti - make multi/use command block

NB. =========================================================
makemulti=: 3 : 0

setplotdefaults 'new'
setsubdxywh''

'cmd pos'=. {. y
dat=. }. y

NB. ---------------------------------------------------------
if. 0 = #dat do.
  drawbackground '' return.
end.

NB. ---------------------------------------------------------
if. ',' e. pos do.
  ndx=. pos i. ','
  pos=. (0 ". ndx {. pos) ; 0 ". (ndx + 1) }. pos
else.
  pos=. (0 ". pos) # each 1
end.
Shape=: # &> pos
len=. */ Shape

NB. ---------------------------------------------------------
NB. get options not in data
ndx=. ({."1 dat) i. <'data'
opts=. ndx {. dat

NB. ---------------------------------------------------------
NB. get commands for each plot
cmds=. getmulticmd each 1 pick ndx { dat

NB. ---------------------------------------------------------
NB. get multi options that are same for each plot
msk=. ({."1 e. FontOpts"_) each cmds
mopts=. ; msk #each cmds
cmds=. (-.each msk) # each cmds
mopts=. mopts ,~ (-. ({."1 opts) e. MultiHdrs) # opts
mopts=. (|. ~: |. {."1 mopts) # mopts

NB. ---------------------------------------------------------
defineoptions opts
setfonts''
getmultilayout''
multidefs=. packs MultiDefs
multigroups=. packs MultiGroups
drawbackground''
setplotdefaults 'new'
pdefs multigroups

NB. ---------------------------------------------------------
if. *./ (XGROUP;YGROUP;ZGROUP) e. '';i.len do.
  mxywh=. Lxywh makesubshape pos
  for_i. i.#cmds do.
    Sxywh=: i { mxywh
    cmd=. ('new';''), mopts
    cmd=. cmd, i pick cmds
    makenew cmd
  end.
else.
  mxywh=. makemultigroup mopts;cmds;<pos
end.

NB. ---------------------------------------------------------
makemulti_fini multidefs;mxywh
)

NB. =========================================================
NB. grouped multiplot
makemultigroup=: 3 : 0
'opts cmds pos'=. y

if. Y2Axis e. ; {."1 each cmds do.
  signal 'Y2Axis not supported in grouped Multiplots'
end.

len=. */ 'rws cls'=. shape=. # &> pos

NB. ---------------------------------------------------------
if. #XGROUP do.
  if. -. (#XGROUP) e. 1,cls,len do.
    signal 'Number of X groups should be one of 1, ',(":cls),', ',":len
  end.
else.
  XGROUP=: i.len
end.
if. #YGROUP do.
  if. -. (#YGROUP) e. 1,rws,len do.
    signal 'Number of Y groups should be one of 1, ',(":rws),', ',":len
  end.
else.
  YGROUP=: i.len
end.
XGroup=: i.~ len $ XGROUP
YGroup=: i.~ len $ ((len=#YGROUP) { cls,1) # YGROUP

IfMXlabs=: 1 = #~. shape $ XGroup
IfMYlabs=: 1 = #~. |: shape $ YGroup

NB. ---------------------------------------------------------
def=. (". each PDefNames) & getpdef &> cmds
def=. XGroup getxgroup def
def=. YGroup getygroup def

NB. ---------------------------------------------------------
NB. each plot processed twice - once to find frame,
NB. then to draw

mxywh=. Lxywh makesubshape pos
fxywh=. i. 0 4
for_i. i.#def do.
  setplotdefaults 'new'
  defineoptions opts
  setdxywh i { mxywh
  fxywh=. fxywh, getframesize i { def
end.

fxywh=. fitmulti fxywh
def=. (<"1 fxywh) pFrame }"0 1 def

NB. ---------------------------------------------------------
for_i. i.#def do.
  setplotdefaults 'new'
  defineoptions opts
  setdxywh i { mxywh
  makepdef i { def
end.

mxywh
)

NB. =========================================================
makemulti_fini=: 3 : 0
'defs mxywh'=. y
definemultidefs defs
drawtitle''
drawsubtitle''
drawmulticaptions mxywh
drawborder''
drawkey''
Ndx=: Ndx + 3
)

NB. =========================================================
drawmulticaptions=: 3 : 0
mxywh=. Shape $ y
if. #XCAPTION do.
  xcap=. boxarg XCAPTION
  if. 1=#xcap do.
    drawxcaption''
  else.
    cls=. 1 { $ mxywh
    xcap=. cls {. xcap
    for_i. i.cls do.
      mat=. i {"2 mxywh
      Xx=: 0 { <./mat
      Xw=: 2 { >./mat
      XCAPTION=: i pick xcap
      drawxcaption''
    end.
  end.
end.
if. #YCAPTION do.
  ycap=. boxarg YCAPTION
  if. 1=#ycap do.
    drawycaption''
  else.
    rws=. {. $ mxywh
    ycap=. rws {. ycap
    for_i. i.rws do.
      mat=. i { mxywh
      Yy=: 1 { <./mat
      Yh=: 3 { >./mat
      YCAPTION=: i pick ycap
      drawycaption''
    end.
  end.
end.
)

NB. =========================================================
NB. returns frame size for plot
getframesize=: 3 : 0
(PDefNames)=: y
if. 0=#Data do.
  Dxywh return.
end.
defineoptions 0 pick Opts
setfonts''
settypeflags ;Types
getlayout''
Fxywh
)

NB. =========================================================
fitmulti=: 3 : 0
fxw=. 0 2 {"1 y
fyh=. 1 3 {"1 y

'r c'=. Shape
len=. r * c

if. #XGroup do.
  xg=. XGroup + len $ len * i.c
  fxw=. xg fitmulti1 fxw
end.

if. #YGroup do.
  yg=. YGroup + c # len * i.r
  fyh=. yg fitmulti1 fyh
end.

0 2 1 3 {"1 fxw,.fyh
)

NB. =========================================================
fitmulti1=: 4 : 0
}."1 /:~ ; x fitmulti2 /. (i.#y),.y
)

NB. =========================================================
fitmulti2=: 3 : 0
'i fx fw'=. |: y
fx=. >./fx
fw=. (<./fx+fw) - fx
<i,"0 1 fx,fw
)
