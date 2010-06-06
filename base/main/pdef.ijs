NB. PDef / PDefs
NB.
NB. PDef is a global boxed list defining a single plot.
NB.
NB. This has enough information to calculate and position the plot.
NB.
NB. External definitions such as Title are not included - these
NB. are the definitions in PlotOpts.
NB.
NB. Non-positioning definitions such as color are included in a
NB. single item (Opts).
NB.
NB. PDefs is a boxed matrix with one PDef plot per row,
NB. used for multiplots.
NB.
NB. For multiplots, the Opts item of each row may contain
NB. inside KEY definitions.
NB.
NB. corresponding indices begin "p", e.g. pASPECT
NB.
NB. The list includes names defined by plot commands (upper case),
NB. and defined internally (upper and lower case).
NB.
NB. use:
NB.    makenew builds a PDef list
NB.    makemulti builds a PDefs matrix

PDefNames=: <;._2 (0 : 0)
Data
DataRep
DimData
DimType
Frame
Gcmd0
Gcmd1
Opts
Rule
Text
Types
TypeMsk
YAxes
Y2Msk
ASPECT
AXES
CAPTIONFONT
FRAME
FRAMESTYLE
GRIDS
LABELFONT
LABELS
PIEPERCENT
RTIC
TICMAJOR
TICMINOR
TICS
TICSTYLE
TYPE
XCAPTION
XCAPTIONSTYLE
XINT
XLABEL
XLABELSTYLE
XLOG
XRANGE
XTIC
XTICPOS
Y2AXIS
YCAPTION
YCAPTIONSTYLE
YINT
YLABEL
YLABELSTYLE
YLOG
YRANGE
YTIC
YTICPOS
Y2CAPTION
Y2CAPTIONSTYLE
Y2LABEL
Y2LABELSTYLE
Y2LOG
Y2RANGE
YGROUP
Y2TIC
Y2TICPOS
ZCAPTIONSTYLE
ZINT
ZLABEL
ZLABELSTYLE
ZLOG
ZRANGE
ZGROUP
ZTIC
ZTICPOS
)

('p' ,each PDefNames)=: i.#PDefNames
