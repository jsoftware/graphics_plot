NB. init

coclass 'jzplot'
NB. gtk init

PlotGtkInit=: 0

NB. =========================================================
initplotgtk=: 3 : 0
if. PlotGtkInit do. return. end.
'require'~'~addons/gui/gtk/gtk.ijs'
path=. copath coname''
ndx=. path i. <'jgl2'
path=. ~. (ndx{.path),'jgtk';ndx}.path
path copath coname''
)

