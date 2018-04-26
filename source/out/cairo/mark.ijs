NB. markers

NB. =========================================================
cairomark_circle=: 3 : 0
's m f e c p'=. y
p=. citemize p
v=. 8 * s * CAIRO_PENSCALE
1 cairo_color e
for_i. i.#p do.
  cairo_new_sub_path_jcairo_ plotcr
  cairo_arc_jcairo_ plotcr ; ;/ (flipxy i{p) , v, 0, 2p1
  cairo_fill_jcairo_ plotcr
end.
)

NB. =========================================================
cairomark_diamond=: 3 : 0
's m f e c p'=. y
p=. 8 $"1 citemize p
d=. (3.5 * s) * _1 0 0 1 1 0 0 _1
p=. p +"1 d
for_i. i.#p do.
  cairo_makelines i{p
  cairo_close_path_jcairo_ plotcr
  1 cairo_color e
  cairo_fill_jcairo_ plotcr
end.
)

NB. =========================================================
NB. following only used for key markers, given singly
cairomark_line=: 3 : 0
's m f e c p'=. y
p=. ,p
s=. -:KeyLen,KeyPen
p=. (p - s) , p + s
cairo_makerect p
cairo_close_path_jcairo_ plotcr
1 cairo_color e
cairo_fill_jcairo_ plotcr
)

NB. =========================================================
cairomark_plus=: 3 : 0
's m f e c p'=. y
s=. s * 4
t=. s, 0
e cairo_pen s
p=. citemize p
d=. (p -"1 t) ,. p +"1 t
t=. |. t
d=. d, (p -"1 t) ,. p +"1 t
cairo_lines d
)

NB. =========================================================
cairomark_square=: 3 : 0
's m f e c p'=. y
p=. citemize p
s=. 3 * s
p=. (p - s) ,"1 p + s
for_i. i.#p do.
  cairo_makerect i{p
  cairo_close_path_jcairo_ plotcr
  1 cairo_color e
  cairo_fill_jcairo_ plotcr
end.
)

NB. =========================================================
cairomark_times=: 3 : 0
's m f e c p'=. y
e cairo_pen 4 * s
t=. _1 + s * 3
r=. (p - t) ,. p + t
s=. (p +"1 t * 1 _1) ,. p +"1 t * _1 1
cairo_lines r,s
)

NB. =========================================================
cairomark_triangle=: 3 : 0
's m f e c p'=. y
p=. 6 $"1 citemize p
d=. (4 * s) * , (sin,.cos) 2p1 * 0 1 2 % 3
p=. p +"1 d
for_i. i.#p do.
  cairo_makelines i{p
  cairo_close_path_jcairo_ plotcr
  1 cairo_color e
  cairo_fill_jcairo_ plotcr
end.
)
