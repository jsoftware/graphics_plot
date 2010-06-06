NB. key innerbox

NB. =========================================================
getinnerkeybox=: 3 : 0

if. 0 = #KEY do. return. end.

if. 'o' e. KEYPOS do. return. end.

NB. ---------------------------------------------------------
NB. horizontal keys
if. 'h' e. KEYSTYLE do.
  if. 'r' e. KEYPOS do.
    x=. Gw - (+:MKx) + Kw
  elseif. 'c' e. KEYPOS do.
    x=. -: Gw - Kw
  elseif. do.
    x=. +:MKx
  end.
  if. 'b' e. KEYPOS do.
    y=. +:MKy
  else.
    y=. Gh - (+:MKy) + Kh
  end.

NB. ---------------------------------------------------------
NB. vertical keys
else.
  if. 'r' e. KEYPOS do.
    x=. Gw - (+:MKx) + Kw
  else.
    x=. +:MKx
  end.
  if. 'b' e. KEYPOS do.
    y=. +:MKy
  elseif. 'm' e. KEYPOS do.
    y=. -: Gh - Kh
  elseif. do.
    y=. Gh - (+:MKy) + Kh
  end.
end.

Kx=: x+Gx
Ky=: y+Gy
Kxywh=: Kx,Ky,Kw,Kh
)

