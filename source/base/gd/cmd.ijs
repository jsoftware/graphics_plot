NB. draw gl2 commands

NB. =========================================================
gdbrushcolor=: 3 : 0
BrushColor=: rndint _1 ". toupper y
)

NB. =========================================================
gdlines=: 3 : 0
drawpline iGD;({:Pen);PenColor;({.Pen);gdxy y
)

NB. =========================================================
gdpen=: 3 : 0
Pen=: 2 {. _1 ". y
)

NB. =========================================================
gdpencolor=: 3 : 0
PenColor=: rndint _1 ". toupper y
)

NB. =========================================================
gdrect=: 3 : 0
drawrect iGD;PenColor;({.Pen);BrushColor;gdxy y
)
