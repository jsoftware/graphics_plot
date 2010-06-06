NB. markers

NB. =========================================================
pdfmark_circle=: 4 : 0
s=. 3.5 * x
p=. y ,. s
for_d. p do.
  pos=. pdf_circle d
  pbuf (pfmt 2 {. {. pos) , ' m '
  pbuf (pfmt 2 }."1 pos) ,"1 ' c '
  pbuf 'B'
end.
)

NB. =========================================================
pdfmark_diamond=: 4 : 0
p=. 8 $"1 y
d=. (3.5 * x) * _1 0 0 1 1 0 0 _1
p=. p +"1 d
pbuf (pdf_makelines p) ,"1 ' b'
)

NB. =========================================================
NB. following only used for key markers, given singly
pdfmark_line=: 4 : 0
'x y'=. , y
p=. (x--:KeyLen),(y--:KeyPen),KeyLen,KeyPen
pbuf (pfmt p) ,"1 ' re B'
)

NB. =========================================================
pdfmark_plus=: 4 : 0
s=. 0, x * 4
t=. |. s
p=. (y -"1 t) ,. y +"1 t
p=. p, (y -"1 s) ,. y +"1 s
pbuf (":PDF_PENSCALE * 5 * x) , ' w '
pbuf (pdf_makelines p) ,"1 ' b'
)

NB. =========================================================
pdfmark_square=: 4 : 0
s=. 3 * x
p=. (y - s) ,"1 +: s,s
pbuf (pfmt p) ,"1 ' re B'
)

NB. =========================================================
pdfmark_times=: 4 : 0
s=. _1 + 3 * x
p=. y
r=. (p - s) ,. p + s
s=. (p +"1 s * 1 _1) ,. p +"1 s * _1 1
pbuf (":PDF_PENSCALE * 5 * x) , ' w '
pbuf (pdf_makelines r,s) ,"1 ' b'
)

NB. =========================================================
pdfmark_triangle=: 4 : 0
p=. 6 $"1 y
d=. (4 * x) * , (sin,.cos) 2p1 * 0 1 2 % 3
p=. p +"1 d
pbuf (pdf_makelines p) ,"1 ' b'
)
