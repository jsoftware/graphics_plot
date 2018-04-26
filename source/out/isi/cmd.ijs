NB. gpcmd
NB.
NB. isigraph command cover functions
NB.
NB. normal order:
NB.   pattern, pencolor, pensize, brushcolor, data
NB.
NB. these functions assume that positions are flipped
NB. as required by isigraph

gpcount=: ,"1~ 1 + [: {: 1 , $

NB. =========================================================
NB. cut commands (for debugging)
gpcut=: 3 : 0
r=. ''
while. #y do.
  n=. {. y
  if. n=0 do.
    info 'zero length segment at: ',":#;r
    r
    return.
  end.
  r=. r, < n {. y
  y=. n }. y
end.
r
)

NB. =========================================================
gpbuf=: 3 : 0
assert. 2 > #$y
buf=: buf,y
)

NB. =========================================================
NB. gpapply
NB.
NB. apply buffered gl commands
gpapply=: 3 : 0
glcmds buf
buf=: $0
)

NB. =========================================================
gpflip=: flipxy @ rndint

NB. =========================================================
gpfliplast=: 3 : 0
(<gpflip _1 pick y) _1 } y
)

NB. =========================================================
gpinit=: 3 : 0
buf=: bufdef=: $0
r=. ''
r=. r,3 2003 1 NB. bkmode 1
r=. r,3 2071 1 NB. noerasebkgnd 1
gpapply''
)

NB. =========================================================
gpbrushnull=: 3 : '2 2005'

NB. =========================================================
NB. set pen
NB.
NB. gppens   several colors, several sizes
NB. gppen    one color, one size
NB. gppens1  several colors, size 1
NB. gppen1   one color, size 1
NB. gppenbrush1 one color, size 1 also brush
gppens=: 4 : 0
y=. rndint y
5 2032,"1 x,"1 [ 4 2022,"1 y,.(y~:0){PS_NULL,PS_SOLID
)

NB. =========================================================
gppen=: 4 : 0
y=. rndint y
5 2032,(,x),4 2022,y,(y~:0){PS_NULL,PS_SOLID
)

NB. =========================================================
gppens1=: 3 : 0
5 2032,"1 y,"1 [ 4 2022 1,PS_SOLID
)

NB. =========================================================
gppen1=: 3 : 0
5 2032,(,y),4 2022 1,PS_SOLID
)

NB. =========================================================
gppenbrush1=: 3 : 0
5 2032,(,y),4 2022 1,PS_SOLID,2 2004
)

NB. =========================================================
gppixel=: 3 : 0
's t f e c p'=. y
p=. gpcount 2024 ,"1 gpflip p
if. is1color e do.
  gpbuf e gppen 1
  gpbuf ,p
else.
  rws=. #p
  e=. rws $ citemize e
  pen=. e gppens 1
  gpbuf ,pen ,. p
end.
)

NB. =========================================================
NB. gppline v draw solid lines with color, pensize
NB.
NB. x=. arc,line
NB. y = pencolor;pensize;xywh
gppline=: 4 : 0
's t f e c p'=. y
if. (is1color e) *. 1 = #s do.
  gpbuf (,e) gppen s
  gpbuf ,gpcount x,"1 p
else.
  rws=. #p
  e=. rws $ citemize e
  s=. rws $ s
  pen=. e gppens s
  gpbuf ,pen ,. gpcount x,"1 p
end.
)

NB. =========================================================
NB. gppshape
NB.
NB. x = circle,pie,polygon,rect
NB. y = pencolor;pensize;brushcolor;xywh
NB.
NB. one pencolor,size
gppshape=: 4 : 0
'v s f e c p'=. y

if. v=0 do. e=. c end.

if. is1color e do.
  gpbuf e gppen v

NB. ---------------------------------------------------------
  if. isempty c do.
    gpbuf gpbrushnull''
    gpbuf ,gpcount x,"1 p
  elseif. is1color c do.
    gpbuf 5 2032,(,c),2 2004
    gpbuf ,gpcount x,"1 p
  elseif. do.
    c=. (#p) $ c
    clr=. 5 2032 ,"1 c ,"1 [ 2 2004
    gpbuf , clr ,. gpcount x,"1 p
  end.

NB. ---------------------------------------------------------
else.
  e=. (#p) $ e
  e=. e gppens v
  if. isempty c do.
    gpbuf gpbrushnull''
    gpbuf , e ,. gpcount x,"1 p
  elseif. is1color c do.
    gpbuf 5 2032,(,c),2 2004
    gpbuf , e ,. gpcount x,"1 p
  elseif. do.
    c=. (#p) $ c
    clr=. 5 2032 ,"1 c ,"1 [ 2 2004
    gpbuf , e ,. clr ,. gpcount x,"1 p
  end.

end.
)
