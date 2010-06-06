
NB. =========================================================
drawtrims=: 3 : 0

if. IfPie do. return. end.

if. DimType=2 do.
  drawframebox''

  drawxgrid''
  drawygrid''

  drawxaxis''
  drawyaxis''

  drawxtics''
  drawytics''

  drawxlabs''
  drawylabs''
  drawy2labs''

  drawxcaption''
  drawycaption''
  drawy2caption''

else.

  if. BOXED do.
    drawframebox3d''
    drawxtics3d''
    drawytics3d''
    drawztics3d''
    drawxlabs3d''
    drawylabs3d''
    drawzlabs3d''
  end.

end.
)
