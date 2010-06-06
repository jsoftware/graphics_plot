cocurrent 'jprojsave'

SOURCEPATH=: jpath '~Plot/'
RELEASEPATH=: jpath '~Plot/release/'
DEVPATH=: jpath '~Plot/dev/'
FILES=: jpath '~Plot/base/save/files.ijs'

NB. =========================================================
NB. define source projects - each project builds a file
NB. of the same name in plot/release
SOURCEFILES=: cutopen 0 : 0
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

out/eps
out/gtk
out/isi
out/pdf

type/2d
type/3d
)

NB. =========================================================
NB. set this project last
SOURCELAST=: 'out/gtk'
