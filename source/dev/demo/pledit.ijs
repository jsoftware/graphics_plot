NB. edit graph definition

coclass 'jdplotedit'
coinsert 'jdplot'

getfontsz=: 13 : '{.1{._1 -.~ _1 ". y'
setfontsize=: 4 : 0
b=. ~: /\ y='"'
nam=. b#y
txt=. ;:(-.b)#y
ndx=. 1 i.~ ([: *./ e.&'0123456789.') &> txt
nam, ; ,&' ' &.> (<fmt x) ndx } txt
)

NB. =========================================================
PLOTEDIT=: 0 : 0
pc plotedit;pn "View Definition";
menupop "&File";
menu quit "&Quit" "Ctrl+Q" "" "";
menupopz;
bin vhs;
cc redisplay button;cn "&Redisplay";
cc help button;cn "&Help";
cc close button;cn "&Close";
bin z;
minwh 416 200;cc graf editm;
bin z;
pas 0 0;
rem form end;
)
plotedit_quit_button=: plotedit_close

PLOTEDITJN=: 0 : 0
pc6j plotedit;pn "View Definition";
menupop "&File";
menu quit "&Quit" "Ctrl+Q" "" "";
menupopz;
xywh 82 1 42 12;cc redisplay button leftmove rightmove;cn "&Redisplay";
xywh 124 1 42 12;cc help button leftmove rightmove;cn "&Help";
xywh 166 1 42 12;cc close button leftmove rightmove;cn "&Close";
xywh 0 13 416 100;cc graf editm ws_vscroll rightmove bottommove;
pas 0 0;
rem form end;
)

NB. =========================================================
NB. argument is name of definition
plotedit_run=: 3 : 0
y=. PLDEMOSEL_jdplot_
GNAME=: 'D',y,(0=#y)#'JGRAPHICS'
if. wdisparent 'plotedit' do.
  wd 'psel plotedit'
  wd 'set graf ',((IFQT+.IFJA)#'text '),'*',".GNAME,'_jdplot_'
  wd 'setfocus graf'
else.
  if. IFJA do.
    wd 'activity ', (>coname'')
  else.
    wd IFQT{::PLOTEDIT;~PLOTEDITJN
    wd 'setfont graf ',FIXFONT
    wd 'pshow;'
    wd 'set graf ',((IFQT+.IFJA)#'text '),'*',".GNAME,'_jdplot_'
    wd 'setfocus graf'
  end.
end.
)

onStart=: 3 : 0
wd PLOTEDIT
wd 'setfont graf ',FIXFONT
wd 'set graf text *',".GNAME,'_jdplot_'
wd 'setfocus graf'
wd 'pshow;'
)

NB. =========================================================
plotedit_close_button=: 3 : 0
GRAF=: graf
assign=. 4 : '".x,''=:y'''
GNAME assign graf
wd 'pclose'
)

NB. =========================================================
plotedit_close=: plotedit_close_button

NB. =========================================================
PLOTEDITHELP=: 0 : 0
To experiment, modify the commands, then Redisplay.

To run a demo by itself, wrap the commands in reset and show.
In some cases, you need to reference data in locale jdplot.

For example, to run the 2D|Bar demo:

pd 'reset'
)

plotedit_help_button=: 3 : 0
sminfo 'Plot Demo';PLOTEDITHELP,DBAR_jdplot_,'pd ''show'''
)

NB. =========================================================
plotedit_redisplay_button=: 3 : 0
if. IFJA do.
  sminfo 'J Graphics';'This demo is for desktop versions only' return.
end.
GRAF=: graf
try.
  wd 'psel ',":PForm
  pd 'reset ',":PForm
  plotrun graf
  wd 'psel plotedit'
catch.
  sminfo 'error in graph definition'
  0 return.
end.
1
)

NB. =========================================================
NB. plotedit_sctrlshift_fkey
NB. ... development only
plotedit_sctrlshift_fkey=: 3 : 0
grf=. toJ graf
grf=. (+./\. grf ~: LF) # grf
grf=. grf,LF
f=. jpath '~Plot/dev/demo/plexam.ijs'
dat=. freads f
sel=. GNAME,'=: 0 : 0',LF
ndx=. (#sel) + 1 i.~ sel E. dat
hdr=. ndx {. dat
dat=. ndx }. dat
ndx=. 1 + 1 i.~ (LF,')',LF) E. dat
mid=. ndx {. dat
ftr=. ndx }. dat
ftr=. ftr, LF -. {:ftr
new=. hdr,grf,ftr
new fwrites f
sminfo 'Plot';'Saved: ',GNAME
)
