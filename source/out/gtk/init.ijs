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

GTK_DEFFILE=: '~temp/plot'

NB. =========================================================
fext=: 4 : 0
f=. deb y
f, (-. x -: (-#x) {. f) # x
)

NB. =========================================================
NB. y is file extension
gettemp=: 3 : 0
p=. jpath '~temp/'
d=. 1!:0 p,'*.',y
a=. 0, {.@:(0&".)@> _4 }. each {."1 d
a=. ": {. (i. >: #a) -. a
p,a,'.',y
)

