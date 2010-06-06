NB. data
NB.
NB. nonce - does not handle character data, this may be added
NB.
NB. dat is a 3 column table (even for 2D plots)

NB. =========================================================
NB. getdata
NB.
NB. define and validate data
NB.
NB. returns x;y;z
getdata=: 4 : 0
dat=. y

if. 0 e. $ y do.
  '';(i.0 0);(i.0 0) return.
end.

if. iscomplexdata dat do.
  if. dat -: + dat do.
    dat=. {."1 dat
  else.
    if. 2 > #$dat do.
      dat=. ;/ |: +. dat
    else.
      dat=. ;/ 2 0 1 |: +. dat
    end.
  end.
end.

if. isboxed dat do.
  x getdata_boxed dat
else.
  x getdata_open dat
end.

)

NB. =========================================================
NB. boxed data
getdata_boxed=: 4 : 0
select. (x=3),#y
case. 0 1 do.
  y=. citemize 0 pick y
  x=. i.{:$y
  x;y;0
case. 1 1 do.
  (i.#0 pick y);(i.{:$0 pick y);y
case. 1 2 do.
  (i.#1 pick y);y
case. do.
  3 {. y,<0
end.
)

NB. =========================================================
NB. open data
getdata_open=: 4 : 0
if. x=2 do.
  y=. citemize y
  x=. i.{:$y
  x;y;0
else.
  z=. citemize y
  y=. i. {:$ z
  x=. i. # z
  x;y;z
end.
)

NB. =========================================================
NB. getmin data
getmin=: 3 : 0
<./ &> ,each y
)

NB. =========================================================
NB. getmax data
getmax=: 4 : 0
types=. x
'x y z'=. y
if. (1 e. types e. SumXTypes) do.
  mx=. >./, +/"1 x
else.
  mx=. >./, x
end.
if. (1 e. types e. SumYTypes) do.
  my=. >./, +/ y
else.
  my=. >./, y
end.
if. (1 e. types e. SumZTypes) do.
  mz=. >./, +/ z
else.
  mz=. >./, z
end.
mx,my,mz
)

NB. =========================================================
getpolar=: 3 : 0
'x y z'=. y
(x * cos y) ; (x * sin y) ; z
)
