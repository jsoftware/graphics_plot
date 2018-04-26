NB. qt_gpcmd
NB.
NB. canvas command cover functions
NB.
NB. normal order:
NB.   pattern, pencolor, pensize, brushcolor, data
NB.
NB. these functions assume that positions are flipped
NB. as required by canvas

qt_gpcount=: ,"1~ 1 + [: {: 1 , $

NB. =========================================================
NB. cut commands (for debugging)
qt_gpcut=: 3 : 0
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
qt_gpbuf=: 3 : 0
assert. 2 > #$y
buf=: buf,y
)

NB. =========================================================
NB. qt_gpapply
NB.
NB. apply buffered gl commands
qt_gpapply=: 3 : 0
rc=. glcmds`glcmds_jglc_@.(Poutput=iQTC) buf
assert. 0=rc [ 'glcmds buf'
buf=: $0
)

NB. =========================================================
qt_gpflip=: flipxy @ rndint

NB. =========================================================
qt_gpfliplast=: 3 : 0
(<qt_gpflip _1 pick y) _1 } y
)

NB. =========================================================
qt_gpinit=: 3 : 0
buf=: bufdef=: $0
)

NB. =========================================================
qt_gpbrushnull=: 3 : '2 2005'

NB. =========================================================
NB. set pen
NB.
NB. qt_gppens   several colors, several sizes
NB. qt_gppen    one color, one size
NB. qt_gppens1  several colors, size 1
NB. qt_gppen1   one color, size 1
NB. qt_gppenbrush1 one color, size 1 also brush
qt_gppens=: 4 : 0
y=. rndint y
5 2032,"1 x,"1 [ 4 2022,"1 y,.(y~:0){PS_NULL,PS_SOLID
)

NB. =========================================================
qt_gppen=: 4 : 0
y=. rndint y
5 2032,(,x),4 2022,y,(y~:0){PS_NULL,PS_SOLID
)

NB. =========================================================
qt_gppens1=: 3 : 0
5 2032,"1 y,"1 [ 4 2022 1,PS_SOLID
)

NB. =========================================================
qt_gppen1=: 3 : 0
5 2032,(,y),4 2022 1,PS_SOLID
)

NB. =========================================================
qt_gppenbrush1=: 3 : 0
5 2032,(,y),4 2022 1,PS_SOLID,2 2004
)

NB. =========================================================
qt_gppixel=: 3 : 0
's t f e c p'=. y
p=. qt_gpcount 2024 ,"1 qt_gpflip p
if. is1color e do.
  qt_gpbuf e qt_gppen 1
  qt_gpbuf ,p
else.
  rws=. #p
  e=. rws $ citemize e
  pen=. e qt_gppens 1
  qt_gpbuf ,pen ,. p
end.
)

NB. =========================================================
NB. qt_gppline v draw solid lines with color, pensize
NB.
NB. x=. arc,line
NB. y = pencolor;pensize;xywh
qt_gppline=: 4 : 0
's t f e c p'=. y
if. (is1color e) *. 1 = #s do.
  qt_gpbuf (,e) qt_gppen s
  qt_gpbuf ,qt_gpcount x,"1 p
else.
  rws=. #p
  e=. rws $ citemize e
  s=. rws $ s
  pen=. e qt_gppens s
  qt_gpbuf ,pen ,. qt_gpcount x,"1 p
end.
)

NB. =========================================================
NB. qt_gppshape
NB.
NB. x = circle,pie,polygon,rect
NB. y = pencolor;pensize;brushcolor;xywh
NB.
NB. one pencolor,size
qt_gppshape=: 4 : 0
'v s f e c p'=. y

if. v=0 do. e=. c end.

if. is1color e do.
  qt_gpbuf e qt_gppen v

NB. ---------------------------------------------------------
  if. isempty c do.
    qt_gpbuf qt_gpbrushnull''
    qt_gpbuf ,qt_gpcount x,"1 p
  elseif. is1color c do.
    qt_gpbuf 5 2032,(,c),2 2004
    qt_gpbuf ,qt_gpcount x,"1 p
  elseif. do.
    c=. (#p) $ c
    clr=. 5 2032 ,"1 c ,"1 [ 2 2004
    qt_gpbuf , clr ,. qt_gpcount x,"1 p
  end.

NB. ---------------------------------------------------------
else.
  e=. (#p) $ e
  e=. e qt_gppens v
  if. isempty c do.
    qt_gpbuf qt_gpbrushnull''
    qt_gpbuf , e ,. qt_gpcount x,"1 p
  elseif. is1color c do.
    qt_gpbuf 5 2032,(,c),2 2004
    qt_gpbuf , e ,. qt_gpcount x,"1 p
  elseif. do.
    c=. (#p) $ c
    clr=. 5 2032 ,"1 c ,"1 [ 2 2004
    qt_gpbuf , e ,. clr ,. qt_gpcount x,"1 p
  end.

end.
)
