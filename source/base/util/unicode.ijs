NB. unicode

NB. =========================================================
NB. isi assume utf8
text2utf8=: 3 : 0
if. isutf8 y do. y return. end.
if. 2 ~: 3!:0 y do. utf8 y return. end.
NB. assume 8859-1 codepage:
val=. a. i. y
msk=. 127 < val
uni=. 192 128 +"1 [ 0 64 #: msk # val
val=. val #~ 1 j. msk
ndx=. I. 127 < val
a. {~ uni (<"0 ndx +/ 0 1) } val
)

NB. =========================================================
NB. eps/pdf assume 8-bit for postscript fonts
text2ascii8=: 3 : 0
if. isutf8 y do.
  1 u: ucp y
else.
  y
end.
)
