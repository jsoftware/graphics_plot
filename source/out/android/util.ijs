NB. android util

NB. =========================================================
NB. note this does not set angle - handled separately
andfontdesc=: 3 : 0
'ind fst siz ang und'=. y
'ita bld'=. 2 2 #: fst
sty=. (bld#' bold'),(ita#' italic'),und#' underline'
if. ' ' e. nam=. ind pick ANDFONTNAMES do. nam=. '"', nam, '"' end.
nam,sty,' ',":siz
)


NB. =========================================================
NB. get size of canvas if any
android_getsize=: 3 : 0
if. -. wdishandle :: 0: ": PFormhwnd do. '' return. end.
wd 'psel ', ":PFormhwnd
s=. wdqchildxywh ::0: PId
if. s -: 0 0 0 0 do. '' return. end.
2 3 { s
)

NB. =========================================================
NB. output_parms
NB. get output parameters (for non-android)
output_parms=: 4 : 0
'size file'=. x
if. #y do.
  prm=. qchop y
  select. #prm
  case. 1 do.
    file=. 0 pick prm
  case. 2 do.
    size=. 0 ".&> prm
  case. 3 do.
    file=. 0 pick prm
    size=. 0 ". &> _2 {. prm
    if. 0 e. size do.
      size=. 0 ". &> 2 {. prm
      file=. 2 pick prm
    end.
  end.
else.
  if. #sz=. android_getsize'' do.
    size=. sz
  end.
end.
size;file
)

