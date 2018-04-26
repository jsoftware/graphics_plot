NB. draw

NB. =========================================================
NB. draw key
NB.
NB. this deferred to end
drawkey=: 3 : 0

if. 0 = #KEY do. return. end.

len=. #KEY

NB. ---------------------------------------------------------
if. #KEYCOLOR do.
  clr=. KEYCOLOR
else.
  clr=. ITEMCOLOR
end.
clr=. len $ clr

NB. ---------------------------------------------------------
NB. horizontal, rightjustified
'hz rj'=. 'hr' e. KEYSTYLE

boxed=. -. 'o' e. KEYSTYLE
marker=. 1 e. 'mc' e. KEYSTYLE

if. marker do.
  if. #ndx=. KEYMARKERS,MARKERS do.
    markers=. ndx { KeyMarkerNames
  else.
    markers=. KeyMarkerNames
  end.
end.

NB. ---------------------------------------------------------
NB. xy of bottom left key drawing:
'kx ky'=. ((boxed + 1) * MKx,MKy) + Kx,Ky

NB. style is 1 if rectangle, otherwise line
'tw th'=. KeyExtent
mtw=. >./tw
mth=. >./th

NB. ---------------------------------------------------------
select. hz,rj
case. 0 0 do.
  gx=. 0
  gy=. ty=. |. +/\ th
  tx=. MKx + KeyLen
  ts=. iLEFT
case. 0 1 do.
  tx=. mtw
  gx=. tx + MKx
  gy=. ty=. |. +/\ th
  ts=. iRIGHT
case. 1 0 do.
  gy=. ty=. mth
  gx=. 0, +/\ }: tw + KeyLen + 3 * MKx
  tx=. gx + KeyLen + MKx
  ts=. iLEFT
case. 1 1 do.
  gy=. ty=. mth
  gx=. (+/\ tw) + (KeyLen + 3 * MKx) * i.#tw
  tx=. gx - MKx
  ts=. iRIGHT
end.

gx=. gx + kx
tx=. tx + kx
gy=. gy + ky
ty=. ty + ky

NB. ---------------------------------------------------------
NB. draw box
if. boxed do.
  rect=. boxwh2rs Kxywh shrinkrect MKx,MKy,MKx,MKy
  col=. ('o' e. KEYPOS) pick FrameBackColor;BACKCOLOR
  drawrect iKEY;AXISCOLOR;1;col;rect
end.

NB. ---------------------------------------------------------
NB. draw graphic
if. marker do.
  xy=. (gx + -: KeyLen),.ty - -: th
  for_i. i.#xy do.
    drawmarker iKEY;(MarkerScale*MARKERSIZE);(i{clr);(i{markers),<,:i{xy
  end.
  if. 'c' e. KEYSTYLE do.
    wh=. KeyLen,KeyPen
    xy=. gx,.ty - -: KeyPen + th
    dat=. xy ,"1 xy +"1 wh
    drawrect iKEY;AXISCOLOR;0;clr;dat
  end.
elseif. 'f' e. KEYSTYLE do.
  hit=. 0.5 * <./th
  ly=. ty + 1 - -: hit + th
  xy=. gx,.ly
  wh=. KeyLen,hit
  dat=. xy ,"1 xy +"1 wh
  drawrect iKEY;AXISCOLOR;0;clr;dat
elseif. do.
  ly=. ty + 1 - -: KeyPen + th
  xy=. gx,.ly
  wh=. KeyLen,KeyPen
  dat=. xy ,"1 xy +"1 wh
  drawrect iKEY;AXISCOLOR;0;clr;dat
end.

NB. ---------------------------------------------------------
NB. draw text
if. Poutput = iANDROID do.
  ty=. ty - <. 0.75 * {.th       NB. kludge for android
elseif. Poutput e. iQT,iQTC do.
NB.   ty=. ty - <. 0.75 * {.th       NB. kludge for Qt
end.
pos=. tx,.ty

drawtext dolast iKEY;ts;KeyFont;LABELCOLOR;KEY;pos
)

