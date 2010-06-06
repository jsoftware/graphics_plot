NB. show

NB. =========================================================
NB. isi_show
isi_show=: 3 : 0
popen''
(PForm,'_',PId,'_paint')=: isi_paint
isi_paint''

NB. ---------------------------------------------------------
if. PShow=0 do.
  if. VISIBLE do.
    wd 'pshow ',PSHOW
  else.
    wd 'pshow sw_hide'
  end.
  wd 'ptop ',":PTop
  PShow=: 1
else.
  glpaint''
end.
)

NB. =========================================================
isi_paint=: 3 : 0
glsel PId
'Cw Ch'=: glqwh''
isi_paintit 0 0,Cw,Ch
)

NB. =========================================================
isi_paintit=: 3 : 0
gpinit''
make iISI;y
ids=. 1 {"1 Plot
fns=. 'isi'&, each ids
dat=. 3 }."1 Plot
for_d. dat do.
  (>d_index{fns)~d
end.
gpapply''
)

