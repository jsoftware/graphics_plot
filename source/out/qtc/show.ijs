NB. show

NB. =========================================================
NB. qtc_show
qtc_show=: 3 : 0
'size file'=. 2{. qtc_getparms y
qtc_make file;size
if. VISIBLE do.
  viewimage_j_ file
end.
)

NB. =========================================================
qtc_make=: 3 : 0
'file size'=. y
make iQTC;0 0,size
ids=. 1 {"1 Plot
fns=. 'qt'&, each ids
dat=. 3 }."1 Plot
glinit_jglc_ size
qt_gpinit''
'Cw Ch'=: size
for_d. dat do.
  (>d_index{fns)~d
end.
qt_gpapply''
glsavefile_jglc_ file
glfree_jglc_ ''
)

NB. =========================================================
NB. canvas_getparms
qtc_getparms=: 3 : 0
(QT_DEFSIZE;QT_DEFFILE,'.png') output_parms y
)
