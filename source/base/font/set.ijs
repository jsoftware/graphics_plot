NB. set

NB. =========================================================
setfonts=: 3 : 0

CaptionFontX=: getfontid CAPTIONFONT
KeyFontX=: getfontid KEYFONT
LabelFontX=: getfontid LABELFONT
SubTitleFontX=: getfontid SUBTITLEFONT
SymbolFontX=: getfontid SYMBOLFONT
TitleFontX=: getfontid TITLEFONT

if. Poutput e. iANDROID do.
  CaptionFont=: getgtkfontid CaptionFontX
  KeyFont=: getgtkfontid KeyFontX
  LabelFont=: getgtkfontid LabelFontX
  SubTitleFont=: getgtkfontid SubTitleFontX
  SymbolFont=: getgtkfontid SymbolFontX
  TitleFont=: getgtkfontid TitleFontX
elseif. Poutput e. iQT,iQTC do.
  CaptionFont=: getgtkfontid CaptionFontX
  KeyFont=: getgtkfontid KeyFontX
  LabelFont=: getgtkfontid LabelFontX
  SubTitleFont=: getgtkfontid SubTitleFontX
  SymbolFont=: getgtkfontid SymbolFontX
  TitleFont=: getgtkfontid TitleFontX
elseif. Poutput = iISI do.
  CaptionFont=: getisifontid CaptionFontX
  KeyFont=: getisifontid KeyFontX
  LabelFont=: getisifontid LabelFontX
  SubTitleFont=: getisifontid SubTitleFontX
  SymbolFont=: getisifontid SymbolFontX
  TitleFont=: getisifontid TitleFontX
elseif. do.
  CaptionFont=: CaptionFontX
  KeyFont=: KeyFontX
  LabelFont=: LabelFontX
  SubTitleFont=: SubTitleFontX
  SymbolFont=: SymbolFontX
  TitleFont=: TitleFontX
end.

FontScale=: (Poutput e. iEPS,iPDF,iCAIRO) { 1,FONTSCALE
FontSizeMin=: (Poutput e. iCANVAS) { 0,FONTSIZEMIN
)
