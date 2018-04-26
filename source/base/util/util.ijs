NB. std util    standard utils
NB.
NB. EMPTY       i. 0 0
NB.
NB. alfndx      a. & i.
NB. assert      assert value is true
NB. assign      assign y to x
NB. average
NB. blockcount  #, with vector treated as 1-row matrix
NB. boxarg      box command argument
NB. boxcmd      box commands
NB. boxrows     box rows of list of matrices
NB. boxascii    box draw ascii
NB. check_pdfreader
NB. chop        chop array into boxed list
NB. cile        n cile values
NB. citemize    itemize
NB. cleanz      clean real numbers
NB. comma2blank
NB. cos         cos
NB. cross       cross product
NB. cut         cut vector
NB. cutopen     cut argument if open
NB. cutxyz      cut into x;y;z
NB. deb         delete extra blanks
NB. det         determinant
NB. dim0        dim 0 of array
NB. dim1        dim 1 of array
NB. dist        distance function
NB. dlb         delete leading blanks
NB. drange      data range: last - first
NB. each        each
NB. extbmp      ensure bmp extension
NB. extemf      ensure emf extension
NB. extjpf      ensure jpf extension
NB. extpng      ensure png extension
NB. facenormal  face normal
NB. fetch       fetch
NB. findprefixes find prefixes
NB. first       open first
NB. firstin     first x in y
NB. firstword   first word (up to ' ')
NB. fit01       fit in 0 1  (low-high) fit01 data
NB. fitin       (min,max) fitin data
NB. fix         fix numeric data, _1 on error
NB. getangle    get angle given y and x
NB. has         if list x contains y
NB. head
NB. hostcmd
NB. ifjwplot
NB. ifparent
NB. index       x i. y or _1 if not found
NB. int01       interval in n steps from 0 to 1 (= steps 0 1,n)
NB. interp01
NB. intersect
NB. inxb
NB. isboxed
NB. is1color    1 if single color
NB. ischar      1 if character
NB. iscomplex   1 if complex
NB. iscounter   if counting number
NB. isempty
NB. isinteger   if integer
NB. islinear
NB. islocale
NB. keyarg
NB. log10       log base 10
NB. lsfit       least square fit
NB. matsize     matrix size (also for vector or scalar)
NB. maxmask
NB. mfv         matrix from vector
NB. mp          matrix product
NB. nc          nameclass
NB. ncile       ncile - n even partitions
NB. nthword     n nthword text = index of nth word
NB. partition   partition items
NB. pfmt        fmt numbers
NB. pforms      parent forms
NB. pick        >@{
NB. pickf       build fn pick n
NB. pow10       10 to the power
NB. qchop       chop allow for double quote
NB. qt
NB. range
NB. rank        rank
NB. rank01      if scalar or vector
NB. rfd         radians from degrees
NB. rnd         rnd nearest
NB. rnddn       rnd down
NB. rndint      rnd nearest integer
NB. rndrect
NB. rndup       rnd up
NB. rotxy       rotate xy positions by angle x
NB. signal      signal error
NB. sin         sin
NB. splits      split string head from tail
NB. steps       steps from a to b in c steps
NB. tail
NB. tolist
NB. tominus     to minus sign
NB. towords
NB. unitvec     unit vector
NB. unquot      remove double quotes
NB. zero        zero numbers with mod < 1e_10

NB. isigraph_event

EMPTY=: i.0 0

NB. =========================================================
alfndx=: 3 & u:
assign=: 4 : '".x,''=:y'''
average=: +/ % #
blockcount=: [: {. }:@$ , 1:
boxrows=: >@(,.&.>/)@:(;/&.>)
cile=: $@] $ ((* <.@:% #@]) /:@/:@,)
citemize=: ,:^:(2 > #@$)
cleanz=: * | >: 1e_10"_
cmatch=: (#@[) $ citemize@]
cross=: +/ .* (3 3 3$0 0 0 0 0 _1 0 1 0 0 0 1 0 0 0 _1 0 0 0 _1 0 1 0 0 0 0 0)&(+/ .*)
cutxyz=: <"2@(0 1&|:)
deb=: #~ (+. 1: |. (> </\))@(' '&~:)
det=: -/ .*
dim0=: ]`({."1) @. (2=#&$)
dim1=: ]`{. @. (2=#&$)
dist=: +/&.(*:"_)
dlb=: }.~ =&' ' i. 0:
dquote=: '"'&,@(,&'"')
dquoted=: 2+./\0,2|+/\@(=&'"')
drange=: {:-{.
each=: &.>
extbmp=: , ((0 < #) *. [: -. '.'"_ e. ]) # '.bmp'"_
extemf=: , ((0 < #) *. [: -. '.'"_ e. ]) # '.emf'"_
extjpf=: , ((0 < #) *. [: -. '.'"_ e. ]) # '.jpf'"_
extpng=: , ((0 < #) *. [: -. '.'"_ e. ]) # '.png'"_
findprefixes=: +./"1 @: ([ = (#@>@[) {.each ])"0 1
first=: >@{.
firstin=: e. {.@# [
firstones=: > 0: , }:
firstword=: {.~ i.&' '
fit01=: ((- <./@,) % (>./ - <./)@,) : ((] - {.@[) % -~/@[)
fitin=: {.@[ + ({: - {.)@[ * ((- <./@,) % (>./ - <./)@,)@]
fix=: _1&".
has=: [: +./ (e.~ boxopen f.)
head=: {.~ i.&' '
hostcmd=: [: 2!:0 '(' , ,&' || true)&'
index=: [ ((#@[ = ]) { ] , _1:) i.
int01=: i.@>: % ]
intersect=: e. # [
inxb=: <:@(+/\) i. i.@(+/)
isboxed=: 0 < L.
ischar=: 3!:0 e. 2 131072 262144"_
is1color=: 3 = */ @ $
iscomplexdata=: 3!:0 e. 16 16384"_
iscounter=: -: |@<.
isempty=: 0 e. $
isinteger=: -: <.
islinear=: *./@(= {.)@(}. - }:)
islocale=: {. @ (e. 18!:1 @ 1:)
lastone=: </\ &. |.
lastones=: > }. , 0:
log10=: 10&^.
lsfit=: {:@] %. {.@] ^/ i.@>:@[
matsize=: _2 {. 1 1 , $
mp=: +/ . *
nc=: 4!:0
packs=: (, ,&< ".) &>
pdefs=: 3 : '0 $ ({."1 y)=: {:"1 y'
pbuf=: 3 : 'buf=: buf,,y,"1 LF'
pick=: >@{
pickf=: 2 : 'u @ > @ (n&{)'
pow10=: 10&^
scale01=: (% {:) @: (0: , +/\)
splits=: i.&' ' ({.;}.@}.) ]
nthword=: +/\@(> 0 , }:)@(~:&' ')@] i. >:@[
partition=: 1 , [: -. }: -:"_1 }.
rank=: #@$
rank01=: 2 > [: # $
rfd=: *&1r180p1
rnd=: [ * [: <. 0.5"_ + %~
rndint=: <.@:+&0.5
rnddn=: [ * [: <. %~
rndup=: [ * [: >. %~
signal=: 13!:8&12
tail=: }.~ >:@(i.&' ')
tolist=: }.@;@:((10{a.)&,@,@":&.>)
tominus=: '-' & (([: I. ] e. '_'"_)})
towords=: ;: ^: _1
u2a=: (1 u: 7 u: ]) :: ]
unitvec=: % dist
zero=: * | >: 1e_10"_

sin=: 1&o.
cos=: 2&o.

NB. =========================================================
NB. boxarg v box command argument
NB. ignores whitespace
boxarg=: 3 : 0
ws=. 8 9 10 13 32 44{a.
del=. 34 127{a.
dat=. ' ',y
b=. (dat e. ws) > ~:/\ dat e. del
dat=. (<'') -.~ b <;._1 dat
dat -. each <del
)

boxascii=: ]

NB. =========================================================
check_epsreader=: 3 : 0
check_reader y
)

NB. =========================================================
check_pdfreader=: 3 : 0
check_reader y
)

NB. =========================================================
check_reader=: 3 : 0
ndx=. 1 i.~ ' -' E. y
flexist ndx {. y
)

NB. =========================================================
comma2blank=: 3 : 0
' ' (I. y=',') } y
)

NB. =========================================================
commasep=: 3 : 0
',' (I. y=' ') } y
)

NB. =========================================================
NB.*chop v chop array into boxed list
NB. chop character vector or matrix into boxed list.
NB. x is optional delimiter, default LF if in text, else blank.
NB. If a matrix, the delimiter must be vertically aligned,
NB. otherwise use chop"1 to chop each row of the matrix.
NB. e.g.  chop ": 10 20 30
NB.       chop ": i. 5 4
chop=: 3 : 0
y chop~ (' ',LF) {~ LF e. ,y
:
if. 2>#$y
do.
  (<'') -.~ (y e.x) <;._2 y=. y,{.x
else.
  |: &.> y -. {: y=. (*./y e.x) <;._2 |: y=. y,"1 [ 2${.x
end.
)

NB. =========================================================
NB. cubicspline        - calculate cubic spline
NB. y is a 2-row matrix x ,: f(x)
NB. result is x values;coefficient matrix,one row per interval.
cubicspline=: 3 : 0
diff=. }.-}:
'x y'=. y
h=. diff x
k=. diff y
w=. 3 * diff k % *: h
n=. +:(2}.x)-_2}.x
sm=. ,~_2+#x
m=. sm$}.,(sm+0 1){.(}:h),.n,.}.h
c=. 0,w %. m
a=. }:y
b=. (k%h) - h * ((+:c) + }.c,0) % 3
d=. (diff c,0) % 3 * h
(}:x);a,.b,.c,.d
)

NB. =========================================================
NB. interspline        - interpolate spline
NB. x is a result from cubicspline
NB. y is a set of x coordinates
NB. returns corresponding f(x) values
interspline=: 4 : 0
'i m'=. x
n=. <: +/ i <:/ y
(n{m) p. y-n{i
)


NB. =========================================================
cut=: 4 : 'a: -.~ (y e.x) <;._2 y=. y,{.x'

NB. =========================================================
cutopen=: 3 : 0
y cutopen~ (' ',LF) {~ LF e. ,y
:
if. L. y do. y return. end.
if. 1 < #$y do. <"_1 y return. end.
(<'') -.~ (y e.x) <;._2 y=. y,{.x
)

NB. =========================================================
dictget=: 4 : 0
(({."1 y) i. x) { ({:"1 y),<''
)

NB. =========================================================
facenormal=: 4 : 0
norm=. x * unitvec (}:cross&(-/)}.) 3{.y
norm + (+/y) % #y
)

NB. =========================================================
NB. y getangle x
getangle=: arctan@% + o.@(] < 0:)

NB. =========================================================
NB. ifjwplot    if a jwplot
ifjwplot=: 3 : 0
('plot' -: PForm) *. 'jwplot' -: > coname''
)

NB. =========================================================
NB. ifparent   if handle is parent window
ifparent=: 3 : 0
(<y) e. 1 {"1 pforms''
)

NB. =========================================================
ifplotf=: 3 : 0
2 e. 3!:0 (S:0) _1 pick y
)

NB. =========================================================
info=: 3 : 0
sminfo@('Plot'&;) :: smoutput y
)

NB. =========================================================
NB. interp01
NB. x is a list of values representing equal-spaced intervals from 0 to 1
NB. y is a list of numbers in range from 0 to 1
NB. result is interpolated values from x corresponding to y
interp01=: 3 : 0
y=. y * <: #x
b=. x {~ <.y
t=. x {~ >.y
k=. y - <.y
(t*k) + b*-.k
)

NB. =========================================================
NB. keyarg
NB. return key option as uppercase letters, one of:
NB.  keypos    left|right top|bottom inside|outside
NB.  keystyle  left|right boxed horizontal|vertical

NB. options may be given as single letters, or in full
keyarg=: 3 : 0
dat=. ;: tolower y
msk=. dat e. KeyOpts
({. &> msk # dat), ;(-.msk) # dat
)

NB. =========================================================
NB. max maxmask number
maxmask=: 4 : 0
rem=. y-x
if. 0 >: rem do. 1
elseif. rem <: x do.
  1 ,~ (<:y)$((rndint x%rem)$1),0
elseif. 1 do.
  1 ,~ (<:y)$1,(rndint rem%x)$0
end.
)

NB. =========================================================
NB. mfv  - matrix from vector
NB. delimiter mfv vector
mfv=: 4 : 0
if. 2>#$y do.
  ];._2 y,x #~ x ~: _1{.x,y
else.
  y
end.
)

NB. =========================================================
NB. ncile
ncile=: 4 : 0
min=. <./,y
max=. >./,y
step=. }: min+(max-min)*(i.>:x)%x
<: +/ step <:/ y
)

NB. =========================================================
NB. 2 3 0 0 2 0 1 lenfrom i.8
plenfrom=: 4 : 0
x {.each (0,+/\}:x) }.each <y
)

NB. =========================================================
NB. format numbers for layout
NB. values are rounded to avoid
NB. - spurious accuracy in layout
NB. - exponential notation not supported by PDF
pfmt=: 3 : 0
dat=. ": 0.0001 round y
txt=. ,dat
($dat) $ '-' (I. txt='_') } txt
)

NB. =========================================================
NB. format numbers argument for js
NB. values are rounded to avoid
NB. - spurious accuracy in layout
NB. - exponential notation not supported by PDF
pfmtjs=: 1&$: : (4 : 0)
dat=. 0.0001 round y
txt=. , dat=. commasep@(('('&,)@(,&')')^:x)@":"1 dat
($dat) $ '-' (I. txt='_') } txt
)

NB. =========================================================
NB. pforms=: [: <;._2 &> [: <;._2 wdqpx
pforms=: 3 : 0
if. 0=# z=. <;._2;._2 @ wdqpx '' do. z=. 0 6$<'' end.
z
)

NB. =========================================================
NB. preserves double quoted strings while chopping
NB. double quotes removed from output
qchop=: 3 : 0
q=. dquoted y
s=. ' '=y
qs=. q*.s
y=. DEL (inxb qs)}y
dltb@unquot@((DEL,' ')&charsub)@deb each chop y
)

NB. =========================================================
query=: 4 : 0
x ((wdquery 'Plot'&;) :: (1: smoutput)) y
)

NB. =========================================================
NB.*range v range from a to b [in steps of c]
range=: 3 : 0
NB. range a,b[,c] = range from a to b [in steps of c]
'x y n'=. 3{.y,1
s=. _1^y<x
x+s*n*i.>:<.n%~|y-x
)

NB. NB. =========================================================
NB. rndrect=: 3 : 0
NB. shape=. $y
NB. 'x y w h'=. |: _4 [\ ,y
NB. xw=. x+w
NB. yh=. y+h
NB. x=. rndint x
NB. y=. rndint y
NB. w=. (rndint xw) - x
NB. h=. (rndint yh) - y
NB. shape $ , |: x, y, w,: h
NB. )

NB. =========================================================
NB.*rotxy v rotate xy coordinates by given angle
NB.
NB. e.g. 0.5p1 rotate points = rotate clockwise a quarter turn
rotxy=: 4 : 0
rot=. 2 2$ 1 1 _1 1 * 0 1 1 0 { 2 1 o. x
rot +/ . * "2 1 y
)

NB. =========================================================
smooth=: (cubicspline@:(,:~ i.@#) interspline i.&.(4&*)@#)"1

NB. =========================================================
NB. steps a,b,c = from a to b in c steps
steps=: {. + (1&{ - {.) * (i.@>: % ])@{:

NB. =========================================================
NB. remove double quotes
unquot=: 3 : 0
'" ' charsub y
)

NB. =========================================================
NB. cover verb for glsel PId
selectpid=: 3 : 0
if. 0~: (0&". ::]) PIdhwnd do.
  glsel ":PIdhwnd
elseif. #PId do.
  glsel PId
end.
)

NB. =========================================================
isigraph_event=: 4 : 0
evt=. >@{.y
syshandler=. PForm, '_handler'
sysevent=. PForm,'_',PId,'_', evt
sysdefault=. PForm, '_default'
if. 1=#y do.
  wdd=. ;: 'syshandler sysevent sysdefault'
elseif. 2=#y do.
  sysdata=. ": >1{y
  wdd=. ;: 'syshandler sysevent sysdefault sysdata'
elseif. 3=#y do.
  sysdata=. ": >1{y
  sysmodifiers=. ": >2{y
  wdd=. ;: 'syshandler sysevent sysdefault sysdata sysmodifiers'
end.
wdqdata=. (wdd ,. ".&.>wdd)
evthandler wdqdata
0
)
