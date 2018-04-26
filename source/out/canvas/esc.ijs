NB. escape sequence of javascript
NB.
NB. \n linefeed
NB. \r carriage return
NB. \t horizontal tab
NB. \f formfeed
NB. \b backspace
NB. \\ backslash
NB. \' single quote
NB. \" double quote

JSESC0=: LF,CR,TAB,FF,(8{a.),'\''"'
JSESC1=: 'nrtfb\''"'

NB. =========================================================
NB. JSESC
NB.
NB. fixes backslash in text and adds any escape sequences
jsesc=: 3 : 0

NB. add backslash
txt=. y
msk=. txt e. JSESC0
if. 1 e. msk do.
  ndx=. , ((I. msk) + i. +/ msk) +/ 0 1
  new=. ,'\',.JSESC1 {~ JSESC0 i. msk#txt
  txt=. new ndx } (1 + msk) # txt
end.

txt
)
