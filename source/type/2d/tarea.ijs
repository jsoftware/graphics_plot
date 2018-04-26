
year=. 1914 1928 1938 1948 1958 1964 1967
manu=. 125000 90700 89500 134400 94900 84900 83900
farm=. 57000 62439 39022 48252 40164 41563 37798
cler=. 3249 4558 4423 6120 6219 7395 8013
prof=. 4366 7729 11270 31636 32237 32035 33574
dat=. 100*|. (+/\ %"1 +/) prof, cler, farm,:manu


pd 'reset'
pd 'type area'
pd 'backcolor lightgray'
pd 'forecolor black'
pd 'gridcolor gray'
pd 'itemcolor blue,red,green,magenta'
pd 'xlabel ',":year
pd 'title Employment Trends by Percentage'
pd 'grids 1 0'
pd dat
pd 'show'

