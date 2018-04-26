NB. util

NB. =========================================================
NB. eps_getparms
eps_getparms=: 3 : 0
(EPS_DEFSIZE;EPS_DEFFILE) output_parms y
)

NB. =========================================================
NB. y is a 2 column table of x, y values
NB.
NB. result is angle in degrees from origin
getarcangles=: 3 : 0
ang=. dfr arctan | %~/"1 y
quad=. (#. y < 0) { 0 3 1 2
(quad { 0 180 180 360) + ang * quad { 1 _1 1 _1
)

NB. =========================================================
eps_write=: 4 : 0
dat=. x
file=. y
while. _1 -: dat flwrites file do.
  msg=. 'Unable to write to file: ',file,LF,LF
  if. #d=. 1!:0 file do.
    msg=. msg, 'If the file is open in a viewer, close the file and try again.'
    if. 1 query msg do. return. end.
  else.
    info msg,'The file name is invalid.' return. end.
end.
if. 0 = 4!:0 <'EPSReader_j_' do.
  if. check_EPSReader ::0: EPSReader_j_ do.
    fork_jtask_ (dquote EPSReader_j_),' ',dquote file
  else.
    info 'File written: ',file
  end.
end.
)
