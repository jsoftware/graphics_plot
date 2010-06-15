NB. init

coclass 'jzplot'
NB. init

'require'~'~addons/graphics/color/colortab.ijs'
'require'~'~addons/graphics/color/hues.ijs'
'require'~'~addons/graphics/afm/afm.ijs'

IFJ7=: 700 < 0 ". ({. ~i.&'/') }.9!:14''
3 : 0''
if. IFJ7 do.
  wdinfo=: smoutput
  wd=: (i.0 0)"_
else.
  LF2_z_=: LF,LF [ IFWIN_z_=: IFWIN32 [ Debug_z_=: 0 [ EMPTY_z_=: i.0 0
  IFGTK_z_=: 0
  'require'~'dll strings unicode'
end.
''
)
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

