NB. init

coclass 'jzplot'
NB. init

'require'~'~addons/graphics/color/colortab.ijs'
'require'~'~addons/graphics/color/hues.ijs'
'require'~'~addons/graphics/afm/afm.ijs'

coinsert 'jafm jgl2'

NB. =========================================================
NB. keywords
NB.
NB. KEYWORDS is a boxed list of lowercase keywords. A keyword
NB. given in the left argument to plot or as an argument to pd,
NB. is replaced with its uppercase definition.

NB. ---------------------------------------------------------
NB. no axes
NB. turns all axis decorations off:
NOAXES=: 'axes 0;boxed 0;frame 0;grids 0;labels 0;tics 0;'

NB. ---------------------------------------------------------
NB. no frame
NB. turns axes on, frame off
NOFRAME=: 'axes 1;frame 0'

KEYWORDS=: 'noaxes';'noframe'

IFJ7=: 700 < 0 ". ({. ~i.&'/') }.9!:14''
3 : 0''
if. IFJ7 do.
  wdinfo=: smoutput
  wdinfo=: wd=: (i.0 0)"_
else.
  IFWIN=: IFWIN32
end.
''
)
