NB. draw gl2 commands

NB. =========================================================
drawgd=: 3 : 0
cmd=. ('Gcmd',":y)~
for_d. cmd do.
  'f v'=. d
  f~v
end.
)
