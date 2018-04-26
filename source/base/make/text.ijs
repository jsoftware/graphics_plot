NB. make text

NB. =========================================================
maketext=: 3 : 0

for_p. Text do.
  cmd=. {.p
  arg=. 1 pick p

NB. ---------------------------------------------------------
  if. -. cmd e. TextTypes do.
    (cmd)=. arg

NB. ---------------------------------------------------------
  else.
    arg=. <;._2 (deb arg),' '
    pos=. makepos_xy 2 {. arg
    text=. towords 2 }. arg
    align=. TextTypes i. cmd
    font=. getfontid TEXTFONT
    if. Poutput e. iANDROID do.
      font=. getgtkfontid font
    elseif. Poutput e. iQT,iQTC do.
      font=. getgtkfontid font
    elseif. Poutput = iISI do.
      font=. getisifontid font
    end.

    drawtext iTEXT;align;font;TEXTCOLOR;text;pos
  end.

end.
)
