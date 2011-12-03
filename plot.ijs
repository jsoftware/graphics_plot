NB. session definitions for plot

NB.*pd v plot driver
NB.*pdf v plot function driver
NB.*plot v cover for pd
NB.*plotf v cover for pdf
NB.*plotdef v set default for canvas

require 'jzplot'
coclass 'jwplot'
coinsert 'jzplot'

cxywh=: 4$0

NB. =========================================================
NB. deferred commands
pdcmdsave=: ''
pdcmdclip=: 0
pdcmdprint=: 0

NB. =========================================================
NB. z locale definitions
pd_z_=: 3 : 0
caller_jwplot_=. coname''
pd_jwplot_ y
)

plot_z_=: 3 : 0
caller_jwplot_=. coname''
'' plot_jwplot_ y
:
caller_jwplot_=. coname''
x plot_jwplot_ y
)

plotdef_z_=: 3 : 0
'CANVAS_DEFSHOW_jzplot_ CANVAS_DEFSIZE_jzplot_'=: y
i.0 0
)
