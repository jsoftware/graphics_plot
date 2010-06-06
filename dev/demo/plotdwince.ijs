NB. plotdwince

NB. =========================================================
PLOTDEMOWINCE=: 0 : 0
pc plotdemo closeok;pn "Plot";
menupop "&Options";
menu view "&View Definition" "" "" "";
menusep;
menu exit "E&xit" "" "" "";
menupopz;
menupop "&2D";
menu MLINE "Line Plots" "" "" "";
menu MLINE2Y "Line Second Y Axes" "" "" "";
menu MLINEPATTERN "Line Patterns" "" "" "";
menusep;
menu MAREA "Area" "" "" "";
menu MDOT "Dot" "" "" "";
menu MMARKER "Marker" "" "" "";
menu MSYMBOL "Symbol" "" "" "";
menu MSTICK "Stick" "" "" "";
menusep;
menu MBAR "Bar" "" "" "";
menu MERRORBAR "Error Bar" "" "" "";
menu MPOLY "Poly" "" "" "";
menupopz;
menupop "&3D";
menu MLINE3D "Line" "" "" "";
menu MSTICK3D "Stick" "" "" "";
menu MWIRE "Wire" "" "" "";
menusep;
menu MSURFACE "Surface" "" "" "";
menu MSURFACEREV "Surface of Revolution" "" "" "";
menu MSPHERE "Sphere" "" "" "";
menusep;
menu MSOLID "Solids" "" "" "";
menu MSTELLATE "Stellates" "" "" "";
menupopz;
menupop "&Gallery";
menu MCOLOR1 "Style 1" "" "" "";
menu MCOLOR2 "Style 2" "" "" "";
menusep;
menu MCURVEFIT "Curve Fitting" "" "" "";
menu MLEGENDRE "Legendre" "" "" "";
menu MPRIMERACE "Prime Race" "" "" "";
menusep;
menu MPAT1 "Patterns 1" "" "" "";
menu MPAT2 "Patterns 2" "" "" "";
menusep;
menu MWIRES "Wire" "" "" "";
menu MGAMMA "Gamma Function" "" "" "";
menu MDRUM "Drum" "" "" "";
menu MSURFACE1 "Surface" "" "" "";
menupopz;
menupop "&Help";
menu next "Next" "Ctrl+A" "" "";
menu prev "Previous" "Ctrl+Shift+A" "" "";
menusep;
menu about "&About" "" "" "";
menupopz;
xywh 0 0 360 260;cc ps isigraph rightmove bottommove;
pas 0 0;pcenter;
rem form end;
)

NB. =========================================================
PLOTNAMESWINCE=: <;._2 (0 : 0)
LINE
LINE2Y
LINEPATTERN
AREA
DOT
MARKER
SYMBOL
STICK
BAR
ERRORBAR
POLY
LINE3D
STICK3D
WIRE
SURFACE
SURFACEREV
SPHERE
SOLID
STELLATE
COLOR1
COLOR2
CURVEFIT
LEGENDRE
PRIMERACE
PAT1
PAT2
WIRES
GAMMA
DRUM
SURFACE1
)

PLOTALL=: 'D', each PLOTNAMES

