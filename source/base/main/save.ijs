NB. save main

writesourcex_jp_ '~Plot/base/main';'~.Plot/release/main.ijs'

to=. jpath '~addons/graphics/plot/'
fm=. jpath '~Plot/base/main/'

(jpath '~Addons/graphics/plot/plot.ijs') fcopynew fm,'plot.ijs'
(jpath '~Addons/graphics/plot/plotdefs.ijs') fcopynew fm,'stddefs.ijs'
(to,'plot.ijs') fcopynew fm,'plot.ijs'
(to,'plotdefs.ijs') fcopynew fm,'stddefs.ijs'

f=. 3 : 0
(jpath '~Addons/graphics/plot/',y) fcopynew jpath '~.Plot/',y
(jpath '~addons/graphics/plot/',y) (fcopynew ::0:) jpath '~.Plot/',y
)

f 'manifest.ijs'
f 'history.txt'
