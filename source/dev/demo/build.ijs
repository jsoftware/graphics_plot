NB. build

mkdir_j_ jpath '~Addons/demos/wdplot/'
mkdir_j_ jpath '~addons/demos/wdplot/'

TO=: jpath '~Addons/demos/wdplot/'
FM=: jpath '~Plot/dev/demo/'

fc=. 3 : 0
(TO,y) fcopynew FM,y
(jpath '~addons/demos/wdplot/',y) (fcopynew ::0:) ::] FM,y
)

fc 'dm0396.txt'
fc 'manifest.ijs'
fc 'pledit.ijs'
fc 'plexam.ijs'
fc 'plot.txt'
fc 'plotdwin.ijs'
fc 'pldata.ijs'
fc 'plotdemo.ijs'
fc 'plotdemos.ijs'
fc 'plotrun.ijs'
fc 'plview.ijs'
fc 'run.ijs'
fc 'view3d.ijs'
