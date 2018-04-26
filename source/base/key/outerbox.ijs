NB. key outer box

ifouterkey=: 3 : 0
('o' e. KEYPOS) *. 0 < #KEY
)

NB. =========================================================
NB.
NB. defines outer key box
getouterkeybox=: 3 : 0
if. -. ifouterkey'' do. return. end.

if. 'r' e. KEYPOS do.
  x=. Ox + Ow - Kw
elseif. 'c' e. KEYPOS do.
  x=. Ox + -: Ow - Kw
elseif. do.
  x=. Ox
end.

if. 'b' e. KEYPOS do.
  y=. Oy
elseif. 'm' e. KEYPOS do.
  y=. Oy + -: Oh - Kh
elseif. do.
  y=. Oy + Oh - Kh
end.

Kx=: x
Ky=: y
Kxywh=: Kx,Ky,Kw,Kh
)

