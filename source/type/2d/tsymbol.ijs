NB. symbol test

require 'trig'
NB. ansi symbols in J601

NB. =========================================================
test=: 3 : 0
oldsym=. 197 196 35 43 42 167 168 169 170 { a.
dat=. sin 9 {. */~0.15*10+i.30
pd 'reset'
pd 'title Symbol'
pd 'symbolfont sans 20'
pd 'type line'
pd dat
NB.pd 'symbols @#$%^&*'
pd 'symbols ',oldsym
NB. pd 'symbols +!@#$%^&*'
pd 'type symbol'
pd dat
pd 'pdf'
)

dbg 1
dbstops ''
test''
