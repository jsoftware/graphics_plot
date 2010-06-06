NB. run

NB. =========================================================
readfonts=: 3 : 0
load '~Source\plot\font\afmdev\readafm.ijs'
p=. jpath '~Source\plot\font\afmdev\'

NB. ---------------------------------------------------------
readafm1 'Courier';p,'courier.afm'
readafm1 'CourierBold';p,'courier-bold.afm'
readafm1 'CourierBoldOblique';p,'courier-boldoblique.afm'
readafm1 'CourierOblique';p,'courier-oblique.afm'
readafm1 'Helvetica';p,'helvetica.afm'
readafm1 'HelveticaOblique';p,'helvetica-oblique.afm'
readafm1 'HelveticaBold';p,'helvetica-bold.afm'
readafm1 'HelveticaBoldOblique';p,'helvetica-boldoblique.afm'
readafm1 'TimesRoman';p,'times-roman.afm'
readafm1 'TimesBold';p,'times-bold.afm'
readafm1 'TimesBoldItalic';p,'times-bolditalic.afm'
readafm1 'TimesItalic';p,'times-italic.afm'
readafm1 'Symbol';p,'symbol.afm'
readafm1 'ZapfDingbats';p,'zapfdingbats.afm'
)

NB. =========================================================
readafm1=: 3 : 0
'name file'=. y
a=. readafm y
a fwrites jpath '~Source\plot\font\afm\',(tolower name),'.ijs'
)