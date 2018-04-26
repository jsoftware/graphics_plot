
x1=. steps 0 20 100

NB. pd 'reset'
NB. pd 'polar 1'
NB. pd 'title sin @ (%&5)'
NB. pd (sin @ (%&5) ; ]) x1
NB. pd 'show'

x1=. steps 0 20 1000
opt=. 'polar 1;backcolor lightgray;color red,darkgreen'
opt=. opt,';textcolor darkblue;type line;titlefont arial 20 italic'

pd 'reset'
pd 'backcolor lightgray'

NB. pd 'new 0 500 500 500'
NB. pd opt
NB. pd 'title sin vs cos'
NB. pd (sin;cos) x1
NB.
NB. pd 'new 500 500 500 500'
NB. pd opt
NB. pd 'title sin @ (%&5)'
NB. pd (sin @ (%&5) ; ]) x1
NB.
pd 'new 0 0 500 500'
pd opt
pd 'title r squared'
pd (*: ; ]) x1

NB. pd 'new 500 0 500 500'
NB. pd opt
NB. pd 'title sin @ +:'
NB. pd (sin@+: ; ]) x1

NB. dbstop 'getyaxis'

pd 'show'
