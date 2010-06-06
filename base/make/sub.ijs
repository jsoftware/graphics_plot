NB. sub

cocurrent 'jzplot'

bSub=: <'sub'
bEndSub=: <'endsub'

NB. =========================================================
makesub=: 3 : 0
pcmd=. y
ndx=. ({."1 pcmd) i. bSub
if. ndx do.
  makesubdo ndx {. pcmd
  pcmd=. ndx }. pcmd
end.
if. #pcmd do.
  cmds=. {."1 pcmd
  msk=. 1, 0 = }: +/\ (bSub=cmds)-bEndSub=cmds
  msk=. firstones msk
  pcmd=. msk <;.1 pcmd
  for_p. pcmd do.
    makesubin >p
  end.
end.
)

NB. =========================================================
makesubdo=: 3 : 0
pcmd=. y
if. -. ({. {. pcmd) e. PDcmds do.
  pcmd=. ('new';''), pcmd
end.
msk=. ({."1 pcmd) e. PDcmds
pcmd=. msk <;.1 pcmd
for_p. pcmd do.
  p=. > p
  'cmd arg'=. {. p
  if. #Mxywh do.
    if. 0 = # arg do.
      Sxywh=: Mndx { Mxywh
      Mndx=: (#Mxywh) | Mndx + 1
    end.
  end.
  if. cmd -: 'multi' do.
    makemulti p
  else.
    makenew p
  end.
end.
)

NB. =========================================================
makesubin=: 3 : 0
pcmd=. y
if. bSub = {. {. pcmd do.

  val=. 1 pick {. pcmd
  pcmd=. }. pcmd
  pcmd=. (- bEndSub={:pcmd) }. pcmd

NB. ---------------------------------------------------------
  if. ',' e. val do.
    ndx=. val i. ','
    val=. (0 ". ndx {. val) ; 0 ". (ndx + 1) }. val
    smat=. Sxywh makesubshape val
    sxywh=. {. smat NB. Sxywh
  else.
    if. 2 = # 0 ". val do.
      smat=. Sxywh makesubshape (0 ". val) # each 1
      sxywh=. {. smat NB. Sxywh
    else.
      smat=. ''
      sxywh=. Sxywh makepos_xywh val
      if. 1 e. 1 >: _2 {. sxywh do. return. end.
    end.
  end.

NB. ---------------------------------------------------------
  pushsxywh smat;sxywh
  makesub pcmd
  popsxywh ''
else.
  makesub pcmd
end.
)

NB. =========================================================
NB. following makes overlapping windows
NB.
NB. possibly should allow margin of 1 between
makesubshape=: 4 : 0
xy=. 2 {. x
wh=. _2 {. x
txy=. > { (scale01 1 pick y);scale01 |. 0 pick y
txy=. xy +"1 txy *"1 wh
bl=. _1 _1 }. txy
tr=. 1 1 }. txy
rec=. rndint bl ,"1 tr - bl
,/ |. 0 2 |: rec
)
