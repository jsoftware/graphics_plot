NB. pd show commands

pd_android=: android_show
pd_eps=: eps_show
pd_canvas=: canvas_show
pd_canvasr=: canvas_get
pd_cairo=: cairo_show
pd_qt=: qt_show
pd_qtc=: qtc_show
pd_pdf=: pdf_show
pd_pdfr=: pdf_get
pd_jpf=: pdf_jpf
pd_isi=: isi_show

NB. pd_clip=: isi_clip
NB. pd_print=: isi_print
NB. pd_save=: isi_save
NB. pd_get=: isi_get

pd_clip=: qt_clip`android_clip`isi_clip@.((IFQT,IFJA)&i.1)
pd_print=: qt_print`android_print`isi_print@.((IFQT,IFJA)&i.1)
pd_save=: qt_save`android_save`isi_save@.((IFQT,IFJA)&i.1)
pd_get=: qt_get`android_get`isi_get@.((IFQT,IFJA)&i.1)

NB. =========================================================
pd_show=: 3 : 0
ndx=. ({."1 PCmd) i. <'output'
if. ndx < #PCmd do.
  OUTPUT=: 1 pick ndx{PCmd
end.
out=. dlb OUTPUT
fn=. 'pd_', tolower ' ' taketo out
arg=. ' ' takeafter out
fn~arg
EMPTY
)
