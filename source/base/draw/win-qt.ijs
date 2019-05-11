NB. win  - default plot window definitions
NB.
NB. pclose     close form
NB. popen      open form

NB. =========================================================
pclose_qt=: 3 : 0
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
popen_qt=: 3 : 0
if. #y do. size=. 0 ". y else. size=. QT_DEFSIZE end.

Poutput=: iQT

NB. ---------------------------------------------------------
if. wdishandle ": (0&". ::]) PFormhwnd do.
  wd 'psel ', ": (0&". ::]) PFormhwnd
  glsel PId
  0 return.
end.

NB. ---------------------------------------------------------
wd 'pc ',PForm,' closeok'
PFormhwnd=: wdqhwndp''

NB. ---------------------------------------------------------
wd 'pn *',PLOTCAPTION
wd 'minwh ',": size
wd 'cc ',PId,' isigraph flush'
wd 'pas 0 0'

fm=. PForm,'_'
id=. fm,PId,'_'
NB. (fm,'close')=: pclose_qt
(id,'paint')=: ppaint
(id,'mmove')=: ]

Pxywh=: ''
PShow=: 0
)

NB. =========================================================
ptop_qt=: 3 : 0
PTop=: -. PTop
wd 'ptop ',":PTop
)

NB. =========================================================
3 : 0''
if. IFQT do.
  pclose=: pclose_qt
  popen=: popen_qt
  ppaint=: qt_paint
  psize=: psize_qt
  ptop=: ptop_qt
elseif. IFJA do.
  pclose=: pclose_android
  popen=: popen_android
  ppaint=: android_paint
  psize=: psize_android
  ptop=: ptop_android
elseif. ('jwin32';'jjava') e.~ < (11!:0) ::0: 'qwd' do.
  pclose=: pclose_isi
  popen=: popen_isi
  ppaint=: isi_paint
  psize=: psize_isi
  ptop=: ptop_isi
end.
EMPTY
)
