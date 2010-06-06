NB. this script builds each  source file,
NB. and runs before the saveall build

NB. =========================================================
demos_z_=: 3 : 0
a=. 'RADAR'
a=. 'PIE'
a=. 'JGRAPHICS'
PLDEMOSEL_jdplot_=: a
'load'~'~system/examples/graphics/plot/plotdemo.ijs'
)

IFJ7_z_=: 700 < 0 ". ({. ~i.&'/') }.9!:14''

cocurrent 'jprojsave'

'load'~ jpath '~Plot/base/save/files.ijs'
'load'~ jpath '~Plot/base/save/headers.ijs'
'require'~ 'dates files strings'

NB. J6 branch

NB. =========================================================
makeprojfile=. 3 : 0
nam=. (*./\. y ~: '/') # y
SOURCEPATH, y,'/', nam,'.ijp'
)

NB. =========================================================
makesavefile=. 3 : 0
nam=. (*./\. y ~: '/') # y
RELEASEPATH, nam,'.ijs'
)

NB. =========================================================
saveproject=. 3 : 0
openp_jproject_ y
r=. buildproject_jproject_ ''
if. r=0 do.
  info 'saveproject';'problem with: ',y
else.
  empty''
end.
)

NB. =========================================================
NB. do the saves:

dosave6=: 3 : 0
PROJECTS=: makeprojfile each SOURCEFILES
SAVEFILES=: makesavefile each SOURCEFILES
LASTPROJECT=: makeprojfile SOURCELAST

NB. erase previous release:
ferase 1 dir RELEASEPATH,'*.ijs'

NB. close Project Manager if open:
if. IFCONSOLE do. return. end.
if. wdisparent 'projectform' do.
  closeproject_jproject_''
end.

saveproject DEVPATH,'demo/demo.ijp'
saveproject &> PROJECTS
openp_jproject_ ::] LASTPROJECT

NB. =========================================================
NB. build the target script, and make a copy in d:/jst
dat=. ;freads each ~.SAVEFILES
dat=. decomment_jproject_ dat
dat=. dat,LF,FOOTER
p=. jpath '~temp/plot.ijs'
dat fwrites p
(jpath '~system/classes/plot/jzplot.ijs') copynew_jproject_ p
ferase p
)

NB. =========================================================
NB. J7 branch

f=: 3 : 0
load '~Plot/',y,'/build.ijs'
)

dosave7=: 3 : 0

f 'dev/demo'
f each SOURCEFILES
g=: (jpath '~.Plot/release/')&,@spath_j_ each SOURCEFILES ,each <'.ijs'
dat=: ;freads each g
dat fwritenew jpath '~.Plot/jzplot.ijs'
dat fwritenew jpath '~addons/graphics/plot/jzplot.ijs'
)

dosave6`dosave7@.IFJ7 ''
