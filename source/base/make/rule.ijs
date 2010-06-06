NB. rule

NB. =========================================================
makerule=: 3 : 0

for_p. Rule do.
  cmd=. {.p
  arg=. 1 pick p
  if. -. cmd e. PDdefs do.
    (cmd)=. arg
  else.
    arg=. <;._2 (deb arg),' '
    pos1=. makepos_xy 2 {. arg
    pos2=. makepos_xy _2 {. arg
    drawline iRULE;RULECOLOR;RULESIZE;pos1,pos2
  end.
end.
)
