NB. show

NB. =========================================================
NB. cairo_show
cairo_show=: 3 : 0
'size file'=. 2{. cairo_getparms y
res=. cairo_make size;file
cairo_write file
unrefcairo ''
if. IFJHS do. plotcairo__'' end.
EMPTY
)

NB. =========================================================
NB. cairo_make
cairo_make=: 3 : 0
'size file'=. y
make iCAIRO;0 0,size
fns=. 'cairo'&, each 1 {"1 Plot
dat=. 3 }."1 Plot
buf=: ''
'Cw Ch'=: size
CLIP=: 0 NB. count of clip stack
initcairo size
for_d. dat do.
  (>d_index{fns)~d
end.
EMPTY
)

initcairo=: 3 : 0
if. 0~:plotcr do. plotcr=: 0 [ cairo_destroy_jcairo_ plotcr end.
if. 0~:plotcs do. plotcs=: 0 [ cairo_surface_destroy_jcairo_ plotcs end.
plotcs=: cairo_image_surface_create <"0 CAIRO_FORMAT_ARGB32, y
plotcr=: cairo_create plotcs
cairo_set_source_rgb_jcairo_ plotcr ; 1 ; 1 ; 1
cairo_rectangle_jcairo_ plotcr ; 0 ; 0 ; ;/ y
cairo_fill_jcairo_ plotcr
EMPTY
)

unrefcairo=: 3 : 0
if. 0~:plotcr do. plotcr=: 0 [ cairo_destroy_jcairo_ plotcr end.
if. 0~:plotcs do. plotcs=: 0 [ cairo_surface_destroy_jcairo_ plotcs end.
EMPTY
)
