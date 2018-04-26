NB. symbol plot commands
NB.
NB. plot_symbol
NB.
NB. Note: symbol font draws a symbol as normal text output,
NB. and this may not be centered exactly on the position.

NB. =========================================================
plot_symbol=: 3 : 0
dat=. getgrafmat y
clr=. getitemcolor #dat
font=. SymbolFont

NB. ---------------------------------------------------------
if. Poutput e. iANDROID,iQT,iQTC,iCANVAS,iCAIRO,iISI do.
  sym=. utf8 each ucp text2utf8 SYMBOLS
else.
  sym=. <&> text2ascii8 SYMBOLS
end.

off=. 0,.-:{:SymbolFont pgetextent sym
dat=. dat + ({:$dat) $"1 (#dat)$off
chr=. (#dat)$sym

NB. ---------------------------------------------------------
for_d. dat do.
  drawtext iDATA;iCENTER;font;(d_index{clr);(d_index{chr),<_2 [\ d
end.
)
