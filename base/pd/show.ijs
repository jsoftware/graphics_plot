NB. pd show commands

pd_eps=: eps_show
pd_gtk=: gtk_show
pd_isi=: isi_show
pd_pdf=: pdf_show
pd_pdfr=: pdf_get
pd_jpf=: pdf_jpf

pd_clip=: isi_clip
pd_print=: isi_print
pd_save=: isi_save
pd_get=: isi_get

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

