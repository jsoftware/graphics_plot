NB. util

NB. =========================================================
NB. cairo_getparms
cairo_getparms=: 3 : 0
(CAIRO_DEFSIZE;CAIRO_DEFFILE) output_parms y
)

NB. =========================================================
cairo_write=: 3 : 0
file=. y
assert. 0~:plotcr
while. 0 ~: cairo_surface_write_to_png_jcairo_ (cairo_get_target_jcairo_ plotcr) ; file do.

  msg=. 'Unable to write to file: ',file,LF,LF
  if. #d=. 1!:0 file do.
    msg=. msg, 'If the file is open in a viewer, close the file and try again.'
    if. 1 query msg do. return. end.
  else.
    info msg,'The file name is invalid.' return. end.
end.
if. (VISIBLE > IFJHS) do.
  viewimage_j_ file
end.
EMPTY
)
