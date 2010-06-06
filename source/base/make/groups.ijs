NB. groups

NB. =========================================================
NB. getxgroup
getxgroup=: 4 : 0
dat=. y
for_n. x </. i.#x do.
  ind=. > n
  dat=. (getxgroup1 ind { dat) ind } dat
end.
)

NB. =========================================================
getxgroup1=: 3 : 0
dat=. y
if. 1 = #dat do. return. end.

if. 1 < # ~. (pDimData,pDimType) {"1 dat do.
  'Incompatible types in XGROUP' assert 0
end.

int=. ; pXINT {"1 dat
if. #int do.
  dat=. (< <./int) pXINT }"1 dat
end.

rng=. > pXRANGE {"1 dat
rng=. ({.<./rng),.{:>./rng
dat=. (<rng) pXRANGE }"1 dat

lab=. ~. (pXLABEL {"1 dat) -. a:
select. #lab
case. 0 do.
case. 1 do.
  dat=. lab pXLABEL }"1 dat
case. do.
  'Incompatible labels in XGROUP' assert 0
end.

dat

)

NB. =========================================================
NB. getygroup
getygroup=: 4 : 0
dat=. y
for_n. x </. i.#x do.
  ind=. > n
  dat=. (getygroup1 ind { dat) ind } dat
end.
)

getygroup1=: 3 : 0
dat=. y
if. 1 = #dat do. return. end.

if. 1 < # ~. (pDimData,pDimType) {"1 dat do.
  'Incompatible types in YGROUP' assert 0
end.

int=. ; pYINT {"1 dat
if. #int do.
  dat=. (< <./int) pYINT }"1 dat
end.

rng=. > pYRANGE {"1 dat
rng=. ({.<./rng),.{:>./rng
dat=. (<rng) pYRANGE }"1 dat

lab=. ~. (pYLABEL {"1 dat) -. a:
select. #lab
case. 0 do.
case. 1 do.
  dat=. lab pYLABEL }"1 dat
case. do.
  'Incompatible labels in YGROUP' assert 0
end.

dat
)

