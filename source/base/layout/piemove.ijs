NB. move
NB.
NB. move pie labels to avoid overlaps

NB. =========================================================
NB. movepielabels
NB.
NB. move labels to avoid overlaps
NB.
NB. returns: return code 0=OK, 1 = fail
NB.          updated positions

movepielabels=: 3 : 0

pos=. y
org=. y
len=. #pos

NB. allowed maximum radii:
'Lmw Lmh'=: <. -: 2 3 { Lxywh

NB. ---------------------------------------------------------
whilst. -. old -: pos do.

  old=. pos

NB. ---------------------------------------------------------
NB. find overlaps:
  msk=. rectoverlaps pos
  if. -. 1 e. msk do.
    0;pos return.
  end.
  msk=. msk, 2 {. msk

NB. ---------------------------------------------------------
  if. -. 0 e. msk do.
    pos=. moveoutpielabels pos continue.
  end.

NB. ---------------------------------------------------------
NB. another loop over possible moves, until something gives:
  ndx=. 1 + I. 0 1 E. msk

  for_i. ndx do.
    'cur nxt'=. (len | i + 0 1) { pos
    if. (i+2) { msk do.
      new=. cur movepielabelback nxt
      pos=. new i } pos
    else.
      new=. cur separatepielabel nxt
      pos=. new (len | i + 0 1) } pos
    end.
    if. -. pos -: old do. break. end.
  end.

end.

(pos-:org);pos
)

NB. =========================================================
NB. try to move pie labels out (subject to label box)
moveoutpielabels=: 3 : 0
'x y w h'=. |: y
x=. x + * x
y=. y + * y
x=. (-Lmw) >. x <. Lmw - w
y=. (-Lmh) >. y <. Lmh - h
x,.y,.w,.h
)

NB. =========================================================
NB. movepielabelback
NB.
NB. separates labels x and y
movepielabelback=: 4 : 0

'lx ly lw lh'=. x
'rx ry rw rh'=. y
ox=. (lw+rw) + (lx<.rx) - (lx+lw)>.rx+rw
oy=. (lh+rh) + (ly<.ry) - (ly+lh)>.ry+rh
ox=. ox + 3
oy=. oy + 3

NB. angle of center of lx:
ang=. (ly - -: lh) getangle lx + -: lw

NB. get required move:
if. (ox % | cos ang) < oy % | sin ang do.
  mx=. ox
  my=. >. mx * | ly%lx
else.
  my=. oy
  mx=. >. my * | lx%ly
end.

mx=. mx * _1 ^ ly > 0
my=. my * _1 ^ lx < 0

lx=. lx + mx
ly=. ly + my

lx,ly,lw,lh
)


NB. =========================================================
NB. separatepielabel
NB.
NB. separates labels x and y
separatepielabel=: 4 : 0
'lx ly lw lh'=. x
'rx ry rw rh'=. y
ox=. (lw+rw) + (lx<.rx) - (lx+lw)>.rx+rw
oy=. (lh+rh) + (ly<.ry) - (ly+lh)>.ry+rh
ox=. >. 2 + -: ox
oy=. >. 2 + -: oy

NB. angle of center of lx:
ang=. (ly - -: lh) getangle lx + -: lw

NB. get required move:
NB. check for pure horizontal or pure vertical movement:
rad=. -: Gh
if. rad < ly <. ry do.
  lx=. lx - ox
  rx=. rx + ox
elseif. rad < - (ly+lh) <. ry+rh do.
  lx=. lx + ox
  rx=. rx - ox
elseif. rad < rx <.ry do.
  ly=. ly - oy
  ry=. ry + oy
elseif. rad < - (rx+rw) <. ry+rw do.
  ly=. ly + oy
  ry=. ry - oy
elseif. do.
  if. (ox % | cos ang) < oy % | sin ang do.
    mx=. ox
    my=. >. mx * | ly%lx
  else.
    my=. oy
    mx=. >. my * | lx%ly
  end.
  mx=. mx * _1 ^ ly > 0
  my=. my * _1 ^ lx < 0
  lx=. lx + mx
  rx=. rx - mx
  ly=. ly + my
  ry=. ry - my
end.

lx=. (-Lmw) >. (lx + *lx) <. Lmw - lw
ly=. (-Lmh) >. (ly + *ly) <. Lmh - lh
rx=. (-Lmw) >. (rx + *rx) <. Lmw - rw
ry=. (-Lmh) >. (ry + *ry) <. Lmh - rh
(lx,ly,lw,lh),:rx,ry,rw,rh
)

NB. =========================================================
NB.*rotxy v rotate xy coordinates by given angle
NB.
NB. e.g. 0.5p1 rotate points = rotate clockwise a quarter turn
rotxy=: 4 : 0
rot=. 2 2$ 1 1 _1 1 * 0 1 1 0 { 2 1 o. x
rot +/ . * "2 1 y
)

