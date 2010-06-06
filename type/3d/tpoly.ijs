
f_z_=. 3 : 'cutxyz ,/0.3 stellate dodecahedron $0'
g_z_=. 3 : 'cutxyz ,/0.6 stellate icosahedron $0'

dbg 1
dbstop''

pd 'reset'
pd 'backcolor lightgray'
pd 'use 25 50 375 500'
pd 'type poly;noaxes'
pd 'viewsize 1 1 1'
pd 'viewpoint 1 2 1'
pd f_jwplot_ ''
pd 'use 375 150 600 750'
pd g_jwplot_ ''
pd 'show'

