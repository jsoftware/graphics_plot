NB. android_gpcmd
NB.
NB. canvas command cover functions
NB.
NB. normal order:
NB.   pattern, pencolor, pensize, brushcolor, data
NB.
NB. these functions assume that positions are flipped
NB. as required by canvas

android_gpcount=: ,"1~ 1 + [: {: 1 , $

NB. =========================================================
NB. cut commands (for debugging)
android_gpcut=: 3 : 0
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
android_gpbuf=: 3 : 0
assert. 2 > #$y
buf=: buf,y
)

NB. =========================================================
NB. android_gpapply
NB.
NB. apply buffered gl commands
android_gpapply=: 3 : 0
rc=. glcmds buf
assert. 0=rc [ 'glcmds buf'
buf=: $0
)

NB. =========================================================
android_gpflip=: flipxy @ rndint

NB. =========================================================
android_gpfliplast=: 3 : 0
(<android_gpflip _1 pick y) _1 } y
)

NB. =========================================================
android_gpinit=: 3 : 0
buf=: bufdef=: $0
r=. ''
r=. r,3 2003 1 NB. bkmode 1
r=. r,3 2071 1 NB. noerasebkgnd 1
NB. android_gpapply''
buf=: r
)

NB. =========================================================
android_gpbrushnull=: 3 : '2 2005'

NB. =========================================================
NB. set pen
NB.
NB. android_gppens   several colors, several sizes
NB. android_gppen    one color, one size
NB. android_gppens1  several colors, size 1
NB. android_gppen1   one color, size 1
NB. android_gppenbrush1 one color, size 1 also brush
android_gppens=: 4 : 0
y=. rndint y
5 2032,"1 x,"1 [ 4 2022,"1 y,.(y~:0){PS_NULL,PS_SOLID
)

NB. =========================================================
android_gppen=: 4 : 0
y=. rndint y
5 2032,(,x),4 2022,y,(y~:0){PS_NULL,PS_SOLID
)

NB. =========================================================
android_gppens1=: 3 : 0
5 2032,"1 y,"1 [ 4 2022 1,PS_SOLID
)

NB. =========================================================
android_gppen1=: 3 : 0
5 2032,(,y),4 2022 1,PS_SOLID
)

NB. =========================================================
android_gppenbrush1=: 3 : 0
5 2032,(,y),4 2022 1,PS_SOLID,2 2004
)

NB. =========================================================
android_gppixel=: 3 : 0
's t f e c p'=. y
p=. android_gpcount 2024 ,"1 android_gpflip p
if. is1color e do.
  android_gpbuf e android_gppen 1
  android_gpbuf ,p
else.
  rws=. #p
  e=. rws $ citemize e
  pen=. e android_gppens 1
  android_gpbuf ,pen ,. p
end.
)

NB. =========================================================
NB. android_gppline v draw solid lines with color, pensize
NB.
NB. x=. arc,line
NB. y = pencolor;pensize;xywh
android_gppline=: 4 : 0
's t f e c p'=. y
if. (is1color e) *. 1 = #s do.
  android_gpbuf (,e) android_gppen s
  android_gpbuf ,android_gpcount x,"1 p
else.
  rws=. #p
  e=. rws $ citemize e
  s=. rws $ s
  pen=. e android_gppens s
  android_gpbuf ,pen ,. android_gpcount x,"1 p
end.
)

NB. =========================================================
NB. android_gppshape
NB.
NB. x = circle,pie,polygon,rect
NB. y = pencolor;pensize;brushcolor;xywh
NB.
NB. one pencolor,size
android_gppshape=: 4 : 0
'v s f e c p'=. y

if. v=0 do. e=. c end.

if. is1color e do.
  android_gpbuf e android_gppen v

NB. ---------------------------------------------------------
  if. isempty c do.
    android_gpbuf android_gpbrushnull''
    android_gpbuf ,android_gpcount x,"1 p
  elseif. is1color c do.
    android_gpbuf 5 2032,(,c),2 2004
    android_gpbuf ,android_gpcount x,"1 p
  elseif. do.
    c=. (#p) $ c
    clr=. 5 2032 ,"1 c ,"1 [ 2 2004
    android_gpbuf , clr ,. android_gpcount x,"1 p
  end.

NB. ---------------------------------------------------------
else.
  e=. (#p) $ e
  e=. e android_gppens v
  if. isempty c do.
    android_gpbuf android_gpbrushnull''
    android_gpbuf , e ,. android_gpcount x,"1 p
  elseif. is1color c do.
    android_gpbuf 5 2032,(,c),2 2004
    android_gpbuf , e ,. android_gpcount x,"1 p
  elseif. do.
    c=. (#p) $ c
    clr=. 5 2032 ,"1 c ,"1 [ 2 2004
    android_gpbuf , e ,. clr ,. android_gpcount x,"1 p
  end.

end.
)
