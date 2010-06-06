
NB. NB. =========================================================
NB. NB. each cidfont use 3 obj
NB. pdf_cidfonts=: 3 : 0
NB. objcntr=. 2 + nf=. 0 NB. assume first obj of font is 3
NB. r=. ''
NB. for_f. CIDFONTS do.
NB.   fontdesobj=. objcntr=. >:objcntr
NB.   r=. r, <cidfontdestmp stringreplace~ '%basefont' ; (>f) ; '%flag' ; '5' ; '%angle' ; '0'
NB.   select. f
NB.   case. <'MSung-Light' do.  NB. traditional chinese, unicode encoding UniCNS-UCS2-H
NB.     cidobj=. objcntr=. >:objcntr
NB.     r=. r, <cidtmp stringreplace~ '%basefont' ; (>f) ; '%fontdes' ; (":fontdesobj) ; '%order' ; 'CNS1' ; '%supp' ; '4'
NB.     fontobj=. objcntr=. >:objcntr
NB.     r=. r, <cidfonttmp stringreplace~ '%fontnum' ; (":nf=. >:nf) ; '%basefont' ; (>f) ; '%cid' ; (":cidobj) ; '%encoding' ; 'UniCNS-UCS2-H'
NB.   case. <'STSong-Light' do.  NB. simplified chinese, unicode encoding UniGB-UCS2-H
NB.     cidobj=. objcntr=. >:objcntr
NB.     r=. r, <cidtmp stringreplace~ '%basefont' ; (>f) ; '%fontdes' ; (":fontdesobj) ; '%order' ; 'GB1' ; '%supp' ; '4'
NB.     fontobj=. objcntr=. >:objcntr
NB.     r=. r, <cidfonttmp stringreplace~ '%fontnum' ; (":nf=. >:nf) ; '%basefont' ; (>f) ; '%cid' ; (":cidobj) ; '%encoding' ; 'UniGB-UCS2-H'
NB. NB. extra cjk font for japanese and korean here
NB.   case. do. 'unhandled cid font' assert. 0
NB.   end.
NB. end.
NB. )

NB. NB. =========================================================
NB. NB. template for cid font
NB. cidfontdestmp=: 0 : 0
NB. <<
NB. /Type /FontDescriptor
NB. /FontName /%basefont
NB. /Flags %flag
NB. /FontBBox [ -260 -174 1043 826 ]
NB. /MissingWidth 600
NB. /StemV 93
NB. /ItalicAngle %angle
NB. /CapHeight 625
NB. /Ascent 826
NB. /Descent -174
NB. >>
NB. )
NB.
NB. NB. =========================================================
NB. cidtmp=: 0 : 0
NB. <<
NB. /Type /Font
NB. /Subtype /CIDFontType0
NB. /BaseFont /%basefont
NB. /FontDescriptor %fontdes 0 R
NB. /CIDSystemInfo << /Registry (Adobe)/Ordering (%order)/Supplement %supp >>
NB. /DW 1200
NB. /W [ 1 255 600 ]
NB. >>
NB. )
NB.
NB. NB. =========================================================
NB. cidfonttmp=: 0 : 0
NB. <<
NB. /Type /Font
NB. /Subtype /Type0
NB. /Name /F%fontnum
NB. /BaseFont /%basefont
NB. /DescendantFonts [ %cid 0 R ]
NB. /Encoding /%encoding
NB. >>
NB. )
