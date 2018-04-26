NB. util

NB. pdf always use big endian
endian=. ({.a.)={. 1&(3!:4) 1  NB. 0 little endian   1 big endian
toucodem=: ''&,@(1&(3!:4))@(3&u:)@u:
toucoder=: ''&,@:,@:(|."1@(_2: ]\ 1&(3!:4)))@(3&u:)@u:
toucode1=: toucodem`toucoder@.(-.endian) f.
4!:55 <'endian'  NB. Remove definition of 'endian' to avoid problems if the name is publicly assigned later

NB. =========================================================
NB. jpf_getparms
jpf_getparms=: 3 : 0
(PDF_DEFSIZE;JPF_DEFFILE) output_parms y
)

NB. =========================================================
pdf_boxrs2wh=: 3 : 0
a=. 2 {."1 y
b=. 2 }."1 y
(a <. b) ,"1 | a - b
)

NB. =========================================================
NB. pdf_getparms
pdf_getparms=: 3 : 0
(PDF_DEFSIZE;PDF_DEFFILE) output_parms y
)

NB. =========================================================
NB. pdf_dict
pdf_dict=: 3 : 0
if. L. y do.
  s=. ; y ,each <LF
else.
  s=. y , (LF ~: {: y) # LF
end.
'<<',LF,s,'>>',LF
)

NB. =========================================================
pdf_rotxy=: 3 : 0
if. ROT do.
  'px py'=. y
  (Sh-py),px
else.
  y
end.
)

NB. =========================================================
pdf_rotxym=: 3 : 0
if. ROT do.
  'px py'=. |:y
  (Sh-py),.px
else.
  y
end.
)

NB. =========================================================
pdf_wraptext=: 3 : 0
'BT ',y,' ET '
)

NB. =========================================================
pdf_write=: 4 : 0
dat=. x
file=. y
while. _1 -: dat flwrite file do.
  msg=. 'Unable to write to file: ',file,LF,LF
  if. #d=. 1!:0 file do.
    msg=. msg, 'If the file is open in Adobe, close the file and try again.'
    if. 1 query msg do. return. end.
  else.
    info msg,'The file name is invalid.' return. end.
end.
if. VISIBLE do.
  viewpdf_j_ file
end.
)
