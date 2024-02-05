NB. Plot viewer

coclass 'jdplot'

CMDS=: ''

plotrun=: 3 : 0
glclear''
0!:100 y
pd 'show'
)

plotruns=: 3 : 0
CMDS=: ". y
)

plotrunsx=: 3 : 0
if. IFQT+.IFJA do.
  CMDS=: ". y
else.
  glclear''
  0!:100 ". y
  pd 'show'
end.
glpaint''
)

PLTIMER=: 3000
PLDEMOVER=: 6.02
SLIDES=: 0

NB. =========================================================
plotdemo_run=: 3 : 0

Cw=: _1 NB. ensure plot window is sized
f=. jpath '~system/packages/graphics/'&, @ (,&'.ijs')
DATHILO=: }. 'm' fread jpath '~addons/demos/wdplot/dm0396.txt'

MyPlotDefaults=: '' NB. turn off user defaults

def=. 'JGRAPHICS'

if. 0 ~: 4!:0 <'PLDEMOSEL' do.
  PLDEMOSEL=: def
end.

ASPECT=: 170%270
PShow=: 0
if. IFJA do.
NB. fs causes menu button hidden in android 7
NB.  wd 'activity ', (>coname''), ' fs'
  wd 'activity ', (>coname'')
else.
  wd (IFQT>UNAME-:'Android'){::PLOTDEMO;~PLOTDEMOJN
  PForm=: 'plotdemo'
  PFormhwnd=: wd 'qhwndp'
  PId=: 'ps'
  PIdhwnd=: wd 'qhwndc ps'
  pd 'reset ',PForm
  wd 'set M',PLDEMOSEL,((IFQT+.IFJA)#' checked'),' 1'
  plotrunsx`plotruns@.IFQT 'D',PLDEMOSEL
  wd 'pshow'
end.
)

onStart=: 3 : 0
wd ('720 520';'360 260') stringreplace PLOTDEMO
PForm=: 'plotdemo'
PFormhwnd=: wd 'qhwndp'
PId=: 'ps'
PIdhwnd=: wd 'qhwndc ps'
pd 'reset ',PForm
NB. optionmenu not yet created at this point in jandroid
NB. wd 'set M',PLDEMOSEL,((IFQT+.IFJA)#' checked'),' 1'
plotrunsx 'D',PLDEMOSEL
wd 'pshow'
)

NB. =========================================================
plotdemo_default=: 3 : 0
if. systype -: 'button' do.
  name=. }.syschild
  if. name -: PLDEMOSEL do.
    wd 'set M',PLDEMOSEL,((IFQT+.IFJA)#' checked'),' 1'
    return.
  end.
  if. (<name) e. PLOTNAMES do.
    wd 'set M',PLDEMOSEL,((IFQT+.IFJA)#' checked'),' 0'
    PLDEMOSEL=: name
    wd 'set M',PLDEMOSEL,((IFQT+.IFJA)#' checked'),' 1'
    pd 'reset ',PForm
    if. IFJA do.
      plotrunsx 'D',PLDEMOSEL
    else.
      plotrunsx 'D',PLDEMOSEL
    end.
  end.
end.
''
)

NB. =========================================================
plotdemo_view_button=: 3 : 0
plotedit_run_jdplotedit_ 'jdplotedit'
)

NB. =========================================================
plotdemo_exit_button=: 3 : 0
wd 'psel plotdemo;pclose;'
try. wd 'psel plotedit;pclose' catch. end.
)

NB. =========================================================
plotdemo_contents_button=: 3 : 0
sminfo 'help contents'
)

NB. =========================================================
plotdemo_about_button=: 3 : 0
j=. 'Plot Demo V',(4j2 ": PLDEMOVER)
sminfo 'Plot';j
)

NB. =========================================================
plotdemo_ps_paint=: 3 : 0
if. #CMDS do.
  0!:100 CMDS
  CMDS=: ''
end.
ppaint''
)

NB. =========================================================
plotdemo_slides_button=: 3 : 0
if. SLIDES do.
  wd 'timer 0'
  SLIDES=: 0
  erase 'sys_timer_z_'
else.
  wd 'timer ',":PLTIMER
  sys_timer_z_=: plotdemo_timer_jdplot_
  SLIDES=: 1
end.
wd 'set slides ',((IFQT+.IFJA)#'checked '),":SLIDES
)

NB. =========================================================
plotdemo_step=: 3 : 0
ndx=. (#PLOTALL) | y + PLOTALL i. <'D',PLDEMOSEL
wd 'set M',PLDEMOSEL,((IFQT+.IFJA)#' checked'),' 0'
PLDEMOSEL=: }.ndx pick PLOTALL
wd 'set M',PLDEMOSEL,((IFQT+.IFJA)#' checked'),' 1'
pd 'reset ',PForm
plotrunsx 'D',PLDEMOSEL
)

NB. =========================================================
plotdemo_timer=: 3 : 0
if. wdisparent 'plotdemo' do.
  wd 'psel plotdemo'
  plotdemo_next_button''
else.
  wd 'timer 0'
  SLIDES=: 0
  erase 'sys_timer_z_'
end.
)

plotdemo_saveeps_button=: pd_jdplot_ bind 'eps'
plotdemo_savepdf_button=: pd_jdplot_ bind 'pdf'
plotdemo_clip_button=: pd_jdplot_ bind 'clip'

NB. =========================================================
plotdemo_next_button=: plotdemo_step bind 1
plotdemo_prev_button=: plotdemo_step bind _1

3 : 0 ''
plotdemo_f4_fkey=: plotdemo_saveeps_button
plotdemo_f11_fkey=: plotdemo_savepdf_button
plotdemo_f12_fkey=: plotdemo_next_button
plotdemo_f12shift_fkey=: plotdemo_prev_button
0
)

NB. plotdemo=: plotdemo_run
