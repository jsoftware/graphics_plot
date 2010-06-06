NB. makenew - make new/use command block

NB. =========================================================
NB. makenew
NB. first command is new or use, this defines the drawing scale
NB.
NB. within this block, types must be compatible.
NB.
NB. the block is then divided into type blocks, run by maketype
makenew=: 3 : 0

dat=. y
'cmd rect'=. {. dat
dat=. }. dat

setplotdefaults cmd
setsubdxywh rect

NB. ---------------------------------------------------------
if. (1 = #dat) *. 'BACKCOLOR' -: 0 pick {. dat do.
  defineoptions dat
  dat=. ''
end.

NB. ---------------------------------------------------------
if. 0 = #dat do.
  drawbackground '' return.
end.

NB. ---------------------------------------------------------
NB. define plot options (not in PDef)
msk=. ({."1 dat) e. PlotOpts
defineoptions msk # dat
dat=. (-.msk) # dat

NB. ---------------------------------------------------------
makepdef (". each PDefNames) getpdef dat
)

NB. =========================================================
makepdef=: 3 : 0
(PDefNames)=: y

defineoptions 0 pick Opts
setfonts''
settypeflags ;Types
setcolorrep''
definecolor''

NB. ---------------------------------------------------------
if. 0=#Data do.
  makenodata ''

NB. ---------------------------------------------------------
else.
  makedata_init {.Y2Msk
  mat=. (Y2Msk ;&> i.#Y2Msk),.Opts,.Types
  for_m. mat do.
    maketype m
  end.
end.

NB. ---------------------------------------------------------
makenew_fini''
)

NB. =========================================================
makenew_fini=: 3 : 0
drawgd 1
drawfxywh 0
drawbackground''
maketext''
makerule''
drawtitle''
drawsubtitle''
drawborder''
drawkey''

NB. ---------------------------------------------------------
NB. show boxes (for debugging):
if. SHOWBOXES do.
  drawbox iBOX;BLUE;GUIDESIZE;Lxywh
  drawbox iBOX;RED;GUIDESIZE;Fxywh
  drawbox iBOX;GREEN;GUIDESIZE;Gxywh
  dat=. Kxywh,Txywh,Xxywh,Yxywh,:Y2xywh
  dat=. dat #~ 0 < +/"1 dat
  for_d. dat do.
    drawbox iBOX;MAGENTA;GUIDESIZE;d
  end.
end.

NB. ---------------------------------------------------------
Ndx=: Ndx + 3
)
