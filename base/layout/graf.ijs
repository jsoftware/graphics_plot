NB. graf
NB.
NB. getgrafbox

NB. =========================================================
NB. getgrafbox
getgrafbox=: 3 : 0
if. DimType=3 do.
  Gxywh=. Fxywh shrinkrect TICMAJOR * TicOut
else.
  if. FRAME *. FrameX do.
    Gxywh=: Fxywh shrinkrect TICMAJOR + MGxy
  else.
    Gxywh=: Fxywh
  end.
end.
'Gx Gy Gw Gh'=: Gxywh
)
