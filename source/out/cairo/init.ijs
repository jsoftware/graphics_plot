NB. init

coclass 'jzplot'
NB. cairo init

CAIRO_DEFSIZE=: 400 300
CAIRO_DEFFILE=: jpath '~temp/plot.png'
CAIRO_PENSCALE=: 0.4

plotcs=: plotcr=: 0
