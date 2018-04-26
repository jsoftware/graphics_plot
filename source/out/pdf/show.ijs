NB. show

NB. =========================================================
NB. pdf_get
pdf_get=: 3 : 0
'size file ctx'=. 3{. pdf_getparms y
pdf_make size
)

NB. =========================================================
NB. write output for report writer
NB. file extension is *.jpf
pdf_jpf=: 3 : 0
'size file ctx'=. 3{. jpf_getparms y
txt=. pdf_make size
size=. ":size
fnt=. ; PDFFonts ,each ','
top=. ; (size;fnt) ,each ';'
txt=. top,LF,txt
res=. txt flwritenew file
if. _1 -: res do.
  info 'Unable to write to file: ',file
end.
)

NB. =========================================================
NB. pdf_show
pdf_show=: 3 : 0
'size file ctx'=. 3{. pdf_getparms y
res=. pdf_make size
res=. pdf_build res
res pdf_write file
)

NB. =========================================================
pdf_make=: 3 : 0
make iPDF;0 0,y
fns=. 'pdf'&, each 1 {"1 Plot
dat=. 3 }."1 Plot
buf=: ''
PDFFonts=: ,<'Helvetica'
PDFClip=: 0 NB. count of clip stack
for_d. dat do.
  (>d_index{fns)~d
end.
dtbs buf
)
