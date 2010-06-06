
dbg 1
dbstops''

NB. pd 'reset'
NB. pd 'backcolor white'
NB. pd 'new 500 0 500 400'
NB. pd 'color red,blue,green,yellow,teal'
NB. pd 'key Canada china India Japan USA'
NB. pd 'keystyle fo'
NB. pd 'keypos tr'
NB. pd 'show'

dat=. 2 3 5 7 11 15,2 4 7 13 14 16,:1.5 ^~ i.6
pd 'reset'
pd 'title Top Line',LF,'Second Line'
pd 'key one two three'
pd 'keystyle combo'
pd 'keypos rmo'
pd 'keycolor blue, red, green'
pd 'keymarkers line,diamond,square'
pd 'color blue,red,green'
pd 'type line'
pd dat
pd 'color red,green'
pd 'type marker'
pd 'markers diamond,square'
pd }. dat
pd 'show'
NB. pd 'eps'
NB. pd 'pdf'

