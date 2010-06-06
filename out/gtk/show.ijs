NB. show

NB. =========================================================
gtk_show=: 3 : 0
initplotgtk''
gtkopen''
)

NB. =========================================================
NB. this is the main drawing program
gtk_paint=: 3 : 0
'Cw Ch'=: _2 {. gtkXYWH
make iGTK;gtkXYWH
glclipreset''
ids=. 1 {"1 Plot
fns=. 'gtk'&, each ids
dat=. 3 }."1 Plot
for_d. dat do.
  (>d_index{fns)~d
end.
glpaint''
)




