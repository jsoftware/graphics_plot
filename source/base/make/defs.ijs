NB. defs

NB. =========================================================
NB. Following are needed to draw wrapper at end of a multiplot
NB. ? BORDER
MultiDefs=: <;._2 (0 : 0)
BACKCOLOR
ITEMCOLOR
KEY
KEYSTYLE
KeyExtent
KeyFont
Kxywh
SUBTITLE
SUBTITLECOLOR
SUBTITLEFONT
SUBTITLESTYLE
SubTitleFont
TITLE
TITLECOLOR
TITLEFONT
TITLESTYLE
TitleFont
Txywh
Vxywh
XCAPTION
XCAPTIONSTYLE
Xxywh
Y2CAPTION
Y2CAPTIONSTYLE
YCAPTION
YCAPTIONSTYLE
Yxywh
ZCAPTION
ZCAPTIONSTYLE
)

NB. =========================================================
definemultidefs=: 3 : 0
pdefs y
'Kx Ky Kw Kh'=: Kxywh
'Tx Ty Tw Th'=: Txywh
'Vx Vy Vw Vh'=: Vxywh
'Xx Xy Xw Xh'=: Xxywh
'Yx Yy Yw Yh'=: Yxywh
)

NB. =========================================================
NB. multiGroups survive a setplotdefaults
MultiGroups=: <;._2 (0 : 0)
XGROUP
YGROUP
ZGROUP
)

NB. =========================================================
NB. multihdrs are used only for the wrapper of a multiplot,
NB. and not carried forward to each subplot.
MultiHdrs=: MultiDefs,MultiGroups,<;._2 (0 : 0)
CLEAR
COLOR
OUTPUT
)
