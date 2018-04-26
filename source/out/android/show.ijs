NB. show

NB. =========================================================
NB. android_show
android_show=: 3 : 0
popen_android''
NB. callback in android_show2
)

NB. this tests make before the form is shown.
NB. it should be possible to avoid doing the make twice, i.e.
NB. save the initial make result and use it in the initial paint.
NB. a form is needed for qextent calls.
NB. make iANDROID;0 0 500 500 NB. test make

android_show2=: 3 : 0
if. 0~: 4!:0 <'VISIBLE' do. '' return. end.
if. PShow=0 do.
  if. VISIBLE do.
    wd 'pshow ',PSHOW
  else.
    wd 'pshow hide'
  end.
  wd 'ptop ',":PTop
  PShow=: 1
else.
  if. VISIBLE do.
    wd 'ptop'
  end.
end.
''
)

NB. =========================================================
android_paint=: 3 : 0
selectpid''
'Cw Ch'=: glqwh''
android_paintit 0 0,Cw,Ch
glpaintx''
0
)

NB. =========================================================
android_paintit=: 3 : 0
android_gpinit''
try.
  make iANDROID;y
catch.
  PCmd=: Plot=: i.0 0
  info ({.~i.&LF) 13!:12''
end.
if. 0=#Plot do. return. end.
ids=. 1 {"1 Plot
fns=. 'android'&, each ids
dat=. 3 }."1 Plot
for_d. dat do.
  (>d_index{fns)~d
end.
android_gpapply''
)
