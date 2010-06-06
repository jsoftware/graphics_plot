NB. readafm
NB.
NB. nonce ignore kerning

NB. NB. =========================================================
NB. NB. Built-in fonts:
NB. ALLFONTS=: 0 : 0
NB. courier-bold
NB. courier-oblique
NB. courier-boldoblique
NB. helvetica
NB. helvetica-bold
NB. helvetica-oblique
NB. helvetica-boldoblique
NB. times-roman
NB. times-bold
NB. times-italic
NB. times-bolditalic
NB. symbol
NB. zapfdingbats
NB. )


NB. =========================================================
FONTMETRICS=: <;._2 (0 : 0)
Ascender
CapHeight
Descender
FontBBox
StdHW
StdVW
UnderlinePosition
UnderlineThickness
XHeight
)

average=: +/%#
rndint=: <.@:+&0.5

NB. =========================================================
boxfind=: 4 : 0
x=. , boxopen x
len=. # &> x
+./ x ="0 1 len {.each/ y
)

NB. =========================================================
readafm=: 3 : 0
'name file'=. y
dat=. 'b' fread file
dat=. (-. 'Comment' boxfind dat) # dat
ndx=. {. I. 'StartCharMetrics' boxfind dat

NB. ---------------------------------------------------------
NB. extract global font metrics
blk=. ndx {. dat
dat=. (ndx + 1) }. dat
msk=. FONTMETRICS boxfind blk
blk=. msk # blk
ndx=. blk i.each ' '
nms=. ndx {.each blk
val=. 0 ". each ndx }.each blk
gfm=. tolist sort nms ,each (<'=: ') ,each ":each val
gfm=. name,'_FontMetrics=: 0 : 0',LF,gfm,LF,')',LF

NB. ascender - default 650
ndx=. nms i. <'Ascender'
asc=. name,'_Ascender=: ',(":ndx pick val,<650),LF

ndx=. nms i. <'FontBBox'
fbx=. name,'_FontBBox=: ',(":ndx pick val),LF

ndx=. nms i. <'UnderlinePosition'
ups=. name,'_UnderlinePosition=: ',(":ndx pick val,<_100),LF

ndx=. nms i. <'UnderlineThickness'
uth=. name,'_UnderlineThickness=: ',(":ndx pick val,<50),LF

NB. ---------------------------------------------------------
NB. extract character metrics:
ndx=. {. I. 'EndCharMetrics' boxfind dat
blk=. ndx {. dat
dat=. (ndx + 1) }. dat
blk=. <;._2 &> blk
chr=. 0 ". &> }.each {."1 blk
msk=. chr ~: _1
chr=. msk # chr
blk=. msk # blk
wid=. 0 ". &> 3 }. each 1 {"1 blk
siz=. 0 ". &> 2 }. each 3 {"1 blk

dat=. sort chr,.wid,.siz
dat=. (0,}.rndint average dat),dat

chm=. , (": dat) ,. LF
chm=. name,'_CharMetrics=: 0 ". [;._2 (0 : 0)',LF,chm,')',LF

hdr=. 'NB. ',name,LF

NB. ---------------------------------------------------------
NB. res=. fbx,LF,gfm,LF,chm

res=. hdr,LF,asc,LF,fbx,LF,ups,LF,uth,LF,gfm,LF,chm

)
