NB. print

PRINTP=: ''

NB. =========================================================
NB. run plot commands to printer
android_print=: 3 : 0
if. PRINTP do. wd 'psel ',(":PRINTP),';pclose' end.
wd 'pc print;cc g canvas'
PRINTP=: wdqhwndp''
PRINTED=: 0
opt=. '"" "" "" orientation ',":ORIENTATION
glprint opt
)

NB. =========================================================
print_g_print=: 3 : 0
'page pass'=. ". sysdata
select. pass
case. _1 do.
  PRINTP=: PRINTPXYWH=: 0
  wd 'pclose'
case. 0 do.
  glprintmore -.PRINTED
case. do.
  'Cw Ch'=: glqprintwh''
  android_paintit android_printwin''
  PRINTED=: 1
end.
)

NB. =========================================================
NB. get print window
NB. glqprintpaper: width, height, offsets to left/top printable area
NB. orientation, copies, and papersize. Measurements are in twips.
android_printwin=: 3 : 0
'pw ph mw mh'=. 4 {. glqprintpaper''
mrg=. 0 >. PRINTMARGIN - mw,(ph - mh + Ch),(pw - mw + Cw),mh
xywh=. (0 0,Cw,Ch) shrinkrect mrg
if. 0 = #PRINTWINDOW do.
  xywh
else.
  if. 4 ~: #PRINTWINDOW do.
    info 'PRINTWINDOW should be of form: x y wh' return.
  end.
  'x y w h'=. xywh
  'px py pw ph'=. PRINTWINDOW%1000
  fx=. x + px * w
  fy=. y + py * h
  fw=. (x-fx) + pw * w
  fh=. (y-fy) + ph * h
  fx,fy,fw,fh
end.
)
