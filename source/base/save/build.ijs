NB. build

'require'~ 'dates files strings'
load '~Plot/dev/demo/build.ijs'

NB. =========================================================
demos_z_=: 3 : 0
a=. 'RADAR'
a=. 'PIE'
a=. 'JGRAPHICS'
PLDEMOSEL_jdplot_=: a
'load'~'~addons/graphics/plot/demo/plotdemo.ijs'
)

NB. =========================================================
f=. 3 : 0
readsourcex_jp_ '~Plot/',y
)

NB. =========================================================
dat=. ; f each cutopen 0 : 0
base/util
base/main
base/axis
base/data
base/draw
base/font
base/gd
base/key
base/layout
base/make
base/pd

out/android
out/cairo
out/canvas
out/eps
out/isi
out/pdf
out/qtc
out/qt

type/2d
type/3d
)

dat fwritenew jpath '~Addons/graphics/plot/jzplot.ijs'
dat fwritenew jpath '~addons/graphics/plot/jzplot.ijs'

load '~Plot/base/main/save.ijs'

f=. 3 : 0
(jpath '~Addons/graphics/plot/',y) fcopynew jpath '~Addons/graphics/plot/source/',y
(jpath '~addons/graphics/plot/',y) (fcopynew ::0:) jpath '~Addons/graphics/plot/source/',y
)

f 'manifest.ijs'
f 'history.txt'
