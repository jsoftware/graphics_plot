NB. label

NB. =========================================================
NB. format numbers for labels
lfmt=: 3 : 0
dat=. ": y
txt=. ,dat
($dat) $ '-' (I. txt='_') } txt
)

NB. =========================================================
getlabelbox=: 3 : 0

lxywh=. Oxywh

if. ifouterkey'' do.

  'lx ly lw lh'=. lxywh
  lr=. lx + lw
  ls=. ly + lh

  if. 'h' e. KEYSTYLE do.
    if. 'b' e. KEYPOS do.
      ly=. Ky + Kh
    else.
      ls=. Ky
    end.
  else.
    if. 'r' e. KEYPOS do.
      lr=. Kx
    elseif. 'c' e. KEYPOS do.
      if. 'b' e. KEYPOS do.
        ly=. Ky + Kh
      else.
        ls=. Ky
      end.
    elseif. do.
      lx=. Kx + Kw
    end.
  end.
  lxywh=. lx,ly,(lr-lx),ls-ly

end.

'Lx Ly Lw Lh'=: Lxywh=: lxywh shrinkrect MLxy + MXlabel,MYlabel
)

NB. =========================================================
NB. getlabels (if not already defined)
NB.
NB. at axis crossings:
NB. dont show if axis=0 or if X crossing (not T) and not ORIGINXLABEL
NB.
NB. this has to be done after axes are calculated, so
NB. that XDiv and YDiv are available
getlabels=: 3 : 0

fm=. FRAME +. ORIGINXLABEL

if. (0=#XLabel) *. 0 { LABELS do.
  b=. (XInt=XTicPos) *. (XInt=0) >: YDiv e. 0 1
  ndx=. I. (DimType=2) *. fm<b
  XLabel=: (<'') ndx } lfmt each pow10 ^: XLOG XTicPos
end.

NB. ---------------------------------------------------------
if. (0=#YLabel) *. 1 { LABELS do.
  b=. (YInt=YTicPos) *. (YInt=0) >: XDiv e. 0 1
  ndx=. I. (DimType=2) *. fm<b
  YLabel=: (<'') ndx } lfmt each pow10 ^: YLOG YTicPos
end.


NB. ---------------------------------------------------------
if. DimType=2 do.
  if. {:YAxes do.
    if. (0=#Y2Label) *. 2 { LABELS do.
      b=. (Y2Int=Y2TicPos) *. (Y2Int=0) >: XDiv e. 0 1
      ndx=. I. (DimType=2) *. fm<b
      Y2Label=: (<'') ndx } lfmt each pow10 ^: Y2LOG Y2TicPos
    end.
  end.
  return.
end.

NB. ---------------------------------------------------------
NB. Z labels
if. (0=#ZLabel) *. 2 { LABELS do.
  b=. (ZInt=ZTicPos) *. (ZInt=0) >: XDiv e. 0 1
  ndx=. I. (DimType=2) *. FRAME<b
  ZLabel=: (<'') ndx } lfmt each pow10 ^: ZLOG ZTicPos
end.
)

