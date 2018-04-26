NB. pd main

NB. =========================================================
NB. pd   - plot driver
NB.
NB. numeric: data
NB. boxed: command;parameters
NB. character: commands or option parameters,
NB.            delimited by semicolon
NB.
NB.   pd 'title My Plot;titlefont Arial 40'
pd=: 3 : 0

dat=. y

if. 0 = #dat do. return. end.

if. ischar dat do.
  pdcmd boxcmd dat return.
end.

if. isboxed dat do.
  if. 1 < #$dat do.
    dat=. pddefverb each <"1 dat
  elseif. ischar 0 pick dat do.
    pdcmd dat return.
  elseif. do.
    dat=. pddefverb dat
  end.
end.

if. -. PReset do. pdreset'' end.
PCmd=: PCmd,'data';<dat
EMPTY
)

NB. =========================================================
NB. pdcmd
NB.
NB. cmd is a boxed list of commands and arguments
pdcmd=: 3 : 0

cmd=. y
if. 0=#cmd do. EMPTY return. end.

'hdr cmd'=. pdcmdhdr cmd

len=. # hdr
cnt=. 1 + # &> hdr

NB. ---------------------------------------------------------
if. len > ndx=. hdr i. <'reset' do.
  pdreset 6 }. ndx pick cmd
  pdcmd (ndx+1) }. cmd return.
end.

NB. ---------------------------------------------------------
if. -. PReset do. pdreset'' end.
prm=. cnt }. each cmd
if. len = ndx=. <./ hdr i. PDshow,PDcopy,PDget do.
  PCmd=: PCmd, hdr ,. prm
else.
  PCmd=: PCmd, (ndx {. hdr) ,. ndx {. prm
  r=. ('pd_',ndx pick hdr)~ndx pick prm
  if. #r do. return. end.
  pdcmd (>:ndx) }. cmd
end.
EMPTY
)

NB. =========================================================
NB. pdcmdhdr
NB.
NB. get commands and command headers
pdcmdhdr=: 3 : 0
cmd=. y
hdr=. tolower each head each cmd
if. 1 e. b=. hdr e. KEYWORDS do.
  new=. boxcmd @ ". @ toupper each b # cmd
  cmd=. <S:0 new (I. b) } y
  hdr=. tolower each head each cmd
end.

hdr;<cmd
)

NB. =========================================================
NB. pddefverb
NB.
NB. fix any verbs in plot definition
pddefverb=: 3 : 0
v=. _1 pick y
if. 2 ~: 3!:0 v do. y return. end.
NB. if. -. (3!:0 v) e. 2 32 do. y return. end.
v=. < caller plotdefverbm`plotdefverbd@.(3=#y) v
v _1 } y
)
