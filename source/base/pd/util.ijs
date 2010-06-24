NB. pd util

NB. =========================================================
boxcmd=: 3 : 0
if. L. y do. y return. end.
if. 2 = #$y do.
  y=. ,y,.';'
end.
y=. y,';'
b=. (y e. ';',LF) > ~:/\ y e. '"'
a: -.~ b (<@dlb) ;._2 y
)

NB. =========================================================
NB. get options in PCmd format
getoptions=: 3 : 0
cmd=. boxcmd y
hdr=. tolower each head each cmd
if. 1 e. b=. hdr e. KEYWORDS do.
  new=. boxcmd @ ". @ toupper each b # cmd
  cmd=. <S:0 new (I. b) } y
  hdr=. tolower each head each cmd
end.
hdr,.(1 + # &> hdr) }.each cmd
)

NB. =========================================================
pdreset=: 3 : 0
setplotdefaults 'plot'
if. #y do.
  PForm=: y
end.
PReset=: 1
NB. deferred commands
pdcmdpixels=: 0$0
pdcmdsave=: ''
pdcmdclip=: 0
EMPTY
)
