NB. sizes

PDFScale=: 0.5   NB. PDF/EPS scale for margins, etc.

NB. =========================================================
NB. various hardcoded size definitions
NB.
NB. these are somewhat arbitrary
Sizes=: ([:<i.&' '{.]);._2 (0 : 0)
KeyLen     key length
KeyPen     key pensize
MinMTic    minimum minor Tic distance
MinPie     minimum pie radius
MinTic     minimum major Tic distance
MKx        keybox x-margins
MKy        keybox y-margins
MLxy       labelbox margins (i.e. initial labelbox offset from drawbox)
MGxy       drawbox margins (i.e. initial grafbox offset from framebox)
MPie       pie label margin
MPieTic    pie tic size
MXlabel    xlabel margin (offset from bottom axis or frame)
MYlabel    ylabel margin (offset from left axis or frame)
MTitle     title margins (above and below)
MSubTitle  title margins (above and below)
MXCaption  X caption (above and below)
MYCaption  Y caption (left and right)
)

DefSizes=: 25 2 50 50 50 6 4 3 4 10 6 2 3 6 4 3 3

NB. =========================================================
setsizes=: 3 : 0
s=. PDFScale ^ Poutput e. iEPS,iPDF,iCANVAS,iCAIRO
(Sizes)=: DefSizes * s
MarkerScale=: s
)

