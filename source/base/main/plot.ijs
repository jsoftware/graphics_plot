NB. session definitions for plot

NB.*pd v plot driver
NB.*pdf v plot function driver
NB.*plot v cover for pd
NB.*plotf v cover for pdf

load '~addons/graphics/plot/jzplot.ijs'
coclass 'jwplot'
coinsert 'jzplot'

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
