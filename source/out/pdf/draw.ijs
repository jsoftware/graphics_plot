NB. pdf draw

NB. =========================================================
pdfcircle=: 3 : 0
'v s f e c p'=. y
if. isempty c do.
  if. is1color e do.
    pbuf e pdf_pen v
    clr=. (#p) $ citemize pdf_color e
    for_i. i.#p do.
      pbuf i{clr
      pos=. pdf_circle i{p
      mov=. (pfmt 2 {. {. pos) , ' m '
      pbuf mov
      crv=. (pfmt 2 }."1 pos) ,"1 ' c '
      pbuf crv
      pbuf 'S'
    end.
  end.
end.
)

NB. =========================================================
pdfdot=: 3 : 0
'v s f e c p'=. y
pbuf e pdf_pen v
for_i. i.#p do.
  pos=. pdf_circle (i{p), v
  pbuf (pfmt 2 {. {. pos) , ' m '
  pbuf (pfmt 2 }."1 pos) ,"1 ' c '
  pbuf 'B'
end.
)

NB. =========================================================
NB. set graph box clipping
pdffxywh=: 3 : 0
p=. _1 pick y
if. #p do.
  PDFClip=: >: PDFClip
  pbuf 'q ',(":p),' re W n'
else.
  if. PDFClip do.
    PDFClip=: <: PDFClip
    pbuf 'Q'
  end.
end.
)

NB. =========================================================
NB. pdfline
pdfline=: 3 : 0
'v s f e c p'=. y
if. (is1color e) *. 1 = #s do.
  pbuf e pdf_pen v
  pbuf pdf_lines p
else.
  rws=. #p
  e=. rws $ citemize e
  v=. rws $ v
  pen=. e pdf_pens v
  pbuf pen ,. pdf_lines p
end.
)

NB. =========================================================
pdfmarker=: 3 : 0
's m f e c p'=. y
pbuf e pdf_pen 1
s ('pdfmark_',m)~ citemize p
)

NB. =========================================================
pdfpie=: 3 : 0
'v s f e c p'=. y
pbuf e pdf_pen v
clr=. (pdf_colorfill c),"1 pdf_colorstroke e
clr=. (#p) $ citemize clr
for_i. i.#p do.
  pbuf i{clr
  pos=. bezierarc i{p
  pbuf (pfmt 2{.i{p), ' m ',(pfmt 2{.{.pos),' l '
  pbuf (pfmt 2}."1 pos),"1 ' c '
  pbuf 'b'
end.
)

NB. =========================================================
NB. pdfline - patterned line
pdfpline=: 3 : 0
'v s f e c p'=. y
if. *./ s = 0 do.
  pdfline y return.
end.
s=. s { PENPATTERN
if. (is1color e) *. 1 = #v do.
  pos=. s linepattern"0 1 p
  pdfline (<pos) _1 } y
else.
  rws=. #p
  e=. rws $ citemize e
  v=. rws $ v
  s=. rws $ s
  for_i. i.#p do.
    pos=. (i{s) linepattern i{p
    pdfline (i{v);0;0;(i{e);0;pos
  end.
end.
)

NB. =========================================================
pdfpoly=: 3 : 0
'v s f e c p'=. y
if. v=0 do. e=. c end.
c=. citemize c
e=. citemize e
pbuf ({.e) pdf_pen v
pos=. (pdf_makelines p) ,"1 (v=0) pick ' b';' h f'
if. (1 = # ~.e) *. 1 = # ~.c do.
  pbuf (pdf_colorfill {.c), pdf_colorstroke {.e
  pbuf pos
else.
  c=. pos cmatch pdf_colorfill c
  e=. pos cmatch pdf_colorstroke e
  pbuf c,.e,.pos
end.
)

NB. =========================================================
pdfrect=: 3 : 0
'v s f e c p'=. y
p=. pdf_boxrs2wh p
NB. PDF has no line-width 0
if. v=0 do.
  clr=. (pdf_colorfill c),"1 pdf_colorstroke c
else.
  pbuf e pdf_pen v
  clr=. (pdf_colorfill c),"1 pdf_colorstroke e
end.
pbuf clr ,"1 (pfmt p) ,"1 ' re B'
)

NB. =========================================================
NB. pdftext
NB. y is text;font;alignment;pencolor;n/a;position
NB.
NB. assumes single alignment, single font
pdftext=: 3 : 0
't f a e c p'=. y

NB. ---------------------------------------------------------
NB. set up fonts
'fnx fst fsz fan und'=. f
rot=. 3 | 0 90 270 i. fan
asc=. pgetascender f
fnm=. <getfntname fnx,fst
PDFFonts=: ~. PDFFonts,fnm

NB. ---------------------------------------------------------
fnx=. 1 + PDFFonts i. fnm
txt=. '/F',(":fnx),' ',(": getplotfontsize f),' Tf '

NB. ---------------------------------------------------------
NB. adjust position to PDF baseline
select. rot
case. 0 do. p=. 0 >. p -"1 [ 0, asc
case. 1 do. p=. p +"1 asc, 0
case. 2 do. p=. p -"1 asc, 0
end.

lin=. ''

NB. ---------------------------------------------------------
if. is1color e do.
  'rtxt rlin'=. (fnm e. CIDFONTS) pdf_text f;e;t;p;a;rot;und
  txt=. txt,,LF ,"1 rtxt
  lin=. lin,rlin,(0<#rlin)#LF
else.
  for_i. i.#e do.
    'rtxt rlin'=. (fnm e. CIDFONTS) pdf_text f;(i{e);(i{t);(i{p);a;rot;und
    txt=. txt,,LF ,"1 rtxt
    lin=. lin,rlin,(0<#rlin)#LF
  end.
end.

NB. ---------------------------------------------------------
pbuf pdf_wraptext txt
pbuf rlin
)
