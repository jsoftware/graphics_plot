NB. isi util

NB. =========================================================
NB. get size of isigraph if any
isi_getsize=: 3 : 0
if. -. wdishandle :: 0: PFormhwnd do. '' return. end.
wd 'psel ',PFormhwnd
s=. wd :: 0: 'qchildxywhx ',PId
if. s -: 0 do. '' return. end.
2 3 { 0 ". s
)

NB. =========================================================
NB. output_parms
NB. get output parameters (for non-isi)
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
  if. #sz=. isi_getsize'' do.
    size=. sz
  end.
end.
size;file
)

