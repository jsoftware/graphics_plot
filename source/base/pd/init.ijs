NB. init

coclass 'jzplot'
NB. pd init

NB. following commands define the plot
j=. 'data endsub multi new rule sub text textc textr type use'

PDdefs=: ;: j
PDDefs=: ;: toupper j

NB. the following gd commands are supported
j=. 'brushcolor end lines pen pencolor rect'
PDgd=: 'gd'&, each ;: j
PDGD=: 'GD'&, each ;: toupper j

NB. following commands show the plot
PDshow=: ;: 'cairo canvas eps android qt qtc jpf pdf isi print show'

NB. following commands copy/save an isigraph plot.
PDcopy=: ;: 'clip save get'

NB. following commands get a plot.
PDget=: ;: 'pdfr canvasr'

NB. following commands define single or multi plots
PDcmds=: ;: 'multi new use'

NB. other command: reset
