NB. show

NB. =========================================================
NB. qt_show
qt_show=: 3 : 0
popen_qt y

NB. this tests make before the form is shown.
NB. it should be possible to avoid doing the make twice, i.e.
NB. save the initial make result and use it in the initial paint.
NB. a form is needed for qextent calls.
NB. make iQT;0 0 500 500 NB. test make

glpaintx''
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
qt_paint=: 3 : 0
selectpid''
'Cw Ch'=: glqwh''
qt_paintit 0 0,Cw,Ch
0
)

NB. =========================================================
qt_paintit=: 3 : 0
qt_gpinit''
try.
  make iQT;y
catch.
  PCmd=: Plot=: i.0 0
NB.   info ({.~i.&LF) 13!:12''
  echo  13!:12''
end.
if. 0=#Plot do. return. end.
try.
ids=. 1 {"1 Plot
fns=. 'qt'&, each ids
dat=. 3 }."1 Plot
for_d. dat do.
  (>d_index{fns)~d
end.
qt_gpapply''
catch.
echo 13!:12''
end.
)
