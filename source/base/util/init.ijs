NB. init

coclass 'jzplot'
NB. init

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

