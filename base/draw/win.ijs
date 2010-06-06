NB. win  - default plot window definitions
NB.
NB. pclose     close form
NB. popen      open form

NB. =========================================================
PMenu=: 0 : 0
menupop "&File";
menu clip "&Clip" "" "" "";
menusep;
menu saveeps "&Save EPS" "" "" "";
menusep;
menu savepdf "&Save PDF" "" "" "";
menusep;
menu print "&Print" "" "" "";
menusep;
menu exit "E&xit" "" "" "";
menupopz;
menupop "&Help";
menu help "&Plot Help" "" "" "";
menusep;
menu about "&About" "" "" "";
menupopz;
)

NB. =========================================================
pclose=: 3 : 0
try.
  wd 'psel ',PFormhwnd
  if. ifjwplot'' do.
    wpsave_j_ :: 0: PForm
  end.
  wd 'pclose'
  pd 'reset'
catch. end.
)

NB. =========================================================
NB. popen   open plot window
NB. return 0 if already open, 1 if opened
popen=: 3 : 0

NB. ---------------------------------------------------------
if. ifparent PFormhwnd do.
  wd 'psel ',PFormhwnd
  wd 'pactive'
  glsel PId
  0 return.
end.

NB. ---------------------------------------------------------
wd 'pc ',PForm
NB. wd PMenu
PFormhwnd=: wd 'qhwndp'

NB. ---------------------------------------------------------
wd 'pn *',PLOTCAPTION
wd 'xywh 0 0 240 180'
wd 'cc ',PId,' isigraph rightmove bottommove'
wd 'pas 0 0'

if. ifjwplot'' do.
  wpset_j_ :: 0: PForm
else.
  wdmove _1 0
end.
wdfit ''

fm=. PForm,'_'
id=. fm,PId,'_'
(fm,'close')=: pclose
(fm,'cancel')=: pclose
(fm,'tctrl_fkey')=: ptop
(id,'size')=: ppaint
(id,'mmove')=: ]

(fm,'f10_fkey')=: pd bind 'eps'
(fm,'f11_fkey')=: pd bind 'pdf'

Pxywh=: ''
PShow=: 0
)

NB. =========================================================
NB. ppaint - paint handler
ppaint=: 3 : 0
cwh=. glqwh''
if. -. cwh -: Cw,Ch do.
  isi_show ''
end.
)

NB. =========================================================
NB. for compatibility with earlier plot
psize=: 3 : 0
if. #Plot do.
  ppaint''
end.
)

NB. =========================================================
ptop=: 3 : 0
PTop=: -. PTop
wd 'ptop ',":PTop
)

