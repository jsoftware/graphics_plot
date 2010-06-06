NB. conform3d

NB. =========================================================
cfserr=: 3 : 0
signal 'need data matrix for 3d plot'
signal 'plot error'
)

NB. =========================================================
NB. conform3d
NB.
NB. reshape x;y;z values to conform, if possible

conform3d=: 3 : 0
'x y z'=. y

shp=. $ each x;y;z
if2=. 2 = # &> shp

select. +/if2

case. 0 do.
  x=. ,:x
  y=. ,;y
  z=. ,:z
  rxy=. $z

case. 1 do.

  rxy=. ;(-.if2)#shp
  rmat=. ;if2#shp

  if. -. rxy -: rmat do.
    if. rxy -: |.rmat do.
      nm=. if2 # 'xyz'
      (nm)=. |:,nm~
    else. cfserr''
    end.
  end.

case. 2 do.
  rz=. ;(-.if2)#shp
  rs=. if2#shp
  rxy=. 0 pick rs
  if. (-:/rs) *: (rz e. rxy) do.
    cfserr''
  end.

case. 3 do.
  if. -. shp -: 3${.shp do.
    cfserr''
  end.
  rxy=. 0 pick shp
end.

'r c'=. rxy
if. 2>rank x do.
  x=. c#"1,.x
end.
if. 2>rank y do.
  y=. rxy$y
end.
if. 2>rank z do.
  z=. rxy$z
end.

x;y;z

)
