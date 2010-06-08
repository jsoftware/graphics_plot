NB. init

coclass 'jzplot'
NB. gtk init

PlotGtkInit_jzplot_=: 0

NB. =========================================================
initplotgtk=: 3 : 0
if. PlotGtkInit_jzplot_ do. return. end.
'require'~'gui/gtk'
if. -.IFGTK do. gtkinit_jgtk_'' end.
path=. copath coname''
ndx=. path i. <'jgl2'
path=. ~. (ndx{.path),'jgtk';ndx}.path
path copath coname''
PlotGtkInit_jzplot_=: 1
)

