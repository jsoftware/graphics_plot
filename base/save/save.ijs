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

cocurrent 'jprojsave'

'load'~ jpath '~Source/plot/base/save/files.ijs'
'load'~ jpath '~Source/plot/base/save/headers.ijs'
'require'~ 'dates files strings'

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
PROJECTS=: makeprojfile each SOURCEFILES
SAVEFILES=: makesavefile each SOURCEFILES
LASTPROJECT=: makeprojfile SOURCELAST

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

NB. erase previous release:
ferase 1 dir RELEASEPATH,'*.ijs'

NB. close Project Manager if open:
3 : 0''
if. IFCONSOLE do. return. end.
if. wdisparent 'projectform' do.
  closeproject_jproject_''
end.
)

saveproject DEVPATH,'demo/demo.ijp'
saveproject &> PROJECTS
openp_jproject_ LASTPROJECT

NB. =========================================================
NB. build the target script, and make a copy in d:/jst
dat=. ;freads each ~.SAVEFILES
dat=. decomment_jproject_ dat
dat=. dat,LF,FOOTER
p=. jpath '~temp/plot.ijs'
dat fwrites p
(jpath '~System/classes/plot/jzplot.ijs') copynew_jproject_ p
ferase p
