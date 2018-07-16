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
NB. optional argument may be form name or form name;child name
NB. if the latter, treat as a form in another locale.
NB. form handle is accepted in place of form name
pdreset=: 3 : 0
readplotdefaults''
setplotdefaults 'plot'
if. #y do.
  if. 0=L. y do.
    PForm=: y
  else.
    if. 2~:#y do.
      sminfo 'invalid argument to pdreset' return.
    end.
    'f c'=. y
    p=. 2 {."1 wdforms''
    i=. <./ (|:p) i:"1 <f
    if. i=#p do.
      sminfo 'form not found: ',f return.
    end.
    'PForm PFormhwnd'=: i{p
    PId=: c
    if. IFQT do.
      ". PForm,'_',PId,'_paint__COCREATOR=: qt_paint_',(>coname''),'_'
    elseif. IFJA do.
      ". PForm,'_',PId,'_paint__COCREATOR=: android_paint_',(>coname''),'_'
    elseif. do.
      ". PForm,'_',PId,'_paint__COCREATOR=: isi_paint_',(>coname''),'_'
    end.
  end.
end.
PReset=: 1
NB. deferred commands
pdcmdsave=: ''
pdcmdclip=: 0
pdcmdprint=: 0
EMPTY
)
