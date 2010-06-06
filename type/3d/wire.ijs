NB. surface plot commands
NB.
NB. plot3d_surface   plot surface
NB. conform3d        conform 3d
NB. cfserr           conform error msg

NB. =========================================================
plot3d_wire=: 3 : 0

NB. check data conforms:
'x y z'=. conform3d y { Data

NB. build xyz positions:
pos=. x ,"0 1 y ,"0 z

NB. following for a see-thru wire:
if. PStyle has 'clear' do.
  pos=. pos,0 2 |: pos
  shape=. $pos
  pos=. shape $ ,project ,/ pos
  pos=. _2[\ ,}:"1 pos
  pos=. fitgrafxy3d pos
  pos=. (-+:1{shape) [\ ,pos
  drawline iDATA;(getitemcolor 1);EDGESIZE;pos

else.

NB. project:
  pos=. ($pos) $ ,project ,/ pos

NB. z values for rectangles:
  zpos=. ,tilesum z

NB. d values for rectangles:
  dpos=. ,tilesum {:"1 pos
  ndx=. \:dpos

NB. create tiles:
  pos=. ,/,/ tiles }:"1 pos
  pos=. fitgrafxy3d pos
  pos=. _8[\,pos
  pos=. ndx{pos

  j=. ndx { (#BANDCOLOR) ncile zpos
  clr=. j { BANDCOLOR
  drawpoly iDATA;clr;EDGESIZE;BACKCOLOR;pos

end.

)

