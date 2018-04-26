NB. save canvas

NB. =========================================================
android_bmp=: 3 : 0
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
file=. file,(0=#file)#android_DEFFILE
file=. jpath '.bmp' fext file
if. (2 = #wh) > wh -: Pw,Ph do.
  a=. cocreate''
  coinsert__a (,copath) coname''
  bitmap=. android_getbitmapwh__a wh
  coerase a
else.
  bitmap=. android_getbitmap''
end.
bitmap writebmp file
)

NB. =========================================================
android_png=: 3 : 0
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
file=. file,(0=#file)#android_DEFFILE
file=. jpath '.png' fext file
if. (2 = #wh) > wh -: Pw,Ph do.
  a=. cocreate''
  coinsert__a (,copath) coname''
  bitmap=. android_getbitmapwh__a wh
  coerase a
else.
  bitmap=. android_getbitmap''
end.
bitmap writepng file
)

NB. =========================================================
android_def=: 4 : 0
type=. x
file=. jpath ('.',type) fext (;qchop y),(0=#y) # android_DEFFILE
(android_getrgb'') writeimg file
)

NB. =========================================================
android_defstr=: 4 : 0
type=. x
(android_getrgb'') putimg type
)

NB. =========================================================
android_emf=: 3 : 0
file=. jpath '.emf' fext (;qchop y),(0=#y) # android_DEFFILE
wd 'psel ',": PFormhwnd
glsel PId
glfile file
glemfopen''
android_paint''
glemfclose''
)

NB. =========================================================
android_getbitmap=: 3 : 0
wd 'psel ',": PFormhwnd
glsel PId
box=. wdqchildxywh PId
res=. glqpixels box
(3 2 { box) $ res
)

NB. =========================================================
android_getbitmapwh=: 3 : 0
wd 'pc a owner;wh 480 300;cc g canvas;pas 0 0'
PFormhwnd=: wdqhwndp''
PId=: 'g'
wd 'set g wh ',":y
wd 'pshow'
NB. android_paintx''
glpaint''
res=. android_getbitmap''
wd 'pclose'
res
)

NB. =========================================================
android_getrgb=: 3 : 0
wd 'psel ',": PFormhwnd
glsel PId
box=. wdqchildxywh PId
(3 2 { box) $ 256 256 256 #: glqpixels box
)

NB. =========================================================
android_jpg=: 3 : 0
file=. ''
qual=. 100
if. #y do.
  arg=. qchop y
  num=. __ ". &.> arg
  msk=. +./ &> num = &.> __
  file=. > {. msk # arg
  qual=. <. {. (>(-.msk) # num),qual
end.
file=. jpath '.jpg' fext file,(0=#file) # android_DEFFILE
rgb=. android_getrgb''
rgb writeimg file
)

NB. =========================================================
android_png=: 3 : 0
file=. ''
comp=. 9
if. #y do.
  arg=. qchop y
  num=. __ ". &.> arg
  msk=. +./ &> num = &.> __
  file=. > {. msk # arg
  comp=. <. {. (>(-.msk) # num),comp
end.
file=. jpath '.png' fext file,(0=#file) # android_DEFFILE
rgb=. android_getrgb''
rgb writeimg file
)

NB. =========================================================
android_save=: 3 : 0
if. Poutput ~: iANDROID do.
  msg=. 'First display an canvas Plot.'
  info msg return.
end.
if. 0=#y do.
  android_clip'' return.
end.
type=. tolower firstword y
if. (<type) e. ;: 'gif jpg png tif gifr jpgr pngr tifr' do.
  af=. jpath '~addons/media/platimg/platimg.ijs'
  if. -. flexist af do.
    info 'Save to ',type,' requires the platimg addon.' return.
  end.
  require af
end.
('android_',type)~ (1+#type) }. y
)

android_get=: 3 : 0
if. #y do.
  type=. tolower firstword y
  if. (<type) e. ;: 'gif jpg png tif' do.
    y=. type,'r ', (#type)}. y
  end.
end.
android_save y
)

NB. =========================================================
android_gif=: 'gif' & android_def
android_tif=: 'tif' & android_def
android_pngr=: 'png' & android_defstr
android_jpgr=: 'jpg' & android_defstr
android_gifr=: 'gif' & android_defstr
android_tifr=: 'tif' & android_defstr
