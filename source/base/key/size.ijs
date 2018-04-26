NB. key size

NB. =========================================================
NB. getkeysize
NB.
NB. defines: Kw,Kh       wh of key box
NB.          KeyExtent   wh of individual keys
NB.          Kxywh       initial box
NB.
NB. uses: MKx,MKy - key margins
NB.
NB. note: if key is boxed, then the box is drawn
NB. in by the key margins from Kxywh
getkeysize=: 3 : 0

if. 0 = #KEY do.
  'Kx Ky Kw Kh'=: Kxywh=: 4$0 return.
end.
len=. #KEY
KeyExtent=: KeyFont pgetextent KEY
'tw th'=. KeyExtent

NB. ---------------------------------------------------------
if. 'h' e. KEYSTYLE do.
  kw=. (len * KeyLen + 3 * MKx) + +/tw
  kh=. (+:MKy) + >./th
else.
  kw=. (3 * MKx) + KeyLen + >./tw
  kh=. (+:MKy) + +/th
end.

NB. ---------------------------------------------------------
if. -. 'o' e. KEYSTYLE do.
  kw=. kw + +: MKx
  kh=. kh + +: MKy
end.

NB. ---------------------------------------------------------
'Kx Ky Kw Kh'=: Kxywh=: 0 0,kw,kh
)

