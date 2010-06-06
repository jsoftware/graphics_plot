NB. util

average=: +/ % #
ischar=: 3!:0 e. 2 131072"_

NB. =========================================================
NB. getascender
getascender=: 3 : 0
'fnt sty siz ang und'=. 5 {. y
nam=. getfntnameNH fnt,sty
(siz % 1000) * (nam,'_Ascender')~
)

NB. =========================================================
NB. get text extent
getextent=: 4 : 0
'fnt sty siz ang und'=. 5 {. x
nam=. getfntnameNH fnt,sty
met=. (nam,'_CharMetrics')~
chr=. 0 {"1 met
wid=. 1 {"1 met
if. 1 = #y do.
  ext=. ($y) $ +/ wid {~ (#chr) | chr i. a. i. 0 pick y
else.
  len=. # &> y
  ext=. wid {~ (#chr) | chr i. a. i.; y
  msk=. , len > 0
  ext=. msk expand (; len {.each 1) +/;.1 ext
end.
|: siz * (ext % 1000) ,. 1
)

NB. =========================================================
getextent1=: 4 : 0
'fnt sty siz ang und'=. 5 {. x
nam=. getfntnameNH fnt,sty
met=. (nam,'_CharMetrics')~
chr=. 0 {"1 met
wid=. 1 {"1 met
ext=. +/ wid {~ (#chr) | chr i. a. i. y
siz * (ext % 1000), 1
)

NB. =========================================================
getfntname=: 3 : 0
'fnt sty'=. y
if. 4 > fnt do.
  nam=. (4 #. y) pick PSFONTNAMES
else.
  nam=. fnt pick FONTNAMES
end.
)

NB. =========================================================
getfntnameNH=: 3 : 0
'fnt sty'=. y
if. 4 > fnt do.
  nam=. (4 #. y) pick PSFONTNAMESNH
else.
  nam=. fnt pick FONTNAMESNH
end.
)

NB. =========================================================
getfont=: 3 : 0
font=. tolower ' ',y -. '-'
b=. (font=' ') > ~:/\font='"'
fnt=. a: -.~ b <;._1 font
nam=. < '"' -.~ > {. fnt
fnt=. }. fnt
if. #fnt do.
  num=. {. &> 0 ". each fnt
  msk=. num > 0
  siz=. (msk i. 1) { num
else.
  siz=. 10
end.
sty=. 0
ndx=. PSFONTNAMESLC i. nam
if. ndx < #PSFONTNAMESLC do.
  fnx=. <. ndx % 4
  sty=. 4 | ndx
else.
  ndx=. ISIFONTNAMESLC i. nam
  if. ndx < # ISIFONTNAMESLC do.
    fnx=. ndx { ISIFONTNAMESX
  else.
    fnx=. (#FONTNAMESLC) | FONTNAMESLC i. nam
  end.
end.
if. 0 = sty do.
  sty=. +/ 1 2 * ('bold';'italic') e. fnt
end.
und=. (<'underline') e. fnt
ang=. {. 90 270 #~ ('angle900';'angle2700') e. fnt
fnx,sty,siz,ang,und
)

NB. =========================================================
getfontid=: 3 : 0
if. ischar y do.
  getfont y
else.
  y
end.
)

NB. =========================================================
getisifontid=: 3 : 0
if. ischar y do.
  fnt=. getfont y
else.
  fnt=. y
end.
'ind fst siz ang und'=. fnt
'ita bld'=. 2 2 #: fst
sty=. (bld#' bold'),(ita#' italic'),und#' underline'
sty=. sty,(0 < ang)#' angle',":10*ang
ind=. (#ISIFONTNAMES) | ISIFONTNAMESX i. ind
'"',(ind pick ISIFONTNAMES),'" ',(":siz),sty
)

getstringlen=: {. @ getextent
getstringlen1=: {. @ getextent1

NB. =========================================================
NB. getunderline only
getunderline=: 3 : 0
'fnt sty siz ang und'=. 5 {. y
id=. fnt pick PSFONTNAMESNH
pos=. (id,'_UnderlinePosition')~
thk=. (id,'_UnderlineThickness')~
(siz % 1000) * pos,thk
)
