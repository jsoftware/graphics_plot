NB. util

NB. =========================================================
NB. note this does not set angle - handled separately
gtkfontdesc=: 3 : 0
'ind fst siz ang und'=. y
'ita bld'=. 2 2 #: fst
sty=. (bld#' bold'),(ita#' italic'),und#' underline'
(dquote ind pick FONTNAMES),sty,' ',":siz
)

