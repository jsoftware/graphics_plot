NB. util

NB. =========================================================
pgetascender=: 3 : 0
if. Poutput=iISI do.
  glfont y
  1 { glqtextmetrics''
else.
  FontScale * getascender y
end.
)

NB. =========================================================
NB. get text extent
pgetextent=: 4 : 0
select. Poutput
case. iISI do.
  glfont x
  |: glqextent &> y
case. iGTK do.
  gtkextent gtkpl;y;gtkfontdesc x
case. do.
  FontScale * x getextent y
end.
)

NB. =========================================================
pgetextent1=: 4 : 0
if. LF e. y do.
  r=. (<x) pgetextent1 &> <;._2 y,LF
  (>./{."1 r),+/{:"1 r return.
end.
select. Poutput
case. iISI do.
  glfont x
  glqextent y
case. iGTK do.
  gtkextent gtkpl;y;gtkfontdesc x
case. do.
  FontScale * x getextent1 y
end.
)

NB. =========================================================
getfontsize=: 3 : 'FontScale * 2 { y'
pgetstringlen=: {. @ pgetextent
