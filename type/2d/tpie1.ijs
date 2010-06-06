NB. pie test1

dat=: cutopen 0 : 0
40 Insurance Company
1 Public Service
1 Industry
45 Consulting Firm
7 Professional Educational Financial Institution
1 Education
3 Other
2 Undisclosed
)

dat=: cutopen 0 : 0
40 Insurance Company
1 Public Service
1 Industry
45 Consulting Firm
7 Financial Institution
1 Education
3 Other
2 Undisclosed
)

ndx=. dat i. &> ' '
val=: 0 ". &> ndx {. each dat
lab=: (ndx+1) }.each dat
lab=: ;'"' ,each lab ,each <'" '

pd 'reset'
pd 'title Pie'
pd 'backcolor whitesmoke'
pd 'type pie'
pd 'color CLR16'
pd 'xlabel ',lab
pd val
pd 'show'
