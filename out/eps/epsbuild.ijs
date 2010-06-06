NB. eps build

EPS_DEFS=: 0 : 0
/showc {dup stringwidth pop neg 2 div 0 rmoveto show } bind def
/showr {dup stringwidth pop neg 0 rmoveto show } bind def
)

NB. /l {moveto lineto stroke} bind def

NB. =========================================================
NB. eps_build
eps_build=: 3 : 0
eps_wrap (eps_header''),LF,y
)


NB. =========================================================
eps_header=: 3 : 0
r=. ''
r=. r,<'%!PS-Adobe-3.0 EPSF-3.0'
r=. r,<'%%Creator: J Plot'
r=. r,<'%%CreationDate: ','20', ; _2 {.each '0' ,each ": each <. 6!:0''
r=. r,<'%%BoundingBox: ',pfmt Pxywh
r=. r,<''
r=. r,<EPS_DEFS
tolist r
)

NB. =========================================================
EPS_TRL=: 0 : 0
grestore
showpage
%%EOF
)

NB. =========================================================
eps_wrap=: 3 : 0
y,EPS_TRL
)
