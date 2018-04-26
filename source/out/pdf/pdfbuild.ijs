NB. build

NB. =========================================================
NB. fonts
PDF_FONTOBJ=: 0 : 0
<<
/Type /Font
/Subtype /Type1
/Name /FXX
>>
)

NB. =========================================================
PDF_TRAILER=: 0 : 0
trailer
<<
/Size {z}
/Info 1 0 R
/Root 2 0 R
>>
startxref
)

NB. =========================================================
NB. build
NB.  1 Info
NB.  2 Catalog
NB.  3+ Fonts
NB.  +4 Pages
NB.  +5 Page
NB.  +6 Content
NB.
NB. pdf_wrap adds:
NB.  Xref
NB.  Trailer
pdf_build=: 3 : 0
PDFFontpages=: pdf_fontpages ''
pdf_wrap (pdf_header''),pdf_page y
)

NB. =========================================================
NB. pdf_creationdate
pdf_creationdate=: 3 : 0
t=. '20', ; _2 {.each '0' ,each ": each <. 6!:0''
'/CreationDate (D:',t,')'
)

NB. =========================================================
pdf_cidfont=: 4 : 0
txt=. LF;<;.2 ". toupper y -. '-'
msk=. 1 = #&> txt
txt=. msk<@;;._1 txt
txt=. (<'<<',LF) ,each txt ,each <'>>',LF
'a b c'=. txt
prev=. x { 3 + 0 0, +/\PDFFontpages
b=. b rplc '%prev';":prev
c=. c rplc '%prev';":prev+1
c=. c rplc '/Name /F';'/Name /F',":x
a;b;c
)

NB. =========================================================
NB. fonts
pdf_fonts=: 3 : 0
ndx=. 1 i.~ 'XX' E. PDF_FONTOBJ
hdr=. ndx {. PDF_FONTOBJ
ftr=. (ndx+2) }. PDF_FONTOBJ
r=. ''
for_f. PDFFonts do.
  if. f e. CIDFONTS do.
    r=. r, ( 1+f_index) pdf_cidfont >f
  else.
    fnt=. (": 1 + f_index),LF,'/BaseFont /', >f
    fnt=. fnt,LF,'/Encoding /WinAnsiEncoding'
    r=. r, <hdr, fnt, ftr
  end.
end.
)

NB. =========================================================
NB. count of pages used for fonts
NB. each cid font use 3 obj
pdf_fontpages=: 3 : 0
1 + 2 * PDFFonts e. CIDFONTS
)

NB. =========================================================
pdf_header=: 3 : 0
t=. '/Title (Plot)'
a=. '/Author (',(9!:14''),')'
p=. '/Producer (J Plot)'
d=. pdf_creationdate''
tit=. pdf_dict t;a;p;d
pag=. ": 3 + +/ PDFFontpages
cat=. pdf_dict '/Type /Catalog',LF,'/Pages ',pag,' 0 R',LF
fnt=. pdf_fonts ''
tit;cat;fnt
)

NB. =========================================================
NB. pdf_pages
pdf_page=: 3 : 0
kp=. 4 + +/ PDFFontpages
r=. '/Type /Pages',LF
r=. r, pdf_pageheader''
r=. r, '/MediaBox [',(pfmt Pxywh),']',LF
r=. r,'/Kids [',(":kp),' 0 R]',LF
r=. r, '/Count 1',LF
res=. pdf_dict r

NB. ---------------------------------------------------------
r=. '/Type /Page',LF
r=. r,'/Parent ',(":kp-1),' 0 R',LF
r=. r,'/Contents ',(":kp+1),' 0 R',LF
res=. res ; pdf_dict r

NB. ---------------------------------------------------------
t=. y
s=. '<< /Length ',(":#t),' >>',LF
res ,< s,'stream',LF,t,'endstream',LF
)

NB. =========================================================
NB. pdf_pages header
pdf_pageheader=: 3 : 0
r=. '/Resources',LF,'<<',LF,' /ProcSet [/PDF /Text]',LF
r=. r,' /Font <<',LF
fx=. ' /F'&, &> ": each 1 + i.#PDFFonts
px=. ' ',. ": &> 2 + +/\ PDFFontpages
r=. r, ,fx ,"1 px ,"1 ' 0 R',LF
r=. r,' >>',LF,'>>',LF
)

NB. =========================================================
pdf_wrap=: 3 : 0
z=. ": 1 + #y
r=. '%PDF-1.3',LF
r=. r, '%', (a. {~128 + a. i. 'elmo'),LF

NB. ---------------------------------------------------------
NB. note the xref section must have exactly 20 characters
NB. per line - otherwise Adobe rebuilds the xref when
NB. the file is loaded
s=. 'xref',LF,'0 ',z,LF
s=. s,(10#'0'),' 65535 f ',LF

for_i. i.#y do.
  s=. s,(_10 {.!.'0' ": #r),' 00000 n ',LF
  c=. LF,(>i{y)
  r=. r,(":1+i),' 0 obj',c,'endobj',LF,LF
end.

NB. ---------------------------------------------------------
ndx=. I. '{z}' E. PDF_TRAILER
tr=. (ndx {. PDF_TRAILER), z, (ndx+3) }. PDF_TRAILER
r,s,LF,tr,(":#r),LF,'%%EOF'
)
