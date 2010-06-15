NB. save gtk graph

NB. =========================================================
gtk_bmp=: 3 : 0
if. #y do.
  arg=. qchop y
  num=. __ ". &.> arg
  msk=. __ e. &> num
  file=. > {. msk # arg
else.
  file=. ''
end.
file=. file,(0=#file)#GTK_DEFFILE
file=. jpath '.bmp' fext file
bmp=. gtk_getbmp''
bmp writebmp file
)

NB. =========================================================
gtk_def=: 4 : 0
type=. x
file=. jpath ('.',type) fext (;qchop y),(0=#y) # GTK_DEFFILE
(gtk_getrgb'') writeimg file
)

NB. =========================================================
gtk_defstr=: 4 : 0
type=. x
(gtk_getrgb'') putimg type
)

NB. =========================================================
gtk_emf=: 0:

NB. =========================================================
gtk_getbmp=: 3 : 0
if. IFGTK do.
  res=. glqpixels 0 0, wh=. glqwh''
  (|.wh) $ res
else.
  (|.gtkgraphwh) $ gtkgraphpixels
end.
)

NB. =========================================================
gtk_getrgb=: 3 : 0
if. IFGTK do.
  res=. glqpixels 0 0, wh=. glqwh''
  (|.wh) $ 256 256 256 #: res
else.
  (|.gtkgraphwh) $ 256 256 256 #: gtkgraphpixels
end.
)

NB. =========================================================
gtk_jpg=: 3 : 0
file=. ''
qual=. 100
if. #y do.
  arg=. qchop y
  num=. __ ". &.> arg
  msk=. +./ &> num = &.> __
  file=. > {. msk # arg
  qual=. <. {. (>(-.msk) # num),qual
end.
file=. jpath '.jpg' fext file,(0=#file) # GTK_DEFFILE
rgb=. gtk_getrgb''
rgb writeimg file
)

NB. =========================================================
gtk_png=: 3 : 0
file=. ''
comp=. 9
if. #y do.
  arg=. qchop y
  num=. __ ". &.> arg
  msk=. +./ &> num = &.> __
  file=. > {. msk # arg
  comp=. <. {. (>(-.msk) # num),comp
end.
file=. jpath '.png' fext file,(0=#file) # GTK_DEFFILE
rgb=. gtk_getrgb''
rgb writeimg file
)

NB. =========================================================
gtk_save=: 3 : 0
if. (-. (0~:#gtkgraphpixels) *. -.IFGTK) *. Poutput ~: iGTK do.
  msg=. 'First display an gtk graph Plot.'
  info msg return.
end.
if. 0=#y do.
  gtk_clip'' return.
end.
type=. tolower firstword y
if. (<type) e. ;: 'gif jpg png tif gifr jpgr pngr tifr' do.
  af=. jpath '~addons/media/platimg/platimg.ijs'
  if. -. flexist af do.
    info 'Save to ',type,' requires the platimg addon.' return.
  end.
  require af
end.
('gtk_',type)~ (1+#type) }. y
)

gtk_get=: 3 : 0
if. #y do.
  type=. tolower firstword y
  if. (<type) e. ;: 'gif jpg png tif' do.
    y=. type,'r ', (#type)}. y
  end.
end.
gtk_save y
)

NB. =========================================================
gtk_gif=: 'gif' & gtk_def
gtk_tif=: 'tif' & gtk_def
gtk_pngr=: 'png' & gtk_defstr
gtk_jpgr=: 'jpg' & gtk_defstr
gtk_gifr=: 'gif' & gtk_defstr
gtk_tifr=: 'tif' & gtk_defstr
