NB. test0

NB. 3 : 0''
NB. if. IFWIN do.
NB.   PDFReader_j_=: 'c:/program files/adobe/acrobat 7.0/reader/acrord32.exe'
NB. end.
NB. )

dbg 1
dbstops''
pd 'reset'

NB. NB. pd 'textfont MSung-Light 50 bold italic'
NB. pd 'textfont MSung-Light 50'
NB. pd 'textcolor darkslateblue'
NB. pd 'textc 500 _20x J Plot', '漢語'
NB. pd 'new 40x 20x -40x -200x'

NB. pd 2 3 5 11
NB. pd 'title sin(exp) vs cos(exp)', '这首歌很好听'
NB. pd 'color red,green'
NB. pd 'key sin(exp),cos(exp)'
NB. x=. steps _1 2 100
NB. pd x;sin ^x
NB. pd x;cos ^x
NB. pd 'show'
NB. dbstop 'pdf_text'

dat=. (;];*/&sin~) steps _2 3 10
pd 'type density'
pd 'titlefont arial 18 italic'
pd 'title Color-Coded Density'
pd dat
pd 'show'
pd 'pdf'
