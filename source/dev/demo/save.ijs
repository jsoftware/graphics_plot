
TO=: jpath '~.Plot/demo/'
FM=: jpath '~Plot/dev/demo/'

fc=. 3 : 0
(TO,y) fcopynew FM,y
(jpath '~addons/graphics/plot/demo/',y) fcopynew ::] FM,y
)

fc 'pledit.ijs'
fc 'plexam.ijs'
fc 'plot.txt'
fc 'plotdwin.ijs'
fc 'pldata.ijs'
fc 'plotdemo.ijs'
fc 'plotdemos.ijs'
fc 'plotrun.ijs'
fc 'plview.ijs'
fc 'view3d.ijs'
