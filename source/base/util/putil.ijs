NB. util    plot utils
NB.
NB. angle2
NB. bezierarc
NB. boxrs2wh      xyrs to xywh
NB. boxwh2rs      xywh to xyrs
NB. cfserr
NB. colorxy
NB. facing        if facing towards observer
NB. getsquarebox     get square box
NB. getpieframes
NB. gettics
NB. getwhx
NB. getxywhx
NB. glcut
NB. grays
NB. linepattern   draw line with pattern
NB. linepattern1
NB. linepattern2
NB. logcheck      check log arguments
NB. makebox
NB. midpoints
NB. numcheck      check if numeric
NB. project       project to 2D
NB. rectcenter
NB. rectoverlap1  if rectangles overlap
NB. rectoverlaps  if rectangles overlap
NB. setbox
NB. setbrush      set brush in given color
NB. setsubdxywh
NB. setfx         set fixed
NB. setmv         set movable
NB. setp
NB. setpen        set solid pen in given color
NB. setpxywh
NB. showboxes
NB. shownouns     show definitions
NB. showplot
NB. shrinkrect    shrink rectangle
NB. shrinksquare
NB. stellate
NB. straddle
NB. surfacerev
NB. tiles         make tiles from lines
NB. tilesum       make tilesum from positions

rectcenter=: 2&{. + -:@(2 3&{)
angle2=: [: r.^:_1 *@(j./)"1

NB. =========================================================
NB. facing
g0=. }:"1                            NB. drop z coord
g1=. (1 2&{ - 0 0&{)"2               NB. points 1, 2 minus point 0
g2=. 0: < -/"1 @: ({. * |. @: {:)"2  NB. is det > 0
facing=: g2 @: g1 @: g0 f.

NB. =========================================================
NB. boxrs2wh
NB. boxwh2rs
NB.
NB. isi conversion:
NB. glrect xywh same as gllines x,y,(x+w-1),y+h-1
NB.
NB. note: not inverse to each other

boxrs2wh=: 3 : 0
a=. 2 {."1 y
b=. 2 }."1 y
(a <. b) ,"1 >: | a - b
)

boxwh2rs=: 3 : 0
a=. 2 {."1 y
b=. 2 }."1 y
a,"1 a + b
)

NB. =========================================================
NB. colorxy - interpolate colors y into x intervals
NB. (also defined in plotdefs)
NB.
NB. alternative last line:
NB. 255 <. <. 256 * (t*k) + b*-.k
colorxy=: 4 : 0
x=. (i. >: x) % x
x=. x * <: #y
b=. y {~ <.x
t=. y {~ >.x
k=. x - <.x
<. 0.5 + 255 * (t*k) + b*-.k
)

NB. =========================================================
fonargs=: 2 : 0
v (, (u&.>)`(u"0/&.>/)@.(<:@#))@(<^:(-.@*@L.)) y
:
x v (, (u&.>)`(u"0/&.>/)@.(<:@#))@(<^:(-.@*@L.)) y
)

NB. =========================================================
getbandcolor=: 3 : 0
ndx=. y - <./ y
ndx=. <. 0.5 + ndx * (<:#BANDCOLOR) % >./ ndx
ndx { BANDCOLOR
)

NB. =========================================================
getitemcolor=: 3 : 0
y $ DataNdx |. ITEMCOLOR
)

NB. =========================================================
NB. get square box fit inside typically rectangular box
getsquarebox=: 3 : 0
'x y w h'=. y
min=. w <. h
x=. x + <. -: w - min
y=. y + <. -: h - min
x,y,min,min
)

NB. =========================================================
getpieframes=: 3 : 0
'Fx Fy Fw Fh'=: Fxywh=: Lxywh
'Gx Gy Gw Gh'=: Gxywh=: Lxywh
)

NB. =========================================================
NB. grays      e.g. grays 4
grays=: 3 : 0
3#"0 [ 255<. <. (256&% * i.@>:) y
)

NB. =========================================================
NB. pattern linepattern1 (x0,y0), (x1,y1)
NB. blank at end
linepattern1=: 4 : 0
len=. - -/ y
n=. rndint (%: +/ *: len) % +/ x
if. n=0 do. y
else.
  j=. +/\ 0 , , n # ,: x
  |: ({.y) + len */ (}: % {:) j
end.
)

NB. =========================================================
NB. pattern linepattern2 (x0,y0), (x1,y1)
NB. line at end
linepattern2=: 4 : 0
len=. - -/ y
n=. rndint (%: +/ *: len) % +/ x
if. n=0 do. y
else.
  j=. +/\ 0 , , n # ,: x
  |: ({.y) + len */ (% {:) }: j
end.
)

NB. =========================================================
NB. pattern linepattern lines
NB. expects vector of xy points
NB. returns matrix with 4 cols: x0,y0,x1,y1
NB. special cases solid "pattern" of 1 0
linepattern=: 4 : 0
nap=. ,`[@.('' -: ])`]@.('' -: [)  NB. null appendable without effect
x=. > x
y=. _2 [\ y
if. x -: 1 0 do.
  <. 2 ,\ y
else.
  a=. ; 2 < @ (x&linepattern1) \ }: y
  <. _2 ,\ a nap x linepattern2 _2 {. y  NB. changed simple append into nap
NB. see http://www.jsoftware.com/pipermail/programming/2009-April/014528.html
end.
)

NB. =========================================================
logcheck=: 4 : 0
if. x do. if. 1 e. 0 >: ,y do.
    signal 'Log argument to plot must be positive'
    signal 'plot error' end.
end.
y
)

NB. NB. =========================================================
NB. NB. makebox  (standard box)
NB. NB.
NB. NB. form: makebox xywh
NB. makebox=: 3 : 0
NB. 'x y w h'=. y
NB. xw=. x + w
NB. yh=. y + h
NB. x,y,xw,y,xw,yh,x,yh,x,y
NB. )

NB. NB. =========================================================
NB. NB. mid points of rectangle
NB. midpoints=: 3 : 0
NB. 'x y w h'=. y
NB. xm=. x + -:w
NB. ym=. y + -:h
NB. xw=. x + w
NB. yh=. y + h
NB. p=. x, ym, xm, yh, xw, ym, xm, y, x, ym
NB. 2 ,\ _2 [\ p
NB. )

NB. =========================================================
NB. check if numeric, signal failure
numcheck=: 3 : 0
if. (ischar y) +: 0 e. $y do. y return. end.
if. ischar y
do. signal 'data should be numeric'
else. signal 'no data to plot'
end.
)

NB. =========================================================
NB. project
NB. y is a 3 col matrix of xyz values
project=: 3 : 0
dat=. }:"1 (y,.1) mp Tfm
dist=. ViewDist-{:"1 dat
((ViewDist*}:"1 dat)%dist),.dist
)

NB. =========================================================
NB. rectoverlap1
NB.
NB. returns 1 if x and y touch or overlap
rectoverlap1=: 4 : 0
'lx ly lw lh'=. x
'rx ry rw rh'=. y
((lx>:rx+rw)+.rx>:lx+lw) +: (ry<:ly-lh)+.ly<:ry-rh
)

NB. =========================================================
NB. rectoverlaps
NB.
NB. returns mask of 1 where row overlaps with next row
rectoverlaps=: 3 : 0
'x y w h'=. |: y
xr=. x+w
yt=. y+h
((x>1|.xr)+.xr<1|.x) +: (yt>1|.y)+.y<1|.yt
)

NB. =========================================================
NB. setbox
setbox=: 3 : 0
Plot=: Plot,Ndx;0;'draw';'';'';BACKCOLOR;'';y;0
)

NB. =========================================================
NB. setbrush
NB. setbrush color
setbrush=: [: ';grgb '&, ": , ';gbrush'"_

NB. =========================================================
setdxywh=: 3 : 0
'Dx Dy Dw Dh'=: Dxywh=: y
Gxywh=: Fxywh=: Lxywh=: y
)

NB. =========================================================
setsubdxywh=: 3 : 0
setdxywh Sxywh makepos_xywh y
)

NB. =========================================================
NB. pop subplot box
popsxywh=: 3 : 0
if. #SSxywh do.
  'm x s'=. {: SSxywh
  SSxywh=: }: SSxywh
  'Sx Sy Sw Sh'=: Sxywh=: s
  Mxywh=: m
  Mndx=: x
end.
)

NB. =========================================================
NB. push subplot box
pushsxywh=: 3 : 0
SSxywh=: SSxywh, Mxywh;Mndx;Sxywh
'mat win'=. y
'Sx Sy Sw Sh'=: Sxywh=: win
Mxywh=: mat
Mndx=: 0
)

NB. =========================================================
NB. set output
setoutput=: 3 : 0
Poutput=: y
setsizes''
)

NB. =========================================================
NB. set graph box
setgxywh=: 3 : 0
'Gx Gy Gw Gh'=: Gxywh=: y
)

NB. =========================================================
NB. set label box
setlxywh=: 3 : 0
'Lx Ly Lw Lh'=: Lxywh=: y
)

NB. =========================================================
NB. set plot box
NB.
NB. also sets subplot box and window stack
NB.
NB. stores initial value as IPxywh
setpxywh=: 3 : 0
if. isempty Pxywh do. IPxywh=: y end.
'Px Py Pw Ph'=: Pxywh=: y
'Sx Sy Sw Sh'=: Sxywh=: y
'Dx Dy Dw Dh'=: Dxywh=: y
Mxywh=: i.0 0
Mndx=: 0
SSxywh=: i.0 3
)

NB. =========================================================
NB. setp
setp=: 3 : 0
Plot=: Plot,Ndx;y
)

NB. =========================================================
showboxes=: 3 : 0
a=. 'Pxywh','Dxywh','Oxywh','Lxywh','Fxywh','Gxywh',:'Kxywh'
b=. Pxywh,Dxywh,Oxywh,Lxywh,Fxywh,Gxywh,:Kxywh
b=. b ,. +/ "2 [ _2 ([\) "1 b
r=. a; b
(- 0 = +/Kxywh) }. each r
)

NB. =========================================================
shownouns=: 3 : 0
rnd=. <.@:+&0.5&.(%&0.0001)
cat=. ,&,.&.|:
x=. (>:>./# &> y) {. each y
f=. ]`rnd @. (e.&8 @ (3!:0))
y=. ":@f@". each y
r=. x cat each y
> ,&.>/ r
)

NB. =========================================================
showplot=: 3 : 0
hdr=. ;:'order type item value style fit pen brush pos'
itm=. tolower each }. each (;2 {"1 Plot) { ItemNames
dat=. itm 2 }"0 1 Plot
stk=. hdr,dat
tc=. 31&<.@$ {.!.'.' ({.~ 30&<.@$)
tc@": &.>stk
)

viewplot=: 3 : 'wdview boxascii showplot y'

NB. =========================================================
showopts=: 3 : 0
shownounds DefOpts
)

NB. =========================================================
showstate=: 3 : 0
(showboxes''),showopts''
)

NB. =========================================================
NB. shrinksquare
NB.
NB. form: square shrinkrect len
shrinksquare=: 4 : 0
x + y * 1 1 _2 _2
)

NB. =========================================================
NB. shrinkrect
NB.
NB. form: rect shrinkrect xywh
shrinkrect=: 4 : 0
x + , 1 _1 * +/\ _2 [\ 4 $ y
)

NB. =========================================================
stellate=: 4 : 0 "2
norm=. x * unitvec (}:cross&(-/)}.) 3{.y
norm=. norm + (+/y) % #y
2 (norm&,)\y,{.y
)

NB. =========================================================
NB. generate surface of revolution, about z axis
NB. y is 2 col matrix of x,z values
NB. x is optional steps, default 10
surfacerev=: 10&$: : (4 : 0)
'r z'=. |: y
ix=. i. x+2
'x y'=. 0 1 |: r */ +. r. ix * 2p1%x
x,"0 1 y,"0 z
)

NB. =========================================================
NB. straddle  - stretch min, max for constant values
straddle=: 3 : 0
y*1.1*(y<0),y>:0
)

NB. =========================================================
NB. tiles
c=. (}: ,:"1 }.)"2
d=. (}. ,:"1 }:)"2
tiles=: (c@}: ,"2 d@}.) f.

NB. =========================================================
NB. tilesum (adjacent 4 tiles)
tilesum=: (1,:2 2)&(+/@,;._3)
