NB. view 3d  - view 3d object
NB.
NB. illustrates viewpoint system used in Plot

PForm=: 'v3d'
PId=: 'gp'

V3D=: 0 : 0
pc v3d closeok;
menupop "File";
menusep ;
menu exit "&Exit" "" "" "";
menupopz;
cc cancel button;cn "Close";
cc default button;cn "Default";
cc xlabel static;cn "x:";
cc xedit edit;
cc xspin spinv;
cc ylabel static;cn "y:";
cc yedit edit;
cc yspin spinv;
cc zlabel static;cn "z:";
cc zedit edit;
cc zspin spinv;
cc xlabel static;cn "x:";
cc uxedit edit;
cc ylabel static;cn "y:";
cc uyedit edit;
cc zlabel static;cn "z:";
cc uzedit edit;
minwh 486 324;cc gp isigraph flush;
cc uzspin spin;
cc uyspin spin;
cc uxspin spin;
pas 2 0;pcenter;
rem form end;
)

setedits=: 3 : 0
wd 'set xedit text ',pfmt VIEWX
wd 'set yedit text ',pfmt VIEWY
wd 'set zedit text ',pfmt VIEWZ
)

setuedits=: 3 : 0
wd 'set uxedit text ',pfmt VIEWUPX
wd 'set uyedit text ',pfmt VIEWUPY
wd 'set uzedit text ',pfmt VIEWUPZ
)

v3d_run=: 3 : 0
VIEWX=: 0{VIEWPOINT
VIEWY=: 1{VIEWPOINT
VIEWZ=: 2{VIEWPOINT

VIEWUPX=: 0{VIEWUP
VIEWUPY=: 1{VIEWUP
VIEWUPZ=: 2{VIEWUP

DEFAULT=: VIEWPOINT
DEFAULTUP=: VIEWUP

if. IFJA do.
  wd 'activity ', (>coname'')
else.
  wd V3D
  PIdhwnd=: wdqhwndc 'gp'
  setedits''
  setuedits''
  viewit''
  wd 'pshow;'
end.
)

onStart=: 3 : 0
wd V3D
PIdhwnd=: wdqhwndc 'gp'
setedits''
setuedits''
viewit''
wd 'pshow;'
)

viewit=: 3 : 0
Init=: 0
VIEWPOINT=: VIEWX,VIEWY,VIEWZ
VIEWUP=: VIEWUPX,VIEWUPY,VIEWUPZ

Plot=: 0#Plot
pd VIEWDATA
plotmake''
Plot=: Plot /: {."1 Plot
PForm=: 'v3d'
plotshow Plot
)

v3d_xedit_button=: viewenter
v3d_yedit_button=: viewenter
v3d_zedit_button=: viewenter
v3d_uxedit_button=: viewenter
v3d_uyedit_button=: viewenter
v3d_uzedit_button=: viewenter

v3d_cancel_button=: 3 : 0
wd 'pclose;'
)

v3d_xspin_button=: 3 : 0
VIEWX=: clean VIEWX+0.2*".xspin
wd 'set xedit text ',pfmt VIEWX
viewit''
)

viewenter=: 3 : 0
VIEWX=: ".xedit
VIEWY=: ".yedit
VIEWZ=: ".zedit
VIEWUPX=: ".uxedit
VIEWUPY=: ".uyedit
VIEWUPZ=: ".uzedit
viewit''
)

v3d_yspin_button=: 3 : 0
VIEWY=: clean VIEWY+0.2*".yspin
wd 'set yedit text ',pfmt VIEWY
viewit''
)

v3d_zspin_button=: 3 : 0
VIEWZ=: clean VIEWZ+0.2*".zspin
wd 'set zedit text ',pfmt VIEWZ
viewit''
)

v3d_uxspin_button=: 3 : 0
VIEWUPX=: clean VIEWUPX+0.05*".uxspin
wd 'set uxedit text ',pfmt VIEWUPX
viewit''
)

v3d_uyspin_button=: 3 : 0
VIEWUPY=: clean VIEWUPY+0.05*".uyspin
wd 'set uyedit text ',pfmt VIEWUPY
viewit''
)

v3d_uzspin_button=: 3 : 0
VIEWUPZ=: clean VIEWUPZ+0.05*".uzspin
wd 'set uzedit text ',pfmt VIEWUPZ
viewit''
)

v3d_default_button=: 3 : 0
(;:'VIEWX VIEWY VIEWZ')=: DEFAULT
(;:'VIEWUPX VIEWUPY VIEWUPZ')=: DEFAULTUP
setedits''
setuedits''
viewit''
)

view3d=: v3d_run
