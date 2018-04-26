NB. aspect

NB. =========================================================
getaspect=: 3 : 0
if. ASPECT=0 do. return. end.
select. * ASPECT - Gh % Gw
case. _1 do.
  getaspecth''
case. 1 do.
  getaspectw''
end.
Gxywh=: Gx,Gy,Gw,Gh
Fxywh=: Fx,Fy,Fw,Fh
Lxywh=: Lx,Ly,Lw,Lh
)

NB. =========================================================
getaspecth=: 3 : 0
new=. Gw * ASPECT
dh=. Gh - new
dy=. 0 >. (Dy - Gy) + -: Dh - new
Gh=: Gh - dh
Gy=: Gy + dy
Fh=: Fh - dh
Fy=: Fy + dy
Lh=: Lh - dh
Ly=: Ly + dy
if. (#KEY) *. 'o' e. KEYPOS do.
  Ky=: Ky + ('b' e. KEYPOS) { (dy-dh),dy
  Kxywh=: Kx,Ky,Kw,Kh
end.
if. #XCAPTION do.
  Xy=: Xy + dy
  Xxywh=: Xx, Xy, Xw, Xh
end.
if. #TITLE do.
  Ty=: Ty + dy - dh
  Txywh=: Tx, Ty, Tw, Th
end.
if. #SUBTITLE do.
  Vy=: Vy + dy - dh
  Vxywh=: Vx, Vy, Vw, Vh
end.
)

NB. =========================================================
getaspectw=: 3 : 0
new=. Gh % ASPECT
dw=. Gw - new
dx=. 0 >. (Dx - Gx) + -: Dw - new
Gw=: Gw - dw
Gx=: Gx + dx
Fw=: Fw - dw
Fx=: Fx + dx
Lw=: Lw - dw
Lx=: Lx + dx
if. (#KEY) *. 'o' e. KEYPOS do.
  Kx=: Kx + ('r' e. KEYPOS) { dx,dx-dw
  Kxywh=: Kx,Ky,Kw,Kh
end.
if. (IfMulti >: IfPie) *. #YCAPTION do.
  Yx=: Yx + dx
  Yxywh=: Yx, Yy, Yw, Yh
end.
if. #Y2CAPTION do.
  Y2x=: Y2x + dx - dw
  Y2xywh=: Y2x, Y2y, Y2w, Y2h
end.
)
