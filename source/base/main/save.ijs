NB. save main

writesourcex_jp_ '~Plot/base/main';'~.Plot/release/main.ijs'

to=. jpath '~addons/graphics/plot/'
fm=. jpath '~Plot/base/main/'

(jpath '~.Plot/plot.ijs') fcopynew fm,'plot.ijs'
(jpath '~.Plot/plotdefs.ijs') fcopynew fm,'stddefs.ijs'
(to,'plot.ijs') fcopynew fm,'plot.ijs'
(to,'plotdefs.ijs') fcopynew fm,'stddefs.ijs'

f=. 3 : 0
=(jpath '~addons/graphics/plot/',y) (fcopynew ::0:) jpath '~.Plot/',y
)

f 'manifest.ijs'
f 'history.txt'
