NB. pdf cmds
NB.
NB. pdf graphics command utilities

NB. =========================================================
NB. pdf_circle
NB.
NB. returns bezier points to draw circle
NB. with given center and radius
NB.
NB. result is 4 row table, each row being a 90 degree arc.
pdf_circle=: 3 : 0
'x y r'=. y
arc=. _2 [\ 0 1 2 1 1 2 1 0 { 0 1, 4r3*<:%:2
arr=. |."1 arc *"1 [ _1 1
mat=. _4 ,\ arc,arr,-arc,arr
(mat * r) + ($mat) $ x,y
)


NB. =========================================================
pdf_colorstroke=: 3 : 0
(": y % 255),"1 ' RG '
)

NB. =========================================================
pdf_colorfill=: 3 : 0
(": y % 255),"1 ' rg '
)

NB. =========================================================
pdf_color=: 3 : 0
clr=. ": y % 255
clr ,"1 ' RG ' ,"1 clr ,"1 ' rg '
)

NB. =========================================================
pdf_makelines=: 3 : 0
if. 2 > #$y do.
  ,: (pfmt 2 {. y),' m ',,(pfmt _2 [\ 2 }. y) ,"1 ' l '
else.
  mov=. (pfmt 2 {."1 y) ,"1 ' m '
  lns=. ,"2 (pfmt _2 [\"1 [ 2 }."1 y) ,"1 ' l '
  mov,.lns
end.
)

NB. =========================================================
NB. codes to set pen
NB.
NB. pdf_pen    one color, one size
NB. pdf_pens   several colors, several sizes
pdf_pens=: 4 : 0
(pdf_color x) ,"1 (":,.PDF_PENSCALE*y) ,"1 ' w '
)

NB. =========================================================
pdf_pen=: 4 : 0
(pdf_color ,x), (":PDF_PENSCALE*y) ,' w '
)

NB. =========================================================
pdf_lines=: 3 : 0
(pdf_makelines y) ,"1 ' S'
)

NB. =========================================================
NB. pdf_text
NB.
NB. single alignment, single font
pdf_text=: 4 : 0
0 pdf_text y  NB. x  1=use cid font
:
'fnt clr txt pos align rot und'=. y

clr=. pdf_color clr

txt=. ,each boxopen txt

NB. ---------------------------------------------------------
if. und +. align e. iCENTER, iRIGHT do.
  len=. fnt pgetstringlen txt
end.

NB. ---------------------------------------------------------
NB. convert utf8 to ucs2, then big endian encoding
if. x do.
  txt=. toucode1@(7&u:) each txt
else.
  tx=. 0$<''
  for_t. txt do.
    if. 0-: t1=. 7&u: ::0: t=. >t do.
      tx=. tx, <u2a t
    else.
      if. *./ 256 > 3&u: t1 do.
        tx=. tx, < 1&u: t1
      else.
        tx=. tx, <u2a t
      end.
    end.
  end.
  txt=. tx
end.

txt=. pdfesc each txt

NB. ---------------------------------------------------------
select. rot

case. 0 do.
  select. align
  case. iCENTER do.
    pos=. pos -"1 (-:len),.0
  case. iRIGHT do.
    pos=. pos -"1 len,.0
  end.
  txt=. (<' Tm (') ,each txt ,each <') Tj '
  res=. clr,(<"1 '1 0 0 1 ' ,"1 pfmt pos >. 0) ,&> txt
case. 1 do.
  select. align
  case. iCENTER do.
    pos=. pos -"1 [ 0,.-:len
  case. iRIGHT do.
    pos=. pos -"1 [ 0,.len
  end.
  txt=. (<' Tm (') ,each txt ,each <') Tj '
  res=. clr,(<"1 '0 1 -1 0 ' ,"1 pfmt pos >. 0) ,&> txt
case. 2 do.
  select. align
  case. iCENTER do.
    pos=. pos +"1 [ 0,.-:len
  case. iRIGHT do.
    pos=. pos +"1 [ 0,.len
  end.
  txt=. (<' Tm (') ,each txt ,each <') Tj '
  res=. clr,(<"1 '0 -1 1 0 ' ,"1 pfmt pos >. 0) ,&> txt
end.

NB. ---------------------------------------------------------
if. -. und do. res;'' return. end.

NB. ---------------------------------------------------------
NB. underline
pos=. citemize pos
len=. , len

'off lwd'=. getunderline fnt
lin=. clr,' ',(":lwd) ,' w '

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

lin=. lin,(pdf_makelines bgn,.end) ,"1 ' b'
res;lin

)
