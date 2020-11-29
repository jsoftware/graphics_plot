NB. cairo cmds
NB.
NB. cairo graphics command utilities

NB. =========================================================
cairo_color=: 4 : 0
assert. 0~:plotcr
assert. 3=#,y
cairo_set_source_rgb_jcairo_ plotcr ; ;/ ,y%256
EMPTY
)

NB. =========================================================
cairo_makerect=: 3 : 0
'x y r s'=. y
cairo_drawline (_2 [\ flipxy x,y,x,s,r,s,r,y,x,y)
EMPTY
)

NB. =========================================================
cairo_drawline=: 3 : 0
assert. 0~:plotcr
assert. 1<$$y
NB. cairo_set_line_width plotcr ; 1
cairo_move_to_jcairo_ plotcr ; ;/ {.y
for_p. }.y do.
  cairo_line_to_jcairo_ plotcr ; ;/ p
end.
EMPTY
)

NB. =========================================================
cairo_makelines=: 3 : 0
len=. -: {: $ y
if. len = 0 do. i.0 0 return. end.
if. 2 > #$y do.
  cairo_drawline _2 [\ flipxy y
else.
  cairo_drawline "2 (_2 [\"1 flipxy y)
end.
EMPTY
)

NB. =========================================================
NB. codes to set pen
NB.
NB. cairo_pen    one color, one size
NB. cairo_pens   several colors, several sizes
cairo_pens=: 4 : 0
assert. 0 [ 'cairo_pens not implemented'
EMPTY
)

NB. =========================================================
cairo_pen=: 4 : 0
assert. 0~:plotcr
0 cairo_color x
cairo_set_line_width_jcairo_ plotcr ; (1>.CAIRO_PENSCALE*y)
EMPTY
)

NB. =========================================================
cairo_lines=: 3 : 0
(cairo_stroke_jcairo_ bind plotcr)@cairo_makelines"1 y
EMPTY
)

NB. =========================================================
NB. cairo_text
NB.
NB. single alignment, single font
cairo_text=: 3 : 0
'fnt txt pos align rot und'=. y
pos=. citemize pos
txt=. ,each boxxopen txt
txt=. utf8 each txt

NB. cairographics text origin at baseline
te=. (5*8)$(2.2-2.2)
te=. _1{:: cairo_font_extents_jcairo_ plotcr; te
of=. - 0 , <. {.te

NB. ---------------------------------------------------------
if. und +. align e. iCENTER, iRIGHT do.
  len=. fnt pgetstringlen txt
end.
if. 1=#txt do. txt=. (#pos)#{.txt end.

select. rot
case. 0 do.
  select. align
  case. iCENTER do.
    pos=. pos -"1 (-:len),.0
  case. iRIGHT do.
    pos=. pos -"1 len,.0
  end.
  for_i. i.#pos do.
    cairo_move_to_jcairo_ plotcr ; <"0 flipxy of + i{pos
    cairo_show_text_jcairo_ plotcr;(,>i{txt)
  end.
case. 1 do.
  select. align
  case. iCENTER do.
    pos=. pos -"1 [ 0,.-:len
  case. iRIGHT do.
    pos=. pos -"1 [ 0,.len
  end.
  for_i. i.#pos do.
    cairo_save_jcairo_ plotcr
    cairo_move_to_jcairo_ plotcr ; <"0 flipxy of + i{pos
    cairo_rotate_jcairo_ plotcr ; - 0.5p1
    cairo_show_text_jcairo_ plotcr;(,>i{txt)
    cairo_restore_jcairo_ plotcr
  end.
case. 2 do.
  select. align
  case. iCENTER do.
    pos=. pos +"1 [ 0,.-:len
  case. iRIGHT do.
    pos=. pos +"1 [ 0,.len
  end.
  for_i. i.#pos do.
    cairo_save_jcairo_ plotcr
    cairo_move_to_jcairo_ plotcr ; <"0 flipxy of + i{pos
    cairo_rotate_jcairo_ plotcr ; 0.5p1
    cairo_show_text_jcairo_ plotcr;(,>i{txt)
    cairo_restore_jcairo_ plotcr
  end.
end.

if. -. und do. EMPTY return. end.

NB. ---------------------------------------------------------
NB. underline
pos=. citemize pos
len=. , len

NB. 'off lwd'=. getunderline fnt
NB. lin=. clr,' ',(":lwd) ,' w '
off=. <. -/ 2 0{te

select. rot
case. 0 do.
  bgn=. 0 >. pos -"1 [ 0,.-off
  end=. bgn + len,.0
case. 1 do.
  bgn=. 0 >. pos -"1 off,.0
  end=. bgn + 0,.len
case. 2 do.
  bgn=. 0 >. pos +"1 off,.0
  end=. bgn - 0,.len
end.

for_p. bgn,.end do.
  cairo_makelines p
  cairo_stroke_jcairo_ plotcr
end.

EMPTY
)
