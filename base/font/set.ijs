NB. set

NB. =========================================================
setfonts=: 3 : 0

CaptionFontX=: getfontid CAPTIONFONT
KeyFontX=: getfontid KEYFONT
LabelFontX=: getfontid LABELFONT
SubTitleFontX=: getfontid SUBTITLEFONT
SymbolFontX=: getfontid SYMBOLFONT
TitleFontX=: getfontid TITLEFONT

if. Poutput = iISI do.
  CaptionFont=: getisifontid CaptionFontX
  KeyFont=: getisifontid KeyFontX
  LabelFont=: getisifontid LabelFontX
  SubTitleFont=: getisifontid SubTitleFontX
  SymbolFont=: getisifontid SymbolFontX
  TitleFont=: getisifontid TitleFontX
else.
  CaptionFont=: CaptionFontX
  KeyFont=: KeyFontX
  LabelFont=: LabelFontX
  SubTitleFont=: SubTitleFontX
  SymbolFont=: SymbolFontX
  TitleFont=: TitleFontX
end.

FontScale=: (Poutput e. iEPS,iPDF) { 1,FONTSCALE
)
