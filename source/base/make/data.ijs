NB. make data

NB. =========================================================
NB. makedata_init
NB.
NB. called before first data block is processed.
NB.
makedata_init=: 3 : 0
DataNdx=: 0  NB. tracks current data item
getlayout''
drawbackground''
drawtrims''
drawfxywh 1
drawgd 0
)

NB. =========================================================
NB. makenodata''
NB.
NB. called if no data block, but some options given
makenodata=: 3 : 0
getouterlayout''
drawbackground''
getinnerboxes''
drawgd 0
)

