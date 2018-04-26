NB. show

NB. =========================================================
NB. canvas_get
canvas_get=: 3 : 0
'size file ctx'=. 3{. canvas_getparms y
res=. canvas_make size;file;ctx
)

NB. =========================================================
NB. canvas_show
canvas_show=: 3 : 0
'size file ctx'=. 3{. canvas_getparms y
res=. canvas_make size;file;ctx
res canvas_write file;ctx
if. IFJHS do. plotcanvas__'' end.
i.0 0
)

NB. =========================================================
NB. canvas_make
canvas_make=: 3 : 0
'size file ctx'=. y
make iCANVAS;0 0,size
fns=. 'canvas'&, each 1 {"1 Plot
dat=. 3 }."1 Plot
buf=: ''
'Cw Ch'=: size
CLIP=: 0 NB. count of clip stack
for_d. dat do.
  (>d_index{fns)~d
end.
ctx canvas_build buf
)
