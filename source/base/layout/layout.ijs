NB. layout

NB. =========================================================
NB. getinnerboxes
NB.
NB. defines Frame, Graf and Key boxes
getinnerboxes=: 3 : 0
getframebox''
getgrafbox''
getaspect''
getinnerkeybox''
)

NB. =========================================================
getouterlayout=: 3 : 0
if. IfPie do.
  setouterkey''
end.
getkeysize''
getouterboxes''
getouterkeybox''
)

NB. =========================================================
getlayout=: 3 : 0
TicOut=: 'o' e. TICSTYLE NB. 0=inside,1=outside
getouterlayout''
getlabelbox''
getaxes''

NB. ---------------------------------------------------------
if. IfPie do.
  FRAME=: 0
  getpieframes'' return.
end.

NB. ---------------------------------------------------------
if. 1 e. TYPE e. 'contour';'density' do.
  FRAME=: +./ AXES,FRAME
end.

NB. ---------------------------------------------------------
getlabels''
getinnerboxes''

NB. ---------------------------------------------------------
if. DimType=3 do.
  gettfm''
end.
)

NB. =========================================================
getmultilayout=: 3 : 0
setouterkey''
getkeysize''
getouterboxes''
getouterkeybox''
getlabelbox''
)

NB. =========================================================
NB. multi key must be outer key
setouterkey=: 3 : 0
KEYPOS=: ~.'o',KEYPOS -. 'i'
)
