NB. save isigraph

NB. =========================================================
isi_bmp=: 3 : 0
if. #y do.
  arg=. qchop y
  num=. __ ". &.> arg
  msk=. __ e. &> num
  file=. > {. msk # arg
  wh=. >(-.msk) # num
  if. -. (#wh) e. 0 2 do.
    info 'invalid [w h] parameter in save bmp' return.
  end.
else.
  wh=. file=. ''
end.
file=. file,(0=#file)#ISI_DEFFILE
file=. jpath '.bmp' fext file
if. (2 = #wh) > wh -: Pw,Ph do.
  a=. cocreate''
  coinsert__a (,copath) coname''
  bmp=. isi_getbmpwh__a wh
  coerase a
else.
  bmp=. isi_getbmp''
end.
bmp writebmp file
)

NB. =========================================================
isi_png=: 3 : 0
if. #y do.
  arg=. qchop y
  num=. __ ". &.> arg
  msk=. __ e. &> num
  file=. > {. msk # arg
  wh=. >(-.msk) # num
  if. -. (#wh) e. 0 2 do.
    info 'invalid [w h] parameter in save bmp' return.
  end.
else.
  wh=. file=. ''
end.
file=. file,(0=#file)#ISI_DEFFILE
file=. jpath '.png' fext file
if. (2 = #wh) > wh -: Pw,Ph do.
  a=. cocreate''
  coinsert__a (,copath) coname''
  bmp=. isi_getbmpwh__a wh
  coerase a
else.
  bmp=. isi_getbmp''
end.
bmp writepng file
)

NB. =========================================================
isi_def=: 4 : 0
type=. x
file=. jpath ('.',type) fext (;qchop y),(0=#y) # ISI_DEFFILE
if. IFJNET do.
  writeimg_jnet_ (isi_getrgb'') ; file
else.
  (isi_getrgb'') writeimg file
end.
)

NB. =========================================================
isi_defstr=: 4 : 0
type=. x
if. IFJNET do.
  putimg_jnet_ (isi_getrgb'') ; type
else.
  (isi_getrgb'') putimg type
end.
)

NB. =========================================================
isi_emf=: 3 : 0
file=. jpath '.emf' fext (;qchop y),(0=#y) # ISI_DEFFILE
wd 'psel ',PFormhwnd
glsel PId
glfile file
glemfopen''
isi_paint''
glemfclose''
)

NB. =========================================================
isi_getbmp=: 3 : 0
wd 'psel ',PFormhwnd
glsel PId
box=. 0 ". wd 'qchildxywhx ',PId
res=. glqpixels box
(3 2 { box) $ res
)

NB. =========================================================
isi_getbmpwh=: 3 : 0
wd 'pc a owner;xywh 0 0 240 200;cc g isigraph rightmove bottommove;pas 0 0'
PFormhwnd=: wd 'qhwndp'
PId=: 'g'
wd 'setxywhx g 0 0 ',":y
isi_paint''
glpaint''
res=. isi_getbmp''
wd 'pclose'
res
)

NB. =========================================================
isi_getrgb=: 3 : 0
wd 'psel ',PFormhwnd
glsel PId
box=. 0 ". wd 'qchildxywhx ',PId
if. IFJNET do.
  (3 2 { box) $ glqpixels box
else.
  (3 2 { box) $ 256 256 256 #: glqpixels box
end.
)

NB. =========================================================
isi_jpg=: 3 : 0
file=. ''
qual=. 100
if. #y do.
  arg=. qchop y
  num=. __ ". &.> arg
  msk=. +./ &> num = &.> __
  file=. > {. msk # arg
  qual=. <. {. (>(-.msk) # num),qual
end.
file=. jpath '.jpg' fext file,(0=#file) # ISI_DEFFILE
rgb=. isi_getrgb''
if. IFJNET do.
  writeimg_jnet_ rgb ; file
else.
  rgb writeimg file
end.
)

NB. =========================================================
isi_png=: 3 : 0
file=. ''
comp=. 9
if. #y do.
  arg=. qchop y
  num=. __ ". &.> arg
  msk=. +./ &> num = &.> __
  file=. > {. msk # arg
  comp=. <. {. (>(-.msk) # num),comp
end.
file=. jpath '.png' fext file,(0=#file) # ISI_DEFFILE
rgb=. isi_getrgb''
if. IFJNET do.
  writeimg_jnet_ rgb ; file
else.
  rgb writeimg file
end.
)

NB. =========================================================
isi_save=: 3 : 0
if. Poutput ~: iISI do.
  msg=. 'First display an isigraph Plot.'
  info msg return.
end.
if. 0=#y do.
  isi_clip'' return.
end.
type=. tolower firstword y
if. IFJNET < (<type) e. ;: 'gif jpg png tif gifr jpgr pngr tifr' do.
  af=. jpath '~addons/media/platimg/platimg.ijs'
  if. -. flexist af do.
    info 'Save to ',type,' requires the platimg addon.' return.
  end.
  require af
end.
('isi_',type)~ (1+#type) }. y
)

isi_get=: 3 : 0
if. #y do.
  type=. tolower firstword y
  if. (<type) e. ;: 'gif jpg png tif' do.
    y=. type,'r ', (#type)}. y
  end.
end.
isi_save y
)

NB. =========================================================
isi_gif=: 'gif' & isi_def
isi_tif=: 'tif' & isi_def
isi_pngr=: 'png' & isi_defstr
isi_jpgr=: 'jpg' & isi_defstr
isi_gifr=: 'gif' & isi_defstr
isi_tifr=: 'tif' & isi_defstr
