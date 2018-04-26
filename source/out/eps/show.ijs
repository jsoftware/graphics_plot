NB. show

NB. =========================================================
NB. eps_show
eps_show=: 3 : 0
'size file ctx'=. 3{. eps_getparms y
make iEPS;0 0,size
fns=. 'eps'&, each 1 {"1 Plot
dat=. 3 }."1 Plot
buf=: ''
CLIP=: 0 NB. count of clip stack
for_d. dat do.
  (>d_index{fns)~d
end.
res=. eps_build buf
res eps_write file
)
