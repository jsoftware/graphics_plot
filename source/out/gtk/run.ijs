NB. run

load 'graphics/plot'

coclass 'm1'

NB. =========================================================
run=: 3 : 0
pd 'reset'
pd 'type surface'
pd +/~2 o. i:6j99
pd 'show'
pd 'save bmp'
)

cocurrent 'base'
run_m1_''
