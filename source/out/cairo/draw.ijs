NB. cairo draw

NB. =========================================================
cairocircle=: 3 : 0
'v s f e c p'=. y
if. isempty c do.
  if. is1color e do.
    e cairo_pen v
    for_i. i.#p do.
      cairo_new_sub_path_jcairo_ plotcr
      cairo_arc_jcairo_ plotcr ; ;/ (flipxy 2{.i{p) , (2{i{p), 0, 2p1
      cairo_stroke_jcairo_ plotcr
    end.
  else.
    for_i. i.#p do.
      cairo_new_sub_path_jcairo_ plotcr
      cairo_arc_jcairo_ plotcr ; ;/ (flipxy 2{.i{p) , (2{i{p), 0, 2p1
      (i{e) cairo_pen (i{v)
      cairo_stroke_jcairo_ plotcr
    end.
  end.
else.
  p=. citemize p
  c=. p cmatch c
  e=. p cmatch e
  v=. p cmatch v
  for_i. i.#p do.
    cairo_new_sub_path_jcairo_ plotcr
    cairo_arc_jcairo_ plotcr ; ;/ (flipxy 2{.i{p) , (2{i{p), 0, 2p1
    (i{e) cairo_pen (i{v)
    cairo_stroke_preserve_jcairo_ plotcr
    1 cairo_color i{c
    cairo_fill_jcairo_ plotcr
  end.
end.
)

NB. =========================================================
NB. cairodot
cairodot=: 3 : 0
'v s f e c p'=. y
p=. citemize p
v=. v * CAIRO_PENSCALE
if. is1color e do.
  1 cairo_color e
  for_i. i.#p do.
    cairo_new_sub_path_jcairo_ plotcr
    cairo_arc_jcairo_ plotcr ; ;/ (flipxy i{p) , v, 0, 2p1
    cairo_fill_jcairo_ plotcr
  end.
else.
  e=. p cmatch e
  for_i. i.#p do.
    1 cairo_color i{e
    cairo_new_sub_path_jcairo_ plotcr
    cairo_arc_jcairo_ plotcr ; ;/ (flipxy i{p) , v, 0, 2p1
    cairo_fill_jcairo_ plotcr
  end.
end.
)

NB. =========================================================
NB. set graph box clipping
cairofxywh=: 3 : 0
''return.
p=. _1 pick y
if. #p do.
  CLIP=: >: CLIP
  'x y w h'=. p
  rect=. cairo_makerect x,y,(x+w),y+h
  pbuf 'gsave ',rect,' clip newpath'
else.
  if. CLIP do.
    CLIP=: <: CLIP
    pbuf 'grestore'
  end.
end.
)

NB. =========================================================
NB. cairoline
cairoline=: 3 : 0
'v s f e c p'=. y
if. (is1color e) *. 1 = #s do.
  pbuf e cairo_pen v
  pbuf cairo_lines p
else.
  rws=. #p
  e=. rws $ citemize e
  v=. rws $ v
  for_i. i. rws do.
    pbuf (i{e) cairo_pen i{v
    pbuf cairo_lines i{p
  end.
end.
)

NB. =========================================================
cairomarker=: 3 : 0
('cairomark_',1 pick y)~ y
)

NB. =========================================================
NB. cairopie
NB.
NB. assume single line width and color
cairopie=: 3 : 0
'v s f e c p'=. y
pen=. e cairo_pen v
p=. citemize p
ctr=. 0 1 {"1 p
rad=. 2 {"1 p
ang=. 360 %~ 2p1 * 90 - 3 4 {"1 p
clr=. cmatch c
for_i. i.#p do.
  cairo_move_to_jcairo_ plotcr ; ;/ (flipxy i{ ctr)
  cairo_arc_negative_jcairo_ plotcr ; ;/ (flipxy i{ ctr) , (i{rad), (i{ang)
  cairo_close_path_jcairo_ plotcr
  cairo_stroke_preserve_jcairo_ plotcr
  1 cairo_color i{clr
  cairo_fill_jcairo_ plotcr
end.
)

NB. =========================================================
NB. cairoline - patterned line
cairopline=: 3 : 0
'v s f e c p'=. y
if. *./ s = 0 do.
  cairoline y return.
end.
s=. s { PENPATTERN
if. (is1color e) *. 1 = #v do.
  pos=. s linepattern"0 1 p
  cairoline (<pos) _1 } y
else.
  rws=. #p
  e=. rws $ citemize e
  v=. rws $ v
  s=. rws $ s
  for_i. i.#p do.
    (i{e) cairo_pen i{v
    pos=. (i{s) linepattern i{p
    cairoline (i{v);0;0;(i{e);0;pos
  end.
end.
)

NB. =========================================================
cairopoly=: 3 : 0
'v s f e c p'=. y
p=. citemize p
if. v=0 do. e=. c end.
c=. p cmatch c
e=. p cmatch e
if. +/v do.
  v=. p cmatch v
  for_i. i.#p do.
    cairo_makelines i{p
    cairo_close_path_jcairo_ plotcr
    (i{e) cairo_pen i{v
    cairo_stroke_preserve_jcairo_ plotcr
    1 cairo_color i{c
    cairo_fill_jcairo_ plotcr
  end.
else.
  for_i. i.#p do.
    cairo_makelines i{p
    cairo_close_path_jcairo_ plotcr
    1 cairo_color i{c
    cairo_stroke_preserve_jcairo_ plotcr
    cairo_fill_jcairo_ plotcr
  end.
end.
)

NB. =========================================================
cairorect=: 3 : 0
assert. 0~:plotcr
'v s f e c p'=. y
p=. citemize p
if. v=0 do. e=. c end.
c=. p cmatch c
e=. p cmatch e
if. +/v do.
  v=. p cmatch v
  for_i. i.#p do.
    cairo_makerect i{p
    (i{e) cairo_pen i{v
    cairo_stroke_preserve_jcairo_ plotcr
    1 cairo_color i{c
    cairo_fill_jcairo_ plotcr
  end.
else.
  for_i. i.#p do.
    cairo_makerect i{p
    1 cairo_color i{c
    cairo_fill_jcairo_ plotcr
  end.
end.
)

NB. =========================================================
NB. cairotext
NB. y is text;font;alignment;pencolor;n/a;position
NB.
NB. assumes single alignment, single font
cairotext=: 3 : 0
't f a e c p'=. y

NB. ---------------------------------------------------------
NB. set up fonts
'fnx fst fsz fan und'=. f
rot=. 3 | 0 90 270 i. fan
NB. middle baseline
asc=. _0.2 * pgetascender f
fnm=. getfntname fnx,fst
NB. kludge for using type I font
bold=. italic=. 0
if. (1 e. '-Oblique' E. fnm)+.(1 e. '-Bold' E. fnm)+.(1 e. '-Italic' E. fnm) do.
  bold=. (1 e. 'Bold' E. fnm)
  italic=. ((1 e. 'Oblique' E. fnm)+.(1 e. 'Italic' E. fnm))
  fnm=. ({.~ i:&'-') fnm
end.

cairofontangle=: <.fan*10
cairounderline=: Underline
cairo_select_font_face_jcairo_ plotcr ; fnm ; (italic{CAIRO_FONT_SLANT_NORMAL,CAIRO_FONT_SLANT_ITALIC); (bold{CAIRO_FONT_WEIGHT_NORMAL,CAIRO_FONT_WEIGHT_BOLD)
cairo_set_font_size_jcairo_ plotcr; getplotfontsize f

NB. ---------------------------------------------------------
NB. adjust position to CAIRO baseline
select. rot
case. 0 do. p=. 0 >. p -"1 [ 0, asc
case. 1 do. p=. p +"1 asc, 0
case. 2 do. p=. p -"1 asc, 0
end.

NB. ---------------------------------------------------------
if. is1color e do.
  1 cairo_color e
  for_i. i.#p do.
    cairo_text f;t;p;a;rot;und
  end.
else.
  for_i. i.#e do.
    1 cairo_color i{e
    cairo_text f;(i{t);(i{p);a;rot;und
  end.
end.
)
