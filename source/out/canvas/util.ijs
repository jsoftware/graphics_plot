NB. util

NB. =========================================================
NB. canvas_getparms
canvas_getparms=: 3 : 0
(CANVAS_DEFSIZE;CANVAS_DEFFILE) output_parms y
)

NB. =========================================================
canvas_write=: 4 : 0
dat=. x
'file ctx'=. y
while. _1 -: dat flwrites file do.
  msg=. 'Unable to write to file: ',file,LF,LF
  if. #d=. 1!:0 file do.
    msg=. msg, 'If the file is open in a viewer, close the file and try again.'
    if. 1 query msg do. return. end.
  else.
    info msg,'The file name is invalid.' return. end.
end.
if. (VISIBLE > IFJHS) *. '<!DOCTYPE html>' -: 15{.x do.
  viewimage_j_ file
end.
)
