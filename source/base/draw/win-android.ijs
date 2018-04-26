NB. win  - default plot window definitions
NB.
NB. pclose     close form
NB. popen      open form

NB. =========================================================
pclose_android=: 3 : 0
try.
  wd 'psel ',": PFormhwnd
  PFormhwnd=: 0
  if. ifjwplot'' do.
    wpsave_j_ :: 0: PForm
  end.
  wd 'pclose'
  pd 'reset'
catch. end.
0
)

NB. =========================================================
NB. popen   open plot window
NB. return 0 if already open, 1 if opened
popen_android=: 3 : 0

NB. ---------------------------------------------------------
if. wdishandle ": (0&". ::]) PFormhwnd do.
  wd 'psel ', ": (0&". ::]) PFormhwnd
  glsel PId
  0 return.
end.

NB. ---------------------------------------------------------

fm=. PForm,'_'
id=. fm,PId,'_'
NB. (fm,'close')=: pclose_android
(id,'paint')=: ppaint
(id,'mmove')=: ]

Pxywh=: ''
PShow=: 0
wd 'activity ', (>coname''), ' fs'
)

onStart=: 3 : 0
NB. ---------------------------------------------------------
wd 'pc ',PForm,' closeok'
wd 'pn *',PLOTCAPTION
NB. wd 'minwh 480 360'
wd 'cc ',PId,' isigraph flush'
wd 'pas 0 0'
PFormhwnd=: wdqhwndp''
android_show2''
)

NB. =========================================================
ptop_android=: 3 : 0
PTop=: -. PTop
wd 'ptop ',":PTop
)

NB. =========================================================
3 : 0''
if. IFJA do.
  pclose=: pclose_android
  popen=: popen_android
  ppaint=: android_paint
  psize=: psize_android
  ptop=: ptop_android
end.
EMPTY
)
