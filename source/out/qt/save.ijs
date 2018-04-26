NB. save

QT_SAVES=: (,,&'r'each) ;: 'bmp jpg png tif'

NB. =========================================================
qt_bmp=: 3 : 0
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
file=. 'bmp' qt_getfile file
if. (2 = #wh) > wh -: Pw,Ph do.
  a=. cocreate''
  coinsert__a (,copath) coname''
  bitmap=. qt_getbitmapwh__a wh
  coerase a
else.
  bitmap=. qt_getbitmap''
end.
bitmap writebmp file
)

qt_png=: 3 : 0
if. #y do.
  arg=. qchop y
  num=. __ ". &.> arg
  msk=. __ e. &> num
  file=. > {. msk # arg
  wh=. >(-.msk) # num
  if. -. (#wh) e. 0 2 do.
    info 'invalid [w h] parameter in save png' return.
  end.
else.
  wh=. file=. ''
end.
file=. 'png' qt_getfile file
if. (2 = #wh) > wh -: Pw,Ph do.
  a=. cocreate''
  coinsert__a (,copath) coname''
  bitmap=. qt_getbitmapwh__a wh
  coerase a
else.
  bitmap=. qt_getbitmap''
end.
bitmap writepng file
)

NB. =========================================================
NB. type qt_def file
qt_def=: 4 : 0
file=. x qt_getfile ;qchop y
(qt_getrgb'') qt_writeimg file
)

NB. =========================================================
qt_defstr=: 4 : 0
type=. x
(qt_getrgb'') putimg type
)

NB. =========================================================
qt_get=: 3 : 0
if. #y do.
  type=. tolower firstword y
  if. (<type) e. ;: 'gif jpg png tif' do.
    y=. type,'r ', (#type)}. y
  end.
end.
qt_save y
)

NB. =========================================================
qt_getbitmap=: 3 : 0
wd 'psel ',": PFormhwnd
glsel PId
box=. wdqchildxywh PId
res=. glqpixels box
(3 2 { box) $ res
)

NB. =========================================================
qt_getbitmapwh=: 3 : 0
wd 'pc a owner;wh 480 400;cc g canvas;pas 0 0'
PFormhwnd=: wdqhwndp''
PId=: 'g'
wd 'set g wh ',":y
wd 'pshow'
NB. qt_paintx''
glpaint''
res=. qt_getbitmap''
wd 'pclose'
res
)

NB. =========================================================
qt_getfile=: 4 : 0
jpath ('.',x) fext y,(0=#y) # QT_DEFFILE
)

NB. =========================================================
qt_getrgb=: 3 : 0
wd 'psel ',": PFormhwnd
glsel PId
box=. wdqchildxywh PId
(3 2 { box) $ 256 256 256 #: glqpixels box
)

NB. =========================================================
qt_jpg=: 3 : 0
file=. ''
qual=. 100
if. #y do.
  arg=. qchop y
  num=. __ ". &.> arg
  msk=. +./ &> num = &.> __
  file=. > {. msk # arg
  qual=. <. {. (>(-.msk) # num),qual
end.
file=. 'jpg' qt_getfile file
rgb=. qt_getrgb''
rgb qt_writeimg file
)

NB. =========================================================
qt_png=: 3 : 0
file=. ''
comp=. 9
if. #y do.
  arg=. qchop y
  num=. __ ". &.> arg
  msk=. +./ &> num = &.> __
  file=. > {. msk # arg
  comp=. <. {. (>(-.msk) # num),comp
end.
file=. 'png' qt_getfile file
rgb=. qt_getrgb''
rgb qt_writeimg file
)

NB. =========================================================
qt_save=: 3 : 0
if. Poutput ~: iQT do.
  msg=. 'First display a Plot.'
  info msg return.
end.
if. 0=#y do.
  qt_clip'' return.
end.
type=. tolower firstword y
if. (<type) e. QT_SAVES do.
  ('qt_',type)~ (1+#type) }. y
else.
  info 'Save to type not supported:',type
end.
)

NB. =========================================================
qt_writeimg=: 4 : '(256 #. 255 ,"0 1 x) writeimg_jqtide_ y'

NB. =========================================================
qt_gif=: 'gif' & qt_def
qt_tif=: 'tif' & qt_def
qt_pngr=: 'png' & qt_defstr
qt_jpgr=: 'jpg' & qt_defstr
qt_gifr=: 'gif' & qt_defstr
qt_tifr=: 'tif' & qt_defstr
