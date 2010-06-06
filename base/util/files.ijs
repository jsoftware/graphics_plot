NB. files
NB.
NB. flexist
NB. flread
NB. flwrite         file write
NB. flwrites        file write string
NB. flwritenew      file write if new

NB. =========================================================
flexist=: 1:@(1!:4)@< :: 0:
flread=: 1!:1 @ <
flwrite=: (1!:2 <) :: _1:
flwrites=: (toHOST@[ 1!:2 <@]) :: _1:

NB. =========================================================
NB. writes data to file (if changed)
flwritenew=: 4 : 0
dat=. ,x
if. -. dat -: flread :: 0: y do. dat flwrite y end.
EMPTY
)
