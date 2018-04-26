NB. util

fzskludge=: 4%3

NB. =========================================================
pgetascender=: 3 : 0
if. Poutput = iANDROID do.
  glfontextent andfontdesc y
  1 { glqtextmetrics''
elseif. Poutput e. iQT,iQTC do.
  glfontextent gtkfontdesc y
  1 { glqtextmetrics''
elseif. Poutput = iCAIRO do.
  FontScale * getascender y
elseif. Poutput = iCANVAS do.
  FontScale * getascender (FontSizeMin >. 2{y) 2 } y
elseif. Poutput=iISI do.
  glfont y
  1 { glqtextmetrics''
elseif. do.
  FontScale * getascender y
end.
)

NB. =========================================================
NB. get text extent
pgetextent=: 4 : 0
select. Poutput
case. iANDROID do.
  glfontextent andfontdesc^:(0={.0#x) x
  |: glqextent &> y
case. iQT;iQTC do.
  glfontextent`glfontextent_jglc_@.(Poutput=iQTC) gtkfontdesc^:(0={.0#x) x
  |: glqextent`glqextent_jglc_@.(Poutput=iQTC) &> y
case. iCAIRO do.
  FontScale * fzskludge * x getextent y
NB.   glcr_fontextent_jglcr_ gtkfontdesc^:(0={.0#x) x
NB.   |: glcr_qextent_jglcr_ &> y
case. iCANVAS do.
  FontScale * fzskludge * ((FontSizeMin >. 2{x) 2} x) getextent y
case. iISI do.
  glfont x
  |: glqextent &> y
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
case. iANDROID do.
  glfontextent andfontdesc^:(0={.0#x) x
  glqextent y
case. iQT;iQTC do.
  glfontextent`glfontextent_jglc_@.(Poutput=iQTC) gtkfontdesc^:(0={.0#x) x
  glqextent`glqextent_jglc_@.(Poutput=iQTC) y
case. iCANVAS do.
  FontScale * fzskludge * ((FontSizeMin >. 2{x) 2} x) getextent1 y
case. iISI do.
  glfont x
  glqextent y
case. do.
  FontScale * x getextent1 y
end.
)

NB. =========================================================
getfontsize=: 13 : '{.1{._1 -.~ _1 ". y'
getplotfontsize=: 3 : 0
if. 2 131072 262144 e.~ 3!:0 y do.
  FontScale * FontSizeMin >. getfontsize y
else.
  FontScale * FontSizeMin >. 2 { y
end.
)

pgetstringlen=: {. @ pgetextent

NB. =========================================================
NB. note this does not set angle - handled separately
gtkfontdesc=: 3 : 0
'ind fst siz ang und'=. y
'ita bld'=. 2 2 #: fst
sty=. (bld#' bold'),(ita#' italic'),und#' underline'
('_' (I.@(' '&=)nam)} nam=. ind pick GTKFONTNAMES),sty,' ',":siz
)
