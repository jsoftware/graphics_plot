NB. init

coclass 'jzplot'
NB. init

ANDROID_DEFSIZE=: 400 200
ANDROID_DEFFILE=: jpath '~temp/plot'
ANDROID_PENSCALE=: 0.4

NB. =========================================================
fext=: 4 : 0
f=. deb y
f, (-. x -: (-#x) {. f) # x
)

NB. =========================================================
NB. y is file extension
gettemp=: 3 : 0
p=. jpath '~temp/'
d=. 1!:0 p,'*.',y
a=. 0, {.@:(0&".)@> _4 }. each {."1 d
a=. ": {. (i. >: #a) -. a
p,a,'.',y
)

