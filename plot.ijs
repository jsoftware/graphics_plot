NB. session definitions for plot

NB.*pd v plot driver
NB.*pdf v plot function driver
NB.*plot v cover for pd
NB.*plotf v cover for pdf

require 'jzplot'
coclass 'jwplot'
coinsert 'jzplot'

cxywh=: 4$0

NB. =========================================================
NB. deferred commands
pdcmdsave=: ''
pdcmdclip=: 0
pdcmdprint=: 0

NB. =========================================================
NB. z locale definitions
pd_z_=: 3 : 0
caller_jwplot_=. coname''
pd_jwplot_ y
)

plot_z_=: 3 : 0
caller_jwplot_=. coname''
'' plot_jwplot_ y
:
caller_jwplot_=. coname''
x plot_jwplot_ y
)

NB. =========================================================
gtkwidget_event=: 4 : 0
evt=. >@{.y
syshandler=. PForm, '_handler'
sysevent=. PForm,'_',PId,'_', evt
sysdefault=. PForm, '_default'
if. 1=#y do.
  wdd=. ;: 'syshandler sysevent sysdefault'
elseif. 2=#y do.
  sysdata=. ": >1{y
  wdd=. ;: 'syshandler sysevent sysdefault sysdata'
elseif. 3=#y do.
  sysdata=. ": >1{y
  sysmodifiers=. ": >2{y
  wdd=. ;: 'syshandler sysevent sysdefault sysdata sysmodifiers'
end.
wdqdata=. (wdd ,. ".&.>wdd)
evthandler wdqdata
0
)

