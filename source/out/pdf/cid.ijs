NB. cid
NB.
NB. Each asian font is a text string in 3 parts,
NB. written to 3 objects.
NB.
NB. This is fixed up by:
NB.   %prev is replaced with the previous object number.
NB.   /Name F has the font number appended

MSUNGLIGHT=: 0 : 0
/Type /FontDescriptor
/FontName /MSung-Light
/Flags 5
/FontBBox [ -260 -174 1043 826 ]
/MissingWidth 600
/StemV 93
/ItalicAngle 0
/CapHeight 625
/Ascent 826
/Descent -174

/Type /Font
/Subtype /CIDFontType0
/BaseFont /MSung-Light
/FontDescriptor %prev 0 R
/CIDSystemInfo << /Registry (Adobe)/Ordering (CNS1)/Supplement 4 >>
/DW 1200
/W [ 1 255 600 ]

/Type /Font
/Subtype /Type0
/Name /F
/BaseFont /MSung-Light
/DescendantFonts [ %prev 0 R ]
/Encoding /UniCNS-UTF16-H
)

NB. =========================================================
STSONGLIGHT=: 0 : 0
/Type /FontDescriptor
/FontName /STSong-Light
/Flags 5
/FontBBox [ -260 -174 1043 826 ]
/MissingWidth 600
/StemV 93
/ItalicAngle 0
/CapHeight 625
/Ascent 826
/Descent -174

/Type /Font
/Subtype /CIDFontType0
/BaseFont /STSong-Light
/FontDescriptor %prev 0 R
/CIDSystemInfo << /Registry (Adobe)/Ordering (GB1)/Supplement 4 >>
/DW 1200
/W [ 1 255 600 ]

/Type /Font
/Subtype /Type0
/Name /F
/BaseFont /STSong-Light
/DescendantFonts [ %prev 0 R ]
/Encoding /UniGB-UTF16-H
)
