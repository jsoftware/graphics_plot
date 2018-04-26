NB. outerbox

NB. =========================================================
NB. getouterboxes
NB.
NB. defines item boxes, OutBox
getouterboxes=: 3 : 0

'ox oy ow oh'=. Dxywh
or=. ox + ow
os=. oy + oh

NB. ---------------------------------------------------------
NB. title
if. #TITLE do.
  'Tw Th'=: (TitleFont pgetextent1 TITLE) + +: MTitle
  Tx=: Dx + -: Dw - Tw
  Ty=: Dy + Dh - Th
  Txywh=: Tx,Ty,Tw,Th
  os=. os <. Ty
else.
  'Tx Ty Tw Th'=: Txywh=: Dx,(Dy+Dh),0 0
end.

NB. ---------------------------------------------------------
NB. subtitle
if. #SUBTITLE do.
  'Vw Vh'=: (SubTitleFont pgetextent1 SUBTITLE) + +: MSubTitle
  Vx=: Dx + -: Dw - Vw
  Vy=: Ty - Vh
  Vxywh=: Vx,Vy,Vw,Vh
  os=. os <. Vy
else.
  'Vx Vy Vw Vh'=: Vxywh=: Tx,Ty,0 0
end.

NB. ---------------------------------------------------------
NB. ycaption
if. (-.IfPie) *. #YCAPTION do.
  'Yh Yw'=: (CaptionFont pgetextent1 YCAPTION) + +: MYCaption
  Yx=: Dx
  Yy=: Dy + -: Dh - Yh
  if. #TITLE,SUBTITLE do.
    if. (Tx<.Vx) < Yx+Yw do.
      Yy=: Dy >. Yy <. Vy - Yh
    end.
  end.
  Yxywh=: Yx,Yy,Yw,Yh
  ox=. ox >. Yx + Yw
else.
  'Yx Yy Yw Yh'=: Yxywh=: Dx,Dy,0 0
end.

NB. ---------------------------------------------------------
NB. y2caption
if. #Y2CAPTION do.
  'Y2h Y2w'=: (CaptionFont pgetextent1 Y2CAPTION) + +: MYCaption
  Y2x=: Dx + Dw - Y2w
  Y2y=: Dy + -: Dh - Y2h
  if. #TITLE,SUBTITLE do.
    if. ((Tx+Tw)>.Vx+Vw) > Y2x do.
      Y2y=: Dy >. Y2y <. Vy - Y2h
    end.
  end.
  Y2xywh=: Y2x,Y2y,Y2w,Y2h
  or=. or <. Y2x
else.
  'Y2x Y2y Y2w Y2h'=: Y2xywh=: (Dx+Dw),Dy,0 0
end.

NB. ---------------------------------------------------------
NB. xcaption
NB.
NB. does not check for both overlaps with Y captions at once
if. #XCAPTION do.
  'Xw Xh'=: (CaptionFont pgetextent1 XCAPTION) + +: MXCaption
  Xx=: Dx + -: Dw - Xw
  Xy=: Dy

  if. #YCAPTION do.
    if. Yy < Xy + Xh do.
      Xx=: Xx >. Yx + Yw
    end.
  end.

  if. #Y2CAPTION do.
    if. Y2y < Xy + Xh do.
      Xx=: 0 >. Xx <. Yx - Xw
    end.
  end.
  Xxywh=: Xx,Xy,Xw,Xh
  oy=. oy >. Xy + Xh
else.
  'Xx Xy Xw Xh'=: Xxywh=: Dx,Dy,0 0
end.

NB. ---------------------------------------------------------
'Ox Oy Ow Oh'=: Oxywh=: ox,oy,(or-ox),os-oy
)

