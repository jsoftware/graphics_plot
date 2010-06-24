NB. save gtk graph

NB. =========================================================
gtk_def=: 4 : 0
type=. x
file=. jpath ('.',type) fext (;qchop y),(0=#y) # GTK_DEFFILE
(gtk_getrgb'') saveimg x;file
)

NB. =========================================================
gtk_emf=: 0:
gtk_gif=: 0:

NB. =========================================================
gtk_getrgb=: 3 : 0
pdcmdpixels
)

NB. =========================================================
gtk_jpg=: 3 : 0
file=. ''
qual=. 85  NB. [0,100]
if. #y do.
  arg=. qchop y
  num=. __ ". &.> arg
  msk=. +./ &> num = &.> __
  file=. > {. msk # arg
  qual=. <. {. (>(-.msk) # num),qual
end.
file=. jpath '.jpg' fext file,(0=#file) # GTK_DEFFILE
rgb=. gtk_getrgb''
rgb saveimg 'jpeg';file;'quality';":qual
)

NB. =========================================================
gtk_png=: 3 : 0
file=. ''
comp=. 5   NB. [0,9]
if. #y do.
  arg=. qchop y
  num=. __ ". &.> arg
  msk=. +./ &> num = &.> __
  file=. > {. msk # arg
  comp=. <. {. (>(-.msk) # num),comp
end.
file=. jpath '.png' fext file,(0=#file) # GTK_DEFFILE
rgb=. gtk_getrgb''
rgb saveimg 'png';file;'compression';":comp
)

NB. =========================================================
gtk_save=: 3 : 0
if. 0=#gtk_getrgb'' do.
  pdcmdsave=: y return.
end.
if. 0=#y do.
  gtk_clip'' return.
end.
type=. tolower firstword y
('gtk_',type)~ (1+#type) }. y
)

gtk_get=: 0:

NB. =========================================================
gtk_bmp=: 'bmp' & gtk_def
gtk_tif=: 'tif' & gtk_def

NB. =========================================================
NB. gtk pixels (int) are ABGR with A 255
NB. opengl (and normal folk?) are ARGB with A 0
NB. glpixels and glqpixels need to make these adjustments
ALPHA=: 0{_2 ic 0 0 0 255{a.

OR=: 23 b./

flip_rgb=: 3 : 0
d=. ((#y),4)$2 (3!:4) y
d=. 2 1 0 3{"1 d
_2(3!:4),d
)

saveimg=: 4 : 0
NB. type: bmp jpeg png tiff
'type fl'=. 2{.y
type=. type, (type-:'tif')#'f'
'w h'=. 2{.x
d=. 2}.x
NB. d=. flip_rgb d
d=. d OR ALPHA
if. IF64 do. d=. 2 ic d end.
NB. create new pixbuf from data
NB. ad,cmap,alpha,bits,w,h,rowstride,destroyfn,fndata
buf=. gdk_pixbuf_new_from_data (15!:14<'d'),GDK_COLORSPACE_RGB,1,8,w,h,(4*w),0,0
if. buf do.
  if. 3<#y do.
    gdk_pixbuf_save_1 buf;fl;type;0;(2 3{y),<0
  else.
    gdk_pixbuf_save buf;fl;type;0;0
  end.
end.
g_object_unref buf
)
